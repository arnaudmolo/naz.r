'use strict'

angular.module('dubatoApp')
  .controller 'D3Ctrl', ($scope, $http) ->
    # initialize the model
    $scope.user = "onesime"
    $scope.repo = "naz.r"

    # helper for formatting date
    humanReadableDate = (d) ->
      d.getUTCMonth() + "/" + d.getUTCDate()


    # helper for reformatting the Github API response into a form we can pass to D3
    reformatGithubResponse = (data) ->
      # sort the data by author date (rather than commit date)
      data.sort (a, b) ->
        if new Date(a.commit.author.date) > new Date(b.commit.author.date)
          -1
        else
          1

      # date objects representing the first/last commit dates
      date0 = new Date(data[data.length - 1].commit.author.date)
      dateN = new Date(data[0].commit.author.date)
      
      # the number of days between the first and last commit
      days = Math.floor((dateN - date0) / 86400000) + 1
      
      # map authors and indexes
      uniqueAuthors = [] # map index -> author
      authorMap = {} # map author -> index
      data.forEach (datum) ->
        name = datum.commit.author.name
        if uniqueAuthors.indexOf(name) is -1
          authorMap[name] = uniqueAuthors.length
          uniqueAuthors.push name

      
      # build up the data to be passed to our d3 visualization
      formattedData = []
      formattedData.length = uniqueAuthors.length
      i = undefined
      j = undefined
      i = 0
      while i < formattedData.length
        formattedData[i] = []
        formattedData[i].length = days
        j = 0
        while j < formattedData[i].length
          formattedData[i][j] =
            x: j
            y: 0
          j++
        i++
      data.forEach (datum) ->
        date = new Date(datum.commit.author.date)
        curDay = Math.floor((date - date0) / 86400000)
        formattedData[authorMap[datum.commit.author.name]][curDay].y += 1
        formattedData[0][curDay].date = humanReadableDate(date)

      
      # add author names to data for the chart's key
      i = 0
      while i < uniqueAuthors.length
        formattedData[i][0].user = uniqueAuthors[i]
        i++
      formattedData

    $scope.getCommitData = ->
      
      # attach this data to the scope
      
      # clear the error messages
      $http(
        method: "GET"
        url: "https://api.github.com/repos/" + $scope.user + "/" + $scope.repo + "/commits"
      ).success((data) ->
        $scope.data = reformatGithubResponse(data)
        $scope.error = ""
      ).error (data, status) ->
        if status is 404
          $scope.error = "That repository does not exist"
        else
          $scope.error = "Error: " + status

    # get the commit data immediately
    $scope.getCommitData()