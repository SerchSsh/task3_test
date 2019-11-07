USE `fotostrana`;

CREATE TABLE `news` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`text` VARCHAR(243) NOT NULL,
	`category` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`id`)
)
COLLATE='utf8_general_ci'
AUTO_INCREMENT=0
;

CREATE TABLE `users` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
)
COLLATE='utf8_general_ci'
;

CREATE TABLE `likes` (
	`news_id` INT UNSIGNED NOT NULL,
	`user_id` INT UNSIGNED NOT NULL,
	`status` TINYINT UNSIGNED NOT NULL DEFAULT '0',
	PRIMARY KEY (`news_id`, `user_id`)
)
COLLATE='utf8_general_ci'
;

ALTER TABLE `likes`
	ADD CONSTRAINT `FK_likes_news` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`),
	ADD CONSTRAINT `FK_likes_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);


1:	INSERT INTO `fotostrana`.`likes` (`news_id`, `user_id`, `status`) VALUES (?, ?, '1');
2:	UPDATE `fotostrana`.`likes` SET `status`='0' WHERE  `news_id`=? AND `user_id`=?;
3:	SELECT u.id, u.name FROM `users` u, `likes` l WHERE u.id = l.user_id AND l.news_id = ? AND l.status = 1 LIMIT ? OFFSET ?
	// Èëè ÷åðåç JOIN
	SELECT u.id, u.name FROM `users` u  INNER JOIN (`news` n INNER JOIN  `likes` l ON l.news_id = n.id) ON u.id = l.user_id WHERE n.id=? AND l.status = 1 LIMIT ? OFFSET ?
4:	SELECT * FROM `fotostrana`.`news`;
	SELECT * FROM `fotostrana`.`news` WHERE `category` = '?'; // ? - ïàðàìåòð äëÿ ôèëüòðà ïî êàòåãîðèÿì. Ìîæíî èñïîëüçîâàòü íåñêîëüêî êàòåãîðèé, ëèáî ÷åðåç WHERE ... AND/OR ..., ëèáî IN(..., ..., ...,).
5:	INSERT INTO `fotostrana`.`news` (`text`, `category`) VALUES ('?', '?');
