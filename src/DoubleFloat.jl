struct Double{T, E} <: MultipartFloat{T}
    hi::T
    lo::T

   function Double(::Type{Accuracy}, hi::T, lo::T)  where {T<:AbstractFloat}
       new{T, Accuracy}(hi, lo)
   end

   function Double(::Type{Performance}, hi::T, lo::T)  where {T<:AbstractFloat}
       new{T, Performance}(hi, lo)
   end
end

function Double(::Type{Accuracy}, hi::T) where {T<:AbstractFloat}
    return Double(Accuracy, hi, zero(T))
end

function Double(::Type{Performance}, hi::T) where {T<:AbstractFloat}
    return Double(Performance, hi, zero(T))
end

function Double{T, Accuracy}(hi::T, lo::T) where {T<:AbstractFloat}
    hi, lo = two_sum(hi, lo)
    return Double(Accuracy, hi, lo)
end

function Double{T, Performance}(hi::T, lo::T) where {T<:AbstractFloat}
    hi, lo = two_sum(hi, lo)
    return Double(Performance, hi, lo)
end

function Double{T, Accuracy}(hi::T) where {T<:AbstractFloat}
    return Double(Accuracy, hi, zero(T))
end

function Double{T, Performance}(hi::T) where {T<:AbstractFloat}
    return Double(Performance, hi, zero(T))
end

function Double(hi::T, lo::T) where {T<:AbstractFloat}
    return Double{T, Accuracy}(hi, lo)
end

function Double(hi::T) where {T<:AbstractFloat}
    return Double{T, Accuracy}(hi)
end

function FastDouble(hi::T, lo::T) where {T<:AbstractFloat}
    return Double{T, Performance}(hi, lo)
end

function FastDouble(hi::T) where {T<:AbstractFloat}
    return Double{T, Performance}(hi)
end