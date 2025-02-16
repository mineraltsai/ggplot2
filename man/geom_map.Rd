% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom-map.r
\name{geom_map}
\alias{geom_map}
\title{Polygons from a reference map}
\usage{
geom_map(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  ...,
  map,
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE
)
}
\arguments{
\item{mapping}{Set of aesthetic mappings created by \code{\link[=aes]{aes()}}. If specified and
\code{inherit.aes = TRUE} (the default), it is combined with the default mapping
at the top level of the plot. You must supply \code{mapping} if there is no plot
mapping.}

\item{data}{The data to be displayed in this layer. There are three
options:

If \code{NULL}, the default, the data is inherited from the plot
data as specified in the call to \code{\link[=ggplot]{ggplot()}}.

A \code{data.frame}, or other object, will override the plot
data. All objects will be fortified to produce a data frame. See
\code{\link[=fortify]{fortify()}} for which variables will be created.

A \code{function} will be called with a single argument,
the plot data. The return value must be a \code{data.frame}, and
will be used as the layer data. A \code{function} can be created
from a \code{formula} (e.g. \code{~ head(.x, 10)}).}

\item{stat}{The statistical transformation to use on the data for this
layer, either as a \code{ggproto} \code{Geom} subclass or as a string naming the
stat stripped of the \code{stat_} prefix (e.g. \code{"count"} rather than
\code{"stat_count"})}

\item{...}{Other arguments passed on to \code{\link[=layer]{layer()}}. These are
often aesthetics, used to set an aesthetic to a fixed value, like
\code{colour = "red"} or \code{size = 3}. They may also be parameters
to the paired geom/stat.}

\item{map}{Data frame that contains the map coordinates.  This will
typically be created using \code{\link[=fortify]{fortify()}} on a spatial object.
It must contain columns \code{x} or \code{long}, \code{y} or
\code{lat}, and \code{region} or \code{id}.}

\item{na.rm}{If \code{FALSE}, the default, missing values are removed with
a warning. If \code{TRUE}, missing values are silently removed.}

\item{show.legend}{logical. Should this layer be included in the legends?
\code{NA}, the default, includes if any aesthetics are mapped.
\code{FALSE} never includes, and \code{TRUE} always includes.
It can also be a named logical vector to finely select the aesthetics to
display.}

\item{inherit.aes}{If \code{FALSE}, overrides the default aesthetics,
rather than combining with them. This is most useful for helper functions
that define both data and aesthetics and shouldn't inherit behaviour from
the default plot specification, e.g. \code{\link[=borders]{borders()}}.}
}
\description{
Display polygons as a map. This is meant as annotation, so it does not
affect position scales. Note that this function predates the \code{\link[=geom_sf]{geom_sf()}}
framework and does not work with sf geometry columns as input. However,
it can be used in conjunction with \code{geom_sf()} layers and/or
\code{\link[=coord_sf]{coord_sf()}} (see examples).
}
\section{Aesthetics}{

\code{geom_map()} understands the following aesthetics (required aesthetics are in bold):
\itemize{
\item \strong{\code{map_id}}
\item \code{alpha}
\item \code{colour}
\item \code{fill}
\item \code{group}
\item \code{linetype}
\item \code{linewidth}
\item \code{subgroup}
}
Learn more about setting these aesthetics in \code{vignette("ggplot2-specs")}.
}

\examples{
# First, a made-up example containing a few polygons, to explain
# how `geom_map()` works. It requires two data frames:
# One contains the coordinates of each polygon (`positions`), and is
# provided via the `map` argument. The other contains the
# other the values associated with each polygon (`values`).  An id
# variable links the two together.

ids <- factor(c("1.1", "2.1", "1.2", "2.2", "1.3", "2.3"))

values <- data.frame(
  id = ids,
  value = c(3, 3.1, 3.1, 3.2, 3.15, 3.5)
)

positions <- data.frame(
  id = rep(ids, each = 4),
  x = c(2, 1, 1.1, 2.2, 1, 0, 0.3, 1.1, 2.2, 1.1, 1.2, 2.5, 1.1, 0.3,
  0.5, 1.2, 2.5, 1.2, 1.3, 2.7, 1.2, 0.5, 0.6, 1.3),
  y = c(-0.5, 0, 1, 0.5, 0, 0.5, 1.5, 1, 0.5, 1, 2.1, 1.7, 1, 1.5,
  2.2, 2.1, 1.7, 2.1, 3.2, 2.8, 2.1, 2.2, 3.3, 3.2)
)

ggplot(values) +
  geom_map(aes(map_id = id), map = positions) +
  expand_limits(positions)
ggplot(values, aes(fill = value)) +
  geom_map(aes(map_id = id), map = positions) +
  expand_limits(positions)
ggplot(values, aes(fill = value)) +
  geom_map(aes(map_id = id), map = positions) +
  expand_limits(positions) + ylim(0, 3)

# Now some examples with real maps
if (require(maps)) {

  crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)

  # Equivalent to crimes \%>\% tidyr::pivot_longer(Murder:Rape)
  vars <- lapply(names(crimes)[-1], function(j) {
    data.frame(state = crimes$state, variable = j, value = crimes[[j]])
  })
  crimes_long <- do.call("rbind", vars)

  states_map <- map_data("state")

  # without geospatial coordinate system, the resulting plot
  # looks weird
  ggplot(crimes, aes(map_id = state)) +
    geom_map(aes(fill = Murder), map = states_map) +
    expand_limits(x = states_map$long, y = states_map$lat)

  # in combination with `coord_sf()` we get an appropriate result
  ggplot(crimes, aes(map_id = state)) +
    geom_map(aes(fill = Murder), map = states_map) +
    # crs = 5070 is a Conus Albers projection for North America,
    #   see: https://epsg.io/5070
    # default_crs = 4326 tells coord_sf() that the input map data
    #   are in longitude-latitude format
    coord_sf(
      crs = 5070, default_crs = 4326,
      xlim = c(-125, -70), ylim = c(25, 52)
    )

 ggplot(crimes_long, aes(map_id = state)) +
   geom_map(aes(fill = value), map = states_map) +
   coord_sf(
     crs = 5070, default_crs = 4326,
     xlim = c(-125, -70), ylim = c(25, 52)
   ) +
   facet_wrap(~variable)
}
}
