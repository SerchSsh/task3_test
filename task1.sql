1:	INSERT INTO `fotostrana`.`likes` (`news_id`, `user_id`, `status`) VALUES (?, ?, '1');
2:	UPDATE `fotostrana`.`likes` SET `status`='0' WHERE  `news_id`=? AND `user_id`=?;
3:	SELECT u.id, u.name FROM `users` u, `likes` l WHERE u.id = l.user_id AND l.news_id = ? AND l.status = 1 LIMIT ? OFFSET ?
	// Или через JOIN
	SELECT u.id, u.name FROM `users` u  INNER JOIN (`news` n INNER JOIN  `likes` l ON l.news_id = n.id) ON u.id = l.user_id WHERE n.id=? AND l.status = 1 LIMIT ? OFFSET ?
4:	SELECT * FROM `fotostrana`.`news`;
	SELECT * FROM `fotostrana`.`news` WHERE `category` = '?'; // ? - параметр для фильтра по категориям. Можно использовать несколько категорий, либо через WHERE ... AND/OR ..., либо IN(..., ..., ...,).
5:	INSERT INTO `fotostrana`.`news` (`text`, `category`) VALUES ('?', '?');