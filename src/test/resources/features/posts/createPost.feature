Feature: Create post

  Scenario: Create new post

    Given url baseUrl + '/posts'
    And request
    """
    {
      title: 'Karate Framework',
      body: 'Automation testing',
      userId: 1
    }
    """
    When method POST
    Then status 201
    And match response.title == 'Karate Framework'


  Scenario: Create post with external data

    * def postData = read('classpath:data/postData.json')

    Given url baseUrl + '/posts'
    And request postData
    When method POST
    Then status 201
    And match response.title == 'Karate Advanced'