# Roadmap: Chow forms and heights of subvarieties

**Summary.** Let `K` be a number field with ring of integers `O_K`. The Fubini–Study height of an effective `d`-cycle `Z` in `ℙ^n_K` is the arithmetic intersection number of `d + 1` copies of the metrised line bundle `Ō(1)` on the closure of `Z` over `O_K`, divided by `[K:ℚ]`. The Chow form `F_Z` of `Z` is a polynomial in `d + 1` groups of `n + 1` variables, homogeneous of degree `deg Z` in each group, that vanishes exactly at the tuples of hyperplanes that meet `Z`; its spherical height `ht(F_Z)` combines the Gauss norms of `F_Z` at the finite places with the integrals of `log |σ(F_Z)|` over products of unit spheres at the complex embeddings. This roadmap proves that the two heights differ by an explicit constant, the comparison of Bost, Gillet and Soulé, whose archimedean part is a theorem of Philippon, and proves its form for the projective space of a Hermitian vector bundle.

The headline theorems are these. (1) For every effective `d`-cycle `Z` in `ℙ^n_K`, the Fubini–Study height of `Z` equals `ht(F_Z) + ((d + 1)/2)·H_n·deg Z`, where `H_n = Σ_{k=1}^{n} 1/k`. (2) Let `J̄` be a Hermitian vector bundle of rank `N ≥ 1` over `O_K`, `J` its generic fibre, and `Z` an effective `d`-cycle in the projective space `ℙ(J^∨)` of lines in the dual of `J`, whose line bundle `𝒪(1)` carries the Fubini–Study metrics of `J̄`. Then the height of `Z` equals `ht_J̄(F_Z) + ((d + 1)/2)·H_{N−1}·deg Z`, where `ht_J̄` is the spherical height relative to `J̄`, taken with Gauss norms in local bases of the lattice of `J̄` and with integrals over the unit spheres of its metrics; the constant depends on `d` and `N` only. (3) The height of the whole space `ℙ(J^∨)` is `deĝ_n(J̄) + ½·Σ_{m=1}^{N−1} Σ_{k=1}^{m} 1/k`, the normalised Arakelov degree of `J̄` plus the height of `ℙ^{N−1}`.

The roadmap extends HeightsRationalPointsAndObstructions, which defines the height of projective cycles and the arithmetic intersection numbers with their Cartier recursion; it adds to these numbers a formula for a change of metric. The Chow forms are those of [AlgebraicModuliForArithmeticGeometry](../../AlgebraicModuliForArithmeticGeometry/README.md); Hermitian vector bundles and their Arakelov degree are those of [ArakelovGeometryAndAbelianHeights](../../ArakelovGeometryAndAbelianHeights/README.md); the spherical heights of multiforms, the normalised spherical measure with its disintegration along a unit vector, and the heights relative to a Hermitian vector bundle are those of [SlopesOfHermitianVectorBundles](../SlopesOfHermitianVectorBundles/README.md). In the family [RiemannHypothesisForDirichletLFunctions](../README.md), the comparison turns the explicit arithmetic Hilbert–Samuel inequalities of SlopesOfHermitianVectorBundles, stated with spherical heights of Chow forms, into bounds in terms of heights of varieties, in [ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties](../ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/README.md); the height of the whole space gives the height of a projective bundle in [HeightsForLogSingularMetrics](../HeightsForLogSingularMetrics/README.md).

Layer 5 adds to the arithmetic intersection numbers the change of the metric of one factor by a function `e^{−f}`. Layer 6 first proves the comparison (1) from three local statements on a hyperplane section (the Chow form of the section, its Gauss norms at the finite places, and its spherical integrals at the complex embeddings, through a Crofton formula) and the Cartier recursion, by induction on the dimension. It then defines the height of a cycle in `ℙ(J^∨)`, proves its invariance under isometries and finite extension, its behaviour under rescaling and under a change of metrics, its value on points and on the whole space, and deduces (2) from (1) by moving the metrics of `J̄` along a path to standard ones.

## Conventions

`K` is a number field, `O_K` its ring of integers and `Σ_K` the set of field embeddings `σ : K → ℂ`; sums over `Σ_K` count conjugate embeddings separately. `𝔭` runs over the nonzero primes of `O_K`, with norm `N𝔭`; the absolute values `|·|_𝔭`, the Gauss norms of polynomials and the logarithms are normalised as in SlopesOfHermitianVectorBundles (its Conventions and §6.6). `H_n = Σ_{k=1}^{n} 1/k`, with `H_0 = 0`.

For `s, x ∈ K^{n+1}`, `⟨s, x⟩ = Σ_k s_kx_k`, and `H_s = {⟨s, x⟩ = 0}` is the hyperplane of `s ≠ 0`. A `d`-cycle is pure of dimension `d`, with degree `deg Z`. The Chow form `F_Z` of an effective cycle is that of AlgebraicModuliForArithmeticGeometry §1.6, taken with coefficients in `K` as 6.1 and 6.2 (b) explain.

`projectiveCycleHeight` and `arithmeticIntersection` are the height of a projective cycle and the arithmetic intersection numbers of HeightsRationalPointsAndObstructions §§5.9b and 5.17a; `Ō(1)` carries the Fubini–Study metrics, and `c_1(Ō(1))` is its first Chern form. The spherical height `ht`, the integrals `m_σ` and the normalised spherical measure `ν` on the unit sphere of `ℂ^N` are those of SlopesOfHermitianVectorBundles §6.6; the height `ht_J̄` relative to a Hermitian vector bundle `J̄` and the measures `ν_σ` are those of SlopesOfHermitianVectorBundles §6.7a (i). Hermitian vector bundles `J̄ = (M_J, (h_σ)_σ)`, their isometries, duals, quotients and base change, the rescaling `J̄(t)`, the Arakelov degree `deĝ` and the normalised degree `deĝ_n = deĝ/[K:ℚ]` are those of ArakelovGeometryAndAbelianHeights §§1.1–1.3.

Notation and conventions not restated here are those of HeightsRationalPointsAndObstructions (its Conventions and §§5.9b, 5.17a), SlopesOfHermitianVectorBundles (its Conventions and §§6.6, 6.7a) and ArakelovGeometryAndAbelianHeights (§§1.1–1.3).

## Layer 5: Arithmetic intersection numbers under change of metric

### 5.1 Change of metric in arithmetic intersection numbers

This target extends HeightsRationalPointsAndObstructions §5.17a, whose arithmetic intersection numbers `arithmeticIntersection` are symmetric and multilinear and satisfy the Cartier recursion: it adds to their API the following change-of-metric formula.

*Change of metric.* Let `𝒳` be flat and projective of relative dimension `d` over `O_K`, `L̄_0, …, L̄_d` Hermitian line
bundles on it, and `f` a real function on `𝒳(ℂ)`, invariant under complex conjugation, such that `e^{−f}‖·‖` is again a
smooth metric on `L_0`; write `L̄_0(f)` for `L_0` with that metric. Then

```text
arithmeticIntersection(𝒳; L̄_0(f), L̄_1, …, L̄_d)
    = arithmeticIntersection(𝒳; L̄_0, L̄_1, …, L̄_d) + Σ_σ ∫_{𝒳_σ(ℂ)} f · c_1(L̄_1) ∧ ⋯ ∧ c_1(L̄_d).
```

By symmetry the same holds for any one factor; changing several factors one after the other gives a sum of such terms with
mixed Chern forms (6.2 (a6) is an instance). The Check of HeightsRationalPointsAndObstructions §5.17a, a constant change of one metric at all
embeddings, is the case `f = t`.

*Route.* The formula is proved here, by this route; no published statement of it is cited. By multilinearity write `L_0` as a difference of generated bundles and put the change of metric on the first. For
a section `s` of a generated bundle whose divisor meets `𝒳` properly, the Cartier recursion of HeightsRationalPointsAndObstructions §5.17a is the intersection on
`div s`, which does not involve the metric of `L_0`, minus `Σ_σ ∫ log ‖s‖_σ·c_1(L̄_1) ∧ ⋯ ∧ c_1(L̄_d)`; replacing `‖s‖` by
`e^{−f}‖s‖` adds `Σ_σ ∫ f·c_1(L̄_1) ∧ ⋯ ∧ c_1(L̄_d)`.

*Needs:* HeightsRationalPointsAndObstructions §5.17a (Cartier recursion, multilinearity).

**Checks.**

- `f = λ` at the embeddings of one infinite place `v` and `0` at the others adds `mult(v)·λ` times the geometric mixed degree
  of `L_1, …, L_d` (`mult(v) = 2` at a complex place); `f = t` at every embedding gives `[K:ℚ]·t` times it.
- On `ℙ¹_ℤ` with `L̄_1 = Ō(1)` (Fubini–Study) and `L̄_0` the trivial bundle with `‖1‖ = 1`, the section `1` has no divisor, so
  `arithmeticIntersection(ℙ¹_ℤ; L̄_0(f), Ō(1)) = ∫_{ℙ¹(ℂ)} f·c_1(Ō(1))`; for `f = |x_0|²/(|x_0|² + |x_1|²)` this is `½`, and
  with `f = |x_1|²/(|x_0|² + |x_1|²)` added the two give the case `f = 1`.

