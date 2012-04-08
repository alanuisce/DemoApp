package ie.cit.cloudapp.web;

import java.util.List;

import ie.cit.cloudapp.Todo;
import ie.cit.cloudapp.TodoRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("todos")
@Controller
public class TodoController {

	@Autowired
	private TodoRepository repo;

	@RequestMapping(method = RequestMethod.GET)
	public void listTodos(Model model) {
		model.addAttribute("todos", repo.getTodos());
	}

	@RequestMapping(method = RequestMethod.POST)
	public void createTodo(Model model, @RequestParam String text) {
		Todo todo = new Todo();
		todo.setText(text);
		repo.addTodo(todo);
		model.addAttribute("todos", repo.getTodos());
	}

	@RequestMapping(method = RequestMethod.DELETE)
	public void deleteTodo(Model model, @RequestParam int todoId) {
		repo.getTodos().remove(todoId - 1);
		model.addAttribute("todos", repo.getTodos());
	}

	@RequestMapping(method = RequestMethod.PUT)
	public void updateTodo(Model model, @RequestParam int todoId) {
		Todo todo = repo.getTodos().get(todoId - 1);
		todo.setDone(!todo.isDone());
		model.addAttribute("todos", repo.getTodos());
	}
}
