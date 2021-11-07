module PeriodicArray

mutable struct PeriodicArray{T,N} <: AbstractArray{T,N}
    x :: AbstractArray{T,N}
end

Base.size(A::PeriodicArray) = size(A.x)

Base.length(A::PeriodicArray)=length(A.x)

function Base.getindex(A :: PeriodicArray, I :: Vararg{Int,N}) where N
    I2 = size(A)
    return Base.getindex(A.x,(mod.(I .- 1,I2) .+ 1)...)
end

function Base.setindex(A :: PeriodicArray, I :: Vararg{Int,N}) where N
    return Base.setindex!(A.x,value,(mod.(I .- 1,I2) .+ 1)...)
end

end # module