### Examples

Changing the metric by the constant `λ` at the embeddings of one infinite place `v`, and not at the others, adds `mult(v)·λ` times the geometric mixed degree of the other factors. On `ℙ¹_ℤ`, with `L̄_1 = Ō(1)` and `L̄_0` the trivial bundle with `‖1‖ = 1`, the change by `f = |x_0|²/(|x_0|² + |x_1|²)` gives the intersection number `½`, and adding the change by `|x_1|²/(|x_0|² + |x_1|²)` gives the case `f = 1` (5.1).

### Dependencies

HeightsRationalPointsAndObstructions §5.17a.

## Layer 6: Chow forms, spherical Mahler measures and heights of cycles

### 6.1 The Fubini–Study height is the spherical Mahler measure of the Chow form

Let `K` be a number field and `Z` an effective `d`-cycle in `ℙ^n_K`. Its Chow form `F_Z` is the Chow form of `Z_{K̄}`
(AlgebraicModuliForArithmeticGeometry §1.6), which has a multiple with coefficients in `K` (its class is a point of a
projective space fixed by the Galois group); `F_Z` is taken with coefficients in `K`, so that it is determined up to a factor
in `K^×`, which does not change its height (SlopesOfHermitianVectorBundles §6.6 (i)). It is multihomogeneous of degree `deg Z`
in each of `d + 1` groups of `n + 1` variables. Let `ht(F_Z)` be its spherical height, the height of
SlopesOfHermitianVectorBundles §6.6 for `N = n + 1` variables per group (Gauss norms at the finite places, integrals of
`log|σ(F_Z)|` over the product of the unit spheres of `ℂ^{n+1}` for the normalised spherical measure `ν` at the complex
embeddings, divided by `[K:ℚ]`). Prove `projectiveCycleHeight(Z) = ht(F_Z) + c(d, n)·deg(Z)` with
`c(d, n) = ((d + 1)/2)·H_n`, `H_n = Σ_{k=1}^{n} 1/k`.

Write `⟨s, x⟩ = Σ_k s_kx_k` and `H_s = {⟨s, x⟩ = 0}` for `0 ≠ s ∈ K^{n+1}`, and `F_Z(s, ·)` for the multiform in `d`
arguments obtained by putting `s` in the first argument of `F_Z`. For `Z` integral with `Z ⊄ H_s`, and `𝒵` the closure of `Z`
in `ℙ^n_{O_K}`, also prove the three local statements on which the identity rests:

- (i) *Hyperplane sections.* `F_Z(s, ·)` is a Chow form of the intersection cycle `Z·H_s` (for `d = 0`, a nonzero constant).
- (ii) *Finite places.* For every prime `𝔭` of `O_K`, `log |F_Z(s, ·)|_𝔭 = log |F_Z|_𝔭 − e_𝔭(s)·log N𝔭`, where
  `e_𝔭(s) = Σ_W ord_W(⟨s, ·⟩)·deg W`, the sum running over the irreducible components `W` of the fibre `𝒵_𝔭` (all of
  dimension `d`), and `ord_W` is the order along `W` of `⟨s, ·⟩` as a rational section of `𝒪(1)` on `𝒵`: written in a
  generator of `𝒪(1)` at the generic point of `W`, it is a fraction `a/b` of nonzero elements of the one-dimensional local
  domain `O_{𝒵,W}`, and `ord_W = length(O_{𝒵,W}/a) − length(O_{𝒵,W}/b)`. For `s ∈ O_{K,𝔭}^{n+1}` the rational section
  is a section of `𝒪(1)` over `𝒵 ⊗ O_{K,𝔭}` and `ord_W ≥ 0`; otherwise orders can be negative (for `Z = [1 : 0] ⊂ ℙ¹_ℚ`
  and `s = p^{−1}e_0`, `F_Z(s) = p^{−1}` and `e_p(s) = −1`). So the vertical part `Σ_𝔭 Σ_W ord_W(⟨s, ·⟩)·[W]` of the
  divisor of `⟨s, ·⟩` on `𝒵` is recorded by the content: if `F_Z` has content `1` at `𝔭`, then `F_Z(s, ·)` is
  `π^{e_𝔭(s)}` (`π` a uniformiser at `𝔭`) times a Chow form of `Z·H_s` of content `1` at `𝔭`.
- (iii) *Archimedean places.* For every `σ ∈ Σ_K`,
  `m_σ(F_Z) = m_σ(F_Z(s, ·)) − ∫_{Z_σ(ℂ)} log ‖s‖_σ·c_1(Ō(1))^d − ½·H_n·deg Z`, where `m_σ` is the integral of
  SlopesOfHermitianVectorBundles §6.6 (for `d = 0`, `m_σ` of a constant `a` is `log |σ(a)|`) and
  `‖s‖_σ(x) = |⟨σ(s), x⟩|/‖x‖` is the Fubini–Study norm of the section `⟨s, ·⟩` (Philippon, Théorème 2, p. 256, restated
  as Corollaire 4, p. 272).

*Route.* (i)–(iii) are local; the identity follows from them and the Cartier recursion of HeightsRationalPointsAndObstructions §5.17a along one rational
hyperplane section, by induction on `d`.

(ii) Let `R = O_{K,𝔭}`, `π` a uniformiser, `v` its valuation, and scale `F_Z` to content `1` at `𝔭`. First let
`s ∈ R^{n+1}`, so that `⟨s, ·⟩` is a section of `𝒪(1)` over `𝒵 ⊗ R`. For `d` vectors
`u = (u_1, …, u_d)` of indeterminates let `R′ = R[u]_{(π)}`: a discrete valuation ring whose valuation restricted to
`R[u]` is the Gauss valuation, with infinite residue field `k(𝔭)(u)` (for `d = 0` adjoin one indeterminate). The
incidence `𝒴 = {(x, u) : x ∈ 𝒵, ⟨u_1, x⟩ = ⋯ = ⟨u_d, x⟩ = 0}` is a vector bundle over `𝒵`, hence integral, and its part `𝒞`
over `Spec R′` is integral and finite over `R′`, because its closed fibre is `𝒵_𝔭 ∩ L_u` for the generic linear space `L_u`
of codimension `d` and `𝒵_𝔭` has pure dimension `d`; so `𝒞` is free of rank `deg Z` over `R′`. Over `K(u)`, as a form in
the first argument `w`, `F_Z(w, u) = Φ·∏_p ⟨w, x_p⟩`, where the `[x_p]` are the `deg Z` distinct points of `Z ∩ L_u`
(characteristic zero) with `x_p` primitive for an extension of `v` to an algebraic closure (a form of degree `deg Z` in `w`
that vanishes exactly on these `deg Z` hyperplanes is their product up to a constant); content `1` and Gauss's lemma (Mathlib
`Polynomial.gaussNorm_mul`, after a Kronecker substitution) give `v(Φ) = 0`. Hence the valuation of the content of
`F_Z(s, ·)` is `v(F_Z(s, u)) = Σ_p v(⟨s, x_p⟩)`, which is the valuation of the norm from `𝒞` to `R′` of `f = ⟨s, ·⟩/t`, that
is `length_{R′}(O_𝒞/f)`, for a linear form `t` over `R′` vanishing at no closed point of `𝒞` (the residue field is
infinite). The closed points of `𝒞` are the generic points `y_W` of the preimages in `𝒴` of the components `W` of `𝒵_𝔭`,
with `[k(y_W) : k(𝔭)(u)] = deg W`; as `𝒴 → 𝒵` is smooth and `y_W` is the generic point of its fibre over the generic point
of `W`, the local homomorphism `O_{𝒵,W} → O_{𝒴,y_W}` is flat and carries the maximal ideal onto the maximal ideal, so it
preserves lengths, and the length of `O_𝒞/f` at `y_W` is `ord_W(⟨s, ·⟩)`. Summing gives `e_𝔭(s)`. The same computation
for `f = π` gives `Σ_W ord_W(π)·deg W = length_{R′}(O_𝒞/π) = deg Z`, as `𝒞` is free of rank `deg Z` and `π` is a
uniformiser of `R′`: the fibre cycle `Σ_W ord_W(π)·[W]` of `𝒵` at `𝔭` has degree `deg Z`. For general `s ∈ K^{n+1}`
choose `a ≥ 0` with `π^as ∈ R^{n+1}`. As `F_Z` is homogeneous of degree `deg Z` in its first argument,
`F_Z(π^as, ·) = π^{a·deg Z}·F_Z(s, ·)`, so the left side of (ii) for `π^as` is the left side for `s` minus
`a·deg Z·log N𝔭`; as `ord_W` is additive on fractions (lengths are additive along `0 → O/b → O/ab → O/a → 0`),
`ord_W(π^a⟨s, ·⟩) = ord_W(⟨s, ·⟩) + a·ord_W(π)`, so `e_𝔭(π^as) = e_𝔭(s) + a·deg Z` and the right side for `π^as` is the
right side for `s` minus the same amount. Subtracting, (ii) for `π^as` gives (ii) for `s`.

