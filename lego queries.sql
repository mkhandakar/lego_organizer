/*Find sets that have a word or phrase in their description*/

SELECT * FROM lego_sets
WHERE description LIKE '%Police' OR description LIKE '%car';

/*Sort by sets with the highest piece count*/

WHERE piece_count IS NOT NULL
ORDER BY piece_count DESC;

/*Show only sets that belong to a specific theme*/

SELECT lego_sets. *
FROM lego_sets
JOIN themes ON lego_sets.theme_id=themes.themes_id
WHERE themes.theme_name= 'Star wars';

/*For the viewing of the sets, make a query that “paginates” the list, giving 4 at a time 
and not repeating*/

SELECT * FROM lego_sets
LIMIT 4 OFFSET 0;




