package ie.cit.cloudapp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class JdbcTodoRepository {

	private JdbcTemplate jdbcTemplate;

	public JdbcTodoRepository(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public void save(Todo todo) {
		jdbcTemplate.update("insert into TODO(text, done) values(?,?)",
				todo.getText(), todo.isDone());
	}

	public Todo get(int id) {
		return jdbcTemplate.queryForObject(
				"select id, text, done from TODO where id=?", new TodoMapper(),
				id);
	}
	
	public List<Todo> getAll() {
		return jdbcTemplate.query("select id, text, done from TODO", new TodoMapper());
	}

	public void delete(int id) {
		jdbcTemplate.update("delete from TODO where id=?", id);
	}

	public void update(Todo todo) {
		jdbcTemplate.update("update TODO set text=?, done=? where id=?",
				todo.getText(), todo.isDone(), todo.getId());
	}

}

class TodoMapper implements RowMapper<Todo> {

	public Todo mapRow(ResultSet rs, int rowNum) throws SQLException {
		Todo todo = new Todo();
		todo.setText(rs.getString("text"));
		todo.setDone(rs.getBoolean("done"));
		todo.setId(rs.getInt("id"));
		return todo;
	}
}