(i) Over `K̄`, `F_Z(s, u_1, …, u_d)` vanishes exactly when `Z ∩ H_s ∩ H_{u_1} ∩ ⋯ ∩ H_{u_d} ≠ ∅`
(AlgebraicModuliForArithmeticGeometry §1.6: a Chow form vanishes exactly at the tuples of hyperplanes that meet the support
of its cycle). With `Z·H_s = Σ_j m_jY_j`, and the `F_{Y_j}` irreducible and pairwise non-proportional (AlgebraicModuliForArithmeticGeometry §1.6),
`F_Z(s, ·) = λ·∏_j F_{Y_j}^{a_j}` with `λ ∈ K̄^×` and `a_j ≥ 1`. Then `a_j = m_j` by the computation of (ii), with `Z` in
place of `𝒵` and, in place of `R′`, the discrete valuation ring of the space of `d`-tuples `u` at the generic point `η_j` of
`{F_{Y_j} = 0}`: there `F_Z(·, u)` keeps content `1` (the `u` for which `Z ∩ H_{u_1} ∩ ⋯ ∩ H_{u_d}` is infinite form a set of
codimension at least two), the only closed point of the incidence over `η_j` at which `⟨s, ·⟩` vanishes is the generic point
of the incidence of `Y_j`, which maps birationally onto `{F_{Y_j} = 0}` (a general `d`-tuple of hyperplanes meeting `Y_j`
meets it in one point), and the length there is `ord_{Y_j}(⟨s, ·⟩|_Z) = m_j`. As `F_Z(s, ·)` has coefficients in `K`, it is a
Chow form of `Z·H_s` over `K`.

(iii) For `u′ = (u_1, …, u_d)` outside a `ν^{⊗d}`-null set, `Z_σ ∩ H_{u_1} ∩ ⋯ ∩ H_{u_d}` consists of `deg Z` distinct
points `[x_p]`, `‖x_p‖ = 1`, and `σ(F_Z)(w, u′) = Φ(u′)·∏_p ⟨w, x_p⟩` as in (ii); so, with `‖w‖([x]) = |⟨w, x⟩|/‖x‖`,
`log |σ(F_Z)(w, u′)| = log |Φ(u′)| + Σ_p log ‖w‖([x_p])` for every `w ∈ ℂ^{n+1}`. *Crofton formula:*
`E[Σ_p φ([x_p])] = ∫_{Z_σ(ℂ)} φ·c_1(Ō(1))^d` for every continuous `φ`. Indeed, for a cycle `Y` of positive dimension and `u`
with law `ν`, average the Poincaré–Lelong formula `δ_{Y·H_u} = δ_Y ∧ (c_1(Ō(1)) + dd^c log ‖u‖²)` (ComplexComparisonPartII C5.4, on a
resolution of `Y`, as in HeightsRationalPointsAndObstructions §5.17a) over `u`: `∫ log ‖u‖([x]) dν(u) = −½·H_n` does not depend on `[x]` (SlopesOfHermitianVectorBundles §6.6 (vi); for `n = 0` the integrand is `0`),
and the mean and `dd^c` commute by Fubini, since `∫ |log ‖u‖([x])| dν(u)` is bounded in `[x]`; so the mean of `Y·H_u` is
`Y ∧ c_1(Ō(1))`, and `d` iterations give the formula. By monotone convergence through `max(φ, −M)` it extends to
`φ = log ‖w‖`, which is upper semicontinuous with values in `[−∞, log |w|]`. Hence
`∫ log |σ(F_Z)(w, u′)| dν^{⊗d}(u′) = C + ∫_{Z_σ(ℂ)} log ‖w‖·c_1(Ō(1))^d` for every `w`, with `C = ∫ log |Φ| dν^{⊗d}`, which
is finite (average over `w` with law `ν` as well: Tonelli for the nonpositive terms). At `w = σ(s)` the left side is
`m_σ(F_Z(s, ·))`; averaged over `w` with law `ν`, the left side is `m_σ(F_Z)` and the right side `C − ½·H_n·deg Z` (Tonelli
and SlopesOfHermitianVectorBundles §6.6 (vi) again). Subtract.

*The identity.* Both sides are additive in `Z` (HeightsRationalPointsAndObstructions §5.9b; `F_{Z+Z′} = F_Z·F_{Z′}` and SlopesOfHermitianVectorBundles §6.6 (ii)), so let `Z` be integral, and
choose `s ∈ O_K^{n+1}` with `Z ⊄ H_s` (the linear forms vanishing on `Z` form a proper subspace). The divisor of `⟨s, ·⟩` on
`𝒵` is the closure of `Z·H_s` (for `d > 0` a cycle of degree `deg Z`; for `d = 0` it is `0`, the point `Z` lying outside
`H_s`) plus the vertical cycle of (ii), effective as `s` is integral, whose component `W` over `𝔭` contributes
`ord_W(⟨s, ·⟩)·deg W·log N𝔭` (HeightsRationalPointsAndObstructions §5.17a, its Check on vertical fibres); so its Cartier recursion reads

```text
projectiveCycleHeight(Z) = projectiveCycleHeight(Z·H_s)
    + (1/[K:ℚ]) · ( Σ_𝔭 e_𝔭(s)·log N𝔭 − Σ_σ ∫_{Z_σ(ℂ)} log ‖s‖_σ·c_1(Ō(1))^d ).
```

Take `F_{Z·H_s} = F_Z(s, ·)` ((i); SlopesOfHermitianVectorBundles §6.6 (i)). Summing (ii) and (iii) over all places, `ht(F_Z)` satisfies the same recursion
with the extra term `−½·H_n·deg Z`, so
`projectiveCycleHeight(Z) − ht(F_Z) = projectiveCycleHeight(Z·H_s) − ht(F_{Z·H_s}) + ½·H_n·deg Z`. For `d = 0` the same
holds with `Z·H_s = 0`: the recursion has no horizontal term, and the constant `F_Z(s)` has height `0` by the product
formula. Induction on `d` gives the constant `(d + 1)·½·H_n = c(d, n)`.

*Needs:* HeightsRationalPointsAndObstructions §§5.9b, 5.17a (the Cartier recursion and the contribution of vertical fibres); AlgebraicModuliForArithmeticGeometry
§1.6 (Chow forms: zero set, irreducibility, uniqueness up to scalar); SlopesOfHermitianVectorBundles §6.6 ((i) scaling,
(ii) multiplicativity, (vi) the disintegration of `ν`); ComplexComparisonPartII C5.4 (the Poincaré–Lelong formula and
integration over analytic cycles, for the Crofton formula of (iii)); Mathlib `Polynomial.gaussNorm_mul`.

**Checks.**

- `d = 0`, `Z` a `K`-rational point `x`: `F_Z = Σ_i x_iu_i`, and `∫_{S^{2n+1}} log|u_0| dν = −½·H_n` (for `n ≥ 1` the law of
  `|u_0|²` is `Beta(1, n)`, SlopesOfHermitianVectorBundles §6.6 (vi); for `n = 0`, `|u_0| = 1`), so `c(0, n) = ½·H_n`. For `[1:1] ∈ ℙ¹(ℚ)`:
  `projectiveCycleHeight = ½log 2`, `ht = ½log 2 − ½`, `c(0, 1) = ½`. The torus Mahler measure of `u_0 + u_1` is `0`, which
  would give a difference `½log 2` depending on the point: the sphere, not the torus, makes the constant independent of `Z`.
- *A closed point of degree two.* The form `Σ_i x_iu_i` needs a `K`-rational point; for a closed point of degree `e` the
  Chow form is the product of the linear forms of its `e` geometric points. For `Z = [1 : i]` over `ℚ` (the point
  `X_0² + X_1² = 0`, `deg Z = 2`), `F_Z = (u_0 + iu_1)(u_0 − iu_1) = u_0² + u_1²`, of content `1`. The closure of `Z` is
  `Spec ℤ[i]`, where `(1, i)` is primitive, so `projectiveCycleHeight(Z) = 2·log √2 = log 2` (the two complex embeddings of
  `ℚ(i)`, `‖(1, ±i)‖ = √2`), and `ht(F_Z) = 2·(log √2 − ½) = log 2 − 1`: difference `1 = c(0, 1)·deg Z`.
- `d = n = 1`, `Z = ℙ¹`: `F = det(u₀, u₁)`. For unit vectors `u₀, u₁ ∈ ℂ²`, `|det(u₀, u₁)|² = 1 − |Σ_k ū_{0,k}u_{1,k}|²`,
  with the Hermitian product (the bilinear `Σ_k u_{0,k}u_{1,k}` does not give it: at `u₀ = u₁ = (1, i)/√2` the determinant
  and the bilinear pairing both vanish), and `|Σ_k ū_{0,k}u_{1,k}|²` is uniform on `[0, 1]` (SlopesOfHermitianVectorBundles §6.6 (vi), the law `Beta(1, 1)`),
  so `ht(F) = −½`; `projectiveCycleHeight(ℙ¹) = ½`; `c(1, 1) = 1 = ((1 + 1)/2)·1`.
