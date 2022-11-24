package com.movie.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.hibernate.validator.constraints.Range;

import com.movie.sequenceGenerator.StringPrefixedSequenceIdGenerator;

@Entity
public class Movie {
	@Id
//	@GeneratedValue(strategy=GenerationType.AUTO)
	@GeneratedValue(strategy =GenerationType.SEQUENCE,generator = "Movie_seq")
    @GenericGenerator(name="Movie_seq",
            strategy = "com.movie.sequenceGenerator.StringPrefixedSequenceIdGenerator",
            parameters = {
                    @Parameter(name=StringPrefixedSequenceIdGenerator.INCREMENT_PARAM,value="1"),
                    @Parameter(name=StringPrefixedSequenceIdGenerator.VALUE_PREFIX_PARAMETER,value="MOV"),
                    @Parameter(name=StringPrefixedSequenceIdGenerator.NUMBER_FORMAT_PARAMETER,value="%04d")
            }
            )
	private String movieId;
//	@NotBlank(message="Movie Name is required")
	private String movieName;
	
	private String image;
	
//	@NotBlank(message="*Language is required")
	private String language;
//	@NotBlank(message="Description is mandatory")
//	@Size(min=50, max=1000,message="This field requires 50-1000 characters.")
	private String description;
//	@Size(min=1,max=5,message="Rating should be in the range 1-5")
	private String rating;
//	@NotBlank(message="Time Duration field should not be empty.")
	private String timeDuration;
//	@NotBlank(message="Movie should have a genre.")
	private String genre;
	
	private Date releaseDate;
//	@NotBlank(message="Lead actor field should not be empty.")
	private String leadActor;
//	@NotBlank(message="Lead Actress field should not be empty.")
	private String leadActress;
//	@NotBlank(message="Co Actor 1 field should not be empty.")
	private String coActor1;
//	@NotBlank(message="Co Actor 2 field should not be empty.")
	private String coActor2;
	
	@OneToMany
	private List<Show> show ;

	public String getMovieId() {
		return movieId;
	}

	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getTimeDuration() {
		return timeDuration;
	}

	public void setTimeDuration(String timeDuration) {
		this.timeDuration = timeDuration;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getLeadActor() {
		return leadActor;
	}

	public void setLeadActor(String leadActor) {
		this.leadActor = leadActor;
	}

	public String getLeadActress() {
		return leadActress;
	}

	public void setLeadActress(String leadActress) {
		this.leadActress = leadActress;
	}

	public String getCoActor1() {
		return coActor1;
	}

	public void setCoActor1(String coActor1) {
		this.coActor1 = coActor1;
	}

	public String getCoActor2() {
		return coActor2;
	}

	public void setCoActor2(String coActor2) {
		this.coActor2 = coActor2;
	}

	public List<Show> getShow() {
		return show;
	}

	public void setShow(List<Show> show) {
		this.show = show;
	}
	
}
