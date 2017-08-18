# R Code
# Measures based on Density
# L. P. F. Garcia A. C. Lorena and M. de Souto 2017
# The set of Measues based on density
#
# These measures are based on the paper: 
#@article{sotoca2006meta,
#  title={A meta-learning framework for pattern classication by means of data complexity measures},
#  author={Sotoca, Jos{\'e} Mart{\'\i}nez and Mollineda, Ram{\'o}n Alberto and S{\'a}nchez, Jos{\'e} Salvador},
#  journal={Inteligencia Artificial. Revista Iberoamericana de Inteligencia Artificial},
#  volume={10},
#  number={29},
#  year={2006},
#  publisher={Asociaci{\'o}n Espa{\~n}ola para la Inteligencia Artificial}
#}


volume <- function(data) {
    apply(data, 2, function(i) {
        if(is.numeric(i))
            max(i) - min(i)
        length(unique(i))
    })
}


# Volume of local neighborhood (D2)
d2 <- function(dst, data, k=3) {

    aux = unlist(
        lapply(rownames(data),
            function(i) {
                tmp = knn(dst, data, k, i)
                volume(data[names(tmp), -ncol(data)])
        })
    )

    return(mean(aux))
}


voting <- function(pred, data, i) {

    if(max(table(pred)) >= 2)
        return(which.max(table(pred)))
    return(data[i,]$class)
}


# Class density in overlap region (D3)
d3 <- function(dst, data, k=3) {

    aux = unlist(
        lapply(rownames(data),
            function(i) {
                tmp = knn(dst, data, k, i)
                voting(tmp, data, i)
        })
    )

    aux = mean(aux != data$class)
    return(aux)
}


geodensity <- function(data) {

    dst = dist(data[,-ncol(data)])
    aux = lapply(GEODENSITY, 
        function(i) {
            do.call(i, list(dst, data))
    })

    aux = unlist(aux)
    names(aux) = GEODENSITY
    return(aux)
}