- *A linear `ℙ^d`.* The Chow form is the `(d + 1) × (d + 1)` minor `det(u_{ij})_{i,j≤d}`, and
  `E log|det|² = Σ_{k=1}^{d+1}(ψ(k) − ψ(n + 1))` for independent uniform unit vectors (`ψ` the digamma function; the squared
  lengths of the successive Gram–Schmidt residues are Beta variables); `projectiveCycleHeight(ℙ^d) = ½·Σ_{m=1}^{d} H_m` (the
  recursion along coordinate sections, which have no vertical part); with `ψ(n + 1) − ψ(k) = Σ_{j=k}^{n} 1/j` the difference
  is `((d + 1)/2)·H_n`.
- *A vertical fibre ((i), (ii)).* `K = ℚ`, `p` a prime, `Z = {X_0 = pX_1} ⊂ ℙ²`, `s = e_0`. On the closure
  `𝒵 = {X_0 = pX_1} ⊂ ℙ²_ℤ` the section `X_0 = pX_1` vanishes on the point `[0:0:1]` and on the whole fibre at `p`, a line, so
  `e_p(e_0) = 1`. The Chow form `F_Z(U, V) = (pU_0 + U_1)V_2 − (pV_0 + V_1)U_2` has content `1`, and `F_Z(e_0, V) = p·V_2`,
  `V_2` being the Chow form of `[0:0:1]`. Heights: `Z` is the line through the orthonormal vectors `(p, 1, 0)/(p² + 1)^{1/2}`
  and `e_2`, so `∫_{Z(ℂ)} log ‖X_0‖·c_1 = log p − ½·log(p² + 1) − ½` and the recursion along `X_0` gives
  `projectiveCycleHeight(Z) = 0 + log p − ∫ log ‖X_0‖·c_1 = ½·log(p² + 1) + ½`, the value along `X_1`, which has no vertical
  part (without the term `log p` it would be `½·log(p² + 1) + ½ − log p`). On the other side `ht(F_Z) = ½·log(p² + 1) − 1`
  (Plücker norm `(p² + 1)^{1/2}`, and `E log |det| = −1` for the `2 × 2` minor in `ℂ³`), and
  `ht(p·V_2) = −log p + (log p − ¾) = ht(V_2) = −¾`; and (iii) reads
  `m(F_Z) − m(p·V_2) = ½·log(p² + 1) − log p − ¼ = −∫ log ‖X_0‖·c_1 − ¾`. The differences are `3/2 = c(1, 2)` and
  `¾ = c(0, 2)`.
- *A double fibre component ((i), (ii)).* `K = ℚ`, `Z = {X_1² = 2X_0X_2}`, the image of `[a : b] ↦ [a² : 2ab : 2b²]`
  (`d = 1`, `deg Z = 2`), with Chow form `F_Z(u, v) = z_1² − 2z_0z_2`, `z = u × v`, of content `1` (the resultant of the
  parametrisation has content `4`). The fibre of `𝒵` at `2` is the line `W = {X_1 = 0}` counted twice, and
  `ord_W(X_1) = 1` (on `𝒵`, `X_1² = 2X_0X_2` makes `X_1` a uniformiser at the generic point of `W`): so `e_2(e_1) = 1`,
  not the multiplicity `2` of `W`, and indeed `F_Z(e_1, v) = 2·v_0v_2`, with `v_0v_2` the Chow form of
  `Z·H_{e_1} = [1:0:0] + [0:0:1]`; for the tangent section `s = e_0`, `Z·H_{e_0} = 2·[0:0:1]`, `e_2(e_0) = 0` and
  `F_Z(e_0, v) = v_2²`. Here `ord_W(2)·deg W = 2·1 = deg Z`. For the section `s = ½e_1`, not integral at `2`,
  `ord_W(½X_1) = 1 − 2 = −1`, so `e_2(½e_1) = −1`, and indeed `F_Z(½e_1, v) = ¼·2·v_0v_2 = ½·v_0v_2`. Exact values:
  `projectiveCycleHeight(Z) = −∫ log ‖X_0‖·c_1 = 2`; along `X_1`, `∫ log ‖X_1‖·c_1 = log 2 − 2` and the recursion gives
  `0 + log 2 − (log 2 − 2) = 2` again; `ht(F_Z) = −1` (`|u × v|² ~ Beta(2, 1)` gives `−½`, and `z_1² − 2z_0z_2` is
  unitarily equivalent to `Σ_k z_k²`, whose logarithm has mean `−½` on the unit sphere of `ℂ³`); difference
  `3 = c(1, 2)·2`.
- *A surface.* The quadric `Z = {X_{00}X_{11} = X_{01}X_{10}} ⊂ ℙ³` over `ℚ`, the Segre image of `ℙ¹ × ℙ¹` (`d = 2`,
  `deg Z = 2`). Along `X_{00}` the divisor is two coordinate lines of height `½` each, with no vertical part, and
  `−∫ log ‖X_{00}‖·c_1² = 2` (`c_1 = ω_1 + ω_2` and `log ‖X_{00}‖ = log(|x_0|/‖x‖) + log(|y_0|/‖y‖)`), so
  `projectiveCycleHeight(Z) = 3`. `F_Z(u, v, w)` is `X_{00}X_{11} − X_{01}X_{10}` evaluated at the vector of `3 × 3` minors
  of `(u, v, w)` (the point `H_u ∩ H_v ∩ H_w`), of content `1`; the logarithm of the squared length of that vector has mean
  `−7/6`, and that of `|det|` of its direction, read as a `2 × 2` matrix, has mean `−4/3`, so `ht(F_Z) = −5/2`: difference
  `11/2 = c(2, 3)·2`.
- The constant `(d + 1)·H_n` would give `c(0, 1) = 1` against the point value `½`.

### 6.2 Heights of cycles in the projective space of a Hermitian vector bundle and the relative spherical height of the Chow form

Let `K` be a number field and `J̄ = (M_J, (h_σ)_{σ∈Σ_K})` a Hermitian vector bundle of rank `N ≥ 1` over `O_K`
(ArakelovGeometryAndAbelianHeights §1.1), `J = M_J ⊗ K`, `J_σ = M_J ⊗_σ ℂ`. Let `ℙ(J^∨)` be the projective space of lines in
the dual space `J^∨`, so that `J = H⁰(ℙ(J^∨), 𝒪(1))`: `u ∈ J` is the section `[ξ] ↦ ξ(u)`, whose zero set is the hyperplane
`H_u = {ξ(u) = 0}`. Its model over `O_K` is `ℙ(M_J^∨) = Proj Sym M_J`, and `Ō(1)_J̄` is `𝒪(1)` on this model with, at every
`σ ∈ Σ_K` (real or not), the Fubini–Study metric of `h_σ`: `‖u‖_σ([ξ]) = |ξ(u)|/‖ξ‖^∨_σ` for `0 ≠ ξ ∈ J_σ^∨`, where `‖·‖^∨_σ`
is the norm dual to `h_σ` (equivalently, the quotient metric of `h_σ` under `J_σ → 𝒪(1)_{[ξ]}`). At a finite place the model
gives `‖u‖_𝔭([ξ]) = |ξ(u)|_𝔭/‖ξ‖_𝔭`, where `‖ξ‖_𝔭 = max{|ξ(v)|_𝔭 : v ∈ M_J ⊗ O_𝔭}` is the lattice norm of `ξ` in
`M_J^∨ = Hom(M_J, O_K)`. For `J̄ = Ō_K^{n+1}` this is `ℙ^n` with the metrics of HeightsRationalPointsAndObstructions §5.9b.

(a) *The height.* For an integral closed subvariety `Z ⊂ ℙ(J^∨)` of dimension `d` with closure `𝒵` in `ℙ(M_J^∨)`, put
`projectiveCycleHeight_J̄(Z) = arithmeticIntersection(𝒵; Ō(1)_J̄, …, Ō(1)_J̄)/[K:ℚ]` with `d + 1` factors (HeightsRationalPointsAndObstructions §5.17a), and
extend it additively to effective `d`-cycles. Prove: (a1) for `J̄ = Ō_K^{n+1}` it is `projectiveCycleHeight` of HeightsRationalPointsAndObstructions §5.9b; (a2)
an isometry `φ : J̄ → J̄′` induces an isomorphism `ℙ(J^∨) ≅ ℙ(J′^∨)` (through `(φ^∨)^{−1}`), and
`projectiveCycleHeight_{J̄′}(φ_*Z) = projectiveCycleHeight_J̄(Z)`; (a3)
`projectiveCycleHeight_{J̄_{O_L}}(Z_L) = projectiveCycleHeight_J̄(Z)` for every finite extension `L/K`, with `J̄_{O_L}` the
base change (ArakelovGeometryAndAbelianHeights §1.2); (a4)
`projectiveCycleHeight_{J̄(t)}(Z) = projectiveCycleHeight_J̄(Z) + (d + 1)·t·deg Z`, where `J̄(t)` has the metrics
`e^{−t}‖·‖_σ` (ArakelovGeometryAndAbelianHeights §1.1); (a5) for a `K`-point `x = [ξ]`,
`projectiveCycleHeight_J̄(x) = (1/[K:ℚ])·(Σ_𝔭 log ‖ξ‖_𝔭 + Σ_σ log ‖ξ‖^∨_σ)`, the normalised height of the vector `ξ` for the
dual bundle `J̄^∨`; (a6) if `J̄′ = (M_J, (h′_σ)_σ)` has the same lattice, then, with `f_σ([ξ]) = log(‖ξ‖′^∨_σ/‖ξ‖^∨_σ)`,

