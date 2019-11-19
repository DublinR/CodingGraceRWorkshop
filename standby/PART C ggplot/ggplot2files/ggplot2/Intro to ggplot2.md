<style>
  p {     font-size:16px;
  }
</style>

Introduction to ggplot2
========================================================
*** Wickham, Chapter 1***



ggplot2 is an R package for producing statistical, or data, graphics, but it is unlike most other graphics packages because it has a deep underlying grammar. 

This grammar, based on the Grammar of Graphics (Wilkinson,
2005), is composed of a set of independent components that can be composed in many different ways. 

This makes ggplot2 very powerful, because you are
not limited to a set of pre-specified graphics, but you can create new graphicsthat are precisely tailored for your problem. 

This may sound overwhelming, but because there is a simple set of core principles and very few special cases, ggplot2 is also easy to learn (although it may take a little time to forget your
preconceptions from other graphics tools).

### Layering
ggplot2 is designed to work in a layered fashion, starting with a layer showing the raw data then adding layers of annotations and statistical summaries.

It allows you to produce graphics using the same structured thinking
that you use to design an analysis, reducing the distance between a plot in your head and one on the page. 

It is especially helpful for students who have not yet developed the structured approach to analysis used by experts.

<hr>
### Grammar of Graphics

The data that you want to visualise and a set of aesthetic mappings
describing how variables in the data are mapped to aesthetic attributes
that you can perceive.

Geometric objects, ***geoms*** for short, represent what you actually see on
the plot: points, lines, polygons, etc.

Statistical transformations, ***stats*** for short, summarise data in many useful ways. For example, binning and counting observations to create a histogram,
or summarising a 2d relationship with a linear model. Stats are optional,
but very useful.

The ***scales*** map values in the data space to values in an aesthetic space,
whether it be colour, or size, or shape. Scales draw a legend or axes, which provide an inverse mapping to make it possible to read the original data values from the graph.

A coordinate system, ***coord*** for short, describes how data coordinates are
mapped to the plane of the graphic. It also provides axes and gridlines to
make it possible to read the graph. We normally use a Cartesian coordinate
system, but a number of others are available, including polar coordinates
and map projections.

A ***facet***ing specification describes how to break up the data into subsets
and how to display those subsets as small multiples. This is also known as
conditioning or latticing/trellising.

<hr>

### The `ggplot()` Command

The command `ggplot()` initializes a ggplot object. It can be used to declare the input data frame for a graphic.

It can also be used to specify the set of plot aesthetics intended to be common throughout all subsequent layers (unless specifically overridden).

Important: The actual plots are built with subsequent commands.


`ggplot()` is typically used to construct a plot incrementally, using the `+` operator to add layers to the existing ggplot object.

This is advantageous in that the code is explicit about which layers are added and the order in which they are added.

We can define common aesthetics using the `aes` argument for this command.

<hr> 

### Components of Graphics

To understand ggplot, you need to ask yourself, what are the fundamental parts of every data graph? They are:

**Aesthetics** - these are the roles that the variables play in each graph. A variable may control where points appear, the color or shape of a point, the height of a bar and so on.

**Geoms** - these are the geometric objects. Do you need bars, points, lines?

**Statistics** - these are the functions like linear regression you might need to draw a line.

**Scales** - these are legends that show things like circular symbols represent females while circles represent males.

**Facets** - these are the groups in your data.For example, faceting by gender would cause the graph to repeat for the two genders.
