	--CREATE DATABASE WhatsaAppChatClone

	--CreatE the users table
		CREATE TABLE Users (
		  users_ID INT  PRIMARY KEY  IDENTITY(1,1),
		  first_Name VARCHAR(100) NOT NULL,
		  last_Name VARCHAR(100) NOT NULL,
		  gender VARCHAR(50),
		  phone_Number VARCHAR(20) NULL,
		  profile_Pics TEXT NOT NULL
		);

		--Creating table for message senders
	CREATE TABLE users_Chat_Group (
	member_ID INT PRIMARY KEY NOT NULL, 
	group_Name VARCHAR(100) NULL,
	created_At DATETIME  NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (member_ID) references Users (users_ID)
	);

	CREATE TABLE user_Status (
	users_Id INT PRIMARY KEY  NOT NULL,
	is_Online  BIT NOT NULL,
	FOREIGN KEY (users_Id) REFERENCES Users (users_ID)
	);	

	--Create the messages table
	CREATE TABLE messages (
		 message_Id INT PRIMARY KEY IDENTITY(1,1),
		 senders_ID INT  NOT NULL,
		 recevers_ID INT  NOT NULL,
		 message VARCHAR(200) NOT NULL,
		 sent_Time DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
		 FOREIGN KEY (senders_ID) REFERENCES Users (users_ID),
		 FOREIGN KEY (recevers_ID) REFERENCES Users (users_ID)
		);

	INSERT INTO Users ( first_Name, last_Name, gender, phone_Number, profile_Pics) 
	VALUES
	('David', 'Ukpoju', 'M', '+234 806 555 0123', 'pics1.jpg'),
	('Nneka', 'Lynda', 'F', '+234 806 555 1234', 'pics2.jpg'),
	('Chuka', 'Ogbodo','M', '+234 806 555 2345', 'pics3.jpg');
		  
	INSERT INTO users_Chat_Group (member_ID, group_Name, created_At) 
	VALUES
	('1','Bezao cohort3', ''),
	('2','Learnable Devs', ''),
	('3','Bezao cohort1', '');

	INSERT INTO user_Status ( users_Id, is_Online) 
	VALUES
	('1','TRUE'),
	('2','FALSE'),
	('3','TRUE');


	INSERT INTO messages( senders_ID, recevers_ID, message, sent_Time ) 
	VALUES
	('1','2','Hello Nneka, Please notify Chuka to send the repository link immediately, Thanks', ''),
	('2','1','Okay, i will soonest.', ''),
	('2','3','Please, send the repository link to David.', '');

	--View SenderName,ReceiverName, MessageSent and TimeStamp .

		SELECT 
	Sender.first_Name AS SenderName, 
	Receiver.first_Name AS ReceiverName,
	messages.Message,
	messages.Sent_Time
	FROM messages
	JOIN users AS Sender ON Sender.users_ID = messages.senders_ID
	JOIN users AS Receiver ON Receiver.users_ID = messages.recevers_ID;

	