// account voor Martijn -> invited, not registered
CREATE (
    email1:Email { 
        uuid: "a6636e64-ef40-4e25-89e1-d49e5f87eaa3",
        emailAddress:"martijn.driesen@mail.be",
        isPrimary:true
    }
)

// account voor Lenny -> invited, registered
CREATE (
    email2:Email { 
        uuid: "4603bf16-d56f-4758-b369-b4e297fc1695",
        emailAddress:"lenny.kr@mail.be",
        isPrimary:true,verifiedAt:"2020-01-25T09:10:04-06:12",
        verificationToken:"verified20200125T0910040612"
    }
)
CREATE (
    email3:Email {
        uuid: "2709caba-7174-476f-8f68-4aca6fe5cbf6",
        emailAddress:"lenny.kr2@mail.be",
        isPrimary:false,
        verifiedAt:"2020-01-25T09:10:09-06:12",
        verificationToken:"verified20200125T0910090612"
    }
)

CREATE (
    profile1:Profile {
        name:"Kraaijenhof",
        firstName:"Lenny",
        description:"Lenny works hard"
    }
)

CREATE (
    jwttoken1:JWTToken {
        token: "testdin"
    }
)

CREATE (
    account1:Account {
        uuid:"7c7020be-cb10-4e5d-851d-970daaad6c6b",
        password:"$2y$12$d.4Q/KxKfozkepVV8ofSiOdcMSmLUouzoJqkGvxiFwrP6dPTcz/my",
        active:true
    }
)

CREATE (account1)-[:HAS_PROFILE]->(profile1)
CREATE (account1)-[:HAS_EMAIL]->(email2)
CREATE (account1)-[:HAS_EMAIL]->(email3)
CREATE (account1)-[:HAS_TOKEN]->(jwttoken1)


// account voor John -> invited, registered
CREATE (
    email4:Email { 
        emailAddress:"john.doe@mail.be",
        isPrimary:true
    }
)

CREATE (
    profile2:Profile {
        name:"Doe",
        firstName:"John",
        description:"John doesn't work hard"
    }
)

CREATE (
    jwttoken2:JWTToken {
        token: "testdin"
    }
)

CREATE (
    account2:Account {
        uuid:"878fdeea-f023-4263-8ae4-07384e07f809",
        password:"$2y$12$d.4Q/KxKfozkepVV8ofSiOdcMSmLUouzoJqkGvxiFwrP6dPTcz/my",
        active:true
    }
)

CREATE (account2)-[:HAS_PROFILE]->(profile2)
CREATE (account2)-[:HAS_EMAIL]->(email4)
CREATE (account2)-[:HAS_TOKEN]->(jwttoken2)

// organistatie Acubed
CREATE (
    profile3:Profile {
        name:"Acubed",
        displayName:"A3",
        description:"A lovely team"
    }
)

CREATE (organisation1:Organisation { uuid:"2c0ada33-5f92-44b8-bb2f-a04281149a4b"})

CREATE (organisation1)-[:HAS_PROFILE]->(profile3)

CREATE (organisation1)-[:INVITED {sentAt:"2020-01-25T08:05:02-15:14"}]->(email1)
CREATE (organisation1)-[:INVITED {sentAt:"2020-01-25T08:05:02-15:14"}]->(email2)
CREATE (organisation1)-[:INVITED {sentAt:"2020-01-25T08:05:02-15:14"}]->(email4)



// tracable objects
CREATE (
    object1:TracableObject {
        uuid:"643a3b2e-75a9-401f-a65c-4463b983c599",
        name:"vehicle 1",
        note:"This vehicle transports containers"
    }
)
CREATE (
    object2:TracableObject {
        uuid:"7d405caa-1441-4496-941c-1b402968db6e",
        name:"transporter",
        note:"When overheating, get out!"
    }
)

// cameras
CREATE (
    Camera1:Camera {
        uuid:"0f63a53b-5d1d-4bda-a9eb-7f9c9f945fed",
        name:"tower cam 1",
        locationX:"2.04950",
        locationY:"1.34902",
        locationZ:"4.234533",
        pitch:"-45",
        yaw:"0",
        fieldOfView:"135"
    }
)
CREATE (
    camera2:Camera {
        uuid:"021e5af0-ba2f-4b04-8de0-50b13c0cc95a",
        name:"tower cam 2",
        locationX:"4.04950",
        locationY:"3.34902",
        locationZ:"4.234533",
        pitch:"-45",
        yaw:"180",
        fieldOfView:"135"
    }
)
CREATE (
    camera3:Camera {
        uuid:"b3786550-fb7c-4a86-a070-d845c5f27747",
        name:"tower cam 3",
        locationX:"0.04950",
        locationY:"3.34902",
        locationZ:"4.234533",
        pitch:"-45",
        yaw:"68",
        fieldOfView:"135"
    }
)

// alles verwijderen
// NIET KOPIEREN VOOR INITIALISATIE!
MATCH (n)
DETACH DELETE n