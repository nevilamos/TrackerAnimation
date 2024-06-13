library(moveVis)
library(move)
library(move2)
myData<-to_move(readRDS("./data/myData.rds"))
birdnames <- readRDS("C:/Data/TrackerAnimation/data/birdnames.rds")


#data("move_data", package = "moveVis") # move class object
# if your tracks are present as data.frames, see df2move() for conversion

# align move_data to a uniform time scale
m <- align_move(myData, res = 15, unit = "mins")

# create spatial frames with a OpenStreetMap watercolour map
frames <- frames_spatial(m, path_colours = birdnames$color,
                         map_service = "esri", map_type = "world_imagery", alpha = 1) %>% 
  add_labels(x = "Longitude", y = "Latitude") %>% # add some customizations, such as axis labels
  add_northarrow() %>% 
  add_scalebar() %>% 
  add_timestamps(type = "label") %>% 
  add_progress() 
  

frames[[100]] # preview one of the frames, e.g. the 100th frame

# animate frames
animate_frames(frames, out_file = "brolgaPath2.mp4")
