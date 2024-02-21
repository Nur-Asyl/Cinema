package Controllers.MovieController;

import Entities.Movie;
import Repositories.MovieRepository.interfaces.IMovieRepository;

import java.util.List;

public class MovieController {
    private final IMovieRepository movieRepo;

    public MovieController(IMovieRepository movieRepo) {
        this.movieRepo = movieRepo;
    }

    public String createMovie(String title, String description) {
        Movie movie = new Movie(title, description);
        boolean created = movieRepo.createMovie(movie);
        return (created) ? "|------| Movie created |------|" : "|------| Movie is not created |------|";
    }

    public String deleteMovie(int id) {
        boolean deleted = movieRepo.deleteMovie(id);
        return (deleted) ? "|------| Movie deleted |------|" : "|------| Movie is not deleted |------|";
    }

    public String updateMovieTitle(int id, String newValue) {
        boolean updated = movieRepo.updateMovieTitle(id, newValue);
        return (updated) ? "|------| Movie title updated |------|" : "|------| Movie title not updated |------|";
    }

    public String updateMovieDescription(int id, String newValue) {
        boolean updated = movieRepo.updateMovieDescription(id, newValue);
        return (updated) ? "|------| Movie description updated |------|" : "|------| Movie description not updated |------|";
    }

    public String getMovie(int id) {
        Movie movie = movieRepo.getMovie(id);
        return (movie != null) ? movie.toString() : "|------| Movie not found |------|";
    }

    public String getAllMovies() {
        StringBuilder displayAllMovies = new StringBuilder();
        List<Movie> movies = movieRepo.getAllMovies();
        for (Movie movie : movies) {
            displayAllMovies.append(movie.toString()).append("\n");
        }
        return displayAllMovies.toString();
    }
}
