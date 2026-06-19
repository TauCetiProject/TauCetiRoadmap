# Fair-use extract: Lickorish, An Introduction to Knot Theory: the Alexander polynomial, Seifert matrix, and Conway skein relation

**Source.** W. B. R. Lickorish, An Introduction to Knot Theory, Springer GTM 175, 1997.
**Locus.** Chapter 6, "The Alexander Polynomial", Definition 6.4 (Seifert form/matrix, printed p. 53), Theorem 6.5 (presentation of the Alexander module, printed pp. 54–55), Definition 6.6 and the determinant formula (Alexander polynomial, printed p. 55); and Chapter 8, "The Conway Polynomial, Signatures and Slice Knots", Theorem 8.6 (Conway-normalised skein characterisation, printed pp. 82–83) and the definition of the Conway polynomial (printed p. 83; PDF pp. 63–65, 92–93).
**Supports.** GeometricTopology roadmap, layer 4 (the Alexander polynomial via a Seifert matrix `det(tA − Aᵀ)`, its Conway normalisation, and the skein relation).

*(Short attributed quotations of the essential statements, surrounding material summarised, for scholarly reference.)*

## Summary

Chapter 6 defines the Alexander polynomial homologically. From a Seifert surface `F` for an oriented link `L`, the *Seifert form* `α : H₁(F;ℤ) × H₁(F;ℤ) → ℤ` is `α(x,y) = lk(i₋x, y)` (the linking number of `x` pushed off `F` in the negative normal direction with `y`); in a basis it is the *Seifert matrix* `A` with `Aᵢⱼ = lk(fᵢ⁻, fⱼ)` (Definition 6.4, printed p. 53). Cutting the link exterior along `F` and gluing countably many copies produces the infinite cyclic cover `X_∞`, on which translation `t` makes `H₁(X_∞;ℤ)` a module over `ℤ[t⁻¹, t]` (the *Alexander module*). Theorem 6.5 (printed pp. 54–55) shows `tA − Aᵀ` presents this module. The `r`-th Alexander polynomial is a generator of the smallest principal ideal containing the `r`-th elementary ideal; the first one is *the* Alexander polynomial `Δ_L(t)`, well-defined up to a unit `±tⁿ` (Definition 6.6, printed p. 55), and because `tA − Aᵀ` is square, `Δ_L(t) ≐ det(tA − Aᵀ)`.

Chapter 8 reconciles this with the Conway approach. Theorem 8.6 (printed pp. 82–83) characterises the *Conway-normalised* Alexander polynomial `Δ_L(t) ∈ ℤ[t⁻¹ᐟ², t¹ᐟ²]` by the value 1 on the unknot together with the oriented skein relation `Δ_{L₊} − Δ_{L₋} = (t⁻¹ᐟ² − t¹ᐟ²) Δ_{L₀}`. Substituting `z = t⁻¹ᐟ² − t¹ᐟ²` gives the *Conway polynomial* (or potential) `∇_L(z) ∈ ℤ[z]` with `∇_{unknot}(z) = 1` and the same skein relation in `z` (printed p. 83).

## Key statements (quoted)

The Seifert form and Seifert matrix (Definition 6.4 and the following paragraph, printed p. 53):

> Definition 6.4. Associated to the Seifert surface F for an oriented link L is the Seifert form
> α : H₁(F; ℤ) × H₁(F; ℤ) → ℤ
> defined by α(x, y) = lk(i₋x, y).

> Taking a basis {[fᵢ]} for H₁(F; ℤ) with a β-dual basis {[eᵢ]} for H₁(S³ − F; ℤ) as before, α is represented by the Seifert matrix A, where
> Aᵢⱼ = α([fᵢ], [fⱼ]) = lk(fᵢ⁻, fⱼ) = lk(fᵢ, fⱼ⁺).

Presentation of the Alexander module (Theorem 6.5, printed p. 54):

> Theorem 6.5. Let F be a Seifert surface for an oriented link L in S³ and let A be a matrix, with respect to any basis of H₁(F; ℤ), for the corresponding Seifert form. Then tA − Aᵀ is a matrix that presents the ℤ[t⁻¹, t]-module H₁(X_∞; ℤ).

The Alexander polynomial (Definition 6.6 and the displayed formula, printed p. 55):

> Definition 6.6. The rth Alexander ideal of an oriented link L is the rth elementary ideal of the ℤ[t⁻¹, t] module H₁(X_∞; ℤ). The rth Alexander polynomial of L is a generator of the smallest principal ideal of ℤ[t⁻¹, t] that contains the rth Alexander ideal. The first Alexander polynomial is called the Alexander polynomial and is written Δ_L(t).

> … the Alexander polynomial of L is given by
> Δ_L(t) ≐ det(tA − Aᵀ),
> where "≐" means "is equal to, up to multiplication by a unit".

The Conway-normalised skein characterisation (Theorem 8.6, printed pp. 82–83):

> Theorem 8.6. For oriented links L, the Conway-normalised Alexander polynomial Δ_L(t) ∈ ℤ[t⁻¹ᐟ², t¹ᐟ²] is characterised by
> (i) Δ_{unknot}(t) = 1,
> (ii) whenever three oriented links L₊, L₋ and L₀ are the same except in the neighbourhood of a point where they are as shown in Figure 3.2, then
> Δ_{L₊} − Δ_{L₋} = (t⁻¹ᐟ² − t¹ᐟ²) Δ_{L₀}.

The Conway polynomial (printed p. 83):

> … make the substitution (t⁻¹ᐟ² − t¹ᐟ²) = z, and define the Conway polynomial, or potential, for L to be ∇_L(z) ∈ ℤ[z], where ∇_L(t⁻¹ᐟ² − t¹ᐟ²) = Δ_L(t), the Conway-normalised Alexander polynomial.

> It is characterised by ∇_{unknot}(z) = 1 and (with reference to Figure 3.2) the skein formula …

(The displayed skein formula at the end is the image-rendered relation `∇_{L₊}(z) − ∇_{L₋}(z) = z ∇_{L₀}(z)`, the `z`-substituted form of Theorem 8.6(ii).)

## Notes

- The suggested locus is correct: the Seifert-matrix Alexander polynomial is Chapter 6, and the Conway normalisation/skein relation is in the Conway chapter, which is **Chapter 8** ("The Conway Polynomial, Signatures and Slice Knots", printed pp. 79–92). There is no separately numbered "Conway chapter" beyond Chapter 8.
- `i₋x` denotes pushing the cycle `x` off `F` in the negative normal direction (`e₋ = i₋e` in Lickorish's notation, printed p. 53). Equivalently `Aᵢⱼ = lk(fᵢ⁻, fⱼ) = lk(fᵢ, fⱼ⁺)`.
- The "≐" symbol (rendered by OCR as `~` / `≈`) means equality up to a unit `±t^n` of `ℤ[t⁻¹, t]`.
- Theorem 6.5's proof is a Mayer–Vietoris computation on the infinite cyclic cover; the map `α_*` is represented by `tA − Aᵀ`.
- Theorem 8.6 is the bridge between the homological definition (Chapter 6) and the skein/Conway definition; Lickorish notes the formula is "the promised analogue" of the Jones skein relation (Proposition 3.7). Figure 3.2 supplies the standard `L₊ / L₋ / L₀` crossing triple.
- The Conway-normalised `Δ_L` lives in `ℤ[t⁻¹ᐟ², t¹ᐟ²]` (half-integer powers) and is a genuine representative, removing the unit ambiguity of the Chapter 6 `Δ_L(t)`.
