*** Settings ***
Library         Collections
Library         RequestsLibrary

Suite Setup     Create Session  mainSession  https://thinking-tester-contact-list.herokuapp.com     verify=true

*** Test Cases ***

Create User
    &{headers}=     Create dictionary   Content-Type=application/json
    &{body}=        Create dictionary   firstName=Zoro  lastName=Zeri     email=zorozeri@gmail.com    password=Password123!
    ${resp}=        POST On Session     mainSession     /users            headers=${headers}          json=${body}
    Status Should Be                    201  ${resp}
    Should Be Equal As Strings          ${resp.json()}[user][firstName]   ${body}[firstName]
    Should Be Equal As Strings          ${resp.json()}[user][lastName]    ${body}[lastName]
    Should Be Equal As Strings          ${resp.json()}[user][email]       ${body}[email]
    ${token}=                           Catenate                          Bearer    ${resp.json()}[token]
    Set Global Variable                 ${token}

Log Out
    &{headers}=     Create dictionary   Authorization=${token}
    ${resp}=        POST On Session     mainSession     /users/logout     headers=${headers}
    Status Should Be                    200  ${resp}

Log In
    &{headers}=     Create dictionary   Content-Type=application/json
    &{body}=        Create dictionary   email=zorozeri@gmail.com          password=Password123!
    ${resp}=        POST On Session     mainSession     /users/login      headers=${headers}          json=${body}
    Status Should Be                    200  ${resp}
    Should Be Equal As Strings          ${resp.json()}[user][firstName]   Zoro
    Should Be Equal As Strings          ${resp.json()}[user][lastName]    Zeri
    Should Be Equal As Strings          ${resp.json()}[user][email]       ${body}[email]
    ${token}=                           Catenate                          Bearer                      ${resp.json()}[token]
    Set Global Variable                 ${token}

Get Contact List - Empty List
    &{headers}=     Create dictionary   Authorization=${token}
    ${resp}=        GET On Session      mainSession     /contacts         headers=${headers}
    Status Should Be                    200  ${resp}
    Should Be Empty                     ${resp.json()}

Add #1st Contact
    &{headers}=     Create dictionary   Authorization=${token}
    &{body}=        Create dictionary   firstName=Zoro  lastName=Zeri     birthdate=1991-01-01        email=zorozeri@gmail.com    phone=1234567890    street1=Address1    street2=Address2    city=City    stateProvince=Province    postalCode=12345     country=Country
    ${resp}=        POST On Session     mainSession     /contacts         headers=${headers}          json=${body}
    Status Should Be                    201  ${resp}
    Should Be Equal As Strings          ${resp.json()}[firstName]         ${body}[firstName]
    Should Be Equal As Strings          ${resp.json()}[lastName]          ${body}[lastName]
    Should Be Equal As Strings          ${resp.json()}[birthdate]         ${body}[birthdate]
    Should Be Equal As Strings          ${resp.json()}[email]             ${body}[email]
    Should Be Equal As Strings          ${resp.json()}[phone]             ${body}[phone]
    Should Be Equal As Strings          ${resp.json()}[street1]           ${body}[street1]
    Should Be Equal As Strings          ${resp.json()}[street2]           ${body}[street2]
    Should Be Equal As Strings          ${resp.json()}[city]              ${body}[city]
    Should Be Equal As Strings          ${resp.json()}[stateProvince]     ${body}[stateProvince]
    Should Be Equal As Strings          ${resp.json()}[postalCode]        ${body}[postalCode]
    Should Be Equal As Strings          ${resp.json()}[country]           ${body}[country]
    Set Global Variable                 ${firstContactId}                 ${resp.json()}[_id]

Get Contact List - 1 Contact List should be Exist
    &{headers}=     Create dictionary   Authorization=${token}
    &{body}=        Create dictionary   firstName=Zoro  lastName=Zeri     birthdate=1991-01-01        email=zorozeri@gmail.com    phone=1234567890    street1=Address1    street2=Address2    city=City    stateProvince=Province    postalCode=12345     country=Country
    ${resp}=        GET On Session      mainSession     /contacts         headers=${headers}
    Status Should Be                    200  ${resp}
    Should Be Equal As Strings          ${resp.json()}[0][firstName]      ${body}[firstName]
    Should Be Equal As Strings          ${resp.json()}[0][lastName]       ${body}[lastName]
    Should Be Equal As Strings          ${resp.json()}[0][birthdate]      ${body}[birthdate]
    Should Be Equal As Strings          ${resp.json()}[0][email]          ${body}[email]
    Should Be Equal As Strings          ${resp.json()}[0][phone]          ${body}[phone]
    Should Be Equal As Strings          ${resp.json()}[0][street1]        ${body}[street1]
    Should Be Equal As Strings          ${resp.json()}[0][street2]        ${body}[street2]
    Should Be Equal As Strings          ${resp.json()}[0][city]           ${body}[city]
    Should Be Equal As Strings          ${resp.json()}[0][stateProvince]  ${body}[stateProvince]
    Should Be Equal As Strings          ${resp.json()}[0][postalCode]     ${body}[postalCode]
    Should Be Equal As Strings          ${resp.json()}[0][country]        ${body}[country]

Edit #1st Contact List
    &{headers}=     Create dictionary   Authorization=${token}
    &{body}=        Create dictionary   firstName=Zoro  lastName=Zeri                   birthdate=1991-01-01        email=zorozeri@gmail.com    phone=1234567890    street1=Address1    street2=Address2    city=City    stateProvince=Province    postalCode=12345     country=Country
    ${resp}=        PUT On Session      mainSession     /contacts/${firstContactId}     headers=${headers}          json=${body}
    Status Should Be                    200  ${resp}
    Should Be Equal As Strings          ${resp.json()}[firstName]                       ${body}[firstName]

Delete #1st Contact List
    &{headers}=     Create dictionary   Authorization=${token}
    ${resp}=        DELETE On Session   mainSession     /contacts/${firstContactId}     headers=${headers}
    Status Should Be                    200  ${resp}
    Should Be Equal As Strings          ${resp.content}         Contact deleted

Delete User
    &{headers}=     Create dictionary   Authorization=${token}
    ${resp}=        DELETE On Session   mainSession     /users/me                       headers=${headers}
    Status Should Be                    200  ${resp}