```text
projectiveCycleHeight_J̄′(Z) − projectiveCycleHeight_J̄(Z)
    = (1/[K:ℚ]) · Σ_σ Σ_{j=0}^{d} ∫_{Z_σ(ℂ)} f_σ · c_1(Ō(1)_{J̄′,σ})^j ∧ c_1(Ō(1)_{J̄,σ})^{d−j}.
```

By (a1), (a2) and (a6), for an `O_K`-basis `e` of a free `M_J`, `projectiveCycleHeight_J̄(Z)` is `projectiveCycleHeight` of
`Z` read in the coordinates of `e` plus the archimedean terms of (a6) for the change from the metrics in which `e` is
orthonormal to the `h_σ`. (a7) *The whole space:*

```text
projectiveCycleHeight_J̄(ℙ(J^∨)) = deĝ_n(J̄) + ½·Σ_{m=1}^{N−1} Σ_{k=1}^{m} 1/k,
```

with `deĝ_n(J̄) = deĝ(J̄)/[K:ℚ]` the normalised Arakelov degree (ArakelovGeometryAndAbelianHeights §1.3); the second term is
the height of `ℙ^{N−1}`, the case `J̄ = Ō_K^N`. With (a5) this gives the height in the two extreme dimensions.

(b) *Comparison with the Chow form.* Let `Z` be an effective `d`-cycle in `ℙ(J^∨)` and `F_Z` its Chow form: the multiform on
`J` in the sense of SlopesOfHermitianVectorBundles §6.7a, of degree `deg Z` in each of its `d + 1` arguments, that vanishes at
`(u_0, …, u_d)` exactly when `Z ∩ H_{u_0} ∩ ⋯ ∩ H_{u_d}` is nonempty over `K̄`, the product of the Chow forms of the
components with their multiplicities. In the coordinates of a `K`-basis of `J` it is the Chow form of `Z_{K̄}` of
AlgebraicModuliForArithmeticGeometry §1.6, which has a multiple with coefficients in `K` (its class is a point of a projective
space fixed by the Galois group); so `F_Z` is determined up to a factor in `K^×`, which does not change `ht_J̄`. Let `ht_J̄` be
the spherical height relative to `J̄` of SlopesOfHermitianVectorBundles §6.7a (i): Gauss norms in the coordinates of
`O_𝔭`-bases of `M_J ⊗ O_𝔭` at the finite places and, at every `σ ∈ Σ_K`, real or not, the integral of `log |F_{Z,σ}|` over
the product of `d + 1` copies of the unit sphere `S_σ ⊂ J_σ` of `h_σ` for the measure `ν_σ`, the image of the normalised
spherical measure `ν` of SlopesOfHermitianVectorBundles §6.6 under an isometry `ℂ^N → J_σ`; all divided by `[K:ℚ]`. Prove

```text
projectiveCycleHeight_J̄(Z) = ht_J̄(F_Z) + c(d, N − 1)·deg Z,      c(d, N − 1) = ((d + 1)/2)·Σ_{k=1}^{N−1} 1/k,
```

with the constant of 6.1. It depends on `d` and on the rank `N` of `J̄`, and on nothing else (not on the metrics, the
lattice or `K`); after division by `d + 1` it is `½·Σ_{k=1}^{N−1} 1/k`, which depends on `N` alone. Both sides are unchanged
when `K` is replaced by a finite extension `L` (and `J̄`, `Z` by `J̄_{O_L}`, `Z_L`): (a3) and SlopesOfHermitianVectorBundles §6.7a (i). For `J̄ = Ō_K^{n+1}`
the identity is 6.1. For `Z ≠ 0`, divided by `(d + 1)·deg Z`:
`projectiveCycleHeight_J̄(Z)/((d + 1)·deg Z) = ht_J̄(F_Z)/((d + 1)·deg Z) + ½·Σ_{k=1}^{N−1} 1/k`.

*Route.* (a1)–(a7) and (b) are proved here, by these routes; no published statement of them is cited, and the standard
case on which (b) rests is 6.1. (a) (a1) is the definition of HeightsRationalPointsAndObstructions §5.9b. (a2): the induced isomorphism of models carries `Ō(1)_J̄` isometrically to
`Ō(1)_{J̄′}`. (a3): a flat `O_L`-scheme is the closure of its generic fibre, so the closure of `Z_L` is `𝒵 ⊗_{O_K} O_L`, and
the intersection numbers of HeightsRationalPointsAndObstructions §5.17a scale by `[L:K]`. (a5): the closure of `x` is a section `ε` of `ℙ(M_J^∨)` over `O_K`, and
`ε^*Ō(1)_J̄` is the fractional ideal `ξ(M_J)` with the metrics `|·|/‖ξ‖^∨_σ`, whose Arakelov degree
(ArakelovGeometryAndAbelianHeights §1.3, with the section `1`) is the stated sum. (a6): `Ō(1)_{J̄′}` is `Ō(1)_J̄` with the
norms `e^{−f}‖·‖`, `f = (f_σ)_σ`, which is invariant under complex conjugation by the conjugation condition on `h` and `h′`;
apply the change-of-metric formula 5.1 to the `d + 1` factors in turn, the `j`-th time with `j`
factors already changed. (a4) is (a6) with `f = t` at every `σ`: the dual norms of `J̄(t)` are `e^{t}‖·‖^∨_σ`, and the forms
`c_1` do not change. (a7): both sides are invariant under finite extension ((a3); ArakelovGeometryAndAbelianHeights §1.6),
and after a finite extension `M_J` is free. Indeed `M_J` is a direct sum of `N` fractional ideals (the image of a nonzero
linear form on `M_J` is a fractional ideal, which is projective, so it splits off; induct on the rank); a fractional ideal
`𝔞` has a principal power `𝔞^m = aO_K` (the class group is finite), and `𝔞O_L = a^{1/m}O_L` in `L = K(a^{1/m})`, since both
have `m`-th power `aO_L` and the group of fractional ideals of `O_L` is torsion-free; a compositum treats the `N` ideals at
once. For `N = 1`, `ℙ(J^∨)` is the point `[ξ]` of any `0 ≠ ξ ∈ J^∨`, and (a5) gives the normalised height of `ξ` for the
line `J̄^∨`, which is `−deĝ_n(J̄^∨) = deĝ_n(J̄)` (ArakelovGeometryAndAbelianHeights §§1.3, 1.5). For `N ≥ 2` let `u` be a
vector of an `O_K`-basis of `M_J`. Its divisor on `ℙ(M_J^∨)` is `ℙ((M_J/O_Ku)^∨)`, with multiplicity one and no vertical
component (`u` is nonzero modulo every prime), and `Ō(1)_J̄` restricts there to `Ō(1)_{J̄/u}` for the quotient bundle `J̄/u`
with the quotient metrics (ArakelovGeometryAndAbelianHeights §1.2): a linear form that vanishes at `u` has the same dual norm and the same lattice norm
on `J` and on `J/Ku`. The measure `c_1(Ō(1)_{J̄,σ})^{N−1}` on `ℙ(J_σ^∨)` is the image of the normalised spherical measure of
the unit sphere of `J_σ^∨` (both are probability measures invariant under the unitary group of `‖·‖^∨_σ`), so
`∫ log(|ξ(u)|/‖ξ‖^∨_σ)·c_1^{N−1} = log ‖u‖_σ − ½·Σ_{k=1}^{N−1} 1/k` (SlopesOfHermitianVectorBundles §6.6 (vi)). The Cartier recursion of HeightsRationalPointsAndObstructions §5.17a gives
`projectiveCycleHeight_J̄(ℙ(J^∨)) = projectiveCycleHeight_{J̄/u}(ℙ((J/Ku)^∨)) − (1/[K:ℚ])·Σ_σ log ‖u‖_σ + ½·Σ_{k=1}^{N−1} 1/k`,
and `deĝ(J̄) = deĝ(J̄/u) − Σ_σ log ‖u‖_σ` (ArakelovGeometryAndAbelianHeights §§1.3, 1.5, for the sub-bundle `O_Ku` with the
restricted metrics); induct on `N`.

