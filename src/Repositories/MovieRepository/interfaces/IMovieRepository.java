package Repositories.MovieRepository.interfaces;

import Entities.Movie;

import java.util.List;

public interface IMovieRepository {
    public boolean createMovie(Movie movie);
    public boolean deleteMovie(int id);
    public boolean updateMovieTitle(int id, String newValue);
    public boolean updateMovieDescription(int id, String newValue);
    public Movie getMovie(int id);

    List<Movie> getAllMovies();
}
