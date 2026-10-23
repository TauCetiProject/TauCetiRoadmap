# Roadmap: Hilbert modular surfaces

Let `F` be a real quadratic field with ring of integers `R = 𝓞_F`, discriminant `D`, class
number `h` and narrow class number `h⁺`. For a nonzero ideal `𝔑 ⊆ R` and a fractional ideal `𝔟`
the standard congruence subgroups `Γ₀(𝔑)_𝔟 ≤ GL₂⁺(F)` and `Γ₀¹(𝔑)_𝔟 = Γ₀(𝔑)_𝔟 ∩ SL₂(F)` act on
`ℍ² = ℍ × ℍ` through the two real embeddings of `F`. The quotient `Y(Γ) = Γ\ℍ²` is a normal
complex surface with finitely many quotient singularities (the elliptic points); its Baily–Borel
compactification `Ȳ(Γ)` adds finitely many points (the cusps), each a normal singularity that is
not a quotient singularity; and the **Hilbert modular surface** `X(Γ)` is the minimal
desingularization of `Ȳ(Γ)`. This roadmap builds, for these surfaces, exactly the invariants
that classical surface theory attaches to them and that the LMFDB displays and searches on:

- the cusps, their number, and Hirzebruch's resolution of each by a cycle of rational curves
  whose self-intersection numbers are read off a periodic Hirzebruch–Jung continued fraction;
- the elliptic points, counted by order and by rotation type through class numbers of orders in
  CM extensions of `F`, and resolved by Hirzebruch–Jung strings;
- the Euler number `e`, the self-intersection `K²` of the canonical class, the holomorphic Euler
  characteristic `χ = χ(𝒪_X)`, the Hodge numbers `h^{1,1}`, `h^{2,0}`, the arithmetic genus, and
  the Kodaira dimension, from Hirzebruch's proportionality formula with `ζ_F(−1)` and the local
  contributions of cusps and elliptic points;
- the classification of the level-one surfaces for small `D` (rational, blown-up K3, blown-up
  honestly elliptic, general type), proved for the smallest discriminants and stated as a
  certificate theorem against a stored table for the rest.

