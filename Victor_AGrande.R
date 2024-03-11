install.packages('tidyverse')
install.packages('spotifyr')
install.packages('readxl')
install.packages('openxlsx')

library(tidyverse)
library(spotifyr)
library(readxl)
library(openxlsx)

Sys.setenv(SPOTIFY_CLIENT_ID = '679dfcc8b8d046da8ab806e61c5766c3')
Sys.setenv(SPOTIFY_CLIENT_SECRET = 'dcd6319807ab4de2996baeee606e9f1e')

a.grande <- get_artist_audio_features('Ariana Grande')

a.grande <- tibble(a.grande)
write.xlsx(a.grande, "a_grande.xlsx")

arianaGrande <- read_excel("a_grande.xlsx")


https://developer.spotify.com/documentation/web-api/reference/get-audio-analysis
mean(arianaGrande$instrumentalness)
mean(arianaGrande$valence)
mean(arianaGrande$energy)

ggplot(arianaGrande, aes(x = energy, 
                    fill = album_name)) +
  geom_density(alpha = 0.7) +
  theme_minimal() + 
  labs(fill = "Album") + 
  labs(x = "[Variable]", y = "Density") +
  theme(
    legend.position = "right"  
  ) + ggtitle('[Variable] x Album')


ggplot(arianaGrande, aes(x = album_name, 
                         y = valence, 
                         fill = album_name)) +
  geom_boxplot(alpha = 1) +
  geom_point(aes(text = track_name), alpha = 0.3) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  ggtitle("Valence x Album", subtitle = 'By Victor Cornejo')