(b) A change of structure, reduced to a change of the metrics at the complex embeddings, and the variation of both sides
along a path of metrics. (1) *Reductions.* For `N = 1`, `ℙ(J^∨)` is a point `[ξ]`, `Z = (deg Z)·[ξ]`, `F_Z = ξ^{deg Z}`, and
(b) is `deg Z` times the point Check below; let `N ≥ 2`. Both sides are additive in `Z` (`F_{Z+Z′} = F_Z·F_{Z′}`, and `ht_J̄` is
multiplicative by SlopesOfHermitianVectorBundles §6.7a (i)) and invariant under finite extension. After a finite extension `M_J` has an `O_K`-basis `e`
(route of (a7)), which identifies `J̄` isometrically with `(O_K^N, (H_σ)_σ)`, `H_σ` the Gram matrices of `e`, and `ℙ(J^∨)`
with `ℙ^{N−1}`; by (a2) and SlopesOfHermitianVectorBundles §6.7a (i) it suffices to treat `J̄ = (O_K^N, (H_σ)_σ)`. (2) *The path.* For `0 ≤ t ≤ 1`,
`J̄_t = (O_K^N, (H_σ^t)_σ)` is a Hermitian vector bundle (`H_σ̄^t` is the complex conjugate of `H_σ^t`); the `J̄_t` have one
lattice, hence one model and the same finite-place terms on both sides, and `J̄_0 = Ō_K^N`. So
`G(t) = projectiveCycleHeight_{J̄_t}(Z) − ht_{J̄_t}(F_Z)` has `G(0) = c(d, N − 1)·deg Z` by (a1), SlopesOfHermitianVectorBundles §6.7a (i) and 6.1, and it
remains to see that `G(1) = G(0)`. (3) *Variation of the height.* At `σ`, `h_{σ,t}(v, v) = |e^{−tX_σ}v|²` with
`X_σ = −½·log H_σ` Hermitian, and the dual norm is `‖ξ‖^∨_{σ,t} = ‖ξ ∘ e^{tX_σ}‖^∨_{σ,0}`; so, for every
`0 ≠ ξ ∈ J_σ^∨`, `(d/dt) log ‖ξ‖^∨_{σ,t} = q_{σ,t}([ξ])`, the Rayleigh quotient `h_{σ,t}(ξ^♯, X_σξ^♯)/h_{σ,t}(ξ^♯, ξ^♯)`
of `X_σ` at the vector `ξ^♯ ∈ J_σ` that represents `ξ` for `h_{σ,t}`; it is homogeneous of degree `0` in `ξ`, hence a
function on `ℙ(J_σ^∨)`. (Off `H_u` it is `−(d/dt) log ‖u‖_{σ,t}([ξ])`, as `‖u‖_{σ,t}([ξ]) = |ξ(u)|/‖ξ‖^∨_{σ,t}`; on `H_u`
that norm is `0` for every `t`.) The function `f_σ` of (a6) between `J̄_t` and `J̄_{t′}` is
`log ‖ξ‖^∨_{σ,t′} − log ‖ξ‖^∨_{σ,t}`, so by (a6),
`(d/dt) projectiveCycleHeight_{J̄_t}(Z) = ((d + 1)/[K:ℚ])·Σ_σ ∫_{Z_σ(ℂ)} q_{σ,t}·c_1(Ō(1)_{J̄_t,σ})^d`. (4) *Variation of the
spherical height.* `e^{tX_σ}` is an isometry from `h_{σ,0}` to `h_{σ,t}`, so `m_{J̄_t,σ}(F_Z)` is the integral of
`φ_t(u) = log |F_Z(e^{tX_σ}u_0, …, e^{tX_σ}u_d)|` over the standard spheres for `ν^{⊗(d+1)}`. With the arguments other than
the `i`-th fixed and generic, `F_Z` is, as a function of the `i`-th argument `w`, `c·∏_{p=1}^{deg Z} ξ_p(w)`, where the
`[ξ_p]` are the points of `Z ∩ ⋂_{j≠i} H_{u_j}` with multiplicities (for generic arguments each component `Z_i` meets the
linear section in `deg Z_i` distinct points, and a form of degree `deg Z_i` in `w` that vanishes exactly on the hyperplanes
`ξ_p(w) = 0` is their product up to a constant). So, with `w_i = e^{tX_σ}u_i` and where `F_Z(w_0, …, w_d) ≠ 0`, the
derivative `g_t(u) = ∂_tφ_t(u)` is `Σ_i Re Σ_p ξ_p(X_σw_i)/ξ_p(w_i)`, each `ξ_p` formed from the arguments other than the
`i`-th; as `X_σ` is self-adjoint for every `h_{σ,t}`, `|g_t(u)| ≤ ‖X_σ‖·Σ_i Σ_p ‖ξ_p‖^∨_{σ,t}/|ξ_p(w_i)|`, whose integral is
bounded uniformly in `t` (`E[s^{−1/2}] < ∞` for `s ~ Beta(1, N − 1)`, SlopesOfHermitianVectorBundles §6.6 (vi)). By Tonelli `g` is integrable on
`[0, 1] × S^{d+1}`, so for almost every `u` the real-analytic function `t ↦ F_Z(e^{tX_σ}u_0, …, e^{tX_σ}u_d)` has no zero on
`[0, 1]` (near a zero `t_0` of order `k ≥ 1`, `|g_t(u)| ≥ k/|t − t_0| − O(1)`, which is not integrable), and the fundamental
theorem of calculus along `t` and Fubini give `m_{J̄_1,σ}(F_Z) − m_{J̄_0,σ}(F_Z) = ∫_0^1 ∫ g_t dν^{⊗(d+1)} dt`. (The bound
holds in `L^p` for `1 < p < 2`, uniformly in `t`, and Vitali's convergence theorem then gives differentiability at every
`t`; the integrated form suffices.) Next, `∫ ξ(X_σw)/ξ(w) dν_{σ,t}(w) = q_{σ,t}([ξ])`: in an `h_{σ,t}`-orthonormal basis whose
first vector is a multiple of `ξ^♯` the integrand is `X_{11} + Σ_{k≥2} X_{1k}w_k/w_1`, and `w_k ↦ e^{iθ}w_k` averages the
last terms to `0`. So the `i`-th argument contributes to `∫ g_t dν^{⊗(d+1)}` the expected value of `Σ_p q_{σ,t}([ξ_p])` over
`d` independent `ν_{σ,t}`-distributed `w_j`, which is `∫_{Z_σ(ℂ)} q_{σ,t}·c_1(Ō(1)_{J̄_t,σ})^d` by step (5). Summing over the
`d + 1` arguments and over `σ`, `(1/[K:ℚ])·Σ_σ ∫ g_{σ,t} dν^{⊗(d+1)}` is the derivative of
`projectiveCycleHeight_{J̄_t}(Z)` of step (3) for every `t`, and integrating over `[0, 1]` gives `G(1) = G(0)`. (5) *Crofton
formula.* The Crofton formula of the route of 6.1 (iii), transported by an isometry `ℂ^N → J_σ` for `h_{σ,t}` (which
carries `ν` to `ν_{σ,t}`, hyperplanes `H_u` to hyperplanes and the Fubini–Study form of `ℂ^N` to `c_1(Ō(1)_{J̄_t,σ})`): for
`d` independent `ν_{σ,t}`-distributed hyperplanes, `E[Σ_p φ([ξ_p])] = ∫_{Z_σ(ℂ)} φ·c_1(Ō(1)_{J̄_t,σ})^d` for every continuous
`φ`. The standard case on which step (2) rests is 6.1.

*Needs:* 6.1; 5.1 (the change-of-metric formula); HeightsRationalPointsAndObstructions §§5.9b, 5.17a; AlgebraicModuliForArithmeticGeometry
§1.6; ArakelovGeometryAndAbelianHeights §§1.1–1.3, 1.5, 1.6 (Hermitian vector bundles; duals, quotients and base change; the
Arakelov degree, its additivity, its invariance under finite extension); SlopesOfHermitianVectorBundles §6.6 (the measure `ν`
and its disintegration (vi)) and SlopesOfHermitianVectorBundles §6.7a (i) (`ht_J̄`: independence of the choices, multiplicativity, invariance under
isometries and finite extension, the case `Ō_K^N`, the determinant); ComplexComparisonPartII C5.4 (the Poincaré–Lelong
formula, for the Crofton formula of step (5)).

**Checks.**