The carrier is arithmetic: a Hilbert modular surface is determined by `(F, 𝔑, [𝔟], type)`, where
`[𝔟]` is a narrow ideal class and the type is one of `Γ₀`, `Γ₀¹` (the LMFDB's `gl-0`, `sl-0`).
Every invariant above is a function of this datum, and every milestone that computes one is a
theorem equating a geometric invariant of `X(Γ)` with an arithmetic expression. The groups
themselves and their action on `ℍ²` are the material of the
[Hilbert modular forms roadmap](../HilbertModularForms/README.md) (its Layers 0–1) and are consumed
from it; the quotient `Γ\ℍ²` as a normal complex analytic space is the
[Shimura varieties roadmap](../ShimuraVarieties/README.md)'s (its 0.4, 1.2 and P.6, reached through
the Hilbert modular forms roadmap's 6.1); the toroidal and minimal compactifications are consumed
from the
[toroidal compactifications roadmap](../ShimuraCompactifications/README.md), Layer C6, and the
[Shimura varieties roadmap](../ShimuraVarieties/README.md), Layer 2. What is owned here is the
surface geometry of the result and its numerical invariants.

Suggested home: `TauCeti/Geometry/Shimura/Hilbert/Surface/` (the cusp lattice API of the
toroidal roadmap lives in `TauCeti/Geometry/Shimura/Hilbert/Cusp`), with the purely arithmetic
layers (Hirzebruch–Jung continued fractions, cyclic quotient singularity data, the Siegel value)
under `TauCeti/NumberTheory/HilbertModularSurface/`.

## Prerequisites

- **Mathlib.** `NumberField`, `InfinitePlace` and `IsTotallyReal`; `ClassGroup` and
  `NumberField.classNumber`; `FractionalIdeal` and `Submodule.traceDual`; `UpperHalfPlane` with
  its `GL(2, ℝ)⁺` action; the Dirichlet `LFunction` with its analytic continuation and
  `riemannZeta_neg_nat_eq_bernoulli`; `Int.IsFundamentalDiscr`; `GenContFract`; `Pell`;
  `AlgebraicGeometry.Scheme` with smoothness, properness and `Modules`.
- **Tau Ceti.** `NumberField.IsTotallyPositive` and `totallyPositiveUnits`
  (`TauCeti/NumberTheory/NumberField/TotallyPositive`); `NumberField.NarrowClassGroup` with
  `toClassGroup`, `toClassGroup_ker` and its finiteness
  (`TauCeti/NumberTheory/NumberField/NarrowClassGroup`); `TauCeti.PlumbingGraph` with
  `intersectionMatrix`, `intersectionForm`, `IsNegativeDefinite`
  (`TauCeti/LowDimTopology/Plumbing/IntersectionForm`); the toric fans and regular cones of
  `TauCeti/Geometry/Toric/Algebraic`; `TauCeti.BinaryQuadraticForm`, `reducedForms` and
  `TauCeti.hurwitzClassNumber`; `Scheme.Modules.eulerCharBelow` and `Scheme.genus`
  (`TauCeti/AlgebraicGeometry/Cohomology`); the affine blow-up charts of
  `TauCeti/AlgebraicGeometry/Blowup`.
- **Roadmaps.** [GlobalNumberFields](../GlobalNumberFields/README.md) Layer 2 (narrow ray class
  groups `Cl⁺(𝔪)` of a modulus) and Layer 11 (`NumberFieldOrder`, `Pic O`, conductors, the
  extension/contraction equivalence prime to the conductor);
  [ImaginaryQuadraticClassNumber](../ImaginaryQuadraticClassNumber/README.md) H1.3 (class
  numbers of imaginary quadratic orders as counts of primitive reduced forms), H1.4 (the
  conductor formula over `ℚ`, the model of 3.4) and H2.2 (`ζ_K(s) = ζ(s) L(s, χ_D)` for quadratic
  `K`);
  [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §5.9 (the intersection
  pairing on a smooth projective surface) and §5.10 (adjunction, Riemann–Roch on surfaces,
  Noether's formula, numerical equivalence, the Hodge index theorem);
  [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) K6.1 (Hodge decomposition and
  Hodge symmetry on compact Kähler manifolds), with K7.2 (the Fubini–Study form on `ℂPⁿ`) and
  K6.0 (complex submanifolds inherit Kähler metrics) for the Kähler property of a smooth
  projective surface, and
  [ComplexManifolds](../ComplexManifolds/README.md) Milestone 4 (quotients by free properly
  discontinuous actions); [FuchsianOrbifolds](../FuchsianOrbifolds/README.md) Layer 1 (the
  one-variable elliptic quotient chart `u ↦ u^m`) and Layer 3 (cusp data in one variable), which
  are the degree-one models of Layers 3 and 1–2 below, and 6.1 (the compact modular curve
  `X(1)`); the [Hilbert modular forms roadmap](../HilbertModularForms/README.md) 0.1 (the action),
  1.2 (the groups and the discreteness of their image), 1.3 (component transport), 2.2 (Koecher's
  principle), 2.5–2.6 (constant terms and cusp forms), 3.2 (the invariant measure), 3.5 (finite
  dimensionality) and 6.1 (the groups as component groups of the adelic double coset); [ShimuraCompactifications](../ShimuraCompactifications/README.md) C6.13, C6.14,
  C6.21, C6.30–C6.36, C6.54; [ShimuraVarieties](../ShimuraVarieties/README.md) P.6, 0.1, 0.4, 1.2,
  2.5, 2.7, 2.8;
  [HilbertModularVarietiesAndShimuraCurves](../HilbertModularVarietiesAndShimuraCurves/README.md)
  H0.3, H1.1, H5.2; [AutomorphicBundles](../AutomorphicBundles/README.md) B3.Hilbert.0a.

## Scope and ownership

### Owned here

- The surface-theoretic reading of a cusp of `Ȳ(Γ)`: its type `G(M, V)` (Layer 1), the
  Hirzebruch–Jung continued fraction of an oriented lattice and its period (Layer 2), and the
  theorem that the exceptional locus of `X(Γ) → Ȳ(Γ)` over a cusp of type `G(M, V)` is a cycle of
  `dk` smooth rational curves with the self-intersection numbers `−b_i` (Layer 2).
- Elliptic points of `Γ₀(𝔑)_𝔟` and `Γ₀¹(𝔑)_𝔟`: the dictionary with CM orders, the complete list
  of possible orders, the class number `h(S)` of an `R`-order `S` in a quadratic extension of `F`
  by its conductor (no roadmap states it beyond `F = ℚ`), the class-number formulas for their
  number, the rotation types and their distribution, the Hirzebruch–Jung strings resolving them
  and the local Chern cycles (Layer 3).
- The volume `vol(Γ\ℍ²) = 2[Γ¹(1):Γ] ζ_F(−1)` normalised on `PSL₂(R)`, Siegel's closed formula for `ζ_F(−1)`,
  Hirzebruch's formulas for `c₁² = K²` and `c₂ = e` of `X(Γ)`, the vanishing of the irregularity,
  Noether's formula for `χ`, the Hodge diamond, and the comparison
  `Σ_{[𝔟]} χ(X₀(𝔑)_𝔟) = dim S₂(Γ₀(𝔑)) + h⁺` (Layer 4).
- The surface-classification inputs this roadmap uses and no other roadmap states: the
  Enriques–Kodaira table for minimal surfaces with irregularity zero, the two rationality and
  K3/elliptic criteria of van der Geer, and the passage from `X(Γ)` to its minimal model
  (Layer 5).
- The Kodaira dimension of the level-one surfaces for small `D`, proved for `D ∈ {5, 8, 13, 17}`
  (rational) and stated as a checked-certificate theorem against van der Geer's table for
  `D ≤ 500`, together with the general-type theorem for `D > 500` (Layer 6).
- The LMFDB record of a Hilbert modular surface: every column of the `hmsurface` pages as a
  definition in terms of the layers above, including the Hodge diamond, the set of Kodaira
  dimensions compatible with `(χ, K²)`, the lengths of the resolutions, the principal
  polarizability of a component, and the per-type elliptic-point counts (Layer 7).

### Consumed, not redefined

| Object | Supplier |
| --- | --- |
| `Γ₀(𝔑)_𝔟`, `Γ₁(𝔑)_𝔟`, `Γ(𝔑)_𝔟`, `Γ_i¹(𝔑)_𝔟`, the lattice `R ⊕ 𝔟`, the action on `ℍ^Σ`, the discreteness of the image of `Γ`, the identification with adelic component groups, the invariant measure, Koecher's principle, cusp forms `S_k(Γ₀(𝔑))` and their finite dimension | [HilbertModularForms](../HilbertModularForms/README.md) 0.1, 1.1–1.3, 2.2, 2.5–2.6, 3.2, 3.5, 6.1. This roadmap introduces no second group. |
| The polarization lattice `L_c = R ⊕ c⁻¹𝔡⁻¹`, ordered polarization modules, the complex moduli comparison, the Baily–Borel compactification of the canonical model at tame level and its cusp schemes | [HilbertModularVarietiesAndShimuraCurves](../HilbertModularVarietiesAndShimuraCurves/README.md) H0.3, H1.1, H1.10, H5.2 |
| Proper discontinuity and neat subgroups of the component groups, the normal complex analytic structure of `Γ\X⁺`, finite analytic quotients | [ShimuraVarieties](../ShimuraVarieties/README.md) 0.4, 1.2, P.6 (the Hilbert modular forms roadmap builds the groups and the action, and no quotient space) |
| The normal analytic Baily–Borel quotient `Γ\(ℍ²)*`, its algebraization as a normal projective surface, the Koecher principle and boundary codimension | [ShimuraVarieties](../ShimuraVarieties/README.md) 2.5, 2.7, 2.8 |
| Hilbert cusp data `HilbertCusp.Data`, the character and cocharacter lattices and the trace pairing, admissible cusp fans, the toroidal compactification `M̄_Σ` and its boundary, the minimal contraction `π : M̄_Σ → M^{min}`, its cusps and boundary fibres, the cusp stabilizer exact sequence `0 → X^* → Stab → o_C^× → 1` | [ShimuraCompactifications](../ShimuraCompactifications/README.md) C6.13, C6.14, C6.21, C6.30–C6.36, C6.54 |
| Cusps and stabilizers of the ramified splitting model at prime-to-`p` level | [AutomorphicBundles](../AutomorphicBundles/README.md) B3.Hilbert.0a |
| The narrow class group `Cl⁺(R)`, its finiteness, the surjection `Cl⁺ → Cl` and its kernel (the image of the principal ideals, `1 → {±1}²/sgn(R^×) → Cl⁺ → Cl → 1`) | Tau Ceti `NumberField.NarrowClassGroup`, `toClassGroup_surjective`, `toClassGroup_ker`, `instFinite`, `card_eq_card_classGroup_mul_card_ker`; its identification with [GlobalNumberFields](../GlobalNumberFields/README.md) Layer 2's `RayClassGroup (narrowModulus F)` is Tau Ceti's `narrowEquivNarrowClassGroup` |
| Narrow ray class groups `Cl⁺(𝔪)`; orders `NumberFieldOrder`, `Pic O`, conductors | [GlobalNumberFields](../GlobalNumberFields/README.md) Layer 2, Layer 11 |
| Class numbers of imaginary quadratic orders `h(𝒪_f) = h(K) f/[𝒪_K^×:𝒪_f^×] ∏_{p∣f}(1 − χ_D(p)/p)` (the case `F = ℚ` of 3.4); `ζ_K(s) = ζ(s)L(s, χ_D)` for quadratic `K` on `Re s > 1` | [ImaginaryQuadraticClassNumber](../ImaginaryQuadraticClassNumber/README.md) H1.3, H1.4, H2.2 |
| Intersection numbers on a smooth projective surface, adjunction, Riemann–Roch, Noether's formula `12χ = K² + c₂`, numerical equivalence, Hodge index | [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §§5.9–5.10 |
| Hodge decomposition, Hodge symmetry `h^{p,q} = h^{q,p}` and `b₁ = 2h^{1,0}` on compact Kähler manifolds; the Kähler metric of a complex submanifold of `ℂPⁿ` | [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) K6.1; K7.2 (Fubini–Study) and K6.0 (restriction to complex submanifolds) |
| Free properly discontinuous holomorphic quotients and descent of maps | [ComplexManifolds](../ComplexManifolds/README.md) Milestone 4 |
| The one-variable elliptic chart and cusp datum; the compact modular curve `X(1)` | [FuchsianOrbifolds](../FuchsianOrbifolds/README.md) Layers 1 and 3; 6.1 |
| Toric fans, regular cones, the fan scheme and subdivisions | Tau Ceti `TauCeti/Geometry/Toric/Algebraic` and [AnalyticToricGeometry](../AnalyticToricGeometry/README.md) Layers 0, 2, 3 |
| Plumbing graphs and their intersection matrices | Tau Ceti `TauCeti.PlumbingGraph` |
| Total positivity | Tau Ceti `NumberField.IsTotallyPositive` |

### Not owned here

- **Labels, orderings and stored lists.** The field label `2.2.D.1`, the ideal labels of `𝔑`
  and `𝔟`, the label `F-N-b-t` of a surface, the representative `𝔟` chosen for a narrow class,
  the ordering of the rows of the cusp and elliptic-point tables, the starting point of a
  resolution cycle (`self_intersections_minimal` with `repetition`), the `M_label` of a cusp,
  and the normalisation of cusp coordinates `(a : c)` are not targets. This roadmap states the
  intrinsic label prefix `(D, 𝔑, [𝔟] ∈ Cl⁺(R), type)` and every invariant as a function of it;
  it never fixes an index.
- **Hilbert modular forms** as functions, Hecke operators, newforms, `L`-functions: the
  [Hilbert modular forms roadmap](../HilbertModularForms/README.md). Only `dim S₂(Γ₀(𝔑))` enters
  here, in Layer 4.
- **The moduli interpretation** (`X₀(𝔑)_𝔟` as a moduli space of abelian surfaces with real
  multiplication, polarization modules, the knowl's "polarization module isomorphic to
  `(𝔡_F 𝔟)⁻¹`"): HilbertModularVarietiesAndShimuraCurves H1; here `𝔟` is only the second
  summand of the lattice `R ⊕ 𝔟`.
- **Canonical models over the reflex field**, integral models, toroidal compactifications in
  general, automorphic bundles: ShimuraVarieties, ShimuraCompactifications, AutomorphicBundles.
- **Hilbert–Blumenthal surfaces for degree `> 2`** and the general theory of cusp singularities
  of Hilbert modular varieties: the toroidal roadmap; this roadmap is two-dimensional throughout.
- **Quaternionic Shimura curves and the curves `F_N` as Shimura curves:** `QuaternionArithmetic`
  and HilbertModularVarietiesAndShimuraCurves R18. Layer 6 uses the Hirzebruch–Zagier curves
  `F_N` for `N ≤ 4` on level-one surfaces only, as explicit curves in `ℍ²`, and owns nothing about
  them beyond what the rationality proofs there need.
- **General algebraic surface theory** beyond the three facts of Layer 5 (Castelnuovo's
  contraction and rationality criteria, the Enriques–Kodaira table, the elliptic-configuration
  criterion). Layer 5 states, with sources, exactly the statements used here, so that no
  milestone of this roadmap rests on an unwritten one; an algebraic-surfaces roadmap that
  states them in general is their natural supplier, and Layer 5 is written so that it can be
  consumed from such a roadmap by alias.

## Pinned conventions

1. **The field and the order of its places.** `F` is a number field with
   `Module.finrank ℚ F = 2` and `IsTotallyReal F`; `D = |discr F| ∈ {5, 8, 12, 13, …}` is a
   positive fundamental discriminant. The two real embeddings are **ordered**, `(v₁, v₂)`, and
   the ordered pair is part of the carrier: every invariant below is a function of
   `(F, v₁, v₂, 𝔑, [𝔟], type)`, and `Suggested.lean` takes `v₁ v₂ : F →+* ℝ` as arguments of
   every declaration that depends on the order. The nontrivial automorphism `σ` of `F` swaps the
   two embeddings, so swapping the order replaces the component `[𝔟]` by its Galois conjugate
   `[σ𝔟]` and leaves the set of surfaces attached to `(F, 𝔑, type)` unchanged; the choice the
   LMFDB makes (through the ordering of the real roots of its defining polynomial,
   `nf.generator`) is a database convention, not a target. All pairs `(ζ_{v₁}, ζ_{v₂})`, `(z₁, z₂)` are
   in the order `(v₁, v₂)`. `ℍ² = ℍ × ℍ` with `z = (z₁, z₂)`; `γ ∈ GL₂⁺(F)` acts by
   `γz = (v₁(γ)z₁, v₂(γ)z₂)` through Mathlib's `GL(2, ℝ)⁺` action on `UpperHalfPlane`.
2. **The groups.** `GL₂⁺(F) = {γ ∈ GL₂(F) : det γ ≫ 0}`;
   `Γ₀(𝔑)_𝔟 = {(a b; c d) ∈ GL₂⁺(F) : a, d ∈ R, b ∈ 𝔟⁻¹, c ∈ 𝔑𝔟, ad − bc ∈ R^×_{>0}}`,
   `Γ₁(𝔑)_𝔟` additionally `d ≡ 1 mod 𝔑` (HilbertModularForms 1.2), `Γ(𝔑)_𝔟` additionally
   `a ≡ d ≡ 1 mod 𝔑`, `b ∈ 𝔑𝔟⁻¹`. Assaf et al. and Dasgupta–Kakde write `Γ₁` with `a ≡ 1`
   instead; for `ν ≫ 0` in `F`, conjugation by `W_ν = (0 −1; ν 0)` maps their group at `𝔟` onto
   the pinned `Γ₁(𝔑)_{ν(𝔑𝔟)⁻¹}` (it swaps `a` and `d`), and every statement about `Γ₁` quoted from
   them is read through this isomorphism (1.3, 1.5);
   `Γ_i¹(𝔑)_𝔟 = Γ_i(𝔑)_𝔟 ∩ SL₂(F)`. `Γ₀(1)_𝔟 = GL⁺(R ⊕ 𝔟)`. The LMFDB's `ambient type` `gl`
   is `Γ_i(𝔑)_𝔟`, `sl` is `Γ_i¹(𝔑)_𝔟`; `gamma type` `0`, `1`, `f` is `i = 0`, `i = 1`, full level.
   `PΓ` is the image of `Γ` in `PGL₂⁺(F)`; it acts faithfully on `ℍ²`, and every stabilizer,
   order and index below is taken in `PΓ`.
3. **Components.** For `α ∈ F^×_{>0}`, `γ ↦ diag(1, α) γ diag(1, α)⁻¹` maps `Γ_i(𝔑)_𝔟` onto
   `Γ_i(𝔑)_{α𝔟}` (HilbertModularForms 1.3; `(a b; c d) ↦ (a, α⁻¹b; αc, d)`); the surface depends
   on `𝔟` only through its narrow class `[𝔟] ∈ Cl⁺(R)`. For
   `𝔟 = β𝔟′` with `β` of mixed sign the two surfaces are isomorphic as real-analytic spaces by a
   map holomorphic in `z₁` and antiholomorphic in `z₂`; they are not identified as complex
   surfaces, and every invariant below is attached to the narrow class.
4. **Cusps.** A cusp of `Γ` is a `PΓ`-orbit in `ℙ¹(F)`, represented by `(a : c)` with `a ∈ R`,
   `c ∈ 𝔟`; its invariants are the fractional ideal `𝔰 = aR + c𝔟⁻¹` and the integral ideal
   `𝔐 = 𝔑 + c(𝔟𝔰)⁻¹`. Representatives are normalised so that `𝔰` is coprime to `𝔑`.
5. **Cusp type.** A cusp is of type `G(M, V)` when the stabilizer of `∞` in a conjugate
   `γΓγ⁻¹`, as a transformation group of `ℍ²`, is `{z ↦ vz + m : v ∈ V, m ∈ M}` with `M ⊂ F` a
   `ℤ`-lattice of rank two and `V ≤ F^×_{>0}` a group of totally positive units of the multiplier
   ring of `M` with `VM = M`. A `ℤ`-basis `(x, y)` of `M` is **oriented** when
   `v₁(x)v₂(y) − v₂(x)v₁(y) > 0`.
6. **Hirzebruch–Jung continued fractions.** For real `w > 1` (or for `n/r ∈ ℚ`),
   `w = b₀ − 1/(b₁ − 1/(b₂ − ⋯)) =: [[b₀, b₁, …]]` with `b_j = ⌈w_j⌉`, `w_{j+1} = 1/(b_j − w_j)`;
   all `b_j ≥ 2` once `w_j > 1`. The expansion of a quadratic irrational is eventually periodic;
   its **period** `(b_1, …, b_d)` is the periodic part, taken as a cyclic sequence. The
   expansion attached to an oriented basis `(x, y)` of `M` is that of `v₁(x/y)`.
7. **Resolution cycle of a cusp.** For a cusp of type `G(M, V)` with period `(b_1, …, b_d)` and
   `k ≥ 1` minimal with `(w_1⋯w_d)^k ∈ V` (equivalently `k = [U_M^+ : V]`, `U_M^+` the totally
   positive units of the multiplier ring of `M`), the resolution cycle is the cyclic sequence of
   length `dk` repeating `(−b_1, …, −b_d)` `k` times; these are the self-intersection numbers of
   the `dk` curves, which are smooth rational curves meeting cyclically and transversally. When
   `dk = 1` the single curve is a rational curve with one ordinary double point and
   self-intersection `2 − b_1`; when `dk = 2` the two curves meet transversally in two points.
   The LMFDB's `self_intersections_minimal` is `(−b_1, …, −b_d)` and `repetition` is `k`.
8. **Elliptic points.** `z ∈ ℍ²` is elliptic for `Γ` when its stabilizer in `PΓ` is nontrivial;
   that stabilizer is finite cyclic, of order `q ≥ 2`, the **order** of `z`. Its generator
   `γ̄` lifts to `γ ∈ Γ` with `tr(γ)² − 4 det(γ)` totally negative.
9. **Rotation type.** If the generator acts on the tangent space `T_zℍ² = ℂ²` by
   `(ζ_q^a, ζ_q^b)` with `ζ_q = exp(2πi/q)`, the point has **type** `(q; a, b)`; types are taken
   modulo multiplication of `(a, b)` by `(ℤ/q)^×` (a change of generator), **not** modulo the swap
   `(a, b) ↦ (b, a)`. The normalised representative is `(q; 1, r)` with `r = ba⁻¹ mod q`,
   `gcd(r, q) = 1`. The quotient singularity of type `(q; 1, r)` is `ℂ²/⟨(ζ_q, ζ_q^r)⟩`, resolved by
   the Hirzebruch–Jung string of `q/r = [[b_1, …, b_ℓ]]`: a chain of `ℓ` smooth rational curves
   `C_1, …, C_ℓ` with `C_i² = −b_i`, `C_i·C_{i+1} = 1`. The LMFDB's `rotation_type` `[n; a, b]`
   is `(n; a, b)`.
10. **The surface and its invariants.** `X(Γ)` is the minimal desingularization of `Ȳ(Γ)`
    (unique up to unique isomorphism); it is smooth, projective and connected, and it is
    **not** in general a minimal surface. `K² = K_X·K_X`, `e = c₂(X) = Σ(−1)^i b_i(X)`,
    `χ = χ(𝒪_X) = h^{0,0} − h^{0,1} + h^{0,2}`, `h^{p,q} = dim H^q(X, Ω^p)`, `p_g = h^{2,0}`,
    `q = h^{1,0}`. The **arithmetic genus** is `p_a = χ − 1`; the LMFDB column `chi` is `χ`, and
    the knowl `hmsurface.arithmetic_genus` calls `χ` itself the arithmetic genus. Both numbers
    are defined and named here; `chi` means `χ(𝒪_X)`.
11. **Kodaira dimension.** `κ(X) ∈ {−1, 0, 1, 2}` is the Kodaira dimension of `X(Γ)`, equal to
    that of its minimal model; `−1` is the value for `P_m = 0` for all `m`. Two finite sets are
    defined in Layer 5: `kodairaPossibilitiesMinimal χ K²` is the set of `κ` of a **minimal**
    surface with `q = 0` and invariants `(χ, K²)` by the Enriques–Kodaira table, and
    `kodairaDims χ K²` is the set of `κ` compatible with `χ` and the **lower bound** `K² ≤ K²_{min}`
    (the union of the former over `K²′ ≥ K²`). The LMFDB column `kodaira_dims` is the singleton
    `{κ}` when a classification certificate (6.4) exists and `kodairaDims(χ, K²(X))` otherwise;
    the page's "known to be" is the singleton case. `κ` is a member of both sets.
12. **Volume and `ζ_F(−1)`.** `vol(Γ\ℍ²) := 2[Γ¹(1) : Γ] ζ_F(−1)`, where `Γ¹(1) = PSL₂(R)` and
    `[Γ¹(1) : Γ] = [Γ¹(1) : Γ¹(1) ∩ Γ]/[Γ : Γ¹(1) ∩ Γ] ∈ ℚ` is the generalised index for `Γ`
    commensurable with `Γ¹(1)` in `PGL₂⁺(ℝ)²`. Thus `vol(PΓ₀¹(1)_𝔟\ℍ²) = 2ζ_F(−1)` for every
    `𝔟` (Siegel's theorem for `SL(R ⊕ 𝔟)`), `vol(PΓ₀(1)_𝔟\ℍ²) = 2ζ_F(−1)/[R^×_{>0} : R^{×2}]`,
    and `vol` is multiplied by the index of 0.3 at level `𝔑` (`vol(PΓ₀(𝔭₂)\ℍ²) = 5 · 1/15 = 1/3`
    for `ℚ(√5)`). The normalisation is the one under
    which the two formulas of 4.4 give integers: with the index taken relative to `PGL₂⁺(R)`
    instead, the `sl` surfaces of `D = 12` would have `e = 16 + 1/3` (see the `D = 12` example).
    `ζ_F(−1)` is the value at `s = −1` of the meromorphic continuation of the Dedekind zeta
    function, and it equals Siegel's finite sum `(1/60) Σ_{b ∈ ℤ, b² < D, b ≡ D (2)} σ₁((D − b²)/4)`
    (Layer 4; `siegelZetaMinusOne D` in `Suggested.lean`).
13. **Local Chern data.** For a type `(q; 1, r)` with string `[[b_1, …, b_ℓ]]`, put
    `P_0 = (1, 0)`, `P_1 = (r/q, 1/q)`, `P_{i+1} = b_i P_i − P_{i−1}`, `P_i = (x_i, y_i)`; the local
    Chern cycle is `Z = Σ_{i=1}^{ℓ} (x_i + y_i − 1) C_i`, `c(q; 1, r) := Z·Z ∈ ℚ` and
    `ℓ(q; 1, r) := ℓ`. These are the quantities entering Hirzebruch's formula, and they are
    tabulated for every type that occurs: `c(2;1,1) = 0`, `ℓ = 1`; `c(3;1,1) = −1/3`, `ℓ = 1`;
    `c(3;1,2) = 0`, `ℓ = 2`; `c(4;1,1) = −1`, `ℓ = 1`; `c(4;1,3) = 0`, `ℓ = 3`;
    `c(5;1,2) = c(5;1,3) = −2/5`, `ℓ = 2`; `c(5;1,1) = −9/5`, `ℓ = 1`; `c(5;1,4) = 0`, `ℓ = 4`;
    `c(6;1,1) = −8/3`, `ℓ = 1`; `c(6;1,5) = 0`, `ℓ = 5`; `c(12;1,5) = −1`, `ℓ = 3`;
    `c(12;1,7) = −4/3`, `ℓ = 3`. (`RotationType.localChernSelfIntersection` and
    `RotationType.resolutionLength` in `Suggested.lean`, where every value is checked by
    `decide`.)
14. **Conditional nothing.** No invariant here depends on a hypothesis: the only quantity the
    LMFDB stores as a set rather than a value is `kodaira_dims`, and it is the definition of
    convention 11, not a conjecture.

## What Mathlib supplies

- `UpperHalfPlane` with the `GL(2, ℝ)⁺` Möbius action
  (`Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction`), its manifold structure and its proper action; `Subgroup.IsArithmetic`,
  `IsCusp`, `CuspOrbits` and `strictWidthInfty` for subgroups of `GL(2, ℝ)` in one variable
  (`Mathlib/NumberTheory/ModularForms/Cusps`), the degree-one model of Layer 1.
- `NumberField.InfinitePlace`, `IsReal`, `embedding_of_isReal`, `IsTotallyReal`, `discr`,
  `classNumber`, `ClassGroup`, `Units.fundSystem`, `regulator`, `dedekindZeta_residue`;
  `Int.IsFundamentalDiscr`; `Pell.Solution₁`, `Pell.IsFundamental`.
- `DirichletCharacter.LFunction` with continuation, `completedLFunction_one_sub`,
  `hurwitzZeta_neg_nat`, `riemannZeta_neg_nat_eq_bernoulli`: the inputs for `ζ_F(−1)` through
  `ζ_F = ζ · L(χ_D)`.
- `GenContFract`, `GenContFract.of`, `IntFractPair.stream`: the regular continued fraction.
  Mathlib has no minus (Hirzebruch–Jung) continued fraction; Layer 2 builds it and relates the
  two by the classical splitting `[[b_0, b_1, …]]` of a regular expansion.
- `FractionalIdeal`, `FractionalIdeal.dual`, `Submodule.traceDual`, `Ideal.absNorm`, factorisation
  in Dedekind domains, `Ideal.Quotient` and `ZMod`-style unit groups `(R ⧸ 𝔑)ˣ`.
- `AlgebraicGeometry.Scheme`, `IsSmooth`, `IsProper`, `Scheme.Modules`, sheaf cohomology through
  `Scheme.Modules.cohomology` as used by Tau Ceti's `eulerCharBelow`.

## What Tau Ceti supplies

- `NumberField.IsTotallyPositive`, `isTotallyPositive_iff`, `IsTotallyPositive.mul`, `.inv`,
  `isTotallyPositive_sq`, `totallyPositiveUnits`
  (`TauCeti/NumberTheory/NumberField/TotallyPositive`): `F^×_{>0}`, `R^×_{>0}` and `R^{×2}` are these, never new predicates.
- `NumberField.NarrowClassGroup`, `NarrowClassGroup.mk`, `toClassGroup`, `toClassGroup_ker`,
  `instFinite`, `card_eq_card_classGroup_mul_card_ker`
  (`TauCeti/NumberTheory/NumberField/NarrowClassGroup`), and `narrowEquivNarrowClassGroup`
  (`TauCeti/NumberTheory/NumberField/Global/RayClass/Narrow`): `Cl⁺(R)`, the component set.
- `TauCeti.PlumbingGraph`, `PlumbingGraph.intersectionMatrix`, `.intersectionForm`,
  `.IsNegativeDefinite`, `isNegativeDefinite_iff`, `blowUpVertex`
  (`TauCeti/LowDimTopology/Plumbing`): the intersection matrices of Hirzebruch–Jung strings and
  of resolution cycles are instances, and blowing up a point of the exceptional configuration is
  `blowUpVertex`.
- `TauCeti.Toric.Fan`, `IsToricCone`, `IsRegularCone`, fan subdivisions and the fan scheme
  (`TauCeti/Geometry/Toric/Algebraic`): the Hirzebruch–Jung string is the regular subdivision of
  the cone `⟨(0,1), (q, −r)⟩`, and the cusp resolution is the `V`-quotient of the fan with rays
  through the vertices of the convex hull of `M ∩ (ℝ_{>0})²`.
- `TauCeti.BinaryQuadraticForm`, `IsReducedForm`, `reducedForms D`, `hurwitzClassNumber`: class
  numbers of imaginary quadratic orders as finite decidable counts, used in the level-one
  formulas of Layer 3 for `D ≡ 1 mod 4`.
- `Scheme.Modules.eulerCharBelow`, `Scheme.genus`, Mayer–Vietoris and the long exact sequence
  (`TauCeti/AlgebraicGeometry/Cohomology`); `SchemeWeilDivisor` with Serre duality and the Euler
  characteristic of divisors (`TauCeti/AlgebraicGeometry/WeilDivisor/Scheme`); the affine
  blow-up charts `affineBlowupι` (`TauCeti/AlgebraicGeometry/Blowup`); finite group quotients of
  affine schemes (`TauCeti/AlgebraicGeometry/Quotient`).
- `TauCeti.Hodge.HodgeStructureOn`, `hodgeNumber`, `hodgeType` (`TauCeti/Geometry/Hodge`): the
  Hodge numbers of `H²(X, ℚ)` are read through this carrier.
- `ModularForms.EllipticPoints` (`apply_I_eq_zero_of_not_dvd`, `apply_ρ_eq_zero_of_not_dvd`) and
  `Subgroup.integerCuspWidth`: the degree-one elliptic points `i`, `ρ` and cusp widths; Layer 3
  specialises to them when `F = ℚ` is admitted as a test.

## What is missing

Nothing in Mathlib or Tau Ceti states a Hilbert modular surface, a Hirzebruch–Jung continued
fraction, a cusp singularity, a cyclic quotient singularity of a surface with its resolution,
a rotation type, Hirzebruch's proportionality formula, or Siegel's formula for `ζ_F(−1)`. The
open roadmaps named above construct the compactified varieties and the toroidal boundary in
general; none reads the boundary as a cycle of rational curves with self-intersection numbers,
counts elliptic points, or computes `e`, `K²`, `χ`, the Hodge numbers or `κ`. All of that is
built here.

## Layer 0: the arithmetic frame

Everything in this layer is either a direct application of Mathlib to a real quadratic field or
a specialisation of the Hilbert modular forms roadmap to degree two; it exists so that later
layers have exact names.

### 0.1 Real quadratic data

For `F` with `finrank ℚ F = 2` and `IsTotallyReal F`: the two real places, their order
(convention 1), the fundamental discriminant `D` and its reconstruction of `F` up to isomorphism,
the integral basis `1, ω_D` with `ω_D = (D + √D)/2`, the fundamental unit `ε > 1` at `v₁`
(`Units.fundSystem` in unit rank one; `Pell.IsFundamental` for `d = D/4` or `d = D` describes only
the norm-one units of `ℤ[√d]`, and gives `ε` itself only when `N(ε) = 1` and `ε ∈ ℤ[√d]`: for
`D = 5` the Pell solution `9 + 4√5` is `ε⁶`),
its norm `N(ε) ∈ {±1}`, and the dichotomy: `R^×_{>0} = R^{×2} = ⟨ε²⟩` when `N(ε) = −1`;
`R^×_{>0} = ⟨ε⁺⟩ ⊋ R^{×2} = ⟨ε²⟩` with `ε⁺ = ±ε` totally positive when `N(ε) = 1`. The index
`[R^×_{>0} : R^{×2}]` is `1` or `2` accordingly, and `[R^× : R^{×2}] = 4`. *Rests on:* Mathlib
`Pell`, `Units.fundSystem`, Tau Ceti `totallyPositiveUnits`.

### 0.2 Narrow classes and components

`Cl⁺(R)` is Tau Ceti's `NumberField.NarrowClassGroup F`, which `narrowEquivNarrowClassGroup`
identifies with GlobalNumberFields Layer 2's `RayClassGroup (narrowModulus F)`; `h⁺ = #Cl⁺(R)`,
`h⁺/h ∈ {1, 2}`, and `h⁺ = h` iff `N(ε) = −1`. The set of components of `X₀(𝔑)` is `Cl⁺(R)`
(convention 3; this is the component bijection the knowl `hmsurface.component_ideal` states).
`[𝔡⁻¹] ∈ Cl⁺(R)` is the narrow class of the inverse different; `IsPrincipallyPolarizable 𝔟 :⇔
[𝔟] = [𝔡⁻¹]`, the LMFDB flag `is_pp`. *Rests on:* Tau Ceti `NarrowClassGroup`, 0.1.

### 0.3 The groups and the index formula

The groups of convention 2 are HilbertModularForms 1.2's groups specialised to `n = 2`; prove here:
`Γ₀(1)_𝔟 = GL⁺(R ⊕ 𝔟)`; the exact sequence `1 → Γ_i¹(𝔑)_𝔟 → Γ_i(𝔑)_𝔟 → R^×_{>0} → 1`; the
conjugation isomorphism `Γ_i(𝔑)_𝔟 ≅ Γ_i(𝔑)_{α𝔟}` for `α ≫ 0` of convention 3, and the
isomorphism by `W_ν` of convention 2 between the two forms of `Γ₁`; `PΓ_i¹(𝔑)_𝔟 ≤ PΓ_i(𝔑)_𝔟` of index
`[R^×_{>0} : R^{×2}]`, so the two surfaces coincide when `h⁺ = h`; and the index
`[PΓ₀(1)_𝔟 : PΓ₀(𝔑)_𝔟] = N(𝔑) ∏_{𝔭 ∣ 𝔑} (1 + N(𝔭)⁻¹)`, by the transitive action on
`ℙ¹(R/𝔑)` through the Chinese remainder theorem, with the same value for `Γ₀¹`. *Rests on:*
HilbertModularForms 1.2–1.3 (groups, determinant images, component transport), Mathlib
`Ideal.Quotient`, 0.1.

### 0.4 The action, the effective group and the quotient

The homomorphism `GL₂⁺(F) → GL(2, ℝ)⁺ × GL(2, ℝ)⁺`, `γ ↦ (v₁(γ), v₂(γ))`, its action on `ℍ²`,
the kernel `Γ ∩ F^×` of the action and `PΓ = Γ/(Γ ∩ F^×)`; `PΓ` acts faithfully. The scalar
subgroup of `Γ₀(𝔑)_𝔟` is `R^×` and that of `Γ₀¹(𝔑)_𝔟` is `{±1}`. By HilbertModularForms 6.1,
`Γ₀(𝔑)_𝔟 = GL₂(F) ∩ g K₀(𝔑) GL₂(F_∞)⁺ g⁻¹` for `g = diag(1, t)`, `t` a finite idele of ideal `𝔟`:
it is the component group `Γ_g` of ShimuraVarieties 0.1 for the Hilbert modular datum
`(Res_{F/ℚ} GL₂, (ℍ^±)²)` at level `K₀(𝔑)`, and `PΓ₀¹(𝔑)_𝔟` has finite index in `PΓ₀(𝔑)_𝔟`
(0.3; `Γ₀¹` itself has infinite index, with quotient `R^×_{>0}`). The
quotient: `PΓ` acts properly discontinuously (ShimuraVarieties 0.4); for a neat normal subgroup
`Γ′ ⊴ Γ` of finite index (`Γ ∩ Γ(𝔑′)_𝔟` for `𝔑′` divisible enough, ShimuraVarieties 0.4)
`Γ′\ℍ²` is a complex manifold (ComplexManifolds Milestone 4), and
`Y(Γ) = (Γ/Γ′)\(Γ′\ℍ²)` is its finite analytic quotient (ShimuraVarieties P.6), a normal complex
analytic surface independent of `Γ′` (ShimuraVarieties 1.2). It is smooth off the images of the
points with nontrivial stabilizer in `PΓ`. *Rests on:* HilbertModularForms 0.1, 1.2, 6.1;
ShimuraVarieties 0.1, 0.4, 1.2, P.6; ComplexManifolds Milestone 4.

## Layer 1: cusps

### 1.1 Cusps as orbits

`ℙ¹(F)` with the `GL₂(F)` action; the extension of the `Γ` action to `ℍ² ∪ ℙ¹(F)`; a cusp is a
`PΓ`-orbit in `ℙ¹(F)` (knowl `hmsurface.cusps`); the orbit space is finite. The stabilizer of
a cusp is infinite and contains a translation lattice of rank two; a cusp is never an elliptic
point. For `F = ℚ` the definition reduces to Mathlib's `CuspOrbits` of the image of `Γ` in
`GL(2, ℝ)`. *Rests on:* 0.3, 0.4; Mathlib `Cusps` for the comparison.

### 1.2 The cusp invariants `𝔰` and `𝔐`

For a representative `(a : c)` with `a ∈ R`, `c ∈ 𝔟`: `𝔰(a, c) = aR + c𝔟⁻¹` and
`𝔐(a, c) = 𝔑 + c(𝔟𝔰)⁻¹`. `𝔐` is integral, depends only on the cusp, and divides `𝔑`
(Assaf et al., Lemma 3.1.2). Every cusp has a representative with `𝔰` coprime to `𝔑`.
*Rests on:* 1.1.

### 1.3 Classification of cusps

For `Γ₁(𝔑)_𝔟` and `Γ₀(𝔑)_𝔟`, the bijections
`Γ_i(𝔑)_𝔟\(F² ∖ 0) → 𝒫_i(𝔑)_𝔟`, `(a, c) ↦ (𝔰, 𝔐, (ā, c̄))`, of Assaf et al., Lemma 3.1.8, with
`𝒫₁` the set of triples with `(ā, c̄) ∈ (𝔰/𝔰𝔐)^×/R^×_{>0} × (𝔰𝔟𝔐/𝔰𝔟𝔑)^×/R^×_{>0}` and `𝒫₀` its
quotient by `(R/𝔑)^×` acting by `x·(a, c) = (xa, x⁻¹c)`; the `SL` versions with `R^{×2}` in place
of `R^×_{>0}`. The `Γ₁` case is Dasgupta–Kakde, Lemma 3.6, for their group with `a ≡ 1`; the
pinned `Γ₁(𝔑)_{ν(𝔑𝔟)⁻¹}` receives it through `W_ν` (convention 2), which sends the cusp
`(a : c)` to `(−c : νa)` and exchanges the invariants `𝔐` and `𝔑/𝔐`. *Rests on:* 1.2, 0.3.

### 1.4 The number of cusps

For each `𝔐 ∣ 𝔑`, the cusps of `X_i(𝔑)` with invariant `𝔐`, over all components `𝔟 ∈ Cl⁺(R)`
together, number `#Q_i(𝔐, 𝔑)`, where `Q₀(𝔐, 𝔑)` is the quotient of `Cl⁺(𝔐) × Cl⁺(𝔑/𝔐)` by the
subgroup generated by the pairs `([xR], [x⁻¹R])`, `x ∈ R`, `xR + 𝔑 = R` (Assaf et al.,
Corollary 3.1.18; `Cl⁺(𝔪)` is GlobalNumberFields' narrow ray class group). In closed form the
number of cusps of `X₀(𝔑)` is

```text
h⁺ h · Σ_{𝔐 ∣ 𝔑} φ_{>0}(𝔐 + 𝔑/𝔐),      φ_{>0}(𝔞) = #((R/𝔞)^×/R^×_{>0}),
```

and that of `X₀¹(𝔑)` is the same sum with `φ¹(𝔞) = #((R/𝔞)^×/R^{×2})` (Corollary 3.1.23). The
number of cusps of a single component `X₀(𝔑)_𝔟` is `h · Σ_{𝔐∣𝔑} φ_{>0}(𝔐 + 𝔑/𝔐)`, independent of
`𝔟`; at level one each component has exactly `h` cusps, in bijection with `Cl(R)` through `𝔰`.
The target `cuspCount v₁ v₂ P` of a prefix `P` (7.1) is the number of `PΓ`-orbits in `ℙ¹(F)`
(1.1) for the group `Γ` of `P`, the LMFDB's `nb_cusps`; it is the cardinality of the multiset
`cuspData` of 1.5. It is specified in this README only: the orbits need the groups of
HilbertModularForms 1.2, and no Lean declaration here states it.
*Rests on:* 1.3; GlobalNumberFields Layer 2.

**Checks.**

- (computation) — `2.2.5.1-1.1-1.1-gl-0` has one cusp; over `ℚ(√5)` the surface of `Γ₀(𝔭₂)`,
  `𝔭₂ = (2)`, has two, one for each `𝔐 ∈ {R, 𝔭₂}`, matching
  `h⁺h(φ_{>0}(R) + φ_{>0}(R)) = 2`.
- (independence of the component) — over `ℚ(√3)` (`h = 1`, `h⁺ = 2`) both level-one components
  have one cusp; over `ℚ(√85)` (`h = 2`) the trivial component of `X₀(1)` has two, with the cycle
  `(2⁸, 11)` twice, and so does the other component, with `(2, 3, 2, 4, 4)` twice.
- (comparison) — for `F = ℚ`, admitted as a test, the orbit set is Mathlib's `CuspOrbits` of the
  image of `Γ` in `GL(2, ℝ)` (1.1).

### 1.5 Cusp types

Every cusp of `Γ₀(𝔑)_𝔟`, `Γ₀¹(𝔑)_𝔟`, `Γ₁¹(𝔑)_𝔟`, and of `Γ₁(𝔑)_𝔟` for squarefree `𝔑`, is of type
`G(M, V)` in the sense of convention 5, with (Assaf et al., Proposition 3.3.8; `𝔰`, `𝔐` as in
1.2, `𝔟` and `𝔑` coprime):

| group | `M` | `V` |
| --- | --- | --- |
| `Γ₀(𝔑)_𝔟` | `𝔰⁻²𝔟⁻¹𝔑(𝔑 + 𝔐²)⁻¹` | `{v ∈ R^×_{>0} : v ≡ 1 mod 𝔐 + 𝔑/𝔐}` |
| `Γ₀¹(𝔑)_𝔟` | `𝔰⁻²𝔟⁻¹𝔑(𝔑 + 𝔐²)⁻¹` | `{v² : v ∈ R^×, v² ≡ 1 mod 𝔐 + 𝔑/𝔐}` |
| `Γ₁¹(𝔑)_𝔟` | `𝔰⁻²𝔟⁻¹(𝔑/𝔐)` | `{v² : v ∈ R^×, v ≡ 1 mod 𝔑𝔐(𝔑 + 𝔐²)⁻¹}` |
| `Γ₁(𝔑)_𝔟`, `𝔑` squarefree | `𝔰⁻²𝔟⁻¹(𝔑/𝔐)` | `{v ∈ R^×_{>0} : v ≡ ε mod 𝔑/𝔐, some ε ∈ U}` |

with `U = {u ∈ R^× : u ≡ 1 mod 𝔐}`. The last row is for the pinned `Γ₁` (`d ≡ 1`): in the
stabilizer element `γ⁻¹(v m; 0 1)γ` of Assaf et al. (3.3.10) the lower-right entry is
`≡ 1 mod 𝔭` at `𝔭 ∣ 𝔐` and `≡ v mod 𝔭` at `𝔭 ∣ 𝔑/𝔐`, so the roles of `𝔐` and `𝔑/𝔐` in `V` are
those of Assaf et al., Proposition 3.3.8(d), exchanged (their group has `a ≡ 1`); `M` is
unchanged. For `Γ₁¹` the two forms of `Γ₁` agree, since `ad ≡ 1 mod 𝔑` there. The conjugating matrix is
`γ = (λ μ; −c a) ∈ GL₂⁺(F)` with `λ ∈ 𝔰⁻¹`, `μ ∈ 𝔰⁻¹𝔟⁻¹`, `λa + μc = 1`, `det γ = 1`
(Lemma 3.3.5; van der Geer, Proposition I.1.1). At level one on component `𝔟` the cusp `(1 : 0)`
has `M = 𝔟⁻¹`, `V = R^×_{>0}` (`Γ₀`) or `V = R^{×2}` (`Γ₀¹`). The multiplier ring of `M` is `R`
in every row, so `U_M^+ = R^×_{>0}`. *Rests on:* 1.2, 1.3; ShimuraCompactifications C6.54 (the
stabilizer exact sequence `0 → X^* → Stab → o_C^× → 1`, of which `G(M, V)` is the split
transformation-group form with `M = X^*` and `V = {u²ε}`).

The target `cuspData v₁ v₂ P` of a prefix `P` is the multiset, over the cusps of the surface of
`P` (one entry per `PΓ`-orbit in `ℙ¹(F)`), of their types `G(M, V)` as `CuspDatum F` values
(2.3), with `M` and `V` the lattice and multiplier group of convention 5 at a conjugate moving
the cusp to `∞`; for the groups of the table its entries are the rows above. It is specified in
this README only, for the same reason as `cuspCount` (1.4).

**Checks.**

- (computation) — at level one on the trivial component, the `Γ₀` datum of the cusp `(1 : 0)`
  is `G(R, U_R^+)`, the file's `levelOneCusp`; for `Γ₀¹` it is `G(R, R^{×2})`.
- (computation) — over `ℚ(√5)` the two cusps of `Γ₀(𝔭₂)` have the data `G(2R, U_R^+)` (cusp
  `(0 : 1)`, `𝔐 = R`) and `G(R, U_R^+)` (cusp `(1 : 0)`, `𝔐 = 𝔭₂`), both with period `(3)` and
  `repetition = 1`.
- (repetition) — over `ℚ(√3)` at level one, `repetition = 2` for `sl` and `1` for `gl` on both
  components; over `ℚ(√5)`, where `N(ε) = −1`, it is `1` for both ambient types.
- (rejection) — `Γ₁(𝔑)_𝔟` with `𝔑` not squarefree is outside the definition: its cusp
  stabilizers are not of the form `G(M, V)` (Explicit scope exclusions).

## Layer 2: Hirzebruch–Jung continued fractions and the cusp resolution

### 2.1 The minus continued fraction of a rational

`hjExpansion (n r : ℕ) : List ℕ` for `0 < r < n`, `gcd(n, r) = 1`: the finite expansion
`n/r = [[b_1, …, b_ℓ]]` of convention 6, with `b_i ≥ 2`; `hjLength n r = ℓ`; the recurrence
`n/r = b_1 − r′/r` with `r′ = b_1 r − n`, `0 < r′ < r`; the matrix form
`(n, r) ↦ ∏ (b_i, −1; 1, 0)`; the symmetry `hjExpansion n r′ = reverse (hjExpansion n r)` for
`rr′ ≡ 1 mod n`; the comparison with Mathlib's regular continued fraction of `n/r` (a regular
partial quotient `a` contributes `a − 1` entries `2` after an entry `b + 1`); and the values
`hjExpansion 3 1 = [3]`, `hjExpansion 3 2 = [2,2]`, `hjExpansion 5 2 = [3,2]`,
`hjExpansion 5 3 = [2,3]`, `hjExpansion 6 5 = [2,2,2,2,2]`, `hjExpansion 12 5 = [3,2,3]`,
`hjExpansion 12 7 = [2,4,2]`, all by `decide`. *Rests on:* Mathlib `GenContFract`.

### 2.2 The minus continued fraction of a quadratic irrational

`hjStream v₁ (w : F) : ℕ → F` for `w ∉ ℚ` in the real quadratic field `F`, with digits
`hjDigit v₁ w j = ⌈v₁(w_j)⌉`. A quadratic irrational `w` is **reduced** (`IsReduced v₁ v₂ w`) when
`v₁(w) > 1` and `0 < v₂(w) < 1`; the period of a purely periodic stream is `hjPeriod v₁ w`. Theorems: the stream of any `w` is eventually reduced; the expansion of a reduced
`w` is purely periodic; the period length `d` is the length of the cycle of reduced elements, and
`w_1 w_2 ⋯ w_d = ε_M⁺` is the fundamental totally positive unit of the multiplier ring of
`M = ℤ + ℤw`; conversely every element of the cycle is reduced with the same multiplier ring.
Equivalently: for an oriented basis `(x, y)` of `M`, `w = x/y`, the period of `w` is the sequence
of `b_j` for which the consecutive vertices `A_j` of the convex hull of `M ∩ (ℝ_{>0})²` satisfy
`A_{j−1} + A_{j+1} = b_j A_j` (van der Geer, Chapter II, §2). The period does not depend on the
oriented basis, and replacing `M` by `αM` with `α ≫ 0` leaves it unchanged, while `α` of mixed
sign reverses the orientation and gives the period of the **dual** lattice (2.7). *Rests on:*
2.1; Mathlib `Pell` and 0.1 for the unit; Tau Ceti `IsTotallyPositive`. (`exists_isReduced_hjStream`,
`isReduced_hjStream_one`, `hjPeriod_ne_nil_of_isReduced`, `CuspDatum.period_eq_hjPeriod`.)

### 2.3 The cycle of a cusp datum

`CuspDatum F`: a `ℤ`-lattice `M : Submodule ℤ F` of rank two together with a subgroup
`V ≤ multiplierUnits M` (the totally positive `u ∈ F^×` with `uM = M`, that is `U_M^+`) of finite
index `repetition = k = [U_M^+ : V]` (`Subgroup.relIndex`); the orientation is supplied by the
ordered embeddings `v₁ v₂`, which every function of a datum takes. Its `period v₁ v₂ : List ℤ`
is the period of `v₁(x/y)` for an oriented basis `(x, y)` of `M`, its
`resolutionCycle v₁ v₂ : List ℤ` is the sequence `(−b_1, …, −b_d)` repeated `k` times of
convention 7, a cyclic sequence recorded as a list (two rotations of the list are the same cycle;
the LMFDB's starting point is not a target), its `cycleLength = dk` and its
`cycleSum = Σ (2 − b)`. The level-one `Γ₀` datum `G(R, R^×_{>0})` is the constructor
`levelOneCusp` of the file. Theorems: `k` is the least `k ≥ 1` with
`(ε_M⁺)^k ∈ V`; `dk = 1` iff `d = 1` and `V = U_M^+`; for the data of 1.5 at level one,
`k = 1` for `Γ₀` and `k = [R^×_{>0} : R^{×2}]` for `Γ₀¹`; for `Γ₀(𝔑)_𝔟` in general `k` is the
order of `ε⁺` in `(R/(𝔐 + 𝔑/𝔐))^×`. *Rests on:* 2.2, 1.5.

### 2.4 Hirzebruch's resolution theorem

For a cusp `σ` of `Γ` of type `G(M, V)`, a neighbourhood of `σ` in `Ȳ(Γ)` is isomorphic to a
neighbourhood of the cusp point in the compactification of `G(M, V)\ℍ²` at `∞`, and the
exceptional locus of the minimal resolution over `σ` is the configuration of convention 7: `dk`
smooth rational curves `S_0, …, S_{dk−1}` forming a cycle, with `S_i² = −b_i` (indices modulo
`dk`), `S_i·S_{i+1} = 1`, no other intersections; for `dk = 1`, one rational curve with one node
and `S_0² = 2 − b_1`; for `dk = 2`, `S_0·S_1 = 2`. The resolution is obtained as the quotient by
`V` of the smooth toric surface of the fan whose rays pass through the vertices `A_j` of 2.2,
and it is minimal because every `b_i ≥ 2` and, when `dk ≥ 2`, no curve is a `(−1)`-curve, while
for `dk = 1` the curve is singular (van der Geer, Chapter II, Lemma 3.2, in the form Assaf et
al. quote in §3.3). *Rests on:* 2.3; ShimuraCompactifications
C6.14 (admissible fans at a Hilbert cusp are exactly the `V`-invariant complete decompositions of
the positive cone), C6.21 (the toroidal model), C6.36 (its completion over a minimal cusp is the
completed toric union modulo the cusp units) and C6.35 (each cusp of the minimal model has one
connected boundary fibre); ShimuraVarieties 2.5, 2.7 (`Ȳ(Γ)` as a normal projective surface);
Tau Ceti `Toric.Fan` and AnalyticToricGeometry Layers 2–3 for the analytic charts of the regular
fan. The identification of the toroidal boundary over `σ` with the Hirzebruch cycle is the
content owned here: the regular cone system generated by the `A_j` is the unique minimal one, and
the self-intersection of the divisor of a ray `A_j` in a smooth toric surface is `−b_j` with
`A_{j−1} + A_{j+1} = b_j A_j`.

### 2.5 Intersection matrix of the cycle

The intersection matrix `cycleIntersectionMatrix` of the resolution cycle on `Fin (dk)`: the
cycle graph's `TauCeti.PlumbingGraph.intersectionMatrix` for `dk ≥ 3`, the matrix
`(−b_0, 2; 2, −b_1)` for the two-vertex graph with a double edge, and the `1 × 1` matrix
`(2 − b_1)` in the nodal case (a `PlumbingGraph` carries at most one edge between two vertices,
so the two small cases are matrices, not graphs), and the theorem that it is negative definite (so the cycle contracts to a normal singularity, the cusp singularity), with
the two exceptions `dk = 1, b_1 = 2` and `dk = 2, b_0 = b_1 = 2`, which do not occur because a
period of a reduced quadratic irrational is never all `2`s. Also: the arithmetic genus of the
cycle is `1` (each `S_i` rational, cycle of length `dk`, or a nodal rational curve), and
`K·S_i = b_i − 2`. *Rests on:* 2.3, 2.4; Tau Ceti `PlumbingGraph.IsNegativeDefinite`;
SchemeAndStackFoundations §5.10 (adjunction).

### 2.6 The cusp contributions

For a surface with cusps `σ` of cycles `(b_{σ,1}, …, b_{σ,r_σ})`: `ℓ_cusp = Σ_σ r_σ` (the LMFDB's
`len_cusp_res`) and `Σ_σ Σ_k (2 − b_{σ,k})`. For `Γ₀(𝔑)_𝔟` the cycles of all cusps are determined by
1.4–1.5 and 2.3, so both numbers are functions of `(F, 𝔑, [𝔟], type)`. The targets of a prefix
`P` are `lenCuspRes v₁ v₂ P`, the sum of `CuspDatum.cycleLength` over `cuspData v₁ v₂ P`, and
`cuspSum v₁ v₂ P`, the sum of `CuspDatum.cycleSum` over it; they are specified in this README
only, since `cuspData` is (1.5). *Rests on:* 1.4, 1.5, 2.3.

**Checks.**

- (computation) — `2.2.5.1-1.1-1.1-gl-0`: cycle `(−3)`, `ℓ_cusp = 1`, cusp sum `−1`;
  `2.2.8.1-1.1-1.1-gl-0`: cycle `(−2, −4)`, `ℓ_cusp = 2`, cusp sum `−2`.
- (two cusps) — over `ℚ(√5)`, `Γ₀(𝔭₂)`: two cycles `(−3)`, `ℓ_cusp = 2`, cusp sum `−2`.
- (ambient type) — over `ℚ(√3)` at level one, the `gl` components have the cycles `(−4)`
  (`ℓ_cusp = 1`, cusp sum `−2`) and `(−2, −3)` (`ℓ_cusp = 2`, cusp sum `−1`); the `sl`
  components, with `k = 2`, have `(−4, −4)` (`ℓ_cusp = 2`, cusp sum `−4`) and
  `(−2, −3, −2, −3)` (`ℓ_cusp = 4`, cusp sum `−2`).

### 2.7 Dual cusps and orientation reversal

For `M` and the orientation-reversed lattice (equivalently `βM` with `β` of mixed sign, or the
lattice `M` for the opposite order of the embeddings), the periods are dual in Hirzebruch's
sense: every run of `m ≥ 0` consecutive entries `2` between two entries `≥ 3` of one period
gives an entry `m + 3` of the other, and every entry `b ≥ 3` gives a run of `b − 3` entries `2`
(so `(4) ↔ (3, 2)` and `(3, 6) ↔ (3, 3, 2, 2, 2)`), and the two periods satisfy
`Σ_j (b_j − 3) = −Σ_{j′}(b′_{j′} − 3)` (`CuspDatum.period_swap`). Consequence: the two components of
`X₀¹(1)` for `h⁺ = 2h` have different cusp cycles (for `D = 12`: `(2,3,2,3)` on one, `(4,4)` on
the other), although the two components are real-analytically isomorphic by convention 3.
*Rests on:* 2.2, 2.3.

## Layer 3: elliptic points

### 3.1 Elliptic points, isolation, order

An element `γ ∈ GL₂⁺(F)` is elliptic iff `tr(γ)² − 4det(γ)` is totally negative; it then has a
unique fixed point in `ℍ²` (one in each factor); an elliptic point of `Γ` is the fixed point of an
elliptic element of `Γ` (knowl `hmsurface.elliptic_point`). The stabilizer in `PΓ` of a point of
`ℍ²` is finite cyclic; the elliptic points form a discrete `Γ`-invariant set with finitely many
orbits; the image of an elliptic point of order `q` in `Y(Γ)` is a cyclic quotient singularity of
order `q`, and `Y(Γ)` is smooth elsewhere. The linearisation: the stabilizer acts on `T_zℍ²` by a
pair of primitive `q`-th roots of unity, so every elliptic point is an isolated fixed point and
has a type `(q; a, b)` with `gcd(a, q) = gcd(b, q) = 1`. *Rests on:* 0.4; FuchsianOrbifolds Layer 1
(the one-variable chart) applied in each factor; ComplexManifolds Milestone 4.

### 3.2 The CM-order dictionary

For an elliptic point `z` with stabilizer generated by `γ̄`, lifted to `γ ∈ Γ` with
`det γ ∈ R^×_{>0}` (normalised in a fixed set of representatives of `R^×_{>0}/R^{×2}` containing
`1`): `K = F(γ)` is a CM quadratic extension of `F`, `S = R[γ]` an `R`-order in `K`, and the
assignment `z ↦ (K, S, φ : S ↪ 𝒪)` is a bijection from the elliptic points of `Γ` (mod `Γ`) to
the `Γ`-conjugacy classes of pairs `{φ, φ̄}` of embeddings of CM orders `S` with `S^× ⊋ R^×`
into the `R`-order `𝒪 = 𝒪₀(𝔑)_𝔟 = (R 𝔟⁻¹; 𝔑𝔟 R)` generated by `Γ`, where `φ̄` is `φ` precomposed
with the nontrivial automorphism of `K/F`; `𝒪¹ = Γ₀¹(𝔑)_𝔟` and `𝒪^×_{>0} = Γ₀(𝔑)_𝔟`
(Assaf et al., §4.1). The stabilizer of `z` in `PΓ` is `S′^×/R^×` (for `Γ₀`) or
`μ(S′)/{±1}` (for `Γ₀¹`), where `S′ = φ⁻¹(φ(K) ∩ 𝒪)` is the order optimally embedded by `φ`.
Lemma 4.1.1: if `det γ = 1`, `R[γ] ≅ R[ζ]` with `ζ` a primitive root of unity of order `2q` and
`ζ + ζ⁻¹ ∈ F`; if `det γ = u ∉ R^{×2}`, then `2 ∣ q` and `γ² = u⁻¹ζ` with `ζ` of order `q`,
`ζ + ζ⁻¹ ∈ F`. *Rests on:* 3.1; GlobalNumberFields Layer 11 (`NumberFieldOrder`).

### 3.3 The possible orders

For `Γ₀¹(𝔑)_𝔟` (and every subgroup of `SL₂(F)` commensurable with it) the order of an elliptic
point lies in `{2, 3, 4, 5, 6}`: `ℚ(ζ_{2q} + ζ_{2q}⁻¹) ⊆ F` forces `2q ∈ {4, 6, 8, 10, 12}`, with
`q = 4` only for `D = 8`, `q = 5` only for `D = 5`, `q = 6` only for `D = 12`. For `Γ₀(𝔑)_𝔟` the
orders lie in `{2, 3, 4, 5, 6, 12}`: the second case of Lemma 4.1.1 adds `q ∈ {2, 4, 6, 12}`
with `ζ ∈ {−1, ±i, ζ_6^{±1}, ζ_{12}^{±1}, ζ_{12}^{±5}}` and a non-square totally positive unit
`u`, which exists only when `N(ε) = 1`; `q = 8, 10` cannot occur because `ℚ(√2)` and `ℚ(√5)`
have `N(ε) = −1`; `q = 12` occurs, for `F = ℚ(√3)` only, through the unit
`γ = ζ_{12}(1 + i)/(1 + √3) ∈ ℤ[ζ_{12}]^×` of relative norm `ε⁻¹ = 2 − √3`, whose class generates
`ℤ[ζ_{12}]^×/R^× ≅ ℤ/12`. Hence the LMFDB's per-order counts `nb_ell2, …, nb_ell6` exhaust the
`sl` surfaces and all `gl` surfaces except those over `ℚ(√3)`, for which the order `12` is also
recorded here. *Rests on:* 3.2; Mathlib cyclotomic fields, 0.1.

### 3.4 Counting by embedding numbers

For an `R`-order `S` in a CM extension `K` of `F`, with conductor `𝔣(S)` (so `S = R + 𝔣Z_K`,
the only shape an `R`-order in a quadratic extension can have), class number `h(S) = #Pic S`
and Hasse unit index `Q(S) = [S^× : μ(S)R^×] ∈ {1, 2}`:

```text
h(S) = h(K) · N(𝔣) ∏_{𝔭 ∣ 𝔣} (1 − (K/𝔭) N(𝔭)⁻¹) / [Z_K^× : S^×],
[Z_K^× : S^×] = Q(K) #μ(K) / (Q(S) #μ(S)),
```

with `(K/𝔭) ∈ {1, −1, 0}` the splitting symbol. This class-number formula is a milestone here:
GlobalNumberFields Layer 11's `Pic` and its extension/contraction equivalence prime to the
conductor give the exact sequence
`1 → S^× → Z_K^× → (Z_K/𝔣Z_K)^×/(R/𝔣)^× → Pic S → Pic Z_K → 1` (with `S/𝔣Z_K = R/𝔣`), and
`#(Z_K/𝔣Z_K)^×/#(R/𝔣)^× = N(𝔣) ∏_{𝔭 ∣ 𝔣}(1 − (K/𝔭)N(𝔭)⁻¹)`; the case `F = ℚ` is
ImaginaryQuadraticClassNumber H1.4. The number of elliptic points of order `q` of
`Γ₀¹(𝔑)_𝔟` and of `Γ₀(𝔑)_𝔟` is (Assaf et al., (4.2.2) and Proposition 4.2.3, with `n = 2`)

```text
m_q¹ = (2/h) Σ_{S ⊇ R[ζ_{2q}], #μ(S) = 2q} h(S)/Q(S) · m(Ŝ, 𝒪̂; 𝒪̂^×),
m_q⁺ = (2/h⁺) Σ_{S : S^×/R^× cyclic of order q} h(S) · m(Ŝ, 𝒪̂; 𝒪̂^×),
```

where `S` runs over the orders of 3.2 in all CM extensions `K/F` (only `F(i)`, `F(√−3)`,
`F(ζ_5)` for `D = 5`, and `F(√−ε⁺)` for `N(ε) = 1` carry such orders), and the local embedding
number `m(Ŝ, 𝒪̂; 𝒪̂^×) = ∏_{𝔭 ∣ 𝔑} m_𝔭(S, 𝒪; 𝒪^×)` is `1` at level one. The counts are the same
on every component `𝔟`. For `h = 1` and level one the formula reads
`m_q⁺ = ½ Σ_S h(S) [R^× : R^×_{>0} N_{K/F}(S^×)]` and
`m_q¹ = ½ Σ_S h(S) [R^× : N_{K/F}(S^×)]`, which is how the worked examples below were computed.
*Rests on:* 3.2; GlobalNumberFields Layer 11 (`Pic` of an order, conductors); Voight,
*Quaternion Algebras*, Corollary 31.1.10,
Lemma 30.3.14, Proposition 39.4.12.

### 3.5 Local embedding numbers at the level

For an Eichler order of level `𝔭^e` and an order `S` of conductor prime to `𝔭`:
`m_𝔭 = 1 + (K/𝔭)` when `e = 1` (so `2` if `𝔭` splits in `K`, `0` if inert, `1` if ramified), and
the general formula for `e ≥ 2` and for `𝔭 ∣ 𝔣` (Voight, §§30.6–30.7); the criterion that
`R[γ]` embeds into `𝒪₀(𝔑)_{(1)}` iff `f_γ(x) = x² − t_γ x + u_γ` has a root modulo `𝔑`, through
`φ(x) = (x, 1; −f_γ(x), t_γ − x)` (Assaf et al., Corollary 4.3.15(a)). *Rests on:* 3.4.

### 3.6 Level-one closed forms

For `𝔑 = R`, `D > 12`, from 3.4 and the biquadratic class-number relation: for `Γ₀¹(1)_𝔟`,
`a₂ = h(−4D)` if `D ≡ 1 mod 4`; `a₂ = h(−4D) + h(−D) = 3h(−D)` if `D ≡ 8 mod 16`;
`a₂ = h(−4D) + h(−D) + h(−D/4)` if `D ≡ 12 mod 16`, which is `10h(−D/4)` for `D ≡ 12 mod 32` and
`4h(−D/4)` for `D ≡ 28 mod 32` (the extra term counts the points from the maximal order of
`F(i) = F(√−D/4)`, which here contains `R[i]` with conductor `(2)`: `D = 28` has `a₂ = 4`, not
`h(−112) + h(−28) = 3`, and an odd `a₂` with no point of order `4` or `6` would make `12χ`
non-integral);
`a₃ = h(−3D)` if `3 ∤ D`, `a₃ = h(−3D) + h(−D/3)` if `3 ∣ D`; here `h(Δ)` is the class number
of the imaginary quadratic order of discriminant `Δ` (ImaginaryQuadraticClassNumber H1.3, as the
cardinality of `reducedForms |Δ|` restricted to primitive forms), and `a₄ = a₅ = a₆ = 0`. For
`D ∈ {5, 8, 12}`: `D = 5`: `a₂ = a₃ = a₅ = 2`; `D = 8`: `a₂ = a₃ = a₄ = 2`; `D = 12`:
`a₂ = 3`, `a₃ = 2`, `a₆ = 1`. (Prestel; van der Geer, Chapter I, §5. The worked examples check
the `D ≡ 1 mod 4` row against 3.4 for every `D < 100`.) *Rests on:* 3.4; ImaginaryQuadraticClassNumber H1.3–H1.4.

### 3.7 Rotation factors

For an elliptic `γ = (a b; c d)` with `tr γ = t`, `det γ = u`, fixed point
`z_v = (a_v − d_v)/(2c_v) + i√(4u_v − t_v²)/(2|c_v|)`, the rotation factor at `v` is
`ζ_v = (t_v²/(2u_v) − 1) − i·sgn(t_v c_v)√(1 − (t_v²/(2u_v) − 1)²)` (Prestel; Assaf et al.,
(4.3.1)–(4.3.2)); it equals the derivative `u_v (c_v z_v + d_v)⁻²` of `v(γ)` at `z_v` (the
factor `u_v = v(det γ)` is `1` only on `Γ₀¹`), and the type of
`z` is `(q; a, b)` with `ζ_{v₁} = ζ_q^a`, `ζ_{v₂} = ζ_q^b`. Conjugating `γ` by `β ∈ GL₂(F)`
raises the rotation factor to the sign pattern `ε = sgn(det β) ∈ {±1}²`: `ζ′ = ζ^ε`
(componentwise exponent), so `ζ′ = ζ` iff `det β ≫ 0`. The reference types of the standard
embeddings of 3.5, for the companion matrix of `ζ` with `ζ` the root of `x² − tx + 1` such that
`v₁(t) = 2cos(π/q)`: `(2; 1, 1)` for `ζ = i`; `(3; 1, 1)` for `ζ = ζ_6`; `(4; 1, 3)` for
`ζ = ζ_8` over `ℚ(√2)`; `(5; 1, 3)` for `ζ = ζ_{10}` over `ℚ(√5)`; `(6; 1, 5)` for `ζ = ζ_{12}`
over `ℚ(√3)`; `(12; 1, 5)` for the unit of 3.3 with `v₁(√3) > 0`. *Rests on:* 3.1.

### 3.8 Distribution of types

The elliptic points of order `q` arising from an order `S` of conductor `𝔣` on the component `𝔟`
all have types in `{ζ^ε}` for `ε` in one coset of the kernel of the composite
`{±1}² → Cl⁺(R)/Cl(R) → Gal(K/F)` (the first map sends a sign vector to the narrow class of a
principal ideal with generator of those signs, the second is the Artin map), and the coset is
determined by the Artin symbol of `𝔣𝔟` in `K/F` (Assaf et al., Theorem 4.3.11, Lemma 4.3.14,
Corollary 4.3.15(b)). Two cases are distinguished: if `K/F` is ramified at some finite prime, or
some `𝔭 ∣ 𝔑` with odd exponent is inert in `K` (the oriented optimal selectivity condition
fails), then every sign pattern occurs with the same multiplicity on every component, so the
points from `S` split equally between the two types `(q; 1, r)` and `(q; 1, −r)`; if the
condition holds (`K` lies in the narrow Hilbert class field of `F` and the level condition is
met), then on each component only one coset occurs, all points from `S` have the same type, and
the components with the opposite Artin symbol carry the other type. For `h⁺ = h` the first case
always holds. The total
number of points of each type over all components is the same for both types. *Rests on:* 3.4,
3.7; GlobalNumberFields Layer 2 (the Artin map on `Cl⁺` is ClassFieldTheory's and enters only
through the splitting of `𝔣𝔟` in `K`, which is decided by factorisation).

### 3.9 The Hirzebruch–Jung string and the local Chern cycle

A type is `RotationType` (`q ≥ 2`, `r < q`, `gcd(r, q) = 1`). For `t = (q; 1, r)`: the string
`t.hjString = hjExpansion q r`, the chain `C_1, …, C_ℓ` as the `PlumbingGraph`
`stringPlumbing t.hjString` (the path `stringGraph ℓ` with weights `−b_i`), negative
definiteness of its intersection matrix, the points `P_i` (`RotationType.chernCoefficients`) and
the cycle `Z` of convention 13, `t.localChernSelfIntersection = c(q; 1, r) = Z²` and
`t.resolutionLength = ℓ(q; 1, r)`, with the tabulated values of convention 13 proved by `decide`,
the swap relation `RotationType.IsSwap t t′` (`rr′ ≡ 1 mod q`, the same singularity with the
factors swapped) with `c` and `ℓ` invariant under it, and `c(q; 1, q − 1) = 0`,
`ℓ(q; 1, q − 1) = q − 1` (the `A_{q−1}` singularity).
*Rests on:* 2.1; Tau Ceti `PlumbingGraph`.

### 3.10 Resolution of the elliptic points

The minimal resolution of `Y(Γ)` at the image of an elliptic point of type `(q; 1, r)` has
exceptional locus the Hirzebruch–Jung string of 3.9: smooth rational curves `C_i` with
`C_i² = −b_i`, consecutive ones meeting transversally once; `K_X = π^*K_Y + Z` locally, with
`Z` the local Chern cycle (Assaf et al., §4.4; van der Geer, Chapter II, §6). The quotient
`ℂ²/⟨(ζ_q, ζ_q^r)⟩` is the affine toric surface of the cone `⟨(0, 1), (q, −r)⟩` in the lattice
`ℤ²`, and its minimal resolution is the regular subdivision by the rays through the vertices of
the convex hull of the lattice points in the cone; the self-intersections `−b_i` are read off
exactly as in 2.4. The local model: a neighbourhood of the image of an elliptic point of type
`(q; 1, r)` in the analytic space `Y(Γ)` of 0.4 is isomorphic to a neighbourhood of the vertex of
this toric surface, by the linearisation of 3.1 on a stabilizer-invariant polydisc; the singular
points of `Y(Γ)` are exactly the images of the elliptic points. *Rests on:* 0.4, 3.1, 3.9; Tau Ceti `Toric.Fan`,
`IsRegularCone`; AnalyticToricGeometry Layers 2–3; FuchsianOrbifolds Layer 1.

### 3.11 The elliptic-point record

For a prefix `P` (7.1) and the ordered embeddings: the finite set `ellipticTypes v₁ v₂ P` of
types `(q; 1, r)` that occur, the multiplicities `ellipticCount v₁ v₂ P t = a(Γ; q, 1, r)`
(3.4–3.8), the per-order counts `ellipticCountOfOrder q = nb_ell_q = Σ_r a(Γ; q, 1, r)`, the
total `ellipticTotal = nb_ell`, and `lenEllRes = len_ell_res = Σ a(Γ; q, 1, r) ℓ(q; 1, r)`.
Here `ellipticTypes v₁ v₂ P` is the set of normalised types `(q; 1, r)` (convention 9, with the
tangent coordinates in the order `(v₁, v₂)`) of the elliptic points of `PΓ` (3.1), and
`ellipticCount v₁ v₂ P t` is the number of `PΓ`-orbits of elliptic points of type `t`, zero for
`t` outside `ellipticTypes`. These targets are specified in this README only: elliptic points
need the groups of HilbertModularForms 1.2, and no Lean declaration here states them; a type is
the file's `RotationType`, and `ℓ(q; 1, r)` is `RotationType.resolutionLength`.
*Rests on:* 3.4–3.9.

**Checks.**

- (computation) — `2.2.5.1-1.1-1.1-gl-0`: types `(2;1,1)` twice, `(3;1,1)`, `(3;1,2)`,
  `(5;1,2)`, `(5;1,3)` once each; `nb_ell = 6`, `nb_ell2 = nb_ell3 = nb_ell5 = 2`,
  `len_ell_res = 9`. `2.2.8.1-1.1-1.1-gl-0`: `nb_ell = 6`, `len_ell_res = 9`.
- (order 12) — over `ℚ(√3)` at level one, the `gl` component with cusp cycle `(−4)` has the
  types `(12;1,5)`, `(4;1,3)`, `(3;1,1)` and three points `(2;1,1)`, so `nb_ell12 = 1`; every
  `sl` surface, and every `gl` surface with `D ≠ 12`, has `nb_ell12 = 0`.
- (convention) — types are not identified under the swap: over `ℚ(√5)` the points `(5;1,2)` and
  `(5;1,3)` are counted under two distinct types.
- (rejection) — `(4; 1, 2)` is not a type (`gcd(2, 4) ≠ 1`); for `D = 5`, the assignment
  `(5;1,1), (5;1,4)` in place of `(5;1,2), (5;1,3)` passes integrality (4.5) and is still wrong,
  by 3.7.

## Layer 4: the global invariants

### 4.1 The Hilbert modular surface

`X(Γ) → Ȳ(Γ)` is the minimal desingularization: the resolution of 2.4 over each cusp and of
3.10 over each elliptic point, glued along the smooth locus of `Ȳ(Γ)`. `X(Γ)` is a smooth
connected projective surface over `ℂ` (connectedness because `ℍ²` is connected; projectivity
from the projectivity of `Ȳ(Γ)` and the projectivity of blow-ups); it is unique up to unique
isomorphism over `Ȳ(Γ)`; it is the complex analytic surface the LMFDB knowl `hmsurface.hmsurface`
defines. `X_i(𝔑)_𝔟 := X(Γ_i(𝔑)_𝔟)`, `X_i¹(𝔑)_𝔟 := X(Γ_i¹(𝔑)_𝔟)`. *Rests on:* 2.4, 3.10;
ShimuraVarieties 2.5, 2.7; ShimuraCompactifications C6.32–C6.33 (the minimal model as a normal
projective scheme with its polarization quotient, the algebraic side of `Ȳ(Γ)`).

### 4.2 Siegel's formula

`siegelZetaMinusOne D := (1/60) Σ_{b ∈ ℤ, b² < D, b ≡ D mod 2} σ₁((D − b²)/4) ∈ ℚ` and the theorem
`ζ_F(−1) = siegelZetaMinusOne D` (`dedekindZeta_neg_one_eq_siegel`), where `ζ_F` is the
meromorphic continuation of Mathlib's `NumberField.dedekindZeta F`; the file states it for any
`ζ : ℂ → ℂ` meromorphic on `ℂ` and equal to the Dirichlet series on `Re s > 1`, which pins `ζ`
uniquely. The value is computed as `riemannZeta(−1) · L(−1, χ_D)` for the
primitive quadratic character `χ_D` of conductor `D` (the identity `ζ_F(s) = ζ(s)L(s, χ_D)` on
`Re s > 1` is ImaginaryQuadraticClassNumber H2.2 for quadratic `K`, here applied to real `F`, and
both sides continue meromorphically with the continuation unique). The value
`L(−1, χ_D) = −B_{2,χ_D}/2` with `B_{2,χ} = D Σ_{a=1}^{D} χ(a) B_2(a/D)` follows from Mathlib's
`hurwitzZeta_neg_nat` and the decomposition of `L(s, χ)` into Hurwitz zeta functions; Siegel's
closed form is then the classical identity of Siegel (1969) and Zagier (1976), proved by the
Cohen–Zagier manipulation of `B_{2,χ_D}` as a sum over representations `D = b² + 4ac`. Values:
`1/30, 1/12, 1/6, 1/6, 1/3, 1/3, 1/2, 2/3, 1/2, 1, 5/6, 7/6, 4/3, 7/6` for
`D = 5, 8, 12, 13, 17, 21, 24, 28, 29, 33, 37, 40, 41, 44`, all by `decide` on the finite sum.
`ζ_F(−1) > 0`, and `60 ζ_F(−1) ∈ ℤ`. *Rests on:* Mathlib `DirichletCharacter.LFunction`,
`hurwitzZeta_neg_nat`, `riemannZeta_neg_nat_eq_bernoulli`; ImaginaryQuadraticClassNumber H2.2.

### 4.3 Volume and proportionality

`vol(Γ\ℍ²) = 2[Γ¹(1) : Γ] ζ_F(−1) = [Γ¹(1) : Γ] D^{3/2} ζ_F(2)/(2π⁴)` (convention 12; the second
form is the functional equation `ζ_F(−1) = D^{3/2} ζ_F(2)/(4π⁴)` and is a theorem, not a second
definition; at `D = 5`, `ζ_F(2) = ζ(2)L(2, χ_5) = 2π⁴/(75√5)` gives `1/15 = 2ζ_F(−1)`. Assaf et
al. (6.2.2) print `−[Γ(1) : Γ] d_F^{3/2} ζ_F(2)/π^{2n}`, which is right for `n = 1` and off by
the factor `−1/2` for `n = 2`), with
`[Γ¹(1) : PΓ₀(𝔑)_𝔟] = N(𝔑)∏_{𝔭∣𝔑}(1 + N(𝔭)⁻¹)/[R^×_{>0} : R^{×2}]` and
`[Γ¹(1) : PΓ₀¹(𝔑)_𝔟] = N(𝔑)∏_{𝔭∣𝔑}(1 + N(𝔭)⁻¹)` by 0.3 (the two index factors are
`HMSPrefix.levelIndex` and `HMSPrefix.unitIndex` in `Suggested.lean`; the target
`volume v₁ v₂ P` and the theorem `volume_gamma0` computing it for gamma type `zero` are specified
in this README only, since `[Γ¹(1) : Γ]` needs the groups of HilbertModularForms 1.2);
the Gauss–Bonnet reading: `vol(Γ\ℍ²)` is the orbifold Euler characteristic of `PΓ\ℍ²` for the
measure `(dx₁dy₁/y₁²)(dx₂dy₂/y₂²)` normalised by `1/(4π²)` (van der Geer, Chapter IV, Theorem
2.1 and §1; Siegel's computation of `vol(SL₂(R)\ℍ²) = 2ζ_F(−1)` in these units, which is the
`sl` normalisation of convention 12 and is uniform in `N(ε)`). *Rests on:*
4.2, 0.3; HilbertModularForms 3.2 (the invariant measure and finite covolume).

**Checks.**

- (computation) — `2.2.5.1-1.1-1.1-gl-0`: `vol = 2ζ_F(−1) = 1/15`; over `ℚ(√5)`, `Γ₀(𝔭₂)`:
  `levelIndex 𝔭₂ = 5` and `vol = 1/3`.
- (ambient type) — over `ℚ(√3)` at level one, `unitIndex = 2`, `vol = 1/3` for `sl` and `1/6`
  for `gl`; for `D = 21, 24, 28, 33`, `vol = 2/3, 1, 4/3, 2` for `sl` and half that for `gl`.
- (comparison) — `vol(PΓ₀¹(1)_𝔟\ℍ²) = 2ζ_F(−1) = 2 · siegelZetaMinusOne D` for every `𝔟`, with
  `ζ_F` the continuation of Mathlib's `dedekindZeta F` (4.2).
- (rejection) — taking the index relative to `PGL₂⁺(R)` instead of `PSL₂(R)` gives the `sl`
  surfaces of `D = 12` the non-integral `e = 16 + 1/3` (convention 12).

### 4.4 Hirzebruch's formula for the Chern numbers

For every congruence subgroup `Γ ≤ GL₂⁺(F)` (van der Geer, Chapter IV, Theorem 2.5; Assaf et
al., Theorem 6.2.3):

```text
c₁²(X(Γ)) = K² = 2 vol(Γ\ℍ²) + Σ_{σ cusp} Σ_{k=1}^{r_σ} (2 − b_{σ,k}) + Σ a(Γ; q, 1, r) c(q; 1, r),
c₂(X(Γ)) = e   =   vol(Γ\ℍ²) + ℓ_cusp + Σ a(Γ; q, 1, r) (ℓ(q; 1, r) + (q − 1)/q),
```

the sums over the types of 3.11, `ℓ_cusp` and the cusp sum from 2.6. Proof route: the
proportionality `c₁²(Y_c) = 2c₂(Y_c) = 2 vol` for a smooth compact quotient, extended to the
open surface by the Gauss–Bonnet reading of 4.3 (`e(Y(Γ)) = vol + Σ_z (1 − 1/q_z)`), then the
effect of adding `#cusps` points and replacing each by a cycle of `r_σ` rational curves
(`+r_σ − 1 + 1` to `e`, `Σ(2 − b)` to `K²` by adjunction on the cycle of genus one) and each
elliptic point by its string (`+ℓ` to `e`, `+Z²` to `K²` by `K_X = π^*K + Z`). *Rests on:*
2.4–2.6, 3.9–3.11, 4.3; SchemeAndStackFoundations §§5.9–5.10 (intersection numbers, adjunction).

The two right-hand sides, as functions `K2 v₁ v₂ P` and `eulerNumber v₁ v₂ P` of a prefix, are
the definitions of 4.9; like their inputs they are specified in this README only.

**Checks.**

- (computation) — `D = 5`: `e = 14`, `K² = −2`; `D = 8`: `e = 15`, `K² = −3`; `D = 13`:
  `e = 15`, `K² = −3`; `D = 17`: `e = 16`, `K² = −4` (level one, trivial component).
- (two components) — over `ℚ(√3)` at level one, the two `sl` components have different cusp
  cycles and types, and both have `e = 16`, `K² = −4`; the `gl` components have `e = 15`,
  `K² = −3`.
- (rejection) — for `D = 5`, replacing `(3;1,1), (3;1,2)` by `(3;1,1)` twice gives
  `K² = −7/3`, which 4.5 rejects.

### 4.5 Integrality and the local tables

`K²` and `e` are integers although every summand of 4.4 is rational: this is a theorem about
each surface, and it is the first acceptance test of any computed record. In particular the
denominators `q` in `(q − 1)/q` and in `c(q; 1, r)` cancel against the denominator `60` of
`ζ_F(−1)` and the multiplicities `a(Γ; q, 1, r)`; a wrong assignment of rotation types is
detected by a non-integral `K²` or `χ` (see the `D = 12` example). *Rests on:* 4.4.

### 4.6 The irregularity vanishes

`h^{1,0}(X(Γ)) = h^{0,1}(X(Γ)) = 0` and `b₁(X(Γ)) = b₃(X(Γ)) = 0`: a holomorphic `1`-form on
`X(Γ)` restricts to a `Γ`-invariant holomorphic `1`-form `f₁ dz₁ + f₂ dz₂` on `ℍ²` with `f₁`,
`f₂` Hilbert modular forms of weights `(2, 0)` and `(0, 2)`, and every Hilbert modular form of a
weight with a zero entry is constant and then zero (Koecher's principle, HilbertModularForms
2.2, plus the vanishing of every constant term in non-parallel weight, HilbertModularForms 2.5);
Hodge symmetry gives `h^{0,1} = h^{1,0}` and `b₁ = 2h^{1,0}`, `X(Γ)` being Kähler as a complex
submanifold of projective space (4.1). (Van der Geer, Chapter IV, §6; Assaf et al., §6.3.)
*Rests on:* 4.1; HilbertModularForms 2.2, 2.5; ComplexKahlerGeometry K6.1, with K7.2 and K6.0
for the Kähler metric.

### 4.7 Noether's formula and the Hodge diamond

`χ = (K² + e)/12 ∈ ℤ`; `h^{0,0} = h^{2,2} = 1`, `h^{1,0} = h^{0,1} = h^{2,1} = h^{1,2} = 0`,
`h^{2,0} = h^{0,2} = p_g = χ − 1`, `h^{1,1} = e − 2χ`, `b₂ = e − 2`, `p_a = χ − 1`; the signature
`σ(X) = (K² − 2e)/3 = 2 + 2p_g − h^{1,1}`. These are the LMFDB columns `chi`, `h20`, `h11`,
`euler_nb`, `K2` and the Hodge diamond the page draws. *Rests on:* 4.4–4.6;
SchemeAndStackFoundations §5.10 (Noether's formula); ComplexKahlerGeometry K6.1 (with K7.2, K6.0
as in 4.6).

As targets of a prefix, `chi := (K2 + eulerNumber)/12`, `h20 := chi − 1`,
`h11 := eulerNumber − 2 chi` and `arithmeticGenus := chi − 1`, all in `ℚ`; they are specified in
this README only, since `K2` and `eulerNumber` are (4.9).

**Checks.**

- (computation) — `2.2.5.1-1.1-1.1-gl-0`: `χ = 1`, `h20 = 0`, `h11 = 12`, `p_a = 0`.
- (computation) — `D = 29`: `χ = 2`, `h11 = 24`, `p_g = 1`; `D = 89`: `χ = 4`, `h11 = 44`,
  `p_g = 3`.
- (two components) — for `D = 21`, the `sl` components `1` and `[𝔡⁻¹]` have `χ = 1` and `χ = 2`:
  one surface `X₀¹(1)`, two values.
- (convention) — `chi` is `χ(𝒪_X)`, not `p_a`: for `D = 5` they are `1` and `0`
  (convention 10).

### 4.8 The cusp-form comparison

`Σ_{[𝔟] ∈ Cl⁺(R)} χ(X₀(𝔑)_𝔟) = dim S₂(Γ₀(𝔑)) + h⁺` (Assaf et al., (6.3.1)): `H⁰(X, K_X)` is the
space of cusp forms of parallel weight `2` on `Γ` (Freitag's identification of `p_g` with
`dim S_{(2,2)}(Γ)`, through 4.6 and the vanishing of a holomorphic `2`-form's form at the
cusps), summed over components, and `Σ_𝔟 1 = h⁺`. The same holds with `S₂(Γ₀¹(𝔑))` and the `sl`
surfaces. This is the second acceptance test of a computed record. For `𝔑 = R` the sum is `h⁺`
(so `S₂(Γ₀(1)) = 0`) for `D ∈ {5, 8, 12, 13, 17, 21}`, and the `sl` sum is `h⁺` for
`D ∈ {5, 8, 12, 13, 17}`. The rationality of `X₀¹(1)_{(1)}` (6.4) says nothing about the other
components: for `D = 24, 28, 33` the component `[𝔡⁻¹]` has `χ = 2` for both ambient types, so
`dim S₂(Γ₀(1)) = dim S₂(Γ₀¹(1)) = 1`; for `D = 21` the `sl` sum is `h⁺ + 1`; for `D = 60`
(`h⁺ = 4`) the sums are `8` (`gl`) and `12` (`sl`) (worked examples).
*Rests on:* 4.7; HilbertModularForms 2.6, 3.5 (`S_k(Γ)` and its finite dimension).

### 4.9 The two Chern numbers as invariants of the record

`HMSPrefix.K2 v₁ v₂ P`, `eulerNumber`, `chi`, `h11`, `h20`, `arithmeticGenus`,
`lenRes = lenCuspRes + lenEllRes`, all as functions of the intrinsic prefix `P` and the ordered
embeddings through `cuspData` (1.4–1.5, 2.3, 2.6), `ellipticTypes` and `ellipticCount` (3.11),
`volume` (4.3) and the formulas of 4.4–4.7, which are the *definitions* of `K2` and
`eulerNumber`: `K2 = 2 volume + cuspSum + Σ_t ellipticCount t · c(t)` and
`eulerNumber = volume + lenCuspRes + Σ_t ellipticCount t · (ℓ(t) + (q − 1)/q)`, the sums over
`ellipticTypes`, with `c` and `ℓ` the file's `RotationType.localChernSelfIntersection` and
`RotationType.resolutionLength`. They are specified in this README only, since their inputs
need the congruence subgroups and the quotient `Γ\ℍ²` of the sibling roadmaps (0.3–0.4). The
theorem that they are the geometric invariants of `X(Γ)` is 4.4 together with 4.7.
*Rests on:* 4.4–4.8.

**Checks.**

- (computation) — `2.2.5.1-1.1-1.1-gl-0`: `len_res = 1 + 9 = 10`, `e = 14`, `K² = −2`.
- (keyed by the narrow class) — for `D = 21` the two `sl` components give
  `(e, K², χ) = (18, −6, 1)` and `(25, −1, 2)`: the record is a function of `[𝔟]`, not of
  `(F, 𝔑, type)` alone.
- (ambient type) — for `D = 12` the `gl` and `sl` records differ (`e = 15`, `K² = −3` against
  `e = 16`, `K² = −4`), while for `D = 5`, where `N(ε) = −1`, they coincide (0.3).
- (integrality) — every record of gamma type `zero` in the worked examples has `K²`, `e` and `χ`
  in `ℤ` (4.5).

## Layer 5: surface-classification inputs

These three statements are general surface theory. No roadmap in this repository states them,
and Layer 6 cannot be stated without them, so they are milestones here, with their sources,
stated in the generality Layer 6 uses (smooth projective surfaces over `ℂ` with `q = 0`) and in
the shape an algebraic-surfaces roadmap would state them, so that they can be consumed from one
by alias.

### 5.1 Exceptional curves and minimal models

On a smooth projective surface `X` over `ℂ`, an **exceptional curve** is a smooth rational curve
`E` with `E² = −1`; Castelnuovo's contraction theorem: there is a smooth projective `X′` and a
birational morphism `X → X′` contracting `E` to a point and an isomorphism elsewhere, with
`K²(X′) = K²(X) + 1`, `e(X′) = e(X) − 1`, `χ(X′) = χ(X)` (Beauville, Theorem II.17; Hartshorne,
V.3). A surface is **minimal** when it has no exceptional curve; every `X` dominates a minimal
surface by finitely many contractions; for `κ(X) ≥ 0` the minimal model is unique, and
`K²_{min} = K²(X) + (number of contractions)`. The plurigenera and `κ` are birational invariants.
*Rests on:* SchemeAndStackFoundations §§5.9–5.10.

### 5.2 The Enriques–Kodaira table for `q = 0`

For a minimal smooth projective surface over `ℂ` with `q = h^{1,0} = 0`: `κ = −1` iff the surface
is rational (`ℙ²` or a Hirzebruch surface), and then `χ = 1`, `K² ∈ {8, 9}`; `κ = 0` iff it is an
Enriques surface (`χ = 1`, `K² = 0`) or a K3 surface (`χ = 2`, `K² = 0`); `κ = 1` iff it is an
honestly elliptic surface, and then `K² = 0`, `χ ≥ 1`; `κ = 2` iff it is of general type, and
then `K² ≥ 1`, `χ ≥ 1` (Beauville, Chapters V–VIII, summarised in Assaf et al., Table 1;
Castelnuovo's rationality criterion `q = P₂ = 0 ⇒ rational` is Beauville, Theorem V.1). The
derived definitions, both computable: `kodairaPossibilitiesMinimal (χ K² : ℤ) : Finset ℤ` is
`{−1, 2}` if `χ = 1`, `K² ∈ {8, 9}`; `{0, 1}` if `χ = 1`, `K² = 0`; `{0, 1}` if `χ = 2`,
`K² = 0`; `{1}` if `χ ≥ 3`, `K² = 0`; `{2}` if `χ ≥ 1`, `K² ≥ 1`, `(χ, K²) ∉ {(1,8), (1,9)}`;
`∅` otherwise (so a minimal surface with `q = 0` never has `K² < 0`); and
`kodairaDims (χ K² : ℤ) : Finset ℤ := ⋃_{K² ≤ K²′ ≤ max(K², 10)} kodairaPossibilitiesMinimal χ K²′`,
the set compatible with the **lower bound** `K² ≤ K²_{min}` (the union stabilises beyond `9`,
where only `{2}` occurs). The two theorems: `κ(X) ∈ kodairaPossibilitiesMinimal(χ(X), K²_{min}(X))`
and `κ(X) ∈ kodairaDims(χ(X), K²(X))`, the latter because `K²(X) ≤ K²_{min}(X)` (5.1). Values:
`kodairaDims(1, −2) = {−1, 0, 1, 2}`, `kodairaDims(2, −4) = {0, 1, 2}`, `kodairaDims(3, −7) = {1, 2}`,
`kodairaDims(4, −4) = {1, 2}`, `kodairaDims(1, 8) = {−1, 2}`, `kodairaPossibilitiesMinimal(2, 0) =
{0, 1}`, all by `decide`. A negative `K²(X)` with `χ = 1` therefore leaves every `κ` open, and the
rationality of the small-`D` surfaces (6.3) is a theorem about configurations, not about numbers.
*Rests on:* 5.1; SchemeAndStackFoundations §5.10 (Riemann–Roch, Hodge index).

### 5.3 Van der Geer's criteria

(i) If a smooth projective surface `X` with `q = 0` contains curves `C₁, C₂` with
`C₁² = C₂² = −1` and `C₁·C₂ > 0`, or a curve `C` with `C² ≥ 0` and `K·C < 0`, then `X` is rational
(van der Geer, Proposition VII.2.2; Assaf et al., Proposition 6.4.1). (ii) If a simply connected
non-rational `X` contains an **elliptic configuration** (van der Geer, Definition VII.2.8: a
connected configuration of curves whose intersection matrix is that of a singular fibre of an
elliptic fibration in Kodaira's list), then `X` is a blown-up K3 surface or a blown-up honestly
elliptic surface; if moreover `X` contains a `(−2)`-curve `D` not in the configuration with
`𝒞 ∪ {D}` connected, `X` is a blown-up K3 surface (van der Geer, Proposition VII.2.9; Assaf et
al., Proposition 6.4.2). *Rests on:* 5.1, 5.2.

## Layer 6: Kodaira dimension of the level-one surfaces

### 6.1 Simple connectivity

`X₀¹(1)_𝔟` is simply connected for every `F` and `𝔟` (van der Geer, Theorem IV.6.1, as quoted
by Assaf et al., Example 7.3.2), so 5.3(ii) applies to it. *Rests on:* 4.1.

### 6.2 The Hirzebruch–Zagier curves `F_N` for `N ≤ 4` at level one

For `N ∈ {1, 2, 3, 4}`, the curve `F_N ⊂ Y₀¹(1)_{(1)}` on the trivial component is the image of
the union of the curves `{(z₁, z₂) ∈ ℍ² : a√D z₁z₂ + λz₁ − λ′z₂ + b√D = 0}` over
`(a, b, λ) ∈ ℤ × ℤ × R` with `abD + λλ′ = N` (`λ′` the conjugate; the curve of the skew-hermitian
matrix `(a√D, λ; −λ′, b√D)` of determinant `N`; van der Geer, Chapter V, §1); each component is
the image of a modular or Shimura curve; `F_1` contains the image of the diagonal `z ↦ (z, z)`
(`a = b = 0`, `λ = ±1`), whose closure is the image of the compact modular curve `X(1)`. Owned
here: the definition for `N ≤ 4`, the fact that each component is an irreducible curve on
`X₀¹(1)_{(1)}` whose intersection numbers with the cusp cycles and with itself are computable from
the lattice data, and the specific configurations used in 6.3. *Rests on:* 4.1; FuchsianOrbifolds
6.1 (the compact `X(1)`) for the diagonal component.

### 6.3 The smallest discriminants are rational

`X₀¹(1)_{(1)}` is rational for `D = 5, 8, 13, 17` (and hence so is `X₀(1)_{(1)}`, the same surface).
Proof route, each a finite configuration check with 5.3(i): for `D = 13`, the component `F₃`
is a single exceptional curve meeting two `(−2)`-curves of the cusp cycle `(2, 2, 5)`; blowing it
down makes those two curves meet with self-intersection `−1`, and 5.3(i) applies (Assaf et al.,
Example 7.3.4). For `D = 5, 8, 17` the witnesses are the curves `F_N`, `N ≤ 4`, together with the
cusp and elliptic resolution curves, as in van der Geer, Chapter VII, §3 (Hirzebruch's
`ℚ(√5)` surface is the blow-up of a rational surface; Hirzebruch–van de Ven for `8, 17`). The
numerical data `χ = 1` and `K² = −2, −3, −3, −4` are computed by Layer 4 and are consistent
with rationality (`K² ≤ 9`), but do not prove it: `χ = 1` leaves `κ ∈ {−1, 2}` when `K²_{min}`
reaches `8` or `9`, so the configuration is needed. *Rests on:* 4.7, 5.3, 6.2.

### 6.4 The classification for `D ≤ 500` as a certified table

Van der Geer's theorem (Chapter VII, Theorem 3.3 and the tables of Chapter VII): for `𝔟 = R`,
`X₀¹(1)` is rational iff `D ∈ {5, 8, 12, 13, 17, 21, 24, 28, 33, 60}`; a blown-up K3 surface iff
`D ∈ {29, 37, 40, 41, 44, 56, 57, 69, 105}`; a blown-up honestly elliptic surface iff
`D ∈ {53, 61, 65, 73, 76, 77, 85, 88, 92, 93, 120, 140, 165}`; of general type otherwise. The
roadmap states it as: a **classification certificate** for `(F, 𝔟)` is a finite list of
exceptional curves to contract (each given as a component of a cusp cycle, an elliptic string, or
an `F_N`, `N ≤ 4`, with its intersection numbers) followed by a witness for 5.3(i) or 5.3(ii) or
by `(χ, K²_{min})` with a singleton `kodairaPossibilitiesMinimal`; the theorem is that a checked
certificate determines `κ`, and the table is the stored list of certificates for `D ≤ 500`, each
checked by the same finite procedure that 6.3 runs by hand. The two parts the LMFDB stores,
`kodaira_dims` and the boolean "known", are exactly: the singleton `{κ}` when a certificate
exists, `kodairaDims(χ, K²(X))` otherwise. *Rests on:* 4.7, 5.1–5.3, 6.2–6.3.

### 6.5 General type beyond the table

For `D > 500`, `X₀¹(1)_𝔟` is of general type for every `𝔟` (van der Geer, Theorem VII.5.1, as
quoted by Assaf et al., §7.4); hence 6.4 together with 6.5 is a complete classification of the
level-one `sl` surfaces on the trivial component. Hamahata's theorem for level `𝔑 ≠ (1)`: if
`Cl⁺(R) = 1` and `D` is a prime `≡ 1 mod 4` or `D = 8`, then `X₀¹(𝔑)` is of general type except for
the listed levels (Assaf et al., Theorem 6.5.1, quoting Hamahata, Theorems 3.5, 4.6, 5.15,
6.13): for `D = 5` the levels `𝔭₂, 𝔭₅, 𝔭₁₁, 𝔭₂², 𝔭₅²` are rational, `𝔭₃, 𝔭₁₉, 𝔭₂𝔭₅, 𝔭₂𝔭₁₁` are
not, `𝔭₃₁` is not a blown-up K3; for `D = 8` the levels `𝔭₂, 𝔭₂², 𝔭₂³, 𝔭₂⁴` are rational, `𝔭₃` is a
blown-up K3, `𝔭₂⁵` a blown-up honestly elliptic surface, `𝔭₂𝔭₇` not rational; for `D = 13`,
`𝔭₃, 𝔭₃²` rational, `(2)` blown-up K3, `(3)` honestly elliptic; for `D = 17`, `𝔭₂, 𝔭₂²` rational,
`(2), 𝔭₂³` blown-up K3. These are stated as theorems with the same certificate interface; the
first of them (`D = 5`, `𝔑 = 𝔭₂ = (2)`) is a worked example below. *Rests on:* 6.4.

## Layer 7: the LMFDB record

### 7.1 The intrinsic prefix

`HMSPrefix F := (𝔑 ≠ 0, [𝔟] ∈ Cl⁺(R), GammaType ∈ {zero, one, full}, AmbientType ∈ {gl, sl})`
(fields `level`, `component`, `gammaType`, `ambient`), with `F` and its ordered embeddings as
parameters;
the LMFDB label `2.2.D.1-N-b-t` is a name for it, and the choice of `b` within its narrow class
and of the ideal labels are not targets. Two prefixes give isomorphic complex
surfaces when they differ by `[𝔟] ↦ [α𝔟]`, `α ≫ 0` (0.3), and the `gl` and `sl` surfaces coincide
when `h⁺ = h` (0.3). *Rests on:* 0.2, 0.3.

### 7.2 The record

```text
field_discr = D, level_norm = N(𝔑), narrow_class_nb = h⁺, is_pp = ([𝔟] = [𝔡⁻¹]),
nb_cusps (1.4), cusps: (𝔐, (a : c), (−b_1,…,−b_d), k) per cusp (1.2, 1.5, 2.3),
len_cusp_res (2.6), elliptic points: ((q; a, b), a(Γ; q, a, b)) (3.11), nb_ell, nb_ell_q,
len_ell_res (3.11), len_res, euler_nb = e, K2 = K², chi = χ, h20 = χ − 1, h11 = e − 2χ,
arithmetic genus p_a = χ − 1 (4.7), kodaira_dims = {κ} with a certificate and
kodairaDims(χ, K²(X)) without one (5.2, 6.4).
```

Each field is a function of the prefix; the theorems are the identifications of Layers 1–6. The
elliptic-point, resolution, Chern-number, Hodge and Kodaira fields are defined for the gamma type
`zero` (the LMFDB's `gl-0` and `sl-0`, the only types its tables hold), where Layers 3–4 compute
them; for the types `one` and `full` the record carries the prefix and the cusp data of 1.3–1.5
only (Explicit scope exclusions). The
page's Hodge diamond is `(1; 0, 0; h20, h11, h20; 0, 0; 1)` by 4.7. *Rests on:* everything above.

### 7.3 Page coverage

| LMFDB column or knowl | milestone |
| --- | --- |
| `field_discr`, `narrow_class_nb`, `nf.narrow_class_number` | 0.1, 0.2 |
| `component_label` (as a narrow class), `is_pp`, `hmsurface.component_ideal` | 0.2, 7.1 |
| `group_type`, `gamma_type`, `hmsurface.congruence_subgroup`, `hmsurface.standard_hmsurfaces`, `hmsurface.x0`, `hmsurface.x01` | 0.3 (groups consumed from HilbertModularForms 1.2) |
| `level_label` (as an ideal), `level_norm`, `hmsurface.level`, `hmsurface.levelnorm` | 0.3 |
| `nb_cusps`, `hmsurface.cusps`, cusp table (`M_label` as `𝔐`, coordinates, `self_intersections_minimal`, `repetition`), `hmsurface.cusp_resolution`, `len_cusp_res` | 1.2, 1.4, 1.5, 2.3, 2.6 |
| `nb_ell`, `nb_ell2`–`nb_ell6`, `hmsurface.elliptic_point`, `rotation_type`, `len_ell_res`, `hmsurface.elliptic_point_resolution` | 3.3, 3.4–3.8, 3.9, 3.11 |
| `len_res`, `hmsurface.resolution` | 4.9 |
| `euler_nb`, `hmsurface.euler_number` | 4.4, 4.7 |
| `K2`, `hmsurface.k2` | 4.4 |
| `chi`, `ag.holomorphic_euler_char`, `hmsurface.arithmetic_genus`, `ag.arithmetic_genus` | 4.7 |
| `h20`, `h11`, `hmsurface.hodge_numbers`, the Hodge diamond | 4.6, 4.7 |
| `kodaira_dims`, `ag.kodaira_dimension`, `hmsurface.kodaira_dimension`, "known to be" | 5.2, 6.4, 6.5 |
| `hmsurface.label`, `hmsurface.search_input`, sort orders | not a target (database convention) |
| `hmsurface.polarization_module`, moduli interpretation of `x0`/`x01` | HilbertModularVarietiesAndShimuraCurves H1 |

## Explicit scope exclusions

- Hilbert modular varieties of degree `n > 2`, their cusp singularities and Ehlers' resolutions.
- Hirzebruch–Zagier divisors `F_N` for `N > 4` or at level `𝔑 ≠ (1)`, their modularity, and the
  Hirzebruch–Zagier theorem on their intersection numbers.
- Humbert surfaces and the map to the Siegel threefold (the sibling `SiegelModularForms` and the
  toroidal roadmap's Siegel layers).
- Hilbert modular forms as functions, their rings, dimension formulas beyond the single use of
  `dim S₂(Γ₀(𝔑))` in 4.8, and the Hilbert series of Assaf et al., §5.1.
- Canonical models, fields of definition of the components, integral models, bad reduction.
- The quotients of `X(Γ)` by Atkin–Lehner involutions and by the Galois involution, the symmetric
  Hilbert modular surfaces: the groups are extensions of `Γ` by finite groups; they are not in
  the LMFDB's `hmsurface` tables and are not specified here.
- `Γ₁(𝔑)_𝔟` for non-squarefree `𝔑` (its cusp stabilizers are not of the form `G(M, V)`; 1.5 lists
  the squarefree case only) and `Γ(𝔑)_𝔟`: the cusp-type theorem covers them only as far as 1.5
  says. The elliptic points, Chern numbers and Kodaira dimension of `X(Γ₁(𝔑)_𝔟)`,
  `X(Γ(𝔑)_𝔟)` and their `SL` versions (Layer 3 counts points for `Γ₀` and `Γ₀¹` only).
- The `ℓ`-adic Euler characteristic and étale Gauss–Bonnet (SchemeAndStackFoundations §5.10
  names this as a downstream comparison); here `e` is the topological Euler number.

## Worked examples (acceptance criteria)

All level-one numbers below were computed from 3.4 (orders in `F(i)`, `F(√−3)`, `F(ζ_5)`,
`F(√−ε⁺)` with their class numbers and unit indices), 2.2–2.3 (periods with the convention
`v₁(x/y)`), 4.2 and 4.4, and checked by 4.5 (integrality) and against 3.6 and 6.4. Labels are
the LMFDB's `2.2.D.1-1.1-b-gl-0` / `-sl-0` with `b = 1.1` the trivial narrow class.

### `2.2.5.1-1.1-1.1-gl-0`, `F = ℚ(√5)`, level `(1)`

`h = h⁺ = 1`, `ε = (1+√5)/2`, `N(ε) = −1`, so the `gl` and `sl` surfaces coincide (0.3).
`ζ_F(−1) = 1/30` (4.2: `b = ±1`, `σ₁(1) = 1`, twice). One cusp (1.4); `M = R`, oriented basis
`(ω, 1)`, `v₁(ω) = (1+√5)/2`; period of `ω/1`: `[[2]]` is not reduced, its tail is
`[[3]]`, `d = 1`, `k = 1`; cycle `(−3)`: one nodal rational curve `S₀` with `S₀² = −1`,
`ℓ_cusp = 1`, cusp sum `2 − 3 = −1` (2.3, 2.6). Elliptic points (3.4, 3.8, case of equal
splitting since `h⁺ = 1`): two of type `(2;1,1)` (`S = R[i] = Z_{F(i)}`, `h(S) = 1`,
`m = 4`); one `(3;1,1)` and one `(3;1,2)` (`S = R[ζ_6]`, `h = 1`, `m = 4`); one `(5;1,2)` and one
`(5;1,3)` (`S = ℤ[ζ_5]`, `h = 1`, `m = 4`); `nb_ell = 6`, `len_ell_res = 1+1+1+2+2+2 = 9`,
`len_res = 10`. `e = 1/15 + 1 + 2·(1 + ½) + (1 + ⅔) + (2 + ⅔) + 2·(2 + ⅘) = 14`;
`K² = 1/15·2 + (−1) + 0 − ⅓ + 0 − ⅖ − ⅖ = −2`; `χ = (−2 + 14)/12 = 1`; `h^{2,0} = 0`,
`h^{1,1} = 12`, `p_a = 0`; `kodairaDims(1, −2) = {−1, 0, 1, 2}` without a certificate and
`{−1}` with the rationality certificate of 6.3, so `κ = −1` (6.4); 4.8:
`χ = dim S₂(Γ₀(1)) + 1 = 0 + 1`.

### `2.2.8.1-1.1-1.1-gl-0`, `F = ℚ(√2)`

`h⁺ = 1`, `ε = 1 + √2`, `N(ε) = −1`; `ζ_F(−1) = 1/12`. One cusp, period `[[2, 4]]`, cycle
`(−2, −4)` (two rational curves meeting in two points), `ℓ_cusp = 2`, cusp sum `−2`. Elliptic
points: two `(2;1,1)` from `S = R[i] = R + √2 ℤ[ζ_8]` (conductor `(√2)`, `h(S) = 1`); one
`(3;1,1)` and one `(3;1,2)` from `Z_{F(√−3)}`; one `(4;1,1)` and one `(4;1,3)` from `ℤ[ζ_8]`
(`μ = μ_8`, stabilizer of order `4`); `nb_ell = 6`, `len_ell_res = 1+1+1+2+1+3 = 9`.
`e = 1/6 + 2 + 3 + 5/3 + 8/3 + 7/4 + 15/4 = 15`, `K² = 1/3 − 2 − 1/3 − 1 = −3`, `χ = 1`,
`h^{1,1} = 13`, rational.

### `2.2.13.1-1.1-1.1-gl-0`, `F = ℚ(√13)`

`h⁺ = 1`, `ζ_F(−1) = 1/6`; one cusp, period `[[2, 2, 5]]`, cycle `(−2, −2, −5)`; elliptic points:
`(2;1,1)²` (`h(−52) = 2`), `(3;1,1)²`, `(3;1,2)²` (`h(F(√−3)) = 2` so `h(−39) = 4` points of
order `3`); `e = 1/3 + 3 + 3 + 10/3 + 16/3 = 15`, `K² = 2/3 − 3 − 2/3 = −3`, `χ = 1`,
`h^{1,1} = 13`. Rational by 6.3: `F₃` is one `(−1)`-curve meeting the two `(−2)`-curves of the
cusp cycle once each; after contracting it they become `(−1)`-curves `C₁, C₂` with
`C₁·C₂ = 1 + 1 = 2` (they already meet once in the cycle).

### `2.2.17.1-1.1-1.1-gl-0`, `F = ℚ(√17)`

`h⁺ = 1`, `ζ_F(−1) = 1/3`; period `[[3, 2, 2, 3, 5]]`; `(2;1,1)⁴` (`h(−68) = 4`), `(3;1,1)`,
`(3;1,2)`; `e = 16`, `K² = −4`, `χ = 1`, `h^{1,1} = 14`, rational.

### Level one, `h⁺ = 1`, `29 ≤ D ≤ 97`

| `D` | `ζ_F(−1)` | period | `(2;1,1)` | `(3;1,1)`, `(3;1,2)` | `e` | `K²` | `χ` | `h^{1,1}` | `p_g` | type (6.4) |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 29 | 1/2 | `(2,2,2,2,7)` | 6 | 3, 3 | 28 | −4 | 2 | 24 | 1 | blown-up K3 |
| 37 | 5/6 | `(3,2,2,2,2,3,7)` | 2 | 4, 4 | 29 | −5 | 2 | 25 | 1 | blown-up K3 |
| 41 | 4/3 | `(4,2,3,2,2,2,2,3,2,4,7)` | 8 | 1, 1 | 30 | −6 | 2 | 26 | 1 | blown-up K3 |
| 53 | 7/6 | `(2,2,2,2,2,2,9)` | 6 | 5, 5 | 40 | −4 | 3 | 34 | 2 | blown-up elliptic |
| 61 | 11/6 | `(2,4,2,2,2,2,2,2,4,2,9)` | 6 | 4, 4 | 41 | −5 | 3 | 35 | 2 | blown-up elliptic |
| 73 | 11/3 | length 21 | 4 | 2, 2 | 43 | −7 | 3 | 37 | 2 | blown-up elliptic |
| 89 | 13/3 | length 21 | 12 | 1, 1 | 52 | −4 | 4 | 44 | 3 | general type |
| 97 | 17/3 | length 27 | 4 | 2, 2 | 53 | −5 | 4 | 45 | 3 | general type |

The `χ` column is `1` exactly for the rational entries of 6.4 among `h⁺ = 1` fields
(`5, 8, 13, 17`), `2` exactly for the K3 entries (`29, 37, 41`), `3` for the elliptic ones
(`53, 61, 73`) and `≥ 4` for general type: this agreement between Layer 4 and van der Geer's
table is an acceptance test for both. `kodairaDims(2, K²) = {0, 1, 2}` for `K² < 0`, so for
`D = 29, 37, 41` the record's `kodaira_dims` is `{0, 1, 2}` without a certificate and `{0}`
with one; for `D = 53, 61, 73` it is `kodairaDims(3, K²) = {1, 2}` without and `{1}` with.

### `F = ℚ(√3)`, `D = 12`, level `(1)`, both components, `sl`

`h = 1`, `h⁺ = 2`, `ε = 2 + √3` totally positive, `k = [R^×_{>0} : R^{×2}] = 2` for `sl`,
`ζ_F(−1) = 1/6`, `vol = 1/3`. The two components have the cusp cycles `(−4, −4)` (`M = R`,
oriented basis `(√3, 1)`, `v₁(√3) = [[2, 4, 4, …]]`, period `(4)`, `k = 2`) and `(−2, −3, −2, −3)`
(`M = 𝔟⁻¹` with `𝔟` in the nontrivial narrow class, period `(2, 3)`, `k = 2`), dual to each other
(2.7). Elliptic points per component (3.4, same on both): `a₂ = 3` (one from the order of
conductor `(1 + √3)` in `ℚ(ζ_{12})`, two from the order of conductor `(2)`), `a₃ = 2` (the
order `R[ζ_6]` of conductor `(√3)`), `a₆ = 1` (`ℤ[ζ_{12}]` itself). The types are forced by
4.5: with cusp `(−4, −4)` the only integral assignment is `(3;1,1)²`, `(6;1,5)`, giving
`K² = 2/3 − 4 − 2/3 + 0 = −4`, `e = 1/3 + 2 + 9/2 + 10/3 + 35/6 = 16`, `χ = 1`; with cusp
`(−2, −3, −2, −3)` it is `(3;1,2)²`, `(6;1,1)`, giving `K² = 2/3 − 2 + 0 − 8/3 = −4`,
`e = 1/3 + 4 + 9/2 + 16/3 + 11/6 = 16`, `χ = 1`; every other assignment makes `K²` or `χ`
non-integral. The first assignment is the one with the reference types of 3.7 on the component
`M = R`, as 3.8 predicts for `𝔣 = (1)`. Both components are rational (6.4). The `gl`
surfaces of `ℚ(√3)` differ from the `sl` ones: `vol = 1/6` (convention 12), `k = 1`, so the
cusp cycles are `(−4)` (one nodal curve, `S₀² = −2`, `ℓ_cusp = 1`, cusp sum `−2`) and `(−2, −3)`
(`ℓ_cusp = 2`, cusp sum `−1`); and by 3.4 with `m_q⁺ = (2/h⁺) Σ h(S) = Σ h(S)` each component
carries one point of order `12` (`S = ℤ[ζ_{12}]`, `S^×/R^× ≅ ℤ/12`), one of order `4` (the order
of conductor `(1 + √3)` in `F(i)`, with `Q(S) = 2`), one of order `3` (conductor `(√3)`) and
three of order `2` (one from the order of conductor `(2)` in `F(i)`, two from `Z_{F(√−ε)}` with
`h = 2`). Integrality (4.5) again forces the types: on the component with cusp `(−4)` they are
`(12;1,5)`, `(4;1,3)`, `(3;1,1)`, giving `e = 1/6 + 1 + (3 + 11/12) + 3·(3/2) + (3 + 3/4) +
(1 + 2/3) = 15`, `K² = 1/3 − 2 − 1 + 0 + 0 − 1/3 = −3`, `χ = 1`; on the component with cusp
`(−2, −3)` they are `(12;1,7)`, `(4;1,1)`, `(3;1,2)`, giving `e = 1/6 + 2 + (3 + 11/12) + 9/2 +
(1 + 3/4) + (2 + 2/3) = 15`, `K² = 1/3 − 1 − 4/3 − 1 + 0 = −3`, `χ = 1`; every other assignment,
and the normalisation `vol = 1/3`, makes `χ` non-integral. Both `gl` components have
`h^{1,1} = 13`, and 4.8 reads `1 + 1 = dim S₂(Γ₀(1)) + h⁺ = 0 + 2`.

### Level one, `h = 1`, `h⁺ = 2`: `D = 21, 24, 28, 33`

`N(ε) = 1`, so the components are `[𝔟] = 1` and `[𝔟] = [𝔡⁻¹] = [(√D)]` (the principally
polarizable one), with dual cusp cycles (2.7); `k = 2` for `sl` and `1` for `gl`. The types on the
two components are exchanged (3.8), and the counts per order agree (3.4, 3.6).

| `D` | amb. | `[𝔟]` | period | elliptic points | `e` | `K²` | `χ` |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 21 | `sl` | `1` | `(5)` | `(2;1,1)⁴ (3;1,1)⁴ (3;1,2)` | 18 | −6 | 1 |
| 21 | `sl` | `[𝔡⁻¹]` | `(3,2,2)` | `(2;1,1)⁴ (3;1,1) (3;1,2)⁴` | 25 | −1 | 2 |
| 21 | `gl` | `1` | `(5)` | `(2;1,1)³ (3;1,1)² (6;1,5)` | 15 | −3 | 1 |
| 21 | `gl` | `[𝔡⁻¹]` | `(3,2,2)` | `(2;1,1)³ (3;1,2)² (6;1,1)` | 15 | −3 | 1 |
| 24 | `sl` | `1` | `(2,6)` | `(2;1,1)⁶ (3;1,1)³` | 19 | −7 | 1 |
| 24 | `sl` | `[𝔡⁻¹]` | `(2,4,2,2)` | `(2;1,1)⁶ (3;1,2)³` | 26 | −2 | 2 |
| 24 | `gl` | `1` | `(2,6)` | `(2;1,1)⁵ (3;1,1) (4;1,1) (4;1,3) (6;1,1)` | 19 | −7 | 1 |
| 24 | `gl` | `[𝔡⁻¹]` | `(2,4,2,2)` | `(2;1,1)⁵ (3;1,2) (4;1,1) (4;1,3) (6;1,5)` | 26 | −2 | 2 |
| 28 | `sl` | `1` | `(3,6)` | `(2;1,1)⁴ (3;1,1)² (3;1,2)²` | 20 | −8 | 1 |
| 28 | `sl` | `[𝔡⁻¹]` | `(3,3,2,2,2)` | `(2;1,1)⁴ (3;1,1)² (3;1,2)²` | 26 | −2 | 2 |
| 28 | `gl` | `1` | `(3,6)` | `(2;1,1)⁵ (3;1,1) (3;1,2) (4;1,1)²` | 18 | −6 | 1 |
| 28 | `gl` | `[𝔡⁻¹]` | `(3,3,2,2,2)` | `(2;1,1)⁵ (3;1,1) (3;1,2) (4;1,3)²` | 25 | −1 | 2 |
| 33 | `sl` | `1` | `(2,3,2,7)` | `(2;1,1)⁴ (3;1,1)³` | 21 | −9 | 1 |
| 33 | `sl` | `[𝔡⁻¹]` | `(2,4,4,2,2,2)` | `(2;1,1)⁴ (3;1,2)³` | 28 | −4 | 2 |
| 33 | `gl` | `1` | `(2,3,2,7)` | `(2;1,1)⁷ (3;1,1) (6;1,1)` | 19 | −7 | 1 |
| 33 | `gl` | `[𝔡⁻¹]` | `(2,4,4,2,2,2)` | `(2;1,1)⁷ (3;1,2) (6;1,5)` | 26 | −2 | 2 |

`ζ_F(−1) = 1/3, 1/2, 2/3, 1` (4.2), so `vol = 2/3, 1, 4/3, 2` (`sl`) and half that (`gl`). The
`sl` row for `D = 28` has `a₂ = 4` (3.6). The trivial components are the rational surfaces of 6.4;
the `[𝔡⁻¹]` components with `χ = 2` give `dim S₂(Γ₀(1)) = 1` for `D = 24, 28, 33` (4.8). For
`D = 60` (`h = 2`, `h⁺ = 4`) the four `sl` components have `χ = 1, 3, 5, 3` and the `gl` ones
`χ = 1, 2, 3, 2`, the trivial component being the rational one.

### `F = ℚ(√5)`, `Γ₀(𝔭₂)`, `𝔭₂ = (2)`, norm `4`

`[Γ¹(1) : Γ₀(𝔭₂)] = 5`, `vol = 1/3`. Cusps (1.4): `h⁺h(φ_{>0}(R) + φ_{>0}(R)) = 2`, with
`𝔐 ∈ {R, 𝔭₂}`. By the table of 1.5 the cusp `(0 : 1)` with `𝔐 = R` has `M = 𝔑 = 2R` and
`V = {v ≫ 0 : v ≡ 1 mod 𝔐 + 𝔑/𝔐 = R} = R^×_{>0}`, and the cusp `(1 : 0)` with `𝔐 = 𝔭₂` has
`M = R`, `V = R^×_{>0}`; both lattices have period `(3)` and `k = 1`, so both cycles are `(−3)`
(the congruence condition on `V` is vacuous whenever `𝔐 + 𝔑/𝔐 = R`, in particular for every
cusp of a squarefree level; it bites first at `𝔑 = 𝔭²`, `𝔐 = 𝔭`). `ℓ_cusp = 2`, cusp sum `−2`.
Elliptic
points (3.5): `𝔭₂` is ramified in `F(i)`, so `m_𝔭 = 1` and the two `(2;1,1)` points survive; `𝔭₂`
splits in `F(√−3)` (`𝔽₄` contains the cube roots of unity), so `m_𝔭 = 2` and there are four
points of order `3`, two of each type (3.8, `F(√−3)/F` ramified at `√−3`); `𝔭₂` is inert in
`ℚ(ζ_5)`, so no point of order `5`. `e = 1/3 + 2 + 3 + 2·5/3 + 2·8/3 = 14`,
`K² = 2/3 − 2 − 2/3 = −2`, `χ = 1`, `h^{1,1} = 12`; rational by 6.5 (Hamahata), and 4.8 gives
`dim S₂(Γ₀(𝔭₂)) = 0`.

### `F = ℚ(√85)` and `F = ℚ(√165)`, level `(1)` (from Assaf et al., Examples 7.3.1 and 7.3.3)

`D = 85`: `h = h⁺ = 2`; `X₀(1)_{(1)}` has `χ = 4`, `K²(X) = −8`, and after contracting `8`
exceptional curves (components of `F₁` and `F₄`) the surface has `K² = 0` and is minimal, so
`κ = 1`; the other component has `χ = 4`, `K²(X) = 0`, and after contracting the two components of
`F₃` it has `K² = 2`, so `K²_{min} ≥ 2 > 0` and `κ = 2`: the two components of one surface
`X₀(1)` lie in different Kodaira classes. `D = 165`: `Cl ≅ C₂`, `Cl⁺ ≅ C₂ × C₂`; `X₀¹(1)_{(1)}`
has `χ = 4` and `K² = −20 + 20 = 0` after contracting `20` exceptional curves, `κ = 1`, while
`X₀(1)_{(1)}` has `χ = 3` and `K² = −10 + 20 = 10` after the same number of contractions, so
`κ = 2`. These are the values the certificate interface of 6.4 records. The values of `χ` and
`K²(X)` are Layer 4's (`D = 85`: cusp cycles `(2⁸, 11)` twice on the trivial component and
`(2, 3, 2, 4, 4)` twice on the other, `(2;1,1)⁴ (3;1,1)⁶ (3;1,2)⁶` on both); the
exceptional curves are those Assaf et al. exhibit and are not recomputed here.

### Boundary and off-hypothesis checks

- `hjExpansion n r = []` for `r = 0` or `r ≥ n`, and `hjExpansion 4 2 = hjExpansion 2 1`: a
  non-coprime pair is excluded at `RotationType` (the field `coprime`), not by the expansion.
  `(3; 1, 2)` and `(3; 2, 1)` are the same singularity with the factors swapped, normalised to
  `(3; 1, 2)` since `2⁻¹ = 2 mod 3`; the file states the swap relation as `RotationType.IsSwap`:
  `(5;1,2)` and `(5;1,3)` are swaps of each other and are **distinct** types, while `(12;1,5)`
  and `(12;1,7)` are each their own swap.
- `(2; 1, 1)` is the only type of order `2`; an alleged type `(4; 1, 2)` is rejected by
  `gcd(2, 4) ≠ 1` (not an isolated fixed point).
- A basis `(x, y)` of `M` with `v₁(x)v₂(y) − v₂(x)v₁(y) < 0` is not oriented (convention 5), and
  `CuspDatum.period_eq_hjPeriod` requires `IsOriented`: for `M = ℤ + ℤ√3` the oriented basis
  `(√3, 1)` gives the period `(4)`, while the basis `(1, √3)` would give `(2, 3)`, the dual cycle,
  not a rotation of the same cycle.
- Over `ℚ(√5)`, no elliptic point of order `4` or `6` exists (3.3); over `ℚ(√2)` none of order `5`
  or `6`; `nb_ell12 = 0` for every `sl` surface and for every `gl` surface with `D ≠ 12`.
- For `D = 5` the sum `1/15 + 1 + 3 + 5/3 + 8/3 + 28/5` is `14`. Replacing `(3;1,1), (3;1,2)` by
  `(3;1,1)²` gives `K² = 2/15 − 1 − 2/3 − 4/5 = −7/3`: 4.5 rejects it. Replacing `(5;1,2), (5;1,3)`
  by `(5;1,1), (5;1,4)` gives `e = 15`, `K² = −3`, `χ = 1`, all integers: 4.5 does **not** reject
  it, and 3.7 does (`ζ_{v₂}` is the image of `ζ_{v₁}` under `√5 ↦ −√5`, which sends `ζ_5` to
  `ζ_5^{±2}`, never to `ζ_5^{±1}`). Integrality is necessary, not sufficient.
- `kodairaPossibilitiesMinimal(1, 8) = {−1, 2}`, `kodairaPossibilitiesMinimal(2, 0) = {0, 1}`
  and `kodairaPossibilitiesMinimal(1, −2) = ∅` (no minimal surface with `q = 0` has `K² < 0`):
  the record's `kodaira_dims` is a set, and the page's "known to be" requires a certificate
  (6.4).
- `is_pp` is a property of the narrow class: `𝔡 = (√D)` and `√D` has mixed sign, so `[𝔡⁻¹]` is
  the nontrivial element of `ker(Cl⁺(R) → Cl(R))` when `N(ε) = 1` (for `ℚ(√3)` it is the
  component with cusp cycle `(−2, −3, −2, −3)`, not the trivial one) and is trivial when
  `N(ε) = −1`; for `h⁺ = 1` (for instance `ℚ(√5)`) every component has `is_pp = true`.
- The `gl` and `sl` surfaces of a prefix coincide iff `N(ε) = −1` (0.3); for `D = 12` they do not,
  and the `gl` surface has an elliptic point of order `12` that the `sl` surface lacks.

## Ordering

- **Layer 0** first; it is short and every later layer uses it.
- **Layers 1 and 3** are independent of each other given Layer 0 (cusps versus elliptic points).
- **Layer 2** needs Layer 1 for 2.3–2.6 and 1.5; its continued-fraction core 2.1–2.2 needs only
  Mathlib and can be done first of all. 3.9 needs 2.1 only.
- **Layer 4** needs Layers 1–3 for 4.4; 4.2 (Siegel's formula) is independent of everything but
  Mathlib and ImaginaryQuadraticClassNumber H2.2 and can proceed in parallel with Layers 1–3.
- **Layer 5** is independent of Layers 0–4 (general surface theory) and can proceed in parallel
  with all of them.
- **Layer 6** needs Layers 4 and 5 and, for 6.2–6.3, Layer 2 (the cusp curves it intersects).
- **Layer 7** assembles Layers 0–6; every field of 7.2 except the two Kodaira fields rests on
  4.9 alone, and the Kodaira fields rest on Layer 6.

Dependency graph: `0 → {1, 3}`, `1 → 2`, `{2, 3} → 4`, `5 ∥ {0,…,4}`, `{4, 5} → 6 → 7`, with
`2.1–2.2`, `4.2` and `5` as the three starting points that need no other layer.

## References

- E. Assaf, A. Babei, B. Breen, E. Costa, J. Duque-Rosero, A. Horawa, J. Kieffer, A. Kulkarni,
  G. Molnar, S. Schiavone, J. Voight, *A database of basic numerical invariants of Hilbert
  modular surfaces*, Contemp. Math. 796 (2024), 243–259; arXiv:2301.10302. Cited by section and
  numbered statement: (2.1.4)–(2.1.8), §2.2, Lemma 3.1.2, Lemma 3.1.8, Corollary 3.1.18,
  Corollary 3.1.23, §3.3 ((3.3.1)–(3.3.4)), Lemma 3.3.5, Proposition 3.3.8, §4.1 and Lemma 4.1.1,
  (4.1.4)–(4.1.6), §4.2 ((4.2.2), Proposition 4.2.3), §4.3 ((4.3.1)–(4.3.3), Theorem 4.3.11,
  Corollary 4.3.13, Lemma 4.3.14, Corollary 4.3.15), §4.4 ((4.4.1)), §6 (Theorem 6.2.3, (6.3.1),
  Table 1, Propositions 6.4.1–6.4.2, Theorem 6.5.1, Examples 7.3.1–7.3.4, §7.4).
- G. van der Geer, *Hilbert Modular Surfaces*, Ergebnisse der Mathematik (3) 16, Springer, 1988.
  Chapter I (the Hilbert modular group; Proposition I.1.1; §5 elliptic points), Chapter II
  (resolution of cusp singularities, §§2–3, Lemma 3.2; §6 quotient singularities), Chapter IV
  (Theorem 2.1 proportionality, Theorem 2.5 Chern numbers, §6 and Theorem 6.1), Chapter V
  (Hirzebruch–Zagier curves), Chapter VII (Proposition 2.2, Definition 2.8, Proposition 2.9,
  Theorem 3.3, Theorem 5.1 and the classification tables), as cited through Assaf et al. where a
  theorem number is given.
- F. Hirzebruch, *Hilbert modular surfaces*, L'Enseignement Math. (2) 19 (1973), 183–281.
- F. Hirzebruch, G. van der Geer, *Lectures on Hilbert modular surfaces*, Sém. Math. Sup. 77,
  Presses de l'Université de Montréal, 1981 (Chapter II.1 for the cusp resolution).
- A. Prestel, *Die elliptischen Fixpunkte der Hilbertschen Modulgruppen*, Math. Ann. 177
  (1968), 181–209.
- S. Dasgupta, M. Kakde, *On constant terms of Eisenstein series*, Acta Arith. 200 (2021),
  119–147: Lemma 3.6 and Corollary 3.12 (cusps of `Γ₁(𝔑)_𝔟`).
- Y. Hamahata, *Hilbert modular surfaces with `p_g ≤ 1`*, Math. Nachr. 173 (1995), 193–236:
  Theorems 3.5, 4.6, 5.15, 6.13.
- J. Voight, *Quaternion Algebras*, GTM 288, Springer, 2021: Lemma 30.3.14, §§30.6–30.7,
  Corollary 31.1.10, Main Theorem 31.1.7, Proposition 31.2.1, Proposition 39.4.12.
- C. L. Siegel, *Berechnung von Zetafunktionen an ganzzahligen Stellen*, Nachr. Akad. Wiss.
  Göttingen (1969), 87–102; D. Zagier, *On the values at negative integers of the zeta-function
  of a real quadratic field*, L'Enseignement Math. 22 (1976), 55–95 (the formula of 4.2).
- A. Beauville, *Complex Algebraic Surfaces*, 2nd ed., LMS Student Texts 34, 1996: Theorem
  II.17 (Castelnuovo's contraction), Theorem V.1 (Castelnuovo's rationality criterion), Chapters
  VI–VIII (the classification).
- R. Hartshorne, *Algebraic Geometry*, GTM 52, 1977: V.1 (intersection theory), V.3 (blowing up),
  V.5 (birational transformations).
- W. Fulton, *Introduction to Toric Varieties*, Annals of Math. Studies 131, 1993, §2.6
  (Hirzebruch–Jung resolutions of cyclic quotient surface singularities).
- D. A. Cox, *Primes of the Form `x² + ny²`*, Theorem 7.24 (class numbers of orders).
- The LMFDB, Hilbert modular surfaces (knowls `hmsurface.*`, `ag.kodaira_dimension`,
  `ag.holomorphic_euler_char`, `ag.arithmetic_genus`).
