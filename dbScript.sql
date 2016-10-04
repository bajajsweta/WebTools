create table `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `person` (
  `person_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `person_name` varchar(45) DEFAULT NULL,
  `person_lastname` varchar(45) DEFAULT NULL,
  `email_id` varchar(45) DEFAULT NULL,
  `address_1` varchar(45) DEFAULT NULL,
  `address_2` varchar(45) DEFAULT NULL,
  `address_3` varchar(45) DEFAULT NULL,
  `phone_no` varchar(45) DEFAULT NULL,
  `ssn` varchar(45) DEFAULT NULL,
  `nationality` varchar(45) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `lender` (
  `lender_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `lend_Amount` float DEFAULT NULL,
  PRIMARY KEY (`lender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `borrower` (
  `borrower_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `borrow_Amount` float DEFAULT NULL,
  PRIMARY KEY (`borrower_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `loan_process_state` (
  `loan_process_id` int(11) NOT NULL,
  `loan_process_state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`loan_process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `loan_rate` (
  `loan_id` int(11) NOT NULL,
  `loan_rate` float DEFAULT NULL,
  `loan_interestrate` float DEFAULT NULL,
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `loan_type` (
  `loan_type_id` int(11) NOT NULL,
  `loan_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`loan_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `lender_id` int(11) DEFAULT NULL,
  `borrowe_id` int(11) DEFAULT NULL,
  `loan_type_id` int(11) DEFAULT NULL,
  `loan_rate_id` int(11) DEFAULT NULL,
  `loan_process_state_id` int(11) DEFAULT NULL,
  `loan_start_date` datetime DEFAULT NULL,
  `loan_end_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `lender_id_idx` (`lender_id`),
  KEY `borrower_id_idx` (`borrowe_id`),
  KEY `loan_type_id_idx` (`loan_type_id`),
  KEY `loan_rate_id_idx` (`loan_rate_id`),
  KEY `loan_process_state_id_idx` (`loan_process_state_id`),
  KEY `person_id_idx` (`person_id`),
  CONSTRAINT `borrower_id` FOREIGN KEY (`borrowe_id`) REFERENCES `borrower` (`borrower_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lender_id` FOREIGN KEY (`lender_id`) REFERENCES `lender` (`lender_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_process_state_id` FOREIGN KEY (`loan_process_state_id`) REFERENCES `loan_process_state` (`loan_process_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_rate_id` FOREIGN KEY (`loan_rate_id`) REFERENCES `loan_rate` (`loan_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_type_id` FOREIGN KEY (`loan_type_id`) REFERENCES `loan_type` (`loan_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;