- *A point (`d = 0`), any `J̄`.* For `x = [ξ]`, `F_x = ξ` read as a linear form on `J`. Its Gauss norm in an `O_𝔭`-basis
  `(ε_k)` of `M_J ⊗ O_𝔭` is `max_k |ξ(ε_k)|_𝔭 = ‖ξ‖_𝔭`, the lattice norm in `M_J^∨`, and
  `m_{J̄,σ}(ξ) = log ‖ξ‖^∨_σ + ∫ log |w_1| dν(w) = log ‖ξ‖^∨_σ − ½·Σ_{k=1}^{N−1} 1/k` (SlopesOfHermitianVectorBundles §6.6 (vi) for `N ≥ 2`; for `N = 1`,
  `|w_1| = 1` on the unit circle and both terms vanish); with (a5),
  `projectiveCycleHeight_J̄(x) − ht_J̄(F_x) = ½·Σ_{k=1}^{N−1} 1/k = c(0, N − 1)`. Both sides see the norms of the dual bundle
  `J̄^∨`. For `K = ℚ(i)`, `M_J = O_K³` with Gram matrix `G = [[2, i, 0], [−i, 3, 1], [0, 1, 5]]` at one embedding and its
  complex conjugate `Ḡ` at the other (over `ℚ` a Gram matrix that is not real defines no Hermitian vector bundle:
  ArakelovGeometryAndAbelianHeights §1.1), and `ξ = (1, −2, 3)`: the lattice norms of `ξ` are `1`, and `ξG^{−1}ξ^* = 123/23`
  at both embeddings, so `projectiveCycleHeight_J̄(x) = ½·log(123/23) = 0.8383` and
  `ht_J̄(F_x) = ½·log(123/23) − ¾ = 0.0883`, difference `¾`. The constant `c(0, N − 1)` is read off from `rk J`: the length
  `n` of a spanning family in its place (`n = 3` for `e_1, e_2, e_1 + e_2` in `Ō_K^2`) would give `¾` against `½`.
- *`N = 2`, `K = ℚ`, `M_J = ℤ²` with Gram matrix `diag(1, t)` at the real place, the point `[1 : 2]` (`ξ = (1, 2)`).* `ξ` is
  primitive in `M_J^∨ = ℤ²` and `‖ξ‖^∨ = (1 + 4/t)^{1/2}`, so `projectiveCycleHeight_J̄(x) = ½·log(1 + 4/t)` and
  `ht_J̄(F_x) = ½·log(1 + 4/t) − ½`. At `t = 1` the height is the value `½·log 5` of HeightsRationalPointsAndObstructions §5.9b. The height falls as `t` grows (the basis
  vector `e_2` lengthens); the undualised `½·log(1 + 4t)` would make it rise.
- *The whole space (`d = N − 1`).* The left side is (a7). On the right, `F = det_b` for a `K`-basis `b` of `J`, and
  `ht_J̄(det_b) = ht(det) + deĝ_n(J̄)` (SlopesOfHermitianVectorBundles §6.7a (i): at `σ` the mean of `log |det|` over `N` independent unit vectors of a
  metric whose Gram determinant in `b` is `g` is the standard mean minus `½·log g`), with `ht(det) = −(N − 1)/2` (6.1, the
  Check on a linear `ℙ^d` with `d = n = N − 1`); so the right side is `deĝ_n(J̄) − (N − 1)/2 + (N/2)·Σ_{k=1}^{N−1} 1/k`, and
  the two agree by `Σ_{m=1}^{N−1} Σ_{k≤m} 1/k = N·Σ_{k=1}^{N−1} 1/k − (N − 1)`. Both sides contain the normalised slope
  `deĝ_n(J̄)/N` with the coefficient `N = d + 1` that `J̄(t)` demands: both grow by `N·t` ((a4); SlopesOfHermitianVectorBundles §6.7a (i)). For `ℤ²` with
  Gram matrix `[[2, 1], [1, 3]]` both sides are `½ − ½·log 5 = −0.3047`, with `ht_J̄(det) = −½ − ½·log 5`; for the bundle of
  the first Check (`K = ℚ(i)`, `det G = det Ḡ = 23`, so `deĝ_n(J̄) = −½·log 23`), `ht_J̄(det) = −1 − ½·log 23 = −2.5677` (the
  two embeddings contribute equally), and `ht_J̄(det) + (3/2)·(1 + ½) = −0.3177 = −½·log 23 + ½·(1 + 3/2)`.
- *Rescaling at one place.* Multiply `h_σ` by `e^{−2λ}` at the embeddings of one infinite place `v` (`σ` and `σ̄` if `v` is
  complex), keeping the lattice. By (a6), with `f = λ` at these `mult(v)` embeddings and `f = 0` at the others, the left
  side grows by `mult(v)·λ·(d + 1)·deg Z/[K:ℚ]`; the unit spheres become `e^{λ}S_σ`, so each of these `m_{J̄,σ}(F_Z)` grows by
  `λ` times the total degree `(d + 1)·deg Z` of `F_Z`, and the right side grows by the same amount. For `K = ℚ(2^{1/3})`,
  `λ = 0.3` and a curve of degree `2`: `0.8` on both sides at the complex place, `0.4` at the real place. Over `ℚ` with the
  Gram matrix `[[2, 1], [1, 3]]` the point `[1 : 2]` and `ℙ^1` gain `0.3` and `0.6` on both sides.
- *An index-`2` sublattice.* `K = ℚ`, `M′ = ℤe_1 ⊕ 2ℤe_2 ⊂ ℤ²` with the standard metric, so `M′^∨ = ℤ ⊕ ½ℤ`. For
  `x = [2 : 1]` the lattice norm of `ξ = (2, 1)` in `M′^∨` at `2` is `max(|2|_2, |2·1|_2) = ½`, so
  `projectiveCycleHeight_{M̄′}(x) = ½·log 5 − log 2`, against `½·log 5` for `ℤ²`; the coefficients of `F_x` in the
  `ℤ_2`-basis `e_1, 2e_2` of `M′ ⊗ ℤ_2` are `(2, 2)`, of Gauss norm `½`, so `ht_{M̄′}(F_x) = ½·log 5 − log 2 − ½`: both sides
  drop by `log 2`. For `x = [1 : 2]` nothing changes (coefficients `(1, 4)`). For `ℙ^1`, `deĝ_n(M̄′) = −log 2` and both sides
  of the whole-space Check drop by `log 2`; the Cartier recursion of (a7) with `u = e_1`, primitive in `M′`, confirms it: the
  point `[0 : 1]` has height `−log 2` for `M̄′` (`(0, 1)` has lattice norm `½` at `2` in `M′^∨`), and the archimedean term is
  `½`, as for `ℤ²`.
- *A conic with a metric that is not diagonal.* `K = ℚ`, `M_J = ℤ³` with Gram matrix `G = [[2, 1, 0], [1, 3, 1], [0, 1, 5]]`,
  `Z` the conic `{[1 : s : s²]}` (`d = 1`, `deg Z = 2`), `F_Z` the resultant of `u_0 + u_1s + u_2s²` and `v_0 + v_1s + v_2s²`
  (integral coefficients of content `1`). The section `u = e_0` has divisor `2·[0 : 0 : 1]` on the closure of `Z`, with no
  vertical part, and `[0 : 0 : 1]` has height `log ‖(0, 0, 1)‖^∨ = ½·log(G^{−1})_{33} = ½·log(5/23)`, so
  `projectiveCycleHeight_J̄(Z) = log(5/23) − ∫_Z log(|ξ_0|/‖ξ‖^∨)·c_1 = −0.48838`; on the right `m_J̄(F_Z) = −3.48838`, so
  `ht_J̄(F_Z) + c(1, 2)·2 = −0.48838`. For the standard metric (6.1) both sides are exact:
  `projectiveCycleHeight(Z) = 1 + π/(3√3) = 1.60460` and `ht(F_Z) = −2 + π/(3√3) = −1.39540`, difference `3 = c(1, 2)·2`.
  Between the two metrics the term of (a6) is `−2.09298`, the difference `−0.48838 − 1.60460` of the two heights.

### Examples

For the point `[1:1] ∈ ℙ¹(ℚ)`, `projectiveCycleHeight = ½log 2` and `ht = ½log 2 − ½`, a difference `c(0, 1) = ½`; for `Z = ℙ¹`, `F = det(u₀, u₁)` has `ht(F) = −½` and `projectiveCycleHeight(ℙ¹) = ½`, a difference `c(1, 1) = 1`; for the quadric surface `{X_{00}X_{11} = X_{01}X_{10}} ⊂ ℙ³`, `projectiveCycleHeight(Z) = 3` and `ht(F_Z) = −5/2`, a difference `c(2, 3)·2 = 11/2` (6.1). For `K = ℚ(i)`, `M_J = O_K³` with the Gram matrix `[[2, i, 0], [−i, 3, 1], [0, 1, 5]]` at one embedding and its conjugate at the other, and `ξ = (1, −2, 3)`, the point `x = [ξ]` has `projectiveCycleHeight_J̄(x) = ½·log(123/23)` and `ht_J̄(F_x) = ½·log(123/23) − ¾`. For `ℤ²` with the Gram matrix `[[2, 1], [1, 3]]` both sides of the comparison for the whole space `ℙ^1` are `½ − ½·log 5` (6.2).

### Dependencies

Layer 5; HeightsRationalPointsAndObstructions §§5.9b, 5.17a; AlgebraicModuliForArithmeticGeometry §1.6; ArakelovGeometryAndAbelianHeights §§1.1–1.3, 1.5, 1.6; SlopesOfHermitianVectorBundles §§6.6, 6.7a; ComplexComparisonPartII C5.4; Mathlib `Polynomial.gaussNorm_mul`.

## Downstream consumers

- ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18 (b) uses 6.1 for the comparison of the self-intersection of the metrised `O(1)` on the image of a component with its Chow height (the bound "volume `≤` height" of the slope argument). ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18e (its preamble and (e3)) applies 6.2 (b) to the coordinate bundle `J̄` = the lattice of integral forms of weight `u₁` on a component `Z`, with its Petersson metrics (rank `N_Z`), and the image `X_Z` (`d = D`, degree `δ_Z`), divided by `(D + 1)·δ_Z`: `h(u₁, Z) = ht_J̄(f_Z)/((D + 1)·δ_Z) + ½·Σ_{k=1}^{N_Z−1} 1/k`, the form over a coordinate bundle in which SlopesOfHermitianVectorBundles §6.7a is stated; ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18 (b) uses the height of 6.2 (a) of `X_Z` for that bundle.
- HeightsForLogSingularMetrics §4.3b (a), the height of the projective bundle of lines in a Hermitian vector bundle `Ē`, is 6.2 (a7) for `J̄ = Ē^∨` (the model `Proj Sym E^∨ = ℙ(M_J^∨)` and the metrised `O(1)` are the same), and the change of metric in its route is the formula of 5.1.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns the change-of-metric formula for arithmetic intersection numbers (5.1); the comparison of the Fubini–Study height of an effective cycle in `ℙ^n_K` with the spherical height of its Chow form, with the three local statements on a hyperplane section on which it rests and the Crofton formula of its route (6.1); and the height of cycles in the projective space `ℙ(J^∨)` of a Hermitian vector bundle `J̄`, with its normalisation, its invariance under isometries and finite extension, its rescaling, its value on points, its change under a change of metrics with the same lattice, its value on the whole space, and its comparison with the spherical height of the Chow form relative to `J̄` (6.2).

Not owned here. The theory these statements extend is HeightsRationalPointsAndObstructions: the height `projectiveCycleHeight` of projective cycles with its additivity, projection and arithmetic Bézout (§5.9b), and the arithmetic intersection numbers `arithmeticIntersection` with their symmetry, multilinearity, Cartier recursion and the contribution of vertical fibres (§5.17a), whose API 5.1 extends. Chow forms over an algebraically closed field are AlgebraicModuliForArithmeticGeometry §1.6 ([AlgebraicModuliForArithmeticGeometry](../../AlgebraicModuliForArithmeticGeometry/README.md)). Hermitian vector bundles, their operations, the Arakelov degree, its additivity and its invariance under finite extension are ArakelovGeometryAndAbelianHeights §§1.1–1.3, 1.5 and 1.6 ([ArakelovGeometryAndAbelianHeights](../../ArakelovGeometryAndAbelianHeights/README.md)). The spherical height of a multiform, the normalised spherical measure `ν` with its disintegration along a unit vector, and the spherical height relative to a Hermitian vector bundle are SlopesOfHermitianVectorBundles §§6.6 and 6.7a ([SlopesOfHermitianVectorBundles](../SlopesOfHermitianVectorBundles/README.md)).

In the family, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties and HeightsForLogSingularMetrics use these statements, as Downstream consumers above says.

## Exact supplier contracts

### From TauCetiRoadmap.HeightsRationalPointsAndObstructions

§5.9b: for a pure `d`-cycle `Z` in `ℙ^n_K`, `projectiveCycleHeight(Z) = arithmeticIntersection(Ō(1), …, Ō(1); Z)/[K:ℚ]` with `d + 1` factors, the Fubini–Study metric at infinity and the standard integral-model metrics at the finite places; its additivity in effective cycles; the height `½·log 5` of `[1:2]` over `ℚ` (used in 6.1 and 6.2). §5.17a: for `𝒳` flat and projective of relative dimension `d` over `O_K` and Hermitian line bundles `L̄_0, …, L̄_d` on it, the arithmetic intersection number `arithmeticIntersection(𝒳; L̄_0, …, L̄_d)`, symmetric and multilinear, with the Cartier recursion (for a section `s` of `L_0` whose divisor meets `𝒳` properly, the intersection on `div s` minus `Σ_σ ∫ log ‖s‖_σ·c_1(L̄_1) ∧ ⋯ ∧ c_1(L̄_d)`), its computation through a resolution of horizontal cycles, its scaling by `[K′:K]` under finite extension, the contribution `multiplicity·log N𝔭` of a vertical fibre, and its Check for a constant change of one metric at all embeddings (used in 5.1, 6.1 and 6.2).

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

§1.6: `chowParameters`, the Chow form of an effective pure cycle in `ℙ^n` over an algebraically closed field of characteristic zero: its zero set (it vanishes exactly at the tuples of hyperplanes that meet the support of the cycle), the irreducibility of the Chow form of an integral cycle, and its uniqueness up to a scalar (used in 6.1 and 6.2 (b)).

### From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights

§1.1: Hermitian vector bundles `J̄ = (M_J, (h_σ)_σ)` over `O_K` with the conjugation condition, isometries, `Ō_K^N`, and the rescaling `J̄(t)` with the metrics `e^{−t}‖·‖_σ`. §1.2: duals, sub-bundles with the restricted metrics, quotients with the quotient metrics, and base change along `O_K → O_L`. §1.3: the Arakelov degree `deĝ`, computed for a Hermitian line bundle by any nonzero section, `deĝ(Ē) = deĝ(det Ē)`, and the normalised degree `deĝ_n = deĝ/[K:ℚ]`. §1.5: additivity of the degree along `0 → F̄ → Ē → Q̄ → 0` with the restricted and quotient metrics. §1.6: `deĝ(Ē_{O_L}) = [L:K]·deĝ(Ē)` for a finite extension `L/K` (all used in 6.2).

### From SlopesOfHermitianVectorBundles, a sub-roadmap of this family

6.6: the spherical height `ht(P) = (1/[K:ℚ])·(Σ_𝔭 log |P|_𝔭 + Σ_σ m_σ(P))` of a nonzero polynomial in `D + 1` groups of `N` variables, homogeneous in each group, with the normalised spherical measure `ν` on the unit sphere of `ℂ^N`; (i) the integrability of `log |σ(P)|`, `ht(aP) = ht(P)` for `a ∈ K^×` and the invariance under finite extension; (ii) `ht(PQ) = ht(P) + ht(Q)`; (vi) the disintegration of `ν` along a unit vector, with the law `Beta(1, N − 1)` of `|ξ(x)|²` and `E log t = −H_{N−1}` (used in 6.1 and 6.2). 6.7a (i): the multiforms on the generic fibre `J` of a Hermitian vector bundle `J̄`, the height `ht_J̄` relative to `J̄` with the measures `ν_σ`, its independence of the local bases and of the isometries, its multiplicativity, its invariance under `K^×`, under isometries and under finite extension, `ht_{J̄(t)}(P) = ht_J̄(P) + t·Σ_i e_i`, its agreement with `ht` for `Ō_K^N`, and `ht_J̄(det_b) = ht(det) + deĝ_n(J̄)` for a `K`-basis `b` of `J` (used in 6.2).

### From TauCetiRoadmap.ComplexComparisonPartII

C5.4: `AnalyticCycleIntegration`, the current of integration over a pure-dimensional analytic cycle of a complex manifold, additive in the multiplicities; `lelongPoincareSection`, for a meromorphic section `s` of a Hermitian holomorphic line bundle `L̄` on a complex manifold, vanishing identically on no connected component: `log ‖s‖` is locally integrable and `(i/π)∂∂̄ log ‖s‖ = [div s] − c_1(L̄)` as currents, that is `dd^c log ‖s‖² = [div s] − c_1(L̄)` with `dd^c = (i/2π)∂∂̄`, the normalisation used above (used in the Crofton formula of the route of 6.1 (iii) and in step (5) of the route of 6.2 (b)).

### From Mathlib

`Polynomial.gaussNorm_mul`, the multiplicativity of the Gauss norm of a polynomial for a nonarchimedean absolute value (used, after a Kronecker substitution, in the route of 6.1 (ii)).

## References

- J.-B. Bost, H. Gillet and C. Soulé, *Heights of projective varieties and positive Green forms*, J. Amer. Math. Soc. 7 (1994): the comparison theorem between the height and the Chow form (6.1), and through it the standard case on which 6.2 rests. The route of 6.1 proves it from the local statements (i)–(iii) and the Cartier recursion of HeightsRationalPointsAndObstructions §5.17a.
- P. Philippon, *Sur des hauteurs alternatives I*, Math. Ann. 289 (1991), Théorème 2, p. 256, restated as Corollaire 4, p. 272: the archimedean statement 6.1 (iii) for an irreducible subvariety of `ℙ^n(ℂ)` not contained in `H_{σ(s)}`, from which (iii) follows by additivity over the components of `Z_σ`.
- H. Gillet and C. Soulé, *Arithmetic intersection theory*, Publ. Math. IHÉS 72 (1990), Theorem 4.2.3, p. 138 (the intersection product of arithmetic cycles on a regular arithmetic variety): the arithmetic intersection numbers of HeightsRationalPointsAndObstructions §5.17a, whose API 5.1 extends.
