package com.cinema.dto.reponse;

import com.cinema.dto.request.FilmDTO;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class MovieThreaterResponse {
    private int[][] seat;
    private String time;
    private int numberThreater;
    private FilmNameResponse film;
}
