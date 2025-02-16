% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom-contour.r, R/stat-contour.r
\name{geom_contour}
\alias{geom_contour}
\alias{geom_contour_filled}
\alias{stat_contour}
\alias{stat_contour_filled}
\title{2D contours of a 3D surface}
\usage{
geom_contour(
  mapping = NULL,
  data = NULL,
  stat = "contour",
  position = "identity",
  ...,
  bins = NULL,
  binwidth = NULL,
  breaks = NULL,
  lineend = "butt",
  linejoin = "round",
  linemitre = 10,
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE
)

geom_contour_filled(
  mapping = NULL,
  data = NULL,
  stat = "contour_filled",
  position = "identity",
  ...,
  bins = NULL,
  binwidth = NULL,
  breaks = NULL,
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE
)

stat_contour(
  mapping = NULL,
  data = NULL,
  geom = "contour",
  position = "identity",
  ...,
  bins = NULL,
  binwidth = NULL,
  breaks = NULL,
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE
)

stat_contour_filled(
  mapping = NULL,
  data = NULL,
  geom = "contour_filled",
  position = "identity",
  ...,
  bins = NULL,
  binwidth = NULL,
  breaks = NULL,
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

\item{position}{Position adjustment, either as a string naming the adjustment
(e.g. \code{"jitter"} to use \code{position_jitter}), or the result of a call to a
position adjustment function. Use the latter if you need to change the
settings of the adjustment.}

\item{...}{Other arguments passed on to \code{\link[=layer]{layer()}}. These are
often aesthetics, used to set an aesthetic to a fixed value, like
\code{colour = "red"} or \code{size = 3}. They may also be parameters
to the paired geom/stat.}

\item{bins}{Number of contour bins. Overridden by \code{breaks}.}

\item{binwidth}{The width of the contour bins. Overridden by \code{bins}.}

\item{breaks}{One of:
\itemize{
\item Numeric vector to set the contour breaks
\item A function that takes the range of the data and binwidth as input
and returns breaks as output. A function can be created from a formula
(e.g. ~ fullseq(.x, .y)).
}

Overrides \code{binwidth} and \code{bins}. By default, this is a vector of length
ten with \code{\link[=pretty]{pretty()}} breaks.}

\item{lineend}{Line end style (round, butt, square).}

\item{linejoin}{Line join style (round, mitre, bevel).}

\item{linemitre}{Line mitre limit (number greater than 1).}

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

\item{geom}{The geometric object to use to display the data, either as a
\code{ggproto} \code{Geom} subclass or as a string naming the geom stripped of the
\code{geom_} prefix (e.g. \code{"point"} rather than \code{"geom_point"})}
}
\description{
ggplot2 can not draw true 3D surfaces, but you can use \code{geom_contour()},
\code{geom_contour_filled()}, and \code{\link[=geom_tile]{geom_tile()}} to visualise 3D surfaces in 2D.

These functions require regular data, where the \code{x} and \code{y} coordinates
form an equally spaced grid, and each combination of \code{x} and \code{y} appears
once. Missing values of \code{z} are allowed, but contouring will only work for
grid points where all four corners are non-missing. If you have irregular
data, you'll need to first interpolate on to a grid before visualising,
using \code{\link[interp:interp]{interp::interp()}}, \code{\link[akima:bilinear]{akima::bilinear()}}, or similar.
}
\section{Aesthetics}{

\code{geom_contour()} understands the following aesthetics (required aesthetics are in bold):
\itemize{
\item \strong{\code{x}}
\item \strong{\code{y}}
\item \code{alpha}
\item \code{colour}
\item \code{group}
\item \code{linetype}
\item \code{linewidth}
\item \code{weight}
}
Learn more about setting these aesthetics in \code{vignette("ggplot2-specs")}.


\code{geom_contour_filled()} understands the following aesthetics (required aesthetics are in bold):
\itemize{
\item \strong{\code{x}}
\item \strong{\code{y}}
\item \code{alpha}
\item \code{colour}
\item \code{fill}
\item \code{group}
\item \code{linetype}
\item \code{linewidth}
\item \code{subgroup}
}
Learn more about setting these aesthetics in \code{vignette("ggplot2-specs")}.


\code{stat_contour()} understands the following aesthetics (required aesthetics are in bold):
\itemize{
\item \strong{\code{x}}
\item \strong{\code{y}}
\item \strong{\code{z}}
\item \code{group}
\item \code{order}
}
Learn more about setting these aesthetics in \code{vignette("ggplot2-specs")}.


\code{stat_contour_filled()} understands the following aesthetics (required aesthetics are in bold):
\itemize{
\item \strong{\code{x}}
\item \strong{\code{y}}
\item \strong{\code{z}}
\item \code{fill}
\item \code{group}
\item \code{order}
}
Learn more about setting these aesthetics in \code{vignette("ggplot2-specs")}.
}

\section{Computed variables}{

The computed variables differ somewhat for contour lines (computed by
\code{stat_contour()}) and contour bands (filled contours, computed by \code{stat_contour_filled()}).
The variables \code{nlevel} and \code{piece} are available for both, whereas \code{level_low}, \code{level_high},
and \code{level_mid} are only available for bands. The variable \code{level} is a numeric or a factor
depending on whether lines or bands are calculated.
\describe{
\item{\code{level}}{Height of contour. For contour lines, this is numeric vector that
represents bin boundaries. For contour bands, this is an ordered factor that
represents bin ranges.}
\item{\code{level_low}, \code{level_high}, \code{level_mid}}{(contour bands only) Lower and upper
bin boundaries for each band, as well the mid point between the boundaries.}
\item{\code{nlevel}}{Height of contour, scaled to maximum of 1.}
\item{\code{piece}}{Contour piece (an integer).}
}
}

\section{Dropped variables}{

\describe{
\item{\code{z}}{After contouring, the z values of individual data points are no longer available.}
}
}

\examples{
# Basic plot
v <- ggplot(faithfuld, aes(waiting, eruptions, z = density))
v + geom_contour()

# Or compute from raw data
ggplot(faithful, aes(waiting, eruptions)) +
  geom_density_2d()

\donttest{
# use geom_contour_filled() for filled contours
v + geom_contour_filled()

# Setting bins creates evenly spaced contours in the range of the data
v + geom_contour(bins = 3)
v + geom_contour(bins = 5)

# Setting binwidth does the same thing, parameterised by the distance
# between contours
v + geom_contour(binwidth = 0.01)
v + geom_contour(binwidth = 0.001)

# Other parameters
v + geom_contour(aes(colour = after_stat(level)))
v + geom_contour(colour = "red")
v + geom_raster(aes(fill = density)) +
  geom_contour(colour = "white")
}
}
\seealso{
\code{\link[=geom_density_2d]{geom_density_2d()}}: 2d density contours
}
