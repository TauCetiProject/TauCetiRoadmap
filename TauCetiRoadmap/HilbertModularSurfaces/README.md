# Roadmap: hilbert modular surfaces

**Summary.** Let `F` be a real quadratic field with ring of integers `R = 𝓞_F`, discriminant `D`, class
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
  honestly elliptic, general type), proved as geometric classification theorems, including the complete level-one list.

The carrier is arithmetic: a Hilbert modular surface is determined by `(F, 𝔑, [𝔟], type)`, where
`[𝔟]` is a narrow ideal class and the type is one of `Γ₀`, `Γ₀¹` (the LMFDB's `gl-0`, `sl-0`).
Every invariant above is a function of this datum, and every milestone that computes one is a
theorem equating a geometric invariant of `X(Γ)` with an arithmetic expression. The groups, their
action, their cusps and the spaces of holomorphic forms are HilbertModularForms'; Layers 0–1 read
them in degree two and add only what the surface needs beyond them.
The surface geometry and its numerical invariants are the end theorems of Layers 2–6.

Suggested home: `TauCeti/Geometry/Shimura/Hilbert/Surface/` (the cusp lattice API of the
toroidal roadmap lives in `TauCeti/Geometry/Shimura/Hilbert/Cusp`), with the purely arithmetic
layers (Hirzebruch–Jung continued fractions, cyclic quotient singularity data, the Siegel value)
under `TauCeti/NumberTheory/HilbertModularSurface/`.

## Scope and ownership

### Owned here

- The degree-two reading of HilbertModularForms' groups and cusps: the identification of its
  `ℍ^Σ` with the ordered `ℍ²`, the projective groups `PΓ` and the quotients `PΓᵢ/PΓᵢ¹`, the
  analytic quotient `Y(Γ)` as a ShimuraVarieties component, the cusp invariants `𝔰` and `𝔐`,
  the `Γ₀`/`Γ₁` cusp parametrisation, the `sl` cusp count, the cusp types `G(M, V)` and the
  all-level affine stabilizer with its translation class (Layers 0–1); the canonical two-form
  of a weight-`(2, 2)` form on HilbertModularForms' spaces (0.5, 4.8).
- The surface-theoretic reading of a cusp of `Ȳ(Γ)`: its type `G(M, V)` (Layer 1), the
  extension of the supplied maximal-order minus periods to oriented full lattices with arbitrary
  multiplier order, their compatibility with that construction (Layer 2), and the
  theorem that the exceptional locus of `X(Γ) → Ȳ(Γ)` over a cusp of type `G(M, V)` is a cycle of
  `dk` smooth rational curves with the self-intersection numbers `−b_i` (Layer 2).
- Elliptic points of `Γ₀(𝔑)_𝔟` and `Γ₀¹(𝔑)_𝔟`: the dictionary with CM orders, the complete list
  of possible orders, the class number `h(S)` of an `R`-order `S` in a quadratic extension of `F`
  by its conductor (no roadmap states it beyond `F = ℚ`), the class-number formulas for their
  number, the rotation types and their distribution, the Hirzebruch–Jung strings resolving them
  and the local Chern cycles (Layer 3).
- The volume `vol(Γ\ℍ²) = 2[Γ¹(1):Γ] ζ_F(−1)` normalised on `PSL₂(R)`, Siegel's closed formula for `ζ_F(−1)`,
  Hirzebruch's formulas for `c₁² = K²` and `c₂ = e` of `X(Γ)`, the vanishing of the irregularity,
  the application of Noether's formula to `χ`, the Hodge diamond, and the comparison
  `Σ_{[𝔟]} χ(X₀(𝔑)_𝔟) = dim S₂(Γ₀(𝔑)) + h⁺` (Layer 4).
- The surface-classification inputs this roadmap uses and no other roadmap states: the
  Enriques–Kodaira table for minimal surfaces with irregularity zero, the configuration rationality and
  K3/elliptic criteria of van der Geer, and the passage from `X(Γ)` to its minimal model
  (Layer 5).
- The Kodaira dimension of the level-one surfaces for small `D`, including rationality for `D ∈ {5, 8, 13, 17}`,
  the complete classification for `D ≤ 500`, and the general-type theorem for `D > 500` (Layer 6).
- The LMFDB record of a Hilbert modular surface: every column of the `hmsurface` pages as a
  definition in terms of the layers above, including the Hodge diamond, the set of Kodaira
  dimensions compatible with `(χ, K²)`, the lengths of the resolutions, the principal
  polarizability of a component, and the per-type elliptic-point counts (Layer 7).

### Consumed, not redefined

| Object | Supplier |
| --- | --- |
| The polarization lattice `L_c = R ⊕ c⁻¹𝔡⁻¹`, ordered polarization modules, the complex moduli comparison, the Baily–Borel compactification of the canonical model at tame level and its cusp schemes | [HilbertModularVarietiesAndShimuraCurves](../HilbertModularVarietiesAndShimuraCurves/README.md) H0.3, H1.1, H1.10, H5.2 |
| The domain `ℍ^Σ`, the group `GL₂⁺(F)` and its action with kernel the scalars, the weight-`k` slash in its arithmetic and unitary normalisations | [HilbertModularForms](../HilbertModularForms/README.md) §§0.1, 0.3–0.4 |
| The lattices `L_𝔟 = R ⊕ 𝔟`, the groups `Γ₀(𝔑)_𝔟`, `Γ₁(𝔑)_𝔟`, `Γ(𝔑)_𝔟` and `Γ_i¹(𝔑)_𝔟`, their determinant images and sections `ε ↦ diag(ε, 1)`, the level index `N(𝔑)∏_{𝔭∣𝔑}(1 + N𝔭⁻¹)`, the `J`-conjugation to the `a ≡ 1` convention, commensurability and the component transport `diag(1, α)` | [HilbertModularForms](../HilbertModularForms/README.md) §§1.1–1.3 |
| Cusps of `Γ₀(𝔑)_𝔟` as orbits in `ℙ¹(F)`, their finiteness, the level-one bijection with `Cl(R)`, the translation lattice and unit group of a cusp stabilizer, the count `h Σ_{𝔞∣𝔑} #((R/(𝔞 + 𝔑𝔞⁻¹))^×/U_𝔞)` per component and its fibres over the divisors `𝔞` and the ordinary classes | [HilbertModularForms](../HilbertModularForms/README.md) §1.4 |
| Holomorphic forms `M_k(Γ)` for `Γ` commensurable with `Γ_𝔟`, Koecher's principle, the constant terms at every cusp and their vanishing in nonparallel weight, the cusp forms `S_k(Γ)`, the component tuples `M_k(𝔑; R)`, the invariant measure and finite covolume, finite dimensionality at nonzero level | [HilbertModularForms](../HilbertModularForms/README.md) §§2.2–2.3, 2.5–2.6, 3.2, 3.5 |
| Proper discontinuity and neat subgroups of the component groups, the normal complex analytic structure of `Γ\X⁺`, finite analytic quotients | [ShimuraVarieties](../ShimuraVarieties/README.md) 0.4, 1.2, P.6 (HilbertModularForms supplies the groups and the action, not the quotient space) |
| The normal analytic Baily–Borel quotient `Γ\(ℍ²)*`, its algebraization as a normal projective surface, the Koecher principle and boundary codimension | [ShimuraVarieties](../ShimuraVarieties/README.md) 2.5, 2.7, 2.8 |
| Arithmetic cone systems and characteristic-zero toroidal charts at arbitrary compact open level; the Hilbert moduli specialization only under its tame hypotheses | ShimuraCompactifications §0.13, §§2.1–2.8; §§8.14–8.15, 8.23–8.25, 8.32–8.38, 8.56 |
| The narrow class group `Cl⁺(R)`, its finiteness, the surjection `Cl⁺ → Cl` and its kernel (the image of the principal ideals, `1 → {±1}²/sgn(R^×) → Cl⁺ → Cl → 1`) | Tau Ceti `NumberField.NarrowClassGroup`, `toClassGroup_surjective`, `toClassGroup_ker`, `instFinite`, `card_eq_card_classGroup_mul_card_ker`; its identification with [GlobalNumberFields](../GlobalNumberFields/README.md) Layer 2's `RayClassGroup (narrowModulus F)` is Tau Ceti's `narrowEquivNarrowClassGroup` |
| Narrow ray class groups `Cl⁺(𝔪)`; orders `NumberFieldOrder`, `Pic O`, conductors | [GlobalNumberFields](../GlobalNumberFields/README.md) Layer 2, Layer 11 |
| Class numbers of imaginary quadratic orders `h(𝒪_f) = h(K) f/[𝒪_K^×:𝒪_f^×] ∏_{p∣f}(1 − χ_D(p)/p)` (the case `F = ℚ` of 3.4); `ζ_K(s) = ζ(s)L(s, χ_D)` for quadratic `K` on `Re s > 1` | [ImaginaryQuadraticClassNumber](../ImaginaryQuadraticClassNumber/README.md) H1.3, H1.4, H2.2 |
| Intersection numbers on a smooth projective surface, adjunction, Riemann–Roch, Noether's formula `12χ = K² + c₂`, numerical equivalence, Hodge index | [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) §§5.9–5.10 |
| Hodge decomposition, Hodge symmetry `h^{p,q} = h^{q,p}` and `b₁ = 2h^{1,0}` on compact Kähler manifolds; the Kähler metric of a complex submanifold of `ℂPⁿ` | [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) K6.1; K7.2 (Fubini–Study) and K6.0 (restriction to complex submanifolds) |
| Free properly discontinuous holomorphic quotients and descent of maps | [ComplexManifolds](../ComplexManifolds/README.md) Milestone 4 |
| The one-variable elliptic chart and cusp datum; the compact modular curve `X(1)` | [FuchsianOrbifolds](../FuchsianOrbifolds/README.md) Layers 1 and 3; 6.1 |
| Toric fans, regular cones, the fan scheme and subdivisions | Tau Ceti `TauCeti/Geometry/Toric/Algebraic` and [AnalyticToricGeometry](../AnalyticToricGeometry/README.md) Layers 0, 2, 3 |
| Plumbing graphs and their intersection matrices | Tau Ceti `TauCeti.PlumbingGraph` |
| Total positivity and the unit-square index | Tau Ceti `NumberField.IsTotallyPositive`, `NumberField.units_sq_index_eq` in `TauCeti/NumberTheory/NumberField/Units/ElementaryTwoQuotient.lean` |
| Reduced irrationals and periodic minus cycles of narrow ideal classes of a real quadratic maximal order, with transport under change of representative | AutomorphicSpectralTheory §4.17a |
| Geometric Kodaira fibre types, including normalization genera, primitive multiplicities and incidence schemes | NeronModelsAndSemistableAbelianVarietiesPartII §§2.3, 2.5; §5.3 here applies these configurations to divisors without assuming a fibration |
| Rationality iff q = P₂ = 0 for smooth projective surfaces over an algebraically closed field | NeronModelsAndSemistableAbelianVarietiesPartII §6.1 |

### Not owned here

- **Labels, orderings and stored lists.** The field label `2.2.D.1`, the ideal labels of `𝔑`
  and `𝔟`, the label `F-N-b-t` of a surface, the representative `𝔟` chosen for a narrow class,
  the ordering of the rows of the cusp and elliptic-point tables, the starting point of a
  resolution cycle (`self_intersections_minimal` with repetition), the `M_label` of a cusp,
  and the normalisation of cusp coordinates `(a : c)` are not targets. This roadmap states the
  intrinsic label prefix `(D, 𝔑, [𝔟] ∈ Cl⁺(R), type)` and every invariant as a function of it;
  it never fixes an index.
- **Hilbert modular forms as such.** The groups, their cusps, the form spaces, Koecher's
  principle, finite dimensionality, Hecke operators, newforms and `L`-functions are
  HilbertModularForms'. Here the spaces `M_k(Γ)` and `S_k(Γ)` are read from it, for the
  irregularity (4.6) and the geometric comparison of §4.8 only.
- **The moduli interpretation** (`X₀(𝔑)_𝔟` as a moduli space of abelian surfaces with real
  multiplication, polarization modules, the knowl's "polarization module isomorphic to
  `(𝔡_F 𝔟)⁻¹`"): HilbertModularVarietiesAndShimuraCurves H1; here `𝔟` is only the second
  summand of the lattice `R ⊕ 𝔟`.
- **Canonical models over the reflex field**, integral models, toroidal compactifications in
  general, automorphic bundles: ShimuraVarieties, ShimuraCompactifications, AutomorphicBundles.
- **Hilbert–Blumenthal surfaces for degree `> 2`** and the general theory of cusp singularities
  of Hilbert modular varieties: the toroidal roadmap; this roadmap is two-dimensional throughout.
- **Quaternionic Shimura curves:** HilbertModularVarietiesAndShimuraCurves R18 supplies their
  general construction. Layer 6 owns the Hirzebruch–Zagier divisors as curves on the surfaces,
  for every positive divisor index and every nonzero level, and their geometric intersections.
- **General surface rationality:** the Castelnuovo–Zariski criterion is consumed from
  NeronModelsAndSemistableAbelianVarietiesPartII §6.1; Layer 5 owns the additional configuration
  criteria and the characteristic-zero classification inputs used here.

## Conventions

1. **The field and the order of its places.** `F` is a number field with
   `Module.finrank ℚ F = 2` and `IsTotallyReal F`; `D = |discr F| ∈ {5, 8, 12, 13, …}` is a
   positive fundamental discriminant. The two real embeddings are **ordered**, `(v₁, v₂)`, and
   the ordered pair is part of the carrier: every invariant below is a function of
   `(F, v₁, v₂, 𝔑, [𝔟], type)`, and `Suggested.lean` takes `v₁ v₂ : F →+* ℝ` as arguments of
   every declaration that depends on the order. Interchanging the two coordinates reverses each cusp cycle and swaps the rotation factors.
   Separately, the Galois automorphism σ transports both ideals: `(𝔑, [𝔟])` becomes
   `(σ𝔑, [σ𝔟])`; it preserves a fixed-level family only when σ𝔑 = 𝔑; the choice the
   LMFDB makes (through the ordering of the real roots of its defining polynomial,
   `nf.generator`) is a database convention, not a target. All pairs `(ζ_{v₁}, ζ_{v₂})`, `(z₁, z₂)` are
   in the order `(v₁, v₂)`. `ℍ² = ℍ × ℍ` with `z = (z₁, z₂)`; `γ ∈ GL₂⁺(F)` acts by
   `γz = (v₁(γ)z₁, v₂(γ)z₂)` through Mathlib's `GL(2, ℝ)⁺` action on `UpperHalfPlane`.
2. **The groups.** `GL₂⁺(F) = {γ ∈ GL₂(F) : det γ ≫ 0}`;
   `Γ₀(𝔑)_𝔟 = {(a b; c d) ∈ GL₂⁺(F) : a, d ∈ R, b ∈ 𝔟⁻¹, c ∈ 𝔑𝔟, ad − bc ∈ R^×_{>0}}`,
   `Γ₁(𝔑)_𝔟` additionally `d ≡ 1 mod 𝔑` (§0.3), `Γ(𝔑)_𝔟` additionally
   `a ≡ d ≡ 1 mod 𝔑`, `b ∈ 𝔑𝔟⁻¹`. Assaf et al. write `Γ₁` with `a ≡ 1`
   instead; for `ν ≫ 0` in `F`, conjugation by `W_ν = (0 −1; ν 0)` maps their group at `𝔟` onto
   the pinned `Γ₁(𝔑)_{ν(𝔑𝔟)⁻¹}` (it swaps `a` and `d`), and every statement about `Γ₁` quoted from
   Assaf et al. is read through this isomorphism (`W_ν = diag(1, ν) J` is HilbertModularForms §1.2's
   `J`-conjugation followed by its §1.3 transport; 1.3, 1.5);
   Dasgupta–Kakde use the pinned `d ≡ 1` convention already, with `𝔟 = 𝔱_λ𝔡`
   (arXiv:2010.00650v1, §2, p. 5).
   `Γ_i¹(𝔑)_𝔟 = Γ_i(𝔑)_𝔟 ∩ SL₂(F)`. `Γ₀(1)_𝔟 = GL⁺(R ⊕ 𝔟)`. The LMFDB's `ambient type` `gl`
   is `Γ_i(𝔑)_𝔟`, `sl` is `Γ_i¹(𝔑)_𝔟`; `gamma type` `0`, `1`, `f` is `i = 0`, `i = 1`, full level.
   `PΓ` is the image of `Γ` in `PGL₂⁺(F)`; it acts faithfully on `ℍ²`, and every stabilizer,
   order and index below is taken in `PΓ`.
3. **Components.** For `α ∈ F^×_{>0}`, `γ ↦ diag(1, α) γ diag(1, α)⁻¹` maps `Γ_i(𝔑)_𝔟` onto
   `Γ_i(𝔑)_{α𝔟}` (HilbertModularForms §1.3 for `Γ₀`, §0.3 for the others;
   `(a b; c d) ↦ (a, α⁻¹b; αc, d)`); the surface depends
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
   The LMFDB's `self_intersections_minimal` is `(−b_1, …, −b_d)` and repetition is `k`.
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
    `q = h^{1,0}`. The **arithmetic genus** is `p_a = χ − 1`; the LMFDB column chi is `χ`, and
    the knowl `hmsurface.arithmetic_genus` calls `χ` itself the arithmetic genus. Both numbers
    are defined and named here; chi means `χ(𝒪_X)`.
11. **Kodaira dimension.** `κ(X) ∈ {−1, 0, 1, 2}` is the Kodaira dimension of `X(Γ)`, equal to
    that of its minimal model; `−1` is the value for `P_m = 0` for all `m`. Two finite sets are
    defined in Layer 5: kodairaPossibilitiesMinimal χ K² is the set of κ allowed by the coarse numerical rows for a **minimal**
    surface with q = 0 and invariants (χ,K²) in the Enriques–Kodaira table, and
    kodairaDims χ K² is the set of `κ` compatible with `χ` and the **lower bound** `K² ≤ K²_{min}`
    (the union of the former over `K²′ ≥ K²`). The Kodaira field is the singleton {κ} where §§6.3–6.5 establish κ, and the numerical
    possibility set of §5.2 elsewhere;
    the page's "known to be" is the singleton case. κ belongs to the minimal-table set evaluated at K²_min and the lower-bound set evaluated at K²(X).
12. **Volume and `ζ_F(−1)`.** `vol(Γ\ℍ²) := 2[Γ¹(1) : Γ] ζ_F(−1)`, where `Γ¹(1) = PSL₂(R)` and
    `[Γ¹(1) : Γ] = [Γ¹(1) : Γ¹(1) ∩ Γ]/[Γ : Γ¹(1) ∩ Γ] ∈ ℚ` is the generalised index for `Γ`
    commensurable with `Γ¹(1)` in `PGL₂⁺(ℝ)²`; every `PΓ_i(𝔑)_𝔟` and `PΓ_i¹(𝔑)_𝔟` is, for every
    `𝔟` (4.3). The generalised index `[Γ¹(1) : PΓ₀¹(1)_𝔟]` is `1` for every `𝔟`: this is
    Siegel's theorem that `SL(R ⊕ 𝔟)` and `SL₂(R)` have the same covolume `2ζ_F(−1)` in the
    Gauss–Bonnet measure of 4.3. Thus `vol(PΓ₀¹(1)_𝔟\ℍ²) = 2ζ_F(−1)` for every
    `𝔟`, `vol(PΓ₀(1)_𝔟\ℍ²) = 2ζ_F(−1)/[R^×_{>0} : R^{×2}]`,
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
    `c(12;1,7) = −4/3`, `ℓ = 3`. (The values are Checks for §3.9.)
14. **Conditional nothing.** No invariant here depends on a hypothesis: the only quantity the
    LMFDB stores as a set rather than a value is `kodaira_dims`, and it is the definition of
    convention 11, not a conjecture.

## Exact supplier contracts

### From Mathlib

- `UpperHalfPlane` with the `GL(2, ℝ)⁺` Möbius action
  (`Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction`) and its manifold structure.
  Properness is `UpperHalfPlane.instProperSMul : ProperSMul SL(2, ℝ) ℍ`, and the discrete-subgroup
  consequence is `UpperHalfPlane.instProperlyDiscontinuousSL2RSubgroup`
  (`Mathlib/Analysis/Complex/UpperHalfPlane/ProperAction.lean`, lines 122–128).
  The `GL₂⁺` action has a scalar kernel; the effective Hilbert arithmetic action uses
  ShimuraVarieties §§0.4, 1.2 below. `Subgroup.IsArithmetic`,
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

### From Tau Ceti

- `NumberField.IsTotallyPositive`, `isTotallyPositive_iff`, `IsTotallyPositive.mul`, `.inv`,
  `isTotallyPositive_sq`, `totallyPositiveUnits`
  (`TauCeti/NumberTheory/NumberField/TotallyPositive.lean`, lines 71–78, 96–107, 130): total
  positivity means positivity at every real place; it is vacuous for a totally complex field.
  Use `totallyPositiveIntegerUnits` (line 168 of the same file) for Rˣ, and the range of
  squaring for the squares in Rˣ.
- `NumberField.NarrowClassGroup`, `NarrowClassGroup.mk`, `toClassGroup`, `toClassGroup_ker`,
  `instFinite`, `card_eq_card_classGroup_mul_card_ker`
  (`TauCeti/NumberTheory/NumberField/NarrowClassGroup`), and `narrowEquivNarrowClassGroup`
  (`TauCeti/NumberTheory/NumberField/Global/RayClass/Narrow`): `Cl⁺(R)`, the component set.
- `TauCeti.PlumbingGraph`, `PlumbingGraph.intersectionMatrix`, `.intersectionForm`,
  `.IsNegativeDefinite`, `isNegativeDefinite_iff`, `blowUpVertex`
  (`TauCeti/LowDimTopology/Plumbing`): the intersection matrices of Hirzebruch–Jung strings and
  of cycle graphs of length at least three are instances; the nodal and double-edge cases use
  the matrix definition of §2.5. Vertex blow-up models a smooth point of the named component,
  with separate intersection data for a crossing blow-up.
- `TauCeti.Toric.Fan`, `IsToricCone`, `IsRegularCone`, fan subdivisions and the fan scheme
  (`TauCeti/Geometry/Toric/Algebraic`): the Hirzebruch–Jung string is the regular subdivision of
  the cone `⟨(0,1), (q, −r)⟩`, and individual finite charts of the cusp resolution use these carriers. The infinite
  cone system of the cusp uses ShimuraCompactifications §0.13's arithmetic cone system;
  `TauCeti.Toric.Fan.finite_cones` forbids treating it as a finite fan.
- `TauCeti.BinaryQuadraticForm`, `IsReducedForm`, `reducedForms D`, `hurwitzClassNumber`: reduced quadratic-form data (the weighted Hurwitz count is not an
  ordinary order class number), used in the level-one
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

### From roadmaps

Consume AutomorphicSpectralTheory §4.17a for the reduced representative and cyclic minus period
of each narrow ideal class of a real quadratic maximal order, including representative transport
and its primitive norm-one multiplier. Layer 2 extends this to arbitrary multiplier orders and
identifies its maximal-order specialization with the supplied cycle. Consume
NeronModelsAndSemistableAbelianVarietiesPartII §§2.3, 2.5 for the geometric Kodaira-type
conditions, including genera, primitive multiplicities and local incidence; §5.3 uses those
conditions on a divisor of a surface without assuming that the divisor is already a fibre.

Consume ShimuraVarieties §§0.1, 0.4, 1.2 and P.6 for arithmetic component groups, proper
discontinuity, neat covers and finite analytic quotients, and §§2.5, 2.7–2.8 for the analytic
minimal compactification and its projective algebraization. Consume ShimuraCompactifications
§0.13 for arithmetic cone systems and §§2.1–2.8 for analytic boundary charts, quotients, gluing,
algebraization and the map to the minimal compactification at arbitrary compact open level.
Its §§8.14–8.15, 8.23–8.25, 8.32–8.38 and 8.56 supply the Hilbert moduli comparison and full
affine stabilizer only in their stated tame range; §2.4 below proves the all-level surface
comparison using the general characteristic-zero construction.

Consume GlobalNumberFields Layers 2 and 11 for narrow ray classes, orders, conductors and Picard
groups; ClassFieldTheory Layers 10–13 for reciprocity and narrow class fields. Consume
ImaginaryQuadraticClassNumber §§H1.3–H1.4 for imaginary quadratic order class numbers and §H2.2
for the quadratic Euler-product factorization, with the real quadratic specialization made in §4.2.
Consume SchemeAndStackFoundations §§5.9–5.10 for surface intersection, adjunction, Riemann–Roch,
Noether's formula and Hodge index; ComplexKahlerGeometry K6.0–K6.1 and K7.2 for projective
Kähler metrics, decomposition and symmetry; ComplexManifolds Milestone 4 for free analytic
quotients; FuchsianOrbifolds Layers 1 and 3 and §6.1 for the one-dimensional charts and X(1).
Consume NeronModelsAndSemistableAbelianVarietiesPartII §6.1 for the Castelnuovo–Zariski
rationality criterion over an algebraically closed field. Consume
HilbertModularVarietiesAndShimuraCurves §§H0.3, H1.1, H1.10 and H5.2 for polarization modules,
complex moduli and the tame-level comparison. Generic toric charts come from
AnalyticToricGeometry Layers 0, 2–3. These inputs retain their own hypotheses.

Consume HilbertModularForms §§0.1 and 0.3–0.4 for the domain `ℍ^Σ`, the group `GL₂⁺(F)`, its
action and the slash in both normalisations; §§1.1–1.3 for the lattices `L_𝔟`, the groups of
convention 2 with their determinant images, sections, level index, `J`-conjugation,
commensurability and component transport; §1.4 for the cusps of `Γ₀(𝔑)_𝔟`, their finiteness,
the translation lattices and unit groups of their stabilizers and their count; §§2.2–2.3,
2.5–2.6, 3.2 and 3.5 for Koecher's principle, the spaces `M_k(Γ)` and `S_k(Γ)` with their
constant terms, the component tuples, the invariant measure and finite dimensionality. Its
statements are for every totally real `F` with the places unordered; §0.4 below reads them in
degree two through the ordered pair `(v₁, v₂)`, and nothing of them is proved again here.

## How to read the build

Layer 0 reads HilbertModularForms' groups and forms in degree two and fixes the projective
groups, the analytic quotient and the canonical two-form; Layer 1 reads its cusps and adds the
cusp invariants, the parametrisation, the `sl` count and the affine stabilizers. Layer 2 resolves cusps, while Layer 3 counts and resolves elliptic
points. Layer 4 combines these into Chern and Hodge invariants. Layer 5 supplies the additional
surface classification criteria; Layer 6 proves the classification, and Layer 7 packages its
invariants. The continued fractions and Siegel identity can be developed independently of the
geometric quotient. Suggested.lean states the arithmetic headlines that the pinned carriers
support; its docstring identifies each geometric headline that requires a constructed surface.

## Layer 0: the arithmetic frame

This layer reads HilbertModularForms' groups, their action and their form spaces in degree two
and fixes what the surface needs beyond them: the ordered coordinates, the projective groups,
the analytic quotient and the canonical two-form.

### 0.1 Real quadratic data

For `F` with `finrank ℚ F = 2` and `IsTotallyReal F`: the two real places, their order
(convention 1), the fundamental discriminant `D` and its reconstruction of `F` up to isomorphism,
the integral basis `1, ω_D` with `ω_D = (D + √D)/2`, the fundamental unit `ε > 1` at `v₁`
(`Units.fundSystem` in unit rank one; `Pell.IsFundamental` for `d = D/4` or `d = D` describes only
the norm-one units of `ℤ[√d]`, and gives `ε` itself only when `N(ε) = 1` and `ε ∈ ℤ[√d]`: for
`D = 5` the Pell solution `9 + 4√5` is `ε⁶`),
its norm `N(ε) ∈ {±1}`, and the dichotomy: `R^×_{>0} = R^{×2} = ⟨ε²⟩` when `N(ε) = −1`;
`R^×_{>0} = ⟨ε⁺⟩ ⊋ R^{×2} = ⟨ε²⟩` with `ε⁺ = ±ε` totally positive when `N(ε) = 1`. The index
`[R^×_{>0} : R^{×2}]` is `1` or `2` accordingly, and the native unit-square index specializes to `[R^× : R^{×2}] = 4`. *Needs:* Mathlib
`Pell`, `Units.fundSystem`, Tau Ceti `totallyPositiveUnits`.

The arithmetic-data API includes independence of integral basis for D, the two embeddings
and the unit-norm dichotomy, with ε chosen to exceed 1 at v₁ (Hirzebruch 1973, §2.1;
Mathlib's unit theorem and the native unit-square index).

**Checks.**

- For D = 5, ε = (1+√5)/2 has norm −1 and ε² = (3+√5)/2 generates positive units; the square index is 1.
- For D = 12, ε = 2+√3 has norm 1; positive units modulo squares have size 2.
- D = 1 satisfies the native fundamental-discriminant predicate but is not the discriminant
  of a degree-two field; finrank ℚ ℚ = 1 excludes it.

### 0.2 Narrow classes and components

`Cl⁺(R)` is Tau Ceti's `NumberField.NarrowClassGroup F`, which `narrowEquivNarrowClassGroup`
identifies with GlobalNumberFields Layer 2's `RayClassGroup (narrowModulus F)`; `h⁺ = #Cl⁺(R)`,
`h⁺/h ∈ {1, 2}`, and `h⁺ = h` iff `N(ε) = −1`. The set of components of `X₀(𝔑)` is `Cl⁺(R)`
(convention 3; this is the component bijection the knowl `hmsurface.component_ideal` states).
`[𝔡⁻¹] ∈ Cl⁺(R)` is the narrow class of the inverse different; `IsPrincipallyPolarizable 𝔟 :⇔
[𝔟] = [𝔡⁻¹]`, the LMFDB flag `is_pp`. *Needs:* Tau Ceti `NarrowClassGroup`, 0.1.

The principal-polarizability predicate has the following API (the polarization lattice
comparison of HilbertModularVarietiesAndShimuraCurves H1.1; Assaf et al., §2.2):

- It depends only on the narrow class of 𝔟, and identifies exactly the class of the inverse different.
- Multiplication by a totally positive principal ideal preserves it.
- Forgetting to the ordinary class group does not in general detect it.

**Checks.**

- For ℚ(√5), h⁺ = 1, so the sole component is principally polarizable.
- For ℚ(√3), 𝔡 = (2√3) has mixed-sign generator: [𝔡⁻¹] is the nontrivial narrow class,
  so the trivial component fails the predicate although its ordinary class is trivial.
- Multiplying 𝔡⁻¹ by 2 preserves the predicate, whereas multiplying it by √3 in the
  second field changes its narrow class to 1 and fails it.

### 0.3 The groups, the projective quotients and the index formula

The groups of convention 2 are HilbertModularForms' `Γ₀(𝔑)_𝔟`, `Γ₁(𝔑)_𝔟`, `Γ(𝔑)_𝔟` and
`Γ_i¹(𝔑)_𝔟` (its §1.2, on the lattice `L_𝔟 = R ⊕ 𝔟` of its §1.1), with its determinant images
`Dᵢ` (all positive units for `Γ₀` and `Γ₁`, the positive units congruent to `1` modulo `𝔑` for
full level, each with the section `u ↦ diag(u, 1)` and kernel `Γ_i¹`), its level index
`[Γ₀(1)_𝔟 : Γ₀(𝔑)_𝔟] = N(𝔑) ∏_{𝔭 ∣ 𝔑} (1 + N(𝔭)⁻¹)`, proved there by reduction on `L_𝔟` and
the transitive action on `ℙ¹(R/𝔑)` including prime powers, its `J`-conjugation to the `a ≡ 1`
convention, and its component transport `diag(1, α)` for `Γ₀` (§1.3). Owned here, beyond these:
the transport for `Γ₁` and `Γ(𝔑)` (the conditions on `a` and `d` are untouched and
`b ∈ 𝔑𝔟⁻¹ ↦ α⁻¹b ∈ 𝔑(α𝔟)⁻¹`), the conjugation by `W_ν = diag(1, ν) J` of convention 2 as the
composite, and the passage to the projective groups. Let `Aᵢ` be the scalar units actually in
the group: `A₀ = R^×`, while `A₁ = A_full = {a ∈ R^× : a ≡ 1 mod 𝔑}`. Prove
`PΓᵢ/PΓᵢ¹ ≃ Dᵢ/{a² : a ∈ Aᵢ}`. Only for `Γ₀` does this reduce to
`[R^×_{>0} : R^{×2}]`, giving equality of the `gl` and `sl` surfaces when `h⁺ = h`. Prove that
the level index is the same for `PΓ₀`, for `Γ₀¹` and for `PΓ₀¹`: the coset representatives can
be taken in `SL(L_𝔟)`, since every element of `Γ₀(1)_𝔟` is `diag(ε, 1)` times one of `SL(L_𝔟)`
and `diag(ε, 1) ∈ Γ₀(𝔑)_𝔟`, and the scalars `R^×`, respectively `{±1}`, lie in every level
(Assaf et al., §2.1, equations (2.1.4)–(2.1.8)). *Needs:* §0.1; HilbertModularForms §§1.1–1.3;
Mathlib fractional ideals and finite ideal quotients.

The projective-group API includes:

- Determinant and scalar maps descend to `PΓᵢ`, and the isomorphism
  `PΓᵢ/PΓᵢ¹ ≃ Dᵢ/{a² : a ∈ Aᵢ}` is induced by the determinant.
- The transport by `diag(1, α)` and the conjugation by `W_ν` carry the lattice, the level
  condition and the projective quotient together; the inverse transport uses `α⁻¹`.

**Checks.**

- At unit level all three groups agree (HilbertModularForms §1.2), and
  `PΓ₀(1)_𝔟/PΓ₀¹(1)_𝔟` has order `[R^×_{>0} : R^{×2}]`.
- For F = ℚ(√5), ε = (1+√5)/2 and 𝔑 = (3), ε² = ε+1 is not 1 modulo 3;
  it is not a full-level determinant. In Γ₁, diag(ε²,1) has determinant-one scalar
  normalizations with d = ±ε⁻¹ = ±(ε−1), neither 1 modulo 3. Thus its projective class
  lies outside PΓ₁¹ although h⁺ = h = 1.
- For `𝔑 = (2)` over `ℚ(√5)` the index `5 = 4(1 + 1/4)` of HilbertModularForms §1.2 is also
  `[PΓ₀¹(1) : PΓ₀¹(𝔭₂)]`: the only scalar `−1` lies in both groups and the representatives of
  the five cosets lie in `SL₂(R)`.

### 0.4 The action, the effective group and the quotient

HilbertModularForms §0.1 gives the action of `GL₂⁺(F)` on `ℍ^Σ = InfinitePlace F → ℍ` through
`UpperHalfPlane.glAction` at each place, with kernel the scalar matrices. Read it in degree two:
the ordered pair `(v₁, v₂)` of convention 1 identifies `ℍ^Σ` with `ℍ² = ℍ × ℍ` and the action
with the homomorphism `GL₂⁺(F) → GL(2, ℝ)⁺ × GL(2, ℝ)⁺`, `γ ↦ (v₁(γ), v₂(γ))`; the kernel of
the action of `Γ` is `Γ ∩ F^×`, and `PΓ = Γ/(Γ ∩ F^×)` acts faithfully. The scalar
subgroup of `Γ₀(𝔑)_𝔟` is `R^×` and that of `Γ₀¹(𝔑)_𝔟` is `{±1}`. Prove the component comparison:
`Γ₀(𝔑)_𝔟 = GL₂(F) ∩ g K₀(𝔑) GL₂(F_∞)⁺ g⁻¹` for `g = diag(1, t)`, `t` a finite idele of ideal `𝔟`:
it is the component group `Γ_g` of ShimuraVarieties 0.1 for the Hilbert modular datum
`(Res_{F/ℚ} GL₂, (ℍ^±)²)` at level `K₀(𝔑)`, and `PΓ₀¹(𝔑)_𝔟` has finite index in `PΓ₀(𝔑)_𝔟`
(0.3; `Γ₀¹` itself has infinite index, with quotient `R^×_{>0}`). The
quotient: `PΓ` acts properly discontinuously (ShimuraVarieties 0.4); for a neat normal subgroup
`Γ′ ⊴ Γ` of finite index (`Γ ∩ Γ(𝔑′)_𝔟` for `𝔑′` divisible enough, ShimuraVarieties 0.4)
`Γ′\ℍ²` is a complex manifold (ComplexManifolds Milestone 4), and
`Y(Γ) = (Γ/Γ′)\(Γ′\ℍ²)` is its finite analytic quotient (ShimuraVarieties P.6), a normal complex
analytic surface independent of `Γ′` (ShimuraVarieties 1.2). It is smooth off the images of the
points with nontrivial stabilizer in `PΓ`. *Needs:* §0.3; HilbertModularForms §0.1;
ShimuraVarieties 0.1, 0.4, 1.2, P.6; ComplexManifolds Milestone 4.

The quotient API includes the equivariant holomorphic identification of `ℍ^Σ` with the ordered
`ℍ²`, invariance under replacing a neat normal cover by a smaller
one, the quotient map from ℍ², and descent of invariant holomorphic maps
(ShimuraVarieties §§0.4, 1.2 and P.6).

**Checks.**

- A scalar aI fixes z since az/a = z; in Γ₀¹ the scalars are 1 and −1.
- For t > 0, tI fixes i and has determinant t²: the GL₂⁺ stabilizer contains
  the unbounded sequence nI, while positive scalar matrices in SL₂ have t = 1.
  The SL₂ stabilizer of i consists of (a,b;−b,a) with a²+b² = 1, a compact circle.
- The upper translation matrix (1,1;0,1) sends (i,i) to (1+i,1+i), so the action is not trivial.
- Over ℚ(√3), quotienting Γ₀ by {±1} alone leaves the scalar 2+√3 acting trivially;
  quotienting by the full scalar subgroup removes that kernel.

### 0.5 Holomorphic forms and the canonical two-form

The spaces of holomorphic Hilbert modular forms are HilbertModularForms': `M_k(Γ)` for `Γ`
commensurable with `Γ_𝔟` and a weight `k` of one parity (its §2.3, with no cusp condition, by
Koecher's principle, its §2.2), the constant terms at every cusp and their vanishing in
nonparallel weight (§2.5), the cusp forms `S_k(Γ)` (§2.6), the component tuples `M_k(𝔑; R)`
and `S_k(𝔑; R)` over the narrow class group (§2.3), and `FiniteDimensional ℂ (S_k(Γ))`,
`FiniteDimensional ℂ (M_k(Γ))` at nonzero level (§3.5). Its slash is the arithmetic
normalisation; on the groups of convention 2, whose determinants are positive units, it agrees
with the unitary factor `∏ᵢ det(γᵢ)^{kᵢ/2}(cᵢzᵢ + dᵢ)^{−kᵢ}` (its §0.4), and a weight `(k₁, k₂)`
here is its `k : Σ → ℤ` read through `(v₁, v₂)`. Owned here is the canonical two-form: for a
holomorphic `f : ℍ² → ℂ`, the form `f dz₁ ∧ dz₂` is `Γ`-invariant iff `f ∈ M_{(2,2)}(Γ)`, because
`d(γz)₁ ∧ d(γz)₂ = ∏ᵢ det(γᵢ)(cᵢzᵢ + dᵢ)^{−2} dz₁ ∧ dz₂`; for `f ∈ S_{(2,2)}(Γ)` the two-form
descends to the smooth locus of `Y(Γ)` and extends holomorphically across the resolutions of
§§2.4 and 3.10, and conversely every holomorphic two-form on `X(Γ)` restricts to the two-form
of a cusp form: this is the identification `H⁰(X(Γ), K_X) = S_{(2,2)}(Γ)` used in 4.8 (van der
Geer, Chapter I, §4 and Chapter IV, §6; Assaf et al., §6.3, equation (6.3.1)).
*Needs:* §0.4 for the open space; HilbertModularForms §§2.2–2.3, 2.5–2.6, 3.5; §§2.4, 3.10 and
4.1 for the extension across the resolutions.

The two-form API includes:

- For every holomorphic f and `γ ∈ GL₂⁺(F)`, pullback satisfies
  `γ*(f dz₁ ∧ dz₂) = (f ∣_(2,2) γ) dz₁ ∧ dz₂`, with the unitary slash normalization.
  Invariance under `Γ` is exactly the weight-`(2, 2)` slash law, including at zeros of f.
- Pullback to a finite-index subgroup and descent along it preserve the two-form; in a cusp
  chart the constant term contributes `a₀ dz₁ ∧ dz₂`, which has a pole along the boundary
  divisor of the resolution unless `a₀ = 0`.

**Checks.**

- For f(z₁,z₂) = z₁−i and γ = (1,1;0,1), at z = (i,i) the values are f(z) = 0
  and (f ∣γ)(z) = 1; the pullback coefficient is 1, so division by f would be undefined.
  The identity acting on f = 1 gives coefficient 1 on both sides.
- For `diag(u, 1)` with a totally positive unit `u`, the Jacobian of `z ↦ (u₁z₁, u₂z₂)` is
  `u₁u₂ = N(u) = 1` and `f(uz) = (u₁u₂)^{−1} f(z)` at weight `(2, 2)`, so the two-form is
  invariant; at weight `(0, 0)` the constant `1` gives `dz₁ ∧ dz₂`, which the inversion
  `(0 −1; 1 0) ∈ Γ₀¹(1)_R` sends to `z₁^{−2}z₂^{−2} dz₁ ∧ dz₂`, so `1 ∈ M_{(0,0)}` gives no
  invariant two-form.
- For `D = 5` at level one, `p_g = 0` (4.7, worked example) while `M_{(2,2)}(Γ₀(1))` contains
  the nonzero weight-two Eisenstein series of HilbertModularForms §4.2 (constant term `1` at
  its cusp): identifying `H⁰(K_X)` with all of `M_{(2,2)}` would give `p_g ≥ 1`.
- A form with constant coefficient `1` is not a cusp form even if all its other coefficients
  are supported in the positive cone, and its two-form has a pole along the cusp cycle.

### Examples

The norm-minus-one field ℚ(√5) and the norm-plus-one field ℚ(√3) distinguish the two unit indices; §0.3 tests full and Γ₁ level (3).

### Dependencies

Mathlib number fields, ideals and upper half-plane actions; Tau Ceti positivity and narrow classes; HilbertModularForms §§0.1, 0.3–0.4, 1.1–1.3, 2.2–2.3, 2.5–2.6, 3.5; ShimuraVarieties §§0.1, 0.4, 1.2, P.6.

## Layer 1: cusps

### 1.1 Cusps as orbits

A cusp of `Γ` is a `PΓ`-orbit in `ℙ¹(F)`, which is the same as a `Γ`-orbit (knowl
`hmsurface.cusps`). For `Γ = Γ₀(𝔑)_𝔟` this is HilbertModularForms §1.4's cusp set `C(Γ)`, with
its finiteness, its level-one bijection `C(Γ₀(1)_𝔟) ≃ Cl(R)` through `(a : c) ↦ [aR + c𝔟⁻¹]`,
and the structure of a cusp stabilizer: conjugate in `GL₂⁺(F)` to upper triangular matrices
whose translation part is a full lattice in `F` and whose unit part has finite index in
`R^×_{>0}`. Owned here: the same definition for `Γ₁(𝔑)_𝔟`, `Γ(𝔑)_𝔟` and the `sl` groups, which
have finitely many cusps because their images in `PΓ₀(𝔑)_𝔟` have finite index (`Γ(𝔑)_𝔟` is
the kernel of reduction modulo `𝔑`, HilbertModularForms §1.2; `PΓ₀¹(𝔑)_𝔟` by §0.3, although
`Γ₀¹(𝔑)_𝔟` itself has infinite index in `Γ₀(𝔑)_𝔟`); the extension of
the `Γ` action to `ℍ² ∪ ℙ¹(F)`; that a cusp is never an elliptic point, its stabilizer
containing a translation lattice of rank two and so being infinite; and the comparison for
`F = ℚ`, admitted as a test, with Mathlib's `CuspOrbits` of the image of `Γ` in `GL(2, ℝ)`.
*Needs:* 0.3, 0.4; HilbertModularForms §§1.2, 1.4; Mathlib `Cusps` for the comparison.

The cusp API includes representative independence, the stabilizer action and finiteness
at finite-index level, read from HilbertModularForms §1.4 for `Γ₀` and transported along the
inclusions for the other groups; at level one the ideal-class map is a bijection
(Assaf et al., §3.1, Corollary 3.1.23; Hirzebruch 1973, §3.7).

**Checks.**

- Over ℚ(√5), the level-one orbit count is h = 1, not the cardinality of ℙ¹(F).
- At level (2) in that field, infinity and zero give two Γ₀ orbits.
- At infinity, every translation by n ∈ ℤ fixes the cusp, giving infinitely many
  stabilizer elements; the interior point (i,i) is not fixed by translation by 1.

### 1.2 The cusp invariants `𝔰` and `𝔐`

For a representative `(a : c)` with `a ∈ R`, `c ∈ 𝔟`: `𝔰(a, c) = aR + c𝔟⁻¹` and
`𝔐(a, c) = 𝔑 + c(𝔟𝔰)⁻¹`. `𝔐` is integral, depends only on the cusp, and divides `𝔑`
(Assaf et al., Lemma 3.1.2). Every cusp has a representative with `𝔰` coprime to `𝔑`.
*Needs:* 1.1.

The cusp-ideal API includes:

- Scaling (a,c) by x ∈ Fˣ scales 𝔰 by (x) and leaves 𝔐 unchanged.
- The ordinary class of 𝔰 and the ideal 𝔐 are constant on the indicated cusp orbit.
- The inclusion 𝔑 ⊆ 𝔐 ⊆ R gives ideal divisibility 𝔐 ∣ 𝔑.

**Checks.**

- For 𝔟 = R and (a:c) = (1:0), 𝔰 = R and 𝔐 = 𝔑.
- For (0:1), 𝔰 = R and 𝔐 = R; the two values differ at nonunit level.
- Replacing (1:0) by (2:0) gives 𝔰 = 2R and the same 𝔐 = 𝔑; thus the ideal 𝔰
  itself is not a projective invariant. The pair (0,0) is excluded.

### 1.3 Classification of cusps

For each nonzero fractional ideal 𝔰 and divisor 𝔐 of 𝔑, let A = (𝔰/𝔰𝔐)^× and
C = (𝔰𝔟𝔐/𝔰𝔟𝔑)^×, where the superscript means generators of the respective cyclic
quotient modules. Define the raw Γ₁ parameter set as the disjoint union, over (𝔰,𝔐), of
`(A/R^×_{>0}) × C`; define the raw Γ₁¹ parameter set using A × C. Prove that
(a,c) ↦ (𝔰,𝔐,ā,c̄) gives bijections from the respective orbits in F² ∖ {0} onto these sets.
For the pinned d ≡ 1 group, c̄ is retained as an element of C. The determinant unit acts only
on A; for determinant one neither factor is divided by a unit group.
Derive the raw Γ₀ and Γ₀¹ parameter sets by the action of (R/𝔑)^× on the respective Γ₁
sets, x·(ā,c̄) = (xā,x⁻¹c̄), using lifts in Γ₀¹. These are the raw-vector refinements of
Assaf et al., Lemma 3.1.8, pp. 5–7, and Dasgupta–Kakde, arXiv:2010.00650v1,
Lemma 3.6, pp. 9–10: the independent unit quotient on C in those displayed raw-vector
statements is not part of this target. Dasgupta–Kakde's group already has d ≡ 1;
Assaf's a ≡ 1 convention is transported by W_ν (convention 2), sending
(a:c) to (−c:νa), with target component ν(𝔑𝔟)⁻¹ and invariant 𝔑/𝔐.
*Needs:* 1.2, 0.3; fractional-ideal Chinese remainders and the determinant-one completion
of a generating pair in R ⊕ 𝔟.

The parametrization API includes:

- Inverse reconstruction gives a generating pair and recovers its orbit, including the raw
  second residue; the two composites are identities on orbit and parameter sets.
- The Γ₁-to-Γ₀ map is the displayed residue-unit orbit quotient, with inverse diagonal action
  also in determinant one; replacing it by independent square-unit quotients is not permitted.
- Scalar x ∈ Fˣ sends (𝔰,𝔐,ā,c̄) to (x𝔰,𝔐,xā,xc̄). Taking this quotient gives precisely
  the projective cusp set. The ideal itself remains a parameter until this step; the
  resulting projective formulas agree with §1.4.

**Checks.**

- At level one both residue factors have one generator (also for the zero quotient module).
  Raw orbits retain 𝔰; only after Fˣ scaling does this become its ordinary ideal class.
- For R = ℤ[φ], φ² = φ+1, 𝔑 = (3), 𝔟 = R and u = φ², the vectors (0,1) and (0,u)
  have 𝔰 = 𝔐 = R but second residues 1 and u. Their difference u−1 = φ is a unit,
  so they are distinct modulo 3 and cannot be Γ₁-equivalent (a carrying matrix needs d = u).
  This also tests Γ₁¹, since u is a positive unit square. After scalar quotient both give [0:1].
- In the same example diag(u⁻¹,u) ∈ Γ₀¹ carries (0,1) to (0,u); the residue action
  with x = u⁻¹ identifies their raw Γ₀¹ parameters, as required.
- For level a prime, the two divisors R and 𝔭 give the zero and infinity cusp rows.
- W₁ sends (1:0) to (0:1), exchanging 𝔐 = 𝔑 and R; leaving 𝔐 fixed reverses the
  Γ₁ convention change.

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
count for a single component `X₀(𝔑)_𝔟`, `h · Σ_{𝔐∣𝔑} φ_{>0}(𝔐 + 𝔑/𝔐)`, its fibre
`h · φ_{>0}(𝔐 + 𝔑/𝔐)` over each divisor `𝔐` (a torsor under `(R/(𝔐 + 𝔑/𝔐))^×/R^×_{>0}` for
each ordinary class of `𝔰`), its independence of `𝔟`, and the level-one bijection of each
component's `h` cusps with `Cl(R)` through `𝔰` are HilbertModularForms §1.4 (its divisor `𝔞`
and modulus `𝔤_𝔞 = 𝔞 + 𝔑𝔞⁻¹` are `𝔐` and `𝔐 + 𝔑/𝔐`); the sum over the `h⁺` components gives
the total. Owned here: the identification of its divisor with the invariant `𝔐` of 1.2, the
`sl` count with `φ¹`, and the description of the fibres by `Q₀(𝔐, 𝔑)` and its `Γ₁` analogue.
The target cuspCount v₁ v₂ P of a prefix `P` (7.1) is the number of `PΓ`-orbits in `ℙ¹(F)`
(1.1) for the group `Γ` of `P`, the LMFDB's `nb_cusps`; it is the cardinality of the multiset
cuspData of 1.5. It is specified in this README only: the orbits need the groups of
HilbertModularForms §1.2, and no Lean declaration here states it.
*Needs:* 1.3; HilbertModularForms §1.4; GlobalNumberFields Layer 2.

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
| `Γ₀¹(𝔑)_𝔟` | `𝔰⁻²𝔟⁻¹𝔑(𝔑 + 𝔐²)⁻¹` | `{v² : v ∈ R^×, v² ≡ 1 mod 𝔐 + 𝔑/𝔐}` |
| `Γ₁¹(𝔑)_𝔟` | `𝔰⁻²𝔟⁻¹(𝔑/𝔐)` | `{v² : v ∈ R^×, v ≡ 1 mod 𝔑𝔐(𝔑 + 𝔐²)⁻¹}` |
| `Γ₁(𝔑)_𝔟`, `𝔑` squarefree | `𝔰⁻²𝔟⁻¹(𝔑/𝔐)` | `{v ∈ R^×_{>0} : v ≡ ε mod 𝔑/𝔐, some ε ∈ U}` |

with `U = {u ∈ R^× : u ≡ 1 mod 𝔐}`. The conjugating matrix is
`γ = (λ μ; −c a) ∈ GL₂⁺(F)` with `λ ∈ 𝔰⁻¹`, `μ ∈ 𝔰⁻¹𝔟⁻¹`, `λa + μc = 1`, `det γ = 1`
(Lemma 3.3.5; van der Geer, Proposition I.1.1), for a representative `(a : c)` with `𝔰`
coprime to `𝔑` (1.2). The last row is for the pinned `Γ₁` (`d ≡ 1`): the lower-right entry of
the stabilizer element `γ⁻¹(v m; 0 1)γ` of Assaf et al. (3.3.10) is `1 + μc(v − 1) + acm`.
At `𝔭 ∣ 𝔐` it is `≡ 1 mod 𝔭` for every choice of `(λ, μ)`, because `c ∈ 𝔭𝔟𝔰` makes `μc` and
`cm` lie in `𝔭`. At `𝔭 ∣ 𝔑/𝔐` the ideal `c𝔟⁻¹` is a unit, so the pair `(λ, μ)` is first
normalised by Assaf et al.'s affine change of variables (3.3.11), `(λ, μ) ↦ (λ − xc, μ + xa)`,
to have `λ ∈ 𝔭𝔰⁻¹`; then `μc = 1 − λa ≡ 1 mod 𝔭`, the lower-left condition `λ(v − 1) − cm ≡ 0`
becomes `m ∈ 𝔭𝔰⁻²𝔟⁻¹` locally, and the entry is `≡ v mod 𝔭`. (Without the normalisation the
entry is `1 + μc(v − 1) + acm` with `μc ≡ 1 − λa` depending on `(λ, μ)` when `a` is a unit at
`𝔭`; the set `V` does not depend on the choice, the sketch does.) So the roles of `𝔐` and
`𝔑/𝔐` in `V` are those of Assaf et al., Proposition 3.3.8(d), exchanged (their group has
`a ≡ 1`); `M` is unchanged. For `Γ₁¹` the two forms of `Γ₁` agree, since `ad ≡ 1 mod 𝔑`
there. At level one on component `𝔟` the cusp `(1 : 0)`
has `M = 𝔟⁻¹`, `V = R^×_{>0}` (`Γ₀`) or `V = R^{×2}` (`Γ₀¹`). The multiplier ring of `M` is `R`
in every row, so `U_M^+ = R^×_{>0}`. *Needs:* 1.2, 1.3; §0.3, HilbertModularForms §1.4 (the translation lattice and unit group of a `Γ₀` cusp stabilizer) and the all-level affine construction below (compare ShimuraCompactifications §8.56 in its tame range).

The target cuspData v₁ v₂ P of a prefix `P` is the multiset, over the cusps of the surface of
`P` (one entry per `PΓ`-orbit in `ℙ¹(F)`), of their full affine stabilizers. For the groups of the table the split forms yield
`CuspDatum F` values as above. At every other admitted level use the following construction. It is specified in
this README only, because the analytic cusp quotient is a construction of the library.

**Checks.**

- (computation) — at level one on the trivial component, the `Γ₀` datum of the cusp `(1 : 0)`
  is `G(R, U_R^+)`, the level-one datum; for `Γ₀¹` it is `G(R, R^{×2})`.
- (computation) — over `ℚ(√5)` the two cusps of `Γ₀(𝔭₂)` have the data `G(2R, U_R^+)` (cusp
  `(0 : 1)`, `𝔐 = R`) and `G(R, U_R^+)` (cusp `(1 : 0)`, `𝔐 = 𝔭₂`), both with period `(3)` and
  repetition = 1.
- (repetition) — over `ℚ(√3)` at level one, repetition = 2 for `sl` and `1` for `gl` on both
  components; over `ℚ(√5)`, where `N(ε) = −1`, it is `1` for both ambient types.
- For Γ₁(4) and full level Γ(4) on the trivial component, the cusp at infinity has
  translation lattice R and 4R respectively. These are different even though the same
  field and level are used; the affine definition admits both.

For every i ∈ {0,1,full}, both ambient types, and every nonzero 𝔑, choose g ∈ GL₂⁺(F)
sending a cusp to infinity. Define H as the image of gΓg⁻¹ ∩ B in the affine group
F ⋊ Fˣ, sending (a b;0 d) to (b/d,a/d). Define M = {t : (t,1) ∈ H} and V as the image
of its slope map. For `Γ₀(𝔑)_𝔟`, `M` is the translation lattice and `V` the unit group of the
cusp stabilizer in HilbertModularForms §1.4, a full lattice and a subgroup of finite index in
`R^×_{>0}`; for the other groups of convention 2, whose images in `PΓ₀(𝔑)_𝔟` have finite
index (1.1), prove that `M` has finite index in that lattice and `V` in that unit group, so that M is a full rank-two
lattice and V is a finite-index subgroup of its positive multiplier units. The exact sequence 0 → M → H → V → 1 retains the translation
class τ(v) ∈ F/M, with τ(vw) = τ(v)+vτ(w). This datum, including τ, is the general cusp
record; it is not defined by the four split formulas alone (Assaf et al., §3.3,
(3.3.1)–(3.3.4); ShimuraCompactifications §8.56 for the tame comparison).

The affine API includes:

- Multiplication is (t,v)(s,w) = (t+vs,vw), and inverse is (−v⁻¹t,v⁻¹).
- Changing a lift changes t by M and preserves the character phase exp(2πi Tr(ξt))
  for ξ in the trace-dual lattice; pullback sends q^ξ to exp(2πi Tr(ξt))q^(vξ).
- V is infinite cyclic. For a lift (t,v) of its generator v ≠ 1, translating the coordinate
  by −t/(1−v) conjugates H to G(M,V); changing this choice changes the chart by an
  isomorphism. Thus the resolution of §2.4 is defined also when the original coordinates
  have nontrivial phases. This is a complex analytic splitting, not an integral splitting.

**Checks.**

- For (t,v) = (1,2+√3), conjugation by s = −1/(1−v) changes t to t+(1−v)s = 0;
  the denominator is nonzero. Pure translation (1,1) has no such normalization.
- At infinity for Γ₁(4), (1,1) is a translation and M = R; for Γ(4) it is excluded
  and (4,1) is a translation, giving M = 4R. Both branches have defined data.
- Composition of (1,v) and (2,v) gives translation 1+2v and slope v²;
  discarding τ before applying character pullback loses exp(2πi Tr(ξ(1+2v))).

### Examples

The two Γ₀(2) cusps over ℚ(√5) have M = R and 2R. At level (4), Γ₁ and full level have distinct infinity lattices R and 4R.

### Dependencies

Layer 0; HilbertModularForms §§1.2, 1.4; GlobalNumberFields Layers 2 and 11; ShimuraCompactifications §8.56 only for the tame comparison.

## Layer 2: Hirzebruch–Jung continued fractions and the cusp resolution

### 2.1 The minus continued fraction of a rational

hjExpansion (n r : ℕ) : List ℕ for `0 < r < n`, `gcd(n, r) = 1`: the finite expansion
`n/r = [[b_1, …, b_ℓ]]` of convention 6, with `b_i ≥ 2`; hjLength n r = ℓ; the recurrence
`n/r = b_1 − r′/r` with `r′ = b_1 r − n`, `0 ≤ r′ < r`; terminate when r′ = 0, and use 0 < r′ only at a nonterminal step; the matrix form
`(n, r) ↦ ∏ (b_i, −1; 1, 0)`; the symmetry hjExpansion n r′ = reverse (hjExpansion n r) for
`rr′ ≡ 1 mod n`; the comparison with Mathlib's regular continued fraction of `n/r` (a regular
partial quotient `a` contributes `a − 1` entries `2` after an entry `b + 1`); and the values
hjExpansion 3 1 = [3], hjExpansion 3 2 = [2,2], hjExpansion 5 2 = [3,2],
hjExpansion 5 3 = [2,3], hjExpansion 6 5 = [2,2,2,2,2], hjExpansion 12 5 = [3,2,3],
hjExpansion 12 7 = [2,4,2], by the displayed finite formulas. *Needs:* Mathlib `GenContFract`.

The rational expansion API includes termination, entries at least two, evaluation back
to n/r, invariance under common scaling, and reversal for the inverse residue class
(Fulton, §2.6; Hirzebruch 1973, §2.5, equation (19)).

**Checks.**

- (3,1) has b₁ = 3 and r′ = 0, hence expansion [3]; a strict-positive remainder loses this case.
- (5,2) has b₁ = 3 and r′ = 1, then (2,1) terminates, giving [3,2] and 3−1/2 = 5/2.
- 2·3 ≡ 1 mod 5 gives [3,2] reversed to [2,3]; (4,2) reduces to [2], while
  the totalized values at r = 0 or r ≥ n are empty and are outside the geometric theorem.

### 2.2 The minus continued fraction of a quadratic irrational

Extend AutomorphicSpectralTheory §4.17a’s maximal-order narrow-ideal-class cycle to full
ℤ-lattices in F with arbitrary multiplier order, retaining the surface cusp interpretation.
For a lattice that is a fractional R-ideal, identify the resulting cyclic period with that
supplier’s period under its oriented ideal-class correspondence.

`hjStream v₁ (w : F) : ℕ → F` for `w ∉ ℚ` in the real quadratic field `F`, with digits
`hjDigit v₁ w j = ⌈v₁(w_j)⌉`. A quadratic irrational `w` is **reduced** (`IsReduced v₁ v₂ w`) when
`v₁(w) > 1` and `0 < v₂(w) < 1`; the period of a purely periodic stream is `hjPeriod v₁ w`. Theorems: the stream of any `w` is eventually reduced; the expansion of a reduced
`w` is purely periodic; the period length `d` is the length of the cycle of reduced elements, and
`w_1 w_2 ⋯ w_d = ε_M⁺` is the fundamental totally positive unit of the multiplier ring of
`M = ℤ + ℤw`; conversely every element of the cycle is reduced with the same multiplier ring.
Equivalently: for an oriented basis `(x, y)` of `M`, `w = x/y`, for a reduced quotient the period is the sequence of digits for which the consecutive vertices `A_j` of the convex hull of `M ∩ (ℝ_{>0})²` satisfy
`A_{j−1} + A_{j+1} = b_j A_j` (van der Geer, Chapter II, §2). Among oriented bases whose quotient is reduced, the period is independent up to cyclic rotation; and replacing `M` by `αM` with `α ≫ 0` leaves it unchanged, while `α` of mixed
sign reverses the orientation and gives the period of the **dual** lattice (2.7). *Needs:*
2.1; Mathlib `Pell` and 0.1 for the unit; Tau Ceti `IsTotallyPositive`;
AutomorphicSpectralTheory §4.17a for the maximal-order construction and comparison. (`hjPeriod_ne_nil_of_isReduced`.)

The simple definitions `hjStream`, `hjDigit`, `IsReduced` and `hjPeriod` use only a field
and the displayed real embeddings; the period theorems explicitly assume a degree-two number
field, distinct embeddings and irrational w. The group `multiplierUnits` is defined on any
ℤ-submodule by positivity and the equivalence m ∈ M iff um ∈ M. Their API includes:

- Each nonterminal stream step satisfies `(b_j - w_j) * w_(j+1) = 1`; irrationality makes its denominator nonzero.
- Reducedness is preserved by the successor, and a reduced irrational returns in a least positive period.
- In `hjPeriod_ne_nil_of_isReduced`, the product of the complete quotients ε is a unit, v₁(ε) > 1,
  εM = M for M = ℤ{1,w}, and every positive multiplier is ε^n for some n ∈ ℤ
  (Hirzebruch 1973, §2.5, lemma preceding (19), and §2.6).

**Checks.**

- For D = 28 the maximal-order principal class gives the supplied cycle (3,6):
  w = (3+√7)/2 has successor 3+√7 and next successor w, so the length is 2,
  the digit-minus-three sum is 3 and the product is (3+√7)²/2 = 8+3√7, of norm 1.
  For the nonmaximal order ℤ[√5], w = 3+√5 gives cycle (6,2,2,2), length 4 and
  multiplier 9+4√5; using the maximal-order unit (3+√5)/2 would not preserve this lattice.
- w = 2+√3 has digit 4 and successor 1/(2−√3) = 2+√3. Its conjugate is 2−√3 ∈ (0,1),
  its period is [4], and its product is the fundamental multiplier 2+√3.
- The positive multiplier 7+4√3 is ε², but its powers omit ε; positivity and lattice
  preservation alone therefore do not characterize the generator.
- w = 1 is not reduced and has successor 0 under totalized inversion; w = 0 returns to 0
  and has period [0]. Irrationality excludes both junk values from the period theorem.

### 2.3 The cycle of a cusp datum

`CuspDatum F`: a `ℤ`-lattice `M : Submodule ℤ F` of rank two together with a subgroup
`V ≤ multiplierUnits M` (the totally positive `u ∈ F^×` with `uM = M`, that is `U_M^+`) of finite
index repetition = k = [U_M^+ : V] (`Subgroup.relIndex`); the orientation is supplied by the
ordered embeddings `v₁ v₂`, which every function of a datum takes. Its period v₁ v₂ : List ℤ
is the period of v₁(x/y) for an oriented basis with reduced quotient, its
resolutionCycle v₁ v₂ : List ℤ is the sequence `(−b_1, …, −b_d)` repeated `k` times of
convention 7, a cyclic sequence recorded as a list (two rotations of the list are the same cycle;
the LMFDB's starting point is not a target), its cycleLength = dk and its
cycleSum = Σ (2 − b). The level-one `Γ₀` datum `G(R, R^×_{>0})` is the datum with M = R and V = U_M⁺. Theorems: `k` is the least `k ≥ 1` with
`(ε_M⁺)^k ∈ V`; `dk = 1` iff `d = 1` and `V = U_M^+`; for the data of 1.5 at level one,
`k = 1` for `Γ₀` and `k = [R^×_{>0} : R^{×2}]` for `Γ₀¹`; for `Γ₀(𝔑)_𝔟` in general `k` is the
order of `ε⁺` in `(R/(𝔐 + 𝔑/𝔐))^×`. *Needs:* 2.2, 1.5.

The cusp-datum API includes:

- `IsOriented` is the strict determinant inequality; swapping its basis vectors reverses the sign.
- `CuspDatum.repetition` is positive because V has finite nonzero relative index.
- `CuspDatum.period` is independent, as a Cycle, of the oriented basis with reduced quotient;
  `CuspDatum.resolutionCycle` is invariant under cyclic relabelling of that choice
  (Hirzebruch 1973, §2.5, theorem; Assaf et al., (3.3.1)–(3.3.4)).

**Checks.**

- In ℤ[√3], (2+√3,1) has orientation determinant 2√3 > 0, whereas (1,2+√3)
  has determinant −2√3. The periods for the lattice and twice the lattice are both [4].
- V = ⟨(2+√3)²⟩ has index 2, giving cycle [−4,−4], length 2 and sum (2−4)+(2−4) = −4.
- The zero lattice has rank 0 and is excluded. ℤ[1/2]+ℤ√3 has rank 2 but is not finitely
  generated, so rank alone would admit an invalid cusp datum; V = {1} has infinite index.

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
al. quote in §3.3). *Needs:* §2.3; ShimuraCompactifications §0.13 (possibly infinite arithmetic cone systems),
§§2.1–2.8 (controlled analytic charts, full stabilizer quotients and their projective
algebraization); ShimuraVarieties §§2.5, 2.7 for the minimal compactification; the finite
regular toric charts of AnalyticToricGeometry Layers 2–3.

Prove the all-level cusp comparison: for each group of §0.3, every nonzero level, and each
cusp, the analytic germ of its Baily–Borel compactification is the germ obtained by adjoining
the cusp to the full affine quotient of §1.5. The arithmetic cone system on the positive cone
has rays through consecutive lattice vertices and finitely many V-orbits; apply the general
arithmetic quotient neighbourhood theorem, retaining the translation cocycle. Its toroidal
germ is the quotient of the controlled open toric union by H, and after the analytic splitting
of §1.5 its exceptional divisor is the asserted cycle. This comparison agrees with
ShimuraCompactifications §§8.25 and 8.38 wherever their tame hypotheses hold. It imposes no
coprimality with 6D (Hirzebruch 1973, §§2.1–2.5; Assaf et al., §3.3).

**Checks.**

- In ℚ(√3), the rays through (2+√3)^j for j ∈ ℤ are all distinct: their slope ratios
  are (2+√3)^(2j). There is one orbit under multiplication by 2+√3, not one cone in total.
- In ℚ(√5), levels (2), (3), and the ramified prime (√5) are all admitted. Their norms
  are 4, 9 and 5, so the Γ₀ indices are 5, 10 and 6; no invertibility of these levels is
  used over ℂ.
- The single cycle (−4) is nodal with square −2, while the repeated cycle (−4,−4)
  has matrix ((−4,2),(2,−4)); treating the node as a smooth (−4)-curve is wrong.

The identification of the toroidal boundary over `σ` with the Hirzebruch cycle is the
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
`K·S_i = b_i − 2`. *Needs:* 2.3, 2.4; Tau Ceti `PlumbingGraph.IsNegativeDefinite`;
SchemeAndStackFoundations §5.10 (adjunction).

The matrix API includes symmetry, permutation congruence under cyclic relabelling and
reversal, and `CuspDatum.cycleIntersectionMatrix_negDef` on actual cusp data
(Hirzebruch 1973, §2.4). The arithmetic genus uses the whole cycle, including its node.

**Checks.**

- `CuspDatum.cycleIntersectionMatrix` on [−3] is [−1]; its negative has quadratic value 1 on (1).
- On [−2,−4] it is ((−2,2),(2,−4)), with leading principal minors of its negative 2 and 4;
  the cycle has arithmetic genus 0+0+2−2+1 = 1.
- The fake cycle [−2,−2] gives value 0 on (1,1) for the negative matrix; [−2] gives [0].
  Both are excluded because a genuine period has a digit greater than 2.

### 2.6 The cusp contributions

For a surface with cusps `σ` of cycles `(b_{σ,1}, …, b_{σ,r_σ})`: `ℓ_cusp = Σ_σ r_σ` (the LMFDB's
`len_cusp_res`) and `Σ_σ Σ_k (2 − b_{σ,k})`. For `Γ₀(𝔑)_𝔟` the cycles of all cusps are determined by
1.4–1.5 and 2.3, so both numbers are functions of `(F, 𝔑, [𝔟], type)`. The targets of a prefix
`P` are lenCuspRes v₁ v₂ P, the sum of CuspDatum.cycleLength over cuspData v₁ v₂ P, and
cuspSum v₁ v₂ P, the sum of CuspDatum.cycleSum over it; they are specified in this README
only, since cuspData is (1.5). *Needs:* 1.4, 1.5, 2.3.

**Checks.**

- (computation) — `2.2.5.1-1.1-1.1-gl-0`: cycle `(−3)`, `ℓ_cusp = 1`, cusp sum `−1`;
  `2.2.8.1-1.1-1.1-gl-0`: cycle `(−2, −4)`, `ℓ_cusp = 2`, cusp sum `−2`.
- (two cusps) — over `ℚ(√5)`, `Γ₀(𝔭₂)`: two cycles `(−3)`, `ℓ_cusp = 2`, cusp sum `−2`.
- (ambient type) — over `ℚ(√3)` at level one, the `gl` components have the cycles `(−4)`
  (`ℓ_cusp = 1`, cusp sum `−2`) and `(−2, −3)` (`ℓ_cusp = 2`, cusp sum `−1`); the `sl`
  components, with `k = 2`, have `(−4, −4)` (`ℓ_cusp = 2`, cusp sum `−4`) and
  `(−2, −3, −2, −3)` (`ℓ_cusp = 4`, cusp sum `−2`).

### 2.7 Dual cusps and coordinate reversal

Interchanging v₁ and v₂ reverses the cyclic order of a positive-cone resolution, so its
sum of digits minus three is unchanged. Define instead the dual cusp datum by M′ = βM with
v₁(β)v₂(β) < 0 and V′ = V (multiplication by β identifies the multiplier rings, so
`U_{βM}^+ = U_M^+` and `V` is again admissible). Its periods
are dual in Hirzebruch's sense: a cyclic block (b,2,…,2), with b ≥ 3 and m following twos,
contributes a run of b−3 twos followed by m+3 to the dual cycle. Prove
`CuspDatum.period_dual`: for every datum `E` whose lattice is `βM`, the sums of digits minus
three of the periods of the two data are opposite; the period depends on the lattice alone, so
the theorem carries no hypothesis on the multiplier group of `E`, and the dual datum is the
instance `V′ = V`. This is a statement
about the opposite-sign quadrant, separate from Galois transport of (𝔑,𝔟)
(van der Geer, Chapter II, §2, continued-fraction duality; Hirzebruch 1973, §2.5 for the
positive-cone cycle and reversal under conjugation). *Needs:* §§2.2–2.3.

**Checks.**

- For M = ℤ[√3], the bases (2+√3,1) and (2−√3,1), in the respective embedding orders,
  both have period (4). Their sums are 1 and 1, excluding the negative sign for a swap.
- For β = √3, the basis (3,3−√3) of βM has quotient (3+√3)/2 and period (3,2).
  The dual sums are 1 and −1, and 1 = −(−1).
- The dual of (3,6) is (3,3,2,2,2); the sums are 3 and −3. Duality applied twice
  recovers the original cyclic sequence, whereas coordinate reversal just reverses it.

### Examples

The period [4] gives a nodal curve; its square repetition gives a double edge. Its negative-norm dual is [3,2], while coordinate reversal preserves its digit sum.

### Dependencies

§§2.1–2.3 use lattice arithmetic, the unit theorem and AutomorphicSpectralTheory §4.17a
for the maximal-order period and its comparison. The geometric comparison uses Layer 1, ShimuraCompactifications §0.13 and §§2.1–2.8, and ShimuraVarieties §§2.5, 2.7.

## Layer 3: elliptic points

### 3.1 Elliptic points, isolation, order

An element `γ ∈ GL₂⁺(F)` is elliptic iff `tr(γ)² − 4det(γ)` is totally negative; it then has a
unique fixed point in `ℍ²` (one in each factor); an elliptic point of `Γ` is the fixed point of an
elliptic element of `Γ` (knowl `hmsurface.elliptic_point`). The stabilizer in `PΓ` of a point of
`ℍ²` is finite cyclic; the elliptic points form a discrete `Γ`-invariant set with finitely many
orbits; the image of an elliptic point of order `q` in `Y(Γ)` is a cyclic quotient singularity of
order `q`, and `Y(Γ)` is smooth elsewhere. The linearisation: the stabilizer acts on `T_zℍ²` by a
pair of primitive `q`-th roots of unity, so every elliptic point is an isolated fixed point and
has a type `(q; a, b)` with `gcd(a, q) = gcd(b, q) = 1`. *Needs:* 0.4; FuchsianOrbifolds Layer 1
(the one-variable chart) applied in each factor; ComplexManifolds Milestone 4.

The elliptic-point API includes independence of a scalar lift, finiteness of stabilizers
and invariance of projective order under conjugation (Assaf et al., §4.1).

**Checks.**

- γ = (0,−1;1,0) has discriminant −4, fixes (i,i), and has projective order 2.
- The identity has discriminant 0 and is not elliptic under this definition.
- The translation (1,1;0,1) has discriminant 0 and fixes only the cusp infinity,
  whereas diag(2,1) has discriminant 1 and is not elliptic.

### 3.2 The CM-order dictionary

For an elliptic point `z` with stabilizer generated by `γ̄`, lifted to `γ ∈ Γ` with
`det γ ∈ R^×_{>0}` (normalised in a fixed set of representatives of `R^×_{>0}/R^{×2}` containing
`1`): `K = F(γ)` is a CM quadratic extension of `F`, `R[γ]` is a starting suborder. Set `𝒪 = 𝒪₀(𝔑)_𝔟 = (R 𝔟⁻¹; 𝔑𝔟 R)` and take
the full order S = K ∩ 𝒪 in this matrix embedding. For Γ = Γ₀ or Γ₀¹, prove that elliptic
points modulo Γ correspond bijectively to Γ-conjugacy classes of pairs {φ,φ̄} of **optimal**
embeddings φ : S ↪ 𝒪 of CM R-orders, modulo R-algebra isomorphism of the source order.
Optimal means φ(S) = φ(K) ∩ 𝒪, and φ̄ is precomposition with the nontrivial K/F involution.
Require the actual projective stabilizer Sˣ/Rˣ for Γ₀, or μ(S)/{±1} for Γ₀¹, to be nontrivial;
the order-q dictionary requires that group to have order q. Here `𝒪¹ = Γ₀¹(𝔑)_𝔟` and
`𝒪^×_{>0} = Γ₀(𝔑)_𝔟`; every CM unit has totally positive relative norm.
Any embedding of a starting suborder R[γ] extends to its unique optimal overorder
φ⁻¹(φ(K) ∩ 𝒪), and only this full order labels the point (Assaf et al., §4.1,
equations (4.1.2)–(4.1.3), p. 13).
Lemma 4.1.1: if `det γ = 1`, `R[γ] ≅ R[ζ]` with `ζ` a primitive root of unity of order `2q` and
`ζ + ζ⁻¹ ∈ F`; if `det γ = u ∉ R^{×2}`, then `2 ∣ q` and `γ² = uζ` with `ζ` of order `q`,
`ζ + ζ⁻¹ ∈ F`. *Needs:* 3.1; GlobalNumberFields Layer 11 (`NumberFieldOrder`).

The CM dictionary includes:

- Scalar normalization and changing the stabilizer generator leave K ∩ 𝒪 unchanged.
- Conjugating the embedding by Γ transports the unique upper-half-plane fixed point;
  precomposing by the CM involution gives the same point.
- Passing from a starting suborder to its optimal overorder preserves that point and recovers
  its full stabilizer; relative norm agrees with determinant.

**Checks.**

- For R = ℤ[√2] and A = (0,−1;1,√2) in M₂(R), A² = √2 A−I and A⁴ = −I.
  The optimal order R[A] ≅ ℤ[ζ₈] contains R[A²] ≅ R[i] with index `|N_{F/ℚ}(√2)| = |−2| = 2`.
  Both fix ((−√2+i√2)/2,(√2+i√2)/2), but the latter embedding is nonoptimal:
  its field intersection with M₂(R) is R[A]. Thus this is one order-four point, not also
  an order-two point. Optimal embeddings of R[i] elsewhere still contribute when their
  full projective stabilizer has order two.
- For u = 2+√3 and γ = (0,−u;1,0), det γ = u and γ² = −uI. With ζ = −1,
  the corrected equality reads −u = −u, and both relative norms are u² = 7+4√3.
- The inverse-unit expression would have norm u⁻² = 7−4√3, a different number.
- For determinant 1, γ = (0,−1;1,0) generates F(i) and satisfies γ² = −1;
  a scalar matrix has discriminant 0 and cannot define this CM quadratic algebra.

### 3.3 The possible orders

For `Γ₀¹(𝔑)_𝔟` (and every subgroup of `SL₂(F)` commensurable with it) the order of an elliptic
point lies in `{2, 3, 4, 5, 6}`: `ℚ(ζ_{2q} + ζ_{2q}⁻¹) ⊆ F` forces `2q ∈ {4, 6, 8, 10, 12}`, with
`q = 4` only for `D = 8`, `q = 5` only for `D = 5`, `q = 6` only for `D = 12` (Assaf et al.,
Lemma 4.1.1(a), preprint p. 13; van der Geer, Chapter I, §5; Prestel, §8). For `Γ₀(𝔑)_𝔟` the
orders lie in `{2, 3, 4, 5, 6, 12}`: the second case, Lemma 4.1.1(b) (a generator of
determinant `u ∉ R^{×2}_{>0}` has `2 ∣ q` and `γ² = uζ` with `ζ + ζ⁻¹ ∈ F`, as in 3.2; the
lemma's display writes `u⁻¹ζ`, which the Check `γ = (0, −u; 1, 0)`, `γ² = −uI` of 3.2 excludes), adds
`q ∈ {2, 4, 6, 12}` with `ζ ∈ {−1, ±i, ζ_6^{±1}, ζ_{12}^{±1}, ζ_{12}^{±5}}` and a non-square
totally positive unit `u`, which exists only when `N(ε) = 1`; `q = 8, 10` cannot occur because
`ℚ(√2)` and `ℚ(√5)` have `N(ε) = −1`. The order `q = 12` is proved here, not in the sources:
Lemma 4.1.1(b) bounds `q ≤ 6` in this case too, but for `F = ℚ(√3)` the unit
`γ = ζ_{12}(1 + i)/(1 + √3) ∈ ℤ[ζ_{12}]^×`, with `γ² = ζ_{12}^5 ε⁻¹` and relative norm
`ε⁻¹ = 2 − √3`, has projective order `12` and its class generates `ℤ[ζ_{12}]^×/R^× ≅ ℤ/12`, so
multiplication by `γ` on the `R`-lattice `ℤ[ζ_{12}] ≅ R²` is an elliptic element of
`Γ₀(1)_R` of order `12`. Hence the LMFDB's per-order counts `nb_ell2, …, nb_ell6` exhaust the
`sl` surfaces and all `gl` surfaces except those over `ℚ(√3)`, for which the order `12` is also
recorded here. *Needs:* 3.2; Mathlib cyclotomic fields, 0.1.

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

where `S` runs once over the isomorphism classes of full orders in the optimal dictionary of 3.2 in all CM extensions `K/F` (only `F(i)`, `F(√−3)`,
`F(ζ_5)` for `D = 5`, and `F(√−ε⁺)` for `N(ε) = 1` carry such orders), and the local **optimal** embedding
number `m(Ŝ, 𝒪̂; 𝒪̂^×) = ∏_{𝔭 ∣ 𝔑} m_𝔭(S, 𝒪; 𝒪^×)` is `1` at level one. The counts are the same
on every component `𝔟`. For `h = 1` and level one the formula reads
`m_q⁺ = ½ Σ_S h(S) [R^× : R^×_{>0} N_{K/F}(S^×)]` and
`m_q¹ = ½ Σ_S h(S) [R^× : N_{K/F}(S^×)]`, which is how the worked examples below were computed.
*Needs:* 3.2; GlobalNumberFields Layer 11 (`Pic` of an order, conductors); Voight,
*Quaternion Algebras*, Corollary 31.1.10,
Lemma 30.3.14, Proposition 39.4.12.

The order-count API includes invariance under R-algebra isomorphism, factorization of the
local embedding product, and compatibility of conductor enlargement with the unit index.
Index by the optimally embedded order S itself and its actual stabilizer-order condition;
a proper starting suborder does not contribute a second copy of the same point
(Assaf et al., equations (4.1.5), (4.2.2), Proposition 4.2.3; Voight, Proposition 39.4.12).

**Checks.**

- At conductor R, the empty Euler product is 1, the unit index is 1 and h(S) = h(K).
- Over ℚ, the order ℤ+2ℤ[i] has h = 1·2·(1−0/2)/2 = 1; omitting the unit index gives 2.
- For F = ℚ(√3) and K = F(i), Q(K) = 2 and #μ(K) = 12. At level one h(K) = h(F) = 1,
  the sl order-six count is (2/1)·1/2 = 1. This fixes the denominator Q(S).

### 3.5 Local embedding numbers at the level

Let A be a complete discrete valuation ring with finite residue field, fraction field L,
and maximal ideal 𝔭. Let K be a separable quadratic L-algebra (including L × L), S = A[γ]
a quadratic A-order with fraction algebra K, and O = ((A,A),(𝔭^e,A)) ⊂ M₂(L) an Eichler
order, e ≥ 0. Write f_γ(T) = T²−tT+n and d = t²−4n, and for s ≥ 1 put
M(s) = {x ∈ A/𝔭^s : f_γ(x) = 0}. Count optimal A-algebra embeddings S → O modulo Oˣ.
For e = 0 this count is 1. For e ≥ 1 it is #M(e) if d is a unit, and otherwise
`#M(e) + #image(M(e+1) → A/𝔭^e)` (Voight, version 1.0.7u, Proposition 30.5.3(a),
Proposition 30.6.12, printed pp. 540, 544). This includes residue characteristic two and
conductor-divisible orders; the count is independent of the choice of monogenic generator.
For S maximal and e = 1 it specializes to 1+(K/𝔭) (Lemma 30.6.16).
The global companion-matrix embedding R[γ] → O₀(𝔑) exists exactly when f_γ has a root modulo
𝔑: send γ to ((x,1),(−f_γ(x),t−x)); it is optimal for R[γ]. In the selective case this is the
oriented reference used in §3.8 (Assaf et al., Corollary 4.3.15(a)). *Needs:* §3.4;
local quadratic orders and optimal embeddings, constructed here on native finite free algebras.

The root-set API includes:

- Reduction M(s+1) → M(s), with its image counted as a set, not with lift multiplicity.
- Invariance of the embedding count under conjugation of O and change of generator of S.
- Localization and the product over finite primes; primes of level exponent zero contribute 1.

**Checks.**

- For A = ℤ₂ and S = ℤ₂[i], M(1) = {1}, M(2) = ∅, hence the counts at levels 2 and 4
  are 1+0 = 1 and 0+0 = 0 (Voight, Example 30.6.14).
- Over ℤ₃, the maximal split, unramified and ramified algebras at e = 1 give 2, 0 and 1;
  use T(T−1), T²+1 and T²−3 respectively. The last root 0 modulo 3 has no lift modulo 9.
- The nonmaximal split order ℤ₃[γ] with γ = (0,3) has polynomial T(T−3).
  M(1) = {0}, M(2) = {0,3,6}, whose image has size 1: the count is 2, not 4.

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
the `D ≡ 1 mod 4` row against 3.4 for every `D < 100`.) *Needs:* 3.4; ImaginaryQuadraticClassNumber H1.3–H1.4.

### 3.7 Rotation factors

For an elliptic `γ = (a b; c d)` with `tr γ = t`, `det γ = u`, fixed point
`z_v = (a_v − d_v)/(2c_v) + i√(4u_v − t_v²)/(2|c_v|)`, the rotation factor at `v` is
`ζ_v = (t_v²/(2u_v) − 1) − i·sgn(t_v c_v)√(1 − (t_v²/(2u_v) − 1)²)` (Prestel; Assaf et al.,
(4.3.1)–(4.3.2)); it equals the derivative `u_v (c_v z_v + d_v)⁻²` of `v(γ)` at `z_v` (the
factor `u_v = v(det γ)` is `1` only on `Γ₀¹`), and the type of
`z` is `(q; a, b)` with `ζ_{v₁} = ζ_q^a`, `ζ_{v₂} = ζ_q^b`. Conjugating `γ` by `β ∈ GL₂(F)`
raises the rotation factor to the sign pattern `ε = sgn(det β) ∈ {±1}²`: `ζ′ = ζ^ε`
(componentwise exponent), and for q > 2, `ζ′ = ζ` iff `det β ≫ 0`. At q = 2 both primitive factors are −1, so there is no converse. The reference types of the standard
embeddings of 3.5, for the companion matrix of `ζ` with `ζ` the root of `x² − tx + 1` such that
`v₁(t) = 2cos(π/q)`: `(2; 1, 1)` for `ζ = i`; `(3; 1, 1)` for `ζ = ζ_6`; `(4; 1, 3)` for
`ζ = ζ_8` over `ℚ(√2)`; `(5; 1, 3)` for `ζ = ζ_{10}` over `ℚ(√5)`; `(6; 1, 5)` for `ζ = ζ_{12}`
over `ℚ(√3)`; `(12; 1, 5)` for the unit of 3.3 with `v₁(√3) > 0`. *Needs:* 3.1.

The rotation-factor API includes invariance under scalar lifts, change of generator by
an exponent prime to q, and componentwise inversion under a negative determinant sign
(Assaf et al., equations (4.3.1)–(4.3.3), with the converse restricted to q > 2).

**Checks.**

- For γ = (0,−1;1,0), t = 0, u = 1 and z = i give derivative i⁻² = −1.
- Conjugation by diag(√3,1) has mixed determinant signs but leaves (−1,−1) unchanged.
- For q = 3, inversion changes −1/2+i√3/2 to −1/2−i√3/2, so equality detects
  the positive sign in each embedding.

### 3.8 Distribution of types

Fix a CM extension K/F, an R-order S, and an Eichler order of level 𝔑, with optimal
embeddings locally at every finite prime. The oriented type class group is
`C_𝔑 = Cl⁺(R)/(Cl⁺(R)² · ⟨[𝔭] : ord_𝔭(𝔑) is odd⟩)`.
The selective case is exactly that K is unramified at finite places and every prime with odd
level valuation splits in K. Only in this case use the Artin character C_𝔑 → Gal(K/F).
The sign map is `{±1}²/sgn(Rˣ) ≃ ker(Cl⁺(R) → Cl(R))`, followed by inclusion into Cl⁺(R)
and passage to C_𝔑. It sends a signature to the narrow class of any principal ideal with
that signature. For a reference embedding arising from a root of f_γ modulo 𝔑 as in §3.5,
and conductor 𝔣 of R[γ] in S, the allowed signatures ε satisfy
`Artin(sign(ε)) = Artin([𝔣𝔟])`; their rotation factors are ζ^ε.
Nonzero oriented optimal embedding counts are equal; in the nonselective case every signature
occurs with equal multiplicity, without using an Artin map of Cl⁺ to a ramified extension.
For q > 2 the opposite factors give two types; at q = 2 they give the same type and are counted
once (Assaf et al., Theorem 4.3.11, Lemma 4.3.14, Corollary 4.3.15, with the class group
corrected by the author errata, item (8)). *Needs:* §§3.4, 3.7; GlobalNumberFields Layer 2;
ClassFieldTheory Layers 10–13; Tau Ceti narrow-to-ordinary class map and its kernel.

**Checks.**

- For ℚ(√3), (++), (+−) map respectively to 1 and [(√3)] in the kernel C₂;
  in its nontrivial unramified CM character their Artin values are 1 and −1.
- A prime class with odd level valuation becomes 1 in C_𝔑; so does every square.
  A putative character taking either to −1 cannot descend to C_𝔑.
- At q = 2, (−1)⁻¹ = −1; at q = 3, exp(2πi/3) and exp(−2πi/3) differ by i√3.
  Equal counts of signatures therefore do not give two distinct order-two types.

### 3.9 The Hirzebruch–Jung string and the local Chern cycle

A type is RotationType (`q ≥ 2`, `r < q`, `gcd(r, q) = 1`). For `t = (q; 1, r)`: the string
t.hjString = hjExpansion q r, the chain `C_1, …, C_ℓ` as the `PlumbingGraph`
stringPlumbing t.hjString (the path stringGraph ℓ with weights `−b_i`), negative
definiteness of its intersection matrix, the points `P_i` (RotationType.chernCoefficients) and
the cycle `Z` of convention 13, t.localChernSelfIntersection = c(q; 1, r) = Z² and
t.resolutionLength = ℓ(q; 1, r), with the tabulated values of convention 13,
the swap relation RotationType.IsSwap t t′ (`rr′ ≡ 1 mod q`, the same singularity with the
factors swapped) with `c` and `ℓ` invariant under it, and `c(q; 1, q − 1) = 0`,
`ℓ(q; 1, q − 1) = q − 1` (the `A_{q−1}` singularity).
*Needs:* 2.1; Tau Ceti `PlumbingGraph`.

The local-resolution data API includes invariance of length and Chern square under swapping
tangent factors, negative definiteness of every chain, and the adjunction equations
Z·Cᵢ = bᵢ−2 (Assaf et al., §4.4, equation (4.4.1); Fulton, §2.6).

**Checks.**

- Type (3;1,1) gives [3], P₁ = (1/3,1/3), coefficient −1/3 and square −3·(1/9) = −1/3.
- Type (5;1,2) gives [3,2], coefficients (−2/5,−1/5) and square
  −3·4/25−2·1/25+2·2/25 = −2/5; the swapped type (5;1,3) reverses the chain.
- Type (q;1,q−1) has all coefficients zero and q−1 curves; (4;1,2) is rejected since
  gcd(2,4) = 2. Thus an arbitrary pair of exponents is not a rotation type.

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
points of `Y(Γ)` are exactly the images of the elliptic points. *Needs:* 0.4, 3.1, 3.9; Tau Ceti `Toric.Fan`,
`IsRegularCone`; AnalyticToricGeometry Layers 2–3; FuchsianOrbifolds Layer 1.

### 3.11 The elliptic-point record

For a prefix `P` (7.1) and the ordered embeddings: the finite set ellipticTypes v₁ v₂ P of
types `(q; 1, r)` that occur, the multiplicities ellipticCount v₁ v₂ P t = a(Γ; q, 1, r)
(3.4–3.8), the per-order counts ellipticCountOfOrder q = nb_ell_q = Σ_r a(Γ; q, 1, r), the
total ellipticTotal = nb_ell, and lenEllRes = len_ell_res = Σ a(Γ; q, 1, r) ℓ(q; 1, r).
Here ellipticTypes v₁ v₂ P is the set of normalised types `(q; 1, r)` (convention 9, with the
tangent coordinates in the order `(v₁, v₂)`) of the elliptic points of `PΓ` (3.1), and
ellipticCount v₁ v₂ P t is the number of `PΓ`-orbits of elliptic points of type `t`, zero for
`t` outside ellipticTypes. These targets are specified in this README only: elliptic points
need the groups of HilbertModularForms §1.2 and the projective groups of §0.3, and no Lean
declaration here states them; a type is the rotation datum of §3.9, and `ℓ(q; 1, r)` is RotationType.resolutionLength.
*Needs:* 3.4–3.9.

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

### Examples

The dyadic order ℤ₂[i] gives counts 1 and 0 at levels 2 and 4. The order-two rotation factor is fixed by inversion, whereas an order-three factor is not.

### Dependencies

Layer 0; GlobalNumberFields Layer 11 and ClassFieldTheory Layers 10–13; Layer 2.1 for strings; finite toric charts from AnalyticToricGeometry Layers 2–3.

## Layer 4: the global invariants

### 4.1 The Hilbert modular surface

`X(Γ) → Ȳ(Γ)` is the minimal desingularization: the resolution of 2.4 over each cusp and of
3.10 over each elliptic point, glued along the smooth locus of `Ȳ(Γ)`. `X(Γ)` is a smooth
connected projective surface over `ℂ` (connectedness because `ℍ²` is connected; projectivity
from the projectivity of `Ȳ(Γ)` and the projectivity of blow-ups); it is unique up to unique
isomorphism over `Ȳ(Γ)`; it is the complex analytic surface the LMFDB knowl `hmsurface.hmsurface`
defines. `X_i(𝔑)_𝔟 := X(Γ_i(𝔑)_𝔟)`, `X_i¹(𝔑)_𝔟 := X(Γ_i¹(𝔑)_𝔟)`. *Needs:* 2.4, 3.10;
ShimuraVarieties §§2.5, 2.7; ShimuraCompactifications §§2.7–2.8; §2.4 for the all-level comparison.

The surface API includes the proper birational resolution map, uniqueness over the
normal compactification, and compatibility of the local resolutions on their common smooth
locus (Assaf et al., §6.1; Hirzebruch 1973, §2.5).

**Checks.**

- The D = 5 cusp has one nodal exceptional curve of square −1, not a smooth exceptional curve.
- Its order-three singularity (3;1,2) has two (−2)-curves, whereas (3;1,1) has one (−3)-curve.
- A point with trivial stabilizer outside the cusps has a singleton fibre under the resolution;
  the order-two point has a whole (−2)-curve instead.

### 4.2 Siegel's formula

`siegelZetaMinusOne D := (1/60) Σ_{b ∈ ℤ, b² < D, b ≡ D mod 2} σ₁((D − b²)/4) ∈ ℚ` and the theorem
`ζ_F(−1) = siegelZetaMinusOne D` (`dedekindZeta_neg_one_eq_siegel`), where `ζ_F` is the
meromorphic continuation of Mathlib's `NumberField.dedekindZeta F`; the file states it for any
ζ : ℂ → ℂ meromorphic on ℂ, analytic at −1, and equal to the Dirichlet series on Re s > 1.
The identity theorem fixes the meromorphic germ, and analyticity fixes the value at −1. The value is computed as `riemannZeta(−1) · L(−1, χ_D)` for the
primitive quadratic character `χ_D` of conductor `D` (the identity `ζ_F(s) = ζ(s)L(s, χ_D)` on
`Re s > 1` is ImaginaryQuadraticClassNumber H2.2 for quadratic `K`, here applied to real `F`, and
both sides have the same meromorphic continuation as germs, with analytic values agreeing at −1). The value
`L(−1, χ_D) = −B_{2,χ_D}/2` with `B_{2,χ} = D Σ_{a=1}^{D} χ(a) B_2(a/D)` follows from Mathlib's
`hurwitzZeta_neg_nat` and the decomposition of `L(s, χ)` into Hurwitz zeta functions; Siegel's
closed form is then the classical identity of Siegel (1969) and Zagier (1976), proved by the
Cohen–Zagier manipulation of `B_{2,χ_D}` as a sum over representations `D = b² + 4ac`. Values:
`1/30, 1/12, 1/6, 1/6, 1/3, 1/3, 1/2, 2/3, 1/2, 1, 5/6, 7/6, 4/3, 7/6` for
`D = 5, 8, 12, 13, 17, 21, 24, 28, 29, 33, 37, 40, 41, 44`, by the displayed finite formulas on the finite sum.
For a fundamental D > 1, the sum is positive and 60 times the sum is integral.
The native predicate also admits D = 1; its sum is 0, so D > 1 is essential. *Needs:* Mathlib `DirichletCharacter.LFunction`,
`hurwitzZeta_neg_nat`, `riemannZeta_neg_nat_eq_bernoulli`; ImaginaryQuadraticClassNumber H2.2.

The Siegel-sum API includes rationality, the denominator bound 60, and strict positivity
for fundamental D > 1 (Zagier 1976, §3, equation (17), formula for ζ_K(−1)).

**Checks.**

- D = 5 has b = ±1, hence sum (1+1)/60 = 1/30; D = 8 has b = 0,±2,
  hence (3+1+1)/60 = 1/12.
- D = 1 has no admissible b and sum 0; this excludes positivity without D > 1.
- Updating the genuine continuation at −1 to 0 preserves meromorphy and agreement on
  Re s > 1, but changes 1/30 to 0 for D = 5. It fails analyticity at −1.

### 4.3 Volume and proportionality

`vol(Γ\ℍ²) = 2[Γ¹(1) : Γ] ζ_F(−1) = [Γ¹(1) : Γ] D^{3/2} ζ_F(2)/(2π⁴)` (convention 12; the second
form is the functional equation `ζ_F(−1) = D^{3/2} ζ_F(2)/(4π⁴)` and is a theorem, not a second
definition; at `D = 5`, `ζ_F(2) = ζ(2)L(2, χ_5) = 2π⁴/(75√5)` gives `1/15 = 2ζ_F(−1)`. Assaf et
al. (6.2.2) print `−[Γ(1) : Γ] d_F^{3/2} ζ_F(2)/π^{2n}`, which is right for `n = 1` and off by
the factor `−1/2` for `n = 2`), with
`[Γ¹(1) : PΓ₀¹(𝔑)_𝔟] = [Γ¹(1) : PΓ₀¹(1)_𝔟] · [PΓ₀¹(1)_𝔟 : PΓ₀¹(𝔑)_𝔟] = 1 · N(𝔑)∏_{𝔭∣𝔑}(1 + N(𝔭)⁻¹)`
and `[Γ¹(1) : PΓ₀(𝔑)_𝔟] = N(𝔑)∏_{𝔭∣𝔑}(1 + N(𝔭)⁻¹)/[R^×_{>0} : R^{×2}]`. The generalised index
is defined for every `𝔟`, principal or not: `SL(R ⊕ 𝔟)` and `SL₂(R)` are commensurable, since
for an integer `m ≥ 1` with `mR ⊆ 𝔟 ⊆ m⁻¹R` the principal congruence subgroup of level `m²`
of either lies in both (`(γ − 1)(R ⊕ 𝔟) ⊆ (γ − 1)m⁻¹R² ⊆ mR² ⊆ R ⊕ 𝔟`, so `γ` maps the lattice
`R ⊕ 𝔟` into itself and, having determinant `1`, onto itself; and symmetrically).
Its first factor is `1` by Siegel's theorem (convention 12), and its second factor is the level
index of 0.3 (the two index factors are the ideal index and positive-unit-square index; the target
volume v₁ v₂ P and the theorem volume_gamma0 computing it for gamma type `zero` are specified
in this README only, since `[Γ¹(1) : Γ]` needs the groups of HilbertModularForms §1.2);
the Gauss–Bonnet reading: `vol(Γ\ℍ²)` is the orbifold Euler characteristic of `PΓ\ℍ²` for the
measure `(dx₁dy₁/y₁²)(dx₂dy₂/y₂²)` normalised by `1/(4π²)` (van der Geer, Chapter IV, Theorem
2.1 and §1; Siegel's computation of `vol(SL₂(R)\ℍ²) = 2ζ_F(−1)` in these units, which is the
`sl` normalisation of convention 12 and is uniform in `N(ε)`). *Needs:*
4.2, 0.3; HilbertModularForms §3.2 (the invariant measure and finite covolume).

**Checks.**

- (computation) — `2.2.5.1-1.1-1.1-gl-0`: `vol = 2ζ_F(−1) = 1/15`; over `ℚ(√5)`, `Γ₀(𝔭₂)`:
  levelIndex 𝔭₂ = 5 and `vol = 1/3`.
- (commensurability) — over `ℚ(√10)` with the nonprincipal `𝔟 = (2, √10) = {m + n√10 : m even}`,
  `𝔟⁻¹ = 𝔟/2 = {k + n√10/2}` and `𝔟⁻¹ ∩ R = R`, so `SL(R ⊕ 𝔟) ∩ SL₂(R) = {(a b; c d) ∈ SL₂(R) :
  c ∈ 𝔟}` has index `N(𝔟) + 1 = 3` in `SL₂(R)` and index `3` in `SL(R ⊕ 𝔟)` (it is the
  stabilizer of the line `R²/(R ⊕ 𝔟)` in `𝔟⁻¹(R ⊕ 𝔟)/(R ⊕ 𝔟) ≅ 𝔽₂²`); the generalised index
  `[Γ¹(1) : PΓ₀¹(1)_𝔟] = 3/3 = 1`, as Siegel's equal covolumes require, and `m = 2` works in
  the congruence argument since `2R ⊆ 𝔟 ⊆ R`.
- (ambient type) — over `ℚ(√3)` at level one, unitIndex = 2, `vol = 1/3` for `sl` and `1/6`
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
elliptic point by its string (`+ℓ` to `e`, `+Z²` to `K²` by `K_X = π^*K + Z`). *Needs:*
2.4–2.6, 3.9–3.11, 4.3; SchemeAndStackFoundations §§5.9–5.10 (intersection numbers, adjunction).

The two right-hand sides, as functions K2 v₁ v₂ P and eulerNumber v₁ v₂ P of a prefix, are
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
`ζ_F(−1)` and the multiplicities `a(Γ; q, 1, r)`; some wrong assignments of rotation types give non-integral K² or χ.
Integrality is necessary, not sufficient: §§3.7–3.8 must determine the types independently (see the `D = 12` example). *Needs:* 4.4.

**Checks.**

- At D = 5 the genuine types give (e,K²,χ) = (14,−2,1), all integral.
- Replacing the order-five pair by (5;1,1),(5;1,4) gives (15,−3,1), also all integral;
  §3.7 rejects it, so integrality cannot select the type.
- Duplicating (3;1,1) instead of the genuine order-three pair gives K² = −7/3,
  which integrality does reject.

### 4.6 The irregularity vanishes

`h^{1,0}(X(Γ)) = h^{0,1}(X(Γ)) = 0` and `b₁(X(Γ)) = b₃(X(Γ)) = 0`: a holomorphic `1`-form on
`X(Γ)` restricts to a `Γ`-invariant holomorphic `1`-form `f₁ dz₁ + f₂ dz₂` on `ℍ²` with `f₁`,
`f₂` Hilbert modular forms of weights `(2, 0)` and `(0, 2)`, and the following additional vanishing theorem supplies the conclusion.
For nonnegative integral (k₁,k₂) ≠ (0,0) with a zero entry, every holomorphic Hilbert modular
form is zero. The nonparallel constant terms vanish (HilbertModularForms §2.5), so f is cuspidal and has finite Petersson norm (its §3.4).
Prove, by integration by parts with cuspidal decay, that the norm of the derivative in a
zero-weight variable is zero, hence that derivative vanishes. The dense projection of the
irreducible Hilbert group to the other real factor then forces full constancy, and the nonzero weight forces the constant to vanish. Koecher support
and nonparallel constant-term vanishing alone do not prove the first step (van der Geer,
Chapter I, §4 and Chapter IV, §6). At (0,0), the form 1 remains nonzero; at (2,0) and (0,2),
constancy and the slash transformation force the value 0;
Hodge symmetry gives `h^{0,1} = h^{1,0}` and `b₁ = 2h^{1,0}`, `X(Γ)` being Kähler as a complex
submanifold of projective space (4.1). (Van der Geer, Chapter IV, §6; Assaf et al., §6.3.)
*Needs:* 4.1; §0.5 and HilbertModularForms §§2.3, 2.5, 3.4 (the spaces `M_{(2,0)}`,
`M_{(0,2)}`, the vanishing of their constant terms and the Petersson norm); ComplexKahlerGeometry
K6.1, with K7.2 and K6.0 for the Kähler metric.

### 4.7 Noether's formula and the Hodge diamond

`χ = (K² + e)/12 ∈ ℤ`; `h^{0,0} = h^{2,2} = 1`, `h^{1,0} = h^{0,1} = h^{2,1} = h^{1,2} = 0`,
`h^{2,0} = h^{0,2} = p_g = χ − 1`, `h^{1,1} = e − 2χ`, `b₂ = e − 2`, `p_a = χ − 1`; the signature
`σ(X) = (K² − 2e)/3 = 2 + 2p_g − h^{1,1}`. These are the LMFDB columns chi, h20, h11,
`euler_nb`, K2 and the Hodge diamond the page draws. *Needs:* 4.4–4.6;
SchemeAndStackFoundations §5.10 (Noether's formula); ComplexKahlerGeometry K6.1 (with K7.2, K6.0
as in 4.6).

As targets of a prefix, chi := (K2 + eulerNumber)/12, h20 := chi − 1,
h11 := eulerNumber − 2 chi and arithmeticGenus := chi − 1, all in `ℚ`; they are specified in
this README only, since K2 and eulerNumber are (4.9).

**Checks.**

- (computation) — `2.2.5.1-1.1-1.1-gl-0`: `χ = 1`, h20 = 0, h11 = 12, `p_a = 0`.
- (computation) — `D = 29`: `χ = 2`, h11 = 24, `p_g = 1`; `D = 89`: `χ = 4`, h11 = 44,
  `p_g = 3`.
- (two components) — for `D = 21`, the `sl` components `1` and `[𝔡⁻¹]` have `χ = 1` and `χ = 2`:
  one surface `X₀¹(1)`, two values.
- (convention) — chi is `χ(𝒪_X)`, not `p_a`: for `D = 5` they are `1` and `0`
  (convention 10).

### 4.8 The cusp-form comparison

`Σ_{[𝔟] ∈ Cl⁺(R)} χ(X₀(𝔑)_𝔟) = dim S₂(Γ₀(𝔑)) + h⁺` (Assaf et al., (6.3.1)), where `S₂(Γ₀(𝔑))`
is HilbertModularForms §2.3's component tuple `S_k(𝔑; R)` in parallel weight `2`, whose
dimension is independent of the system `R`: `H⁰(X, K_X)` is the
space of cusp forms of parallel weight `2` on `Γ` (the identification of 0.5,
`p_g = dim S_{(2,2)}(Γ)`, through 4.6 and the vanishing of a holomorphic `2`-form's form at the
cusps), summed over components, and `Σ_𝔟 1 = h⁺`. The same holds with `S₂(Γ₀¹(𝔑))` and the `sl`
surfaces. This is the second acceptance test of a computed record. For `𝔑 = R` the sum is `h⁺`
(so `S₂(Γ₀(1)) = 0`) for `D ∈ {5, 8, 12, 13, 17, 21}`, and the `sl` sum is `h⁺` for
`D ∈ {5, 8, 12, 13, 17}`. The rationality of `X₀¹(1)_{(1)}` (6.4) says nothing about the other
components: for `D = 24, 28, 33` the component `[𝔡⁻¹]` has `χ = 2` for both ambient types, so
`dim S₂(Γ₀(1)) = dim S₂(Γ₀¹(1)) = 1`; for `D = 21` the `sl` sum is `h⁺ + 1`; for `D = 60`
(`h⁺ = 4`) the sums are `8` (`gl`) and `12` (`sl`) (worked examples).
*Needs:* 4.7; §0.5; HilbertModularForms §§2.3, 2.6 and 3.5 (`S_k(Γ)`, the component tuple and
its finite dimension).

### 4.9 The two Chern numbers as invariants of the record

HMSPrefix.K2 v₁ v₂ P, eulerNumber, chi, h11, h20, arithmeticGenus,
lenRes = lenCuspRes + lenEllRes, all as functions of the intrinsic prefix `P` and the ordered
embeddings through cuspData (1.4–1.5, 2.3, 2.6), ellipticTypes and ellipticCount (3.11),
volume (4.3) and the formulas of 4.4–4.7, which are the *definitions* of K2 and
eulerNumber: K2 = 2 volume + cuspSum + Σ_t ellipticCount t · c(t) and
eulerNumber = volume + lenCuspRes + Σ_t ellipticCount t · (ℓ(t) + (q − 1)/q), the sums over
ellipticTypes, with c and ℓ the local invariants of §3.9. They are specified in this README only, since their inputs
need the congruence subgroups of HilbertModularForms §1.2 and the quotient `Γ\ℍ²` of §0.4. The
theorem that they are the geometric invariants of `X(Γ)` is 4.4 together with 4.7.
*Needs:* 4.4–4.8.

**Checks.**

- (computation) — `2.2.5.1-1.1-1.1-gl-0`: `len_res = 1 + 9 = 10`, `e = 14`, `K² = −2`.
- (keyed by the narrow class) — for `D = 21` the two `sl` components give
  `(e, K², χ) = (18, −6, 1)` and `(25, −1, 2)`: the record is a function of `[𝔟]`, not of
  `(F, 𝔑, type)` alone.
- (ambient type) — for `D = 12` the `gl` and `sl` records differ (`e = 15`, `K² = −3` against
  `e = 16`, `K² = −4`), while for `D = 5`, where `N(ε) = −1`, they coincide (0.3).
- (integrality) — every record of gamma type `zero` in the worked examples has `K²`, `e` and `χ`
  in `ℤ` (4.5).

### Examples

The D = 5 record gives e = 14, K² = −2 and χ = 1. An incorrect order-five pair still gives integral values (15,−3,1).

### Dependencies

Layers 1–3; SchemeAndStackFoundations §§5.9–5.10; ComplexKahlerGeometry K6.0–K6.1 and K7.2. Siegel’s value uses only the arithmetic suppliers in §4.2.

## Layer 5: surface-classification inputs

Work with smooth projective surfaces over ℂ. The contraction and configuration statements below
are the geometric inputs to Layer 6; the rationality criterion q = P₂ = 0 is the supplier
contract in Scope and ownership.

### 5.1 Exceptional curves and minimal models

On a smooth projective surface `X` over `ℂ`, an **exceptional curve** is a smooth rational curve
`E` with `E² = −1`; Castelnuovo's contraction theorem: there is a smooth projective `X′` and a
birational morphism `X → X′` contracting `E` to a point and an isomorphism elsewhere, with
`K²(X′) = K²(X) + 1`, `e(X′) = e(X) − 1`, `χ(X′) = χ(X)` (Beauville, Theorem II.17; Hartshorne,
V.3). A surface is **minimal** when it has no exceptional curve; every `X` dominates a minimal
surface by finitely many contractions; for `κ(X) ≥ 0` the minimal model is unique, and
`K²_{min} = K²(X) + (number of contractions)`. The plurigenera and `κ` are birational invariants.
*Needs:* SchemeAndStackFoundations §§5.9–5.10.

The exceptional-curve and minimal-model API includes preservation of the function field,
plurigenera and χ under contraction, and pullback and strict-transform intersection formulas.

**Checks.**

- Blowing up ℙ² once gives (K²,e,χ) = (8,4,1); contracting its exceptional curve gives (9,3,1).
- Blowing up a K3 once gives (−1,25,2); contraction gives (0,24,2), preserving κ = 0.
- A smooth genus-two curve with square −1 is not exceptional: adjunction gives K·C = 3,
  whereas a smooth rational (−1)-curve has K·C = −1.

### 5.2 The Enriques–Kodaira table for `q = 0`

For a minimal smooth projective surface over `ℂ` with `q = h^{1,0} = 0`: `κ = −1` iff the surface
is rational (`ℙ²` or a Hirzebruch surface), and then `χ = 1`, `K² ∈ {8, 9}`; `κ = 0` iff it is an
Enriques surface (`χ = 1`, `K² = 0`) or a K3 surface (`χ = 2`, `K² = 0`); `κ = 1` iff it is an
honestly elliptic surface, and then `K² = 0`, `χ ≥ 1`; `κ = 2` iff it is of general type, and
then `K² ≥ 1`, `χ ≥ 1` (Beauville, Chapters V–VIII, summarised in Assaf et al., Table 1;
apply the supplied Castelnuovo–Zariski criterion when q = P₂ = 0). The
derived definitions, both computable: kodairaPossibilitiesMinimal (χ K² : ℤ) : Finset ℤ is
`{−1, 2}` if `χ = 1`, `K² ∈ {8, 9}`; `{0, 1}` if `χ = 1`, `K² = 0`; `{0, 1}` if `χ = 2`,
`K² = 0`; `{1}` if `χ ≥ 3`, `K² = 0`; `{2}` if `χ ≥ 1`, `K² ≥ 1`, `(χ, K²) ∉ {(1,8), (1,9)}`;
`∅` otherwise (so a minimal surface with `q = 0` never has `K² < 0`); and
kodairaDims (χ K² : ℤ) : Finset ℤ := the union of kodairaPossibilitiesMinimal χ K²′ over K² ≤ K²′ ≤ max(K²,10),
the set compatible with the **lower bound** `K² ≤ K²_{min}` (the union stabilises beyond `9`,
where only `{2}` occurs). The two theorems: κ(X) ∈ kodairaPossibilitiesMinimal(χ(X), K²_min(X))
and κ(X) ∈ kodairaDims(χ(X), K²(X)), the latter because `K²(X) ≤ K²_min(X)` (5.1). Values:
kodairaDims(1, −2) = {−1, 0, 1, 2}, kodairaDims(2, −4) = {0, 1, 2}, kodairaDims(3, −7) = {1, 2},
kodairaDims(4, −4) = {1, 2}, kodairaDims(1, 8) = {−1, 2}, `kodairaPossibilitiesMinimal(2, 0) =
{0, 1}`, by the displayed finite formulas. A negative `K²(X)` with `χ = 1` therefore leaves every `κ` open, and the
rationality of the small-`D` surfaces (6.3) is a theorem about configurations, not about numbers.
*Needs:* 5.1; SchemeAndStackFoundations §5.10 (Riemann–Roch, Hodge index).

The numerical possibility-set API includes inclusion under weakening the lower bound on
K², membership of the actual geometric Kodaira dimension, and the empty value for impossible
minimal numerical data. It is a necessary compatibility test, not existence of every numerical
row as a surface (Assaf et al., Table 1).

**Checks.**

- At (χ,K²) = (1,8), the minimal table gives {−1,2}; it does not prove rationality.
- At (2,0), the minimal table gives {0,1}; at (2,−4) the lower-bound table gives {0,1,2}.
- At (1,−2) the minimal table is empty, but the lower-bound table gives {−1,0,1,2};
  at χ = 0 both tables are empty within the standing q = 0 surface hypotheses.

### 5.3 Van der Geer's criteria

On a smooth projective complex surface X, an **elliptic configuration** is a nonzero
connected effective divisor E = ΣmᵢCᵢ with primitive positive multiplicities, satisfying the
geometric conditions below. The Kodaira-type geometry is that of
NeronModelsAndSemistableAbelianVarietiesPartII §§2.3, 2.5, applied to a divisor without an
assumed fibration. The criterion applies to these divisors on X itself.
In every reducible row all components are smooth rational curves of square −2. All intersections
are exactly those specified, with no extra intersection points or singularities.

| Type | Component geometry and primitive multiplicities |
| --- | --- |
| I₀ | One smooth genus-one curve of square 0, multiplicity 1. |
| I₁ | One irreducible rational curve of square 0 with exactly one ordinary node, multiplicity 1. |
| II | One irreducible rational curve of square 0 with exactly one ordinary cusp, multiplicity 1. |
| I₂ | Two components meeting transversely at two distinct points; both multiplicities 1. |
| Iₙ, n ≥ 3 | A cycle of n components; adjacent components meet transversely once at distinct points, no triple points; all multiplicities 1. |
| III | Two components tangent at one point with intersection length 2; both multiplicities 1. |
| IV | Three components through one point with pairwise distinct tangent directions; all multiplicities 1. |
| I₀* | One central component of multiplicity 2 meets four disjoint multiplicity-1 components transversely at four distinct points. |
| Iₙ*, n ≥ 1 | A chain of n+1 multiplicity-2 components, with two multiplicity-1 leaves at each end; every edge is one transverse intersection, at distinct points. |
| IV* | Three arms of length 2 from a central component of multiplicity 3; along each arm the multiplicities are 2,1. |
| III* | Three arms of lengths 1,3,3 from a central component of multiplicity 4; their multiplicities from the centre are (2), (3,2,1), (3,2,1). |
| II* | Three arms of lengths 1,2,5 from a central component of multiplicity 6; their multiplicities from the centre are (3), (4,2), (5,4,3,2,1). |

In the last three rows each edge is a transverse intersection at a distinct point. Arms have
no other intersections. A positive multiple of E has the same primitive configuration, but E
is not replaced by its reduction in the starred rows. This spells out the geometric
configuration used in van der Geer, Definition VII.2.8, including the irreducible genus-one
cases; the criterion is Proposition VII.2.9 (also Assaf et al., Proposition 6.4.2, p. 22).

The configuration API includes:

- Primitive multiplicities are the unique positive kernel vector of the intersection matrix
  with gcd 1; for each component E·Cᵢ = 0, and E² = K_X·E = 0 and p_a(E) = 1 by adjunction.
- Isomorphisms of surfaces transport the entire divisor, component genera and local incidence
  schemes; a numerical graph alone does not determine the configuration.
- The I₂/III and I₃/IV incidence distinctions persist under this transport; for a divisor
  that is a primitive fibre, the predicate agrees with the supplied geometric Kodaira type.

Prove (i): if X has q = 0 and contains two distinct smooth rational curves C₁,C₂ with
C₁² = C₂² = −1 and C₁·C₂ > 0, or a curve C with C² ≥ 0 and K_X·C < 0, then X is rational
(van der Geer, Proposition VII.2.2; Assaf et al., Proposition 6.4.1).
Prove (ii): if X is simply connected and non-rational and contains an elliptic configuration E,
then X is a blow-up of a K3 surface or of a surface of Kodaira dimension one with an elliptic
fibration. If it also contains a smooth rational curve D of square −2 outside the support of E
with D·E > 0, then X is a blown-up K3 surface (van der Geer, Proposition VII.2.9;
Assaf et al., Proposition 6.4.2). *Needs:* 5.1, 5.2; the supplied geometric Kodaira conditions;
SchemeAndStackFoundations §§5.9–5.10 for divisor intersections and adjunction.

**Checks.**

- On a smooth quintic, two general hyperplane sections have genus 6, squares 5 and
  intersection 5. Blow up three common points and four further points on each: the strict
  transforms have squares 5−3−4 = −2 and intersection 5−3 = 2, but arithmetic genus
  6+6+2−1 = 13. Their matrix matches I₂ while their genera exclude the configuration;
  the surface remains simply connected of Kodaira dimension 2.
- A genuine I₂ has two rational components and arithmetic genus 0+0+2−1 = 1;
  its primitive divisor has square −2−2+2·2 = 0. Type III has the same matrix and genus
  but one tangency of length 2, rather than two nodes. Likewise I₃ has three nodes and
  IV one triple point, though both have three pairwise intersection numbers equal to 1.
- For I₀*, at the centre E·C = 2(−2)+4 = 0, and at a leaf it is −2+2 = 0;
  the reduced divisor instead intersects the centre in −2+4 = 2. A nodal or cuspidal
  irreducible rational curve has p_a = 0+1 = 1, whereas a smooth rational square-zero
  curve has p_a = 0 and is excluded.
- Two transverse genus-two members of a degree-two polarization on a K3 have squares 2
  and intersection 2. Blowing up three separate points on each gives squares −1,−1,
  intersection 2 and genus 2,2; q = 0 and κ = 0 persist. The rational-curve hypothesis excludes this.
- Blowing down the rational curve F₃ for D = 13 changes the two adjacent (−2)-curves
  to rational curves of square −1 meeting positively, so the first alternative applies.
- A line in ℙ² has C² = 1 and K·C = −3; it satisfies the second alternative independently
  of the existence of two exceptional curves.

### Examples

A blow-up of ℙ² has (K²,e,χ) = (8,4,1). The blown-up genus-two K3 curves of §5.3 fail the rational-curve condition.

### Dependencies

SchemeAndStackFoundations §§5.9–5.10; NeronModelsAndSemistableAbelianVarietiesPartII §§2.3, 2.5 for geometric Kodaira types and §6.1 for rationality; no Hilbert surface is an input to these criteria.

## Layer 6: Kodaira dimension of the level-one surfaces

### 6.1 Simple connectivity

`X₀¹(1)_𝔟` is simply connected for every `F` and `𝔟` (van der Geer, Theorem IV.6.1, as quoted
by Assaf et al., Example 7.3.2), so 5.3(ii) applies to it. *Needs:* 4.1.

### 6.2 Hirzebruch–Zagier curves and their intersections

For every positive integer N, the curve `F_N ⊂ Y₀¹(1)_{(1)}` on the trivial component is the image of
the union of the curves `{(z₁, z₂) ∈ ℍ² : a√D z₁z₂ + λz₁ − λ′z₂ + b√D = 0}` over
`(a, b, λ) ∈ ℤ × ℤ × R` with `abD + λλ′ = N` (`λ′` the conjugate; the curve of the skew-hermitian
matrix `(a√D, λ; −λ′, b√D)` of determinant `N`; van der Geer, Chapter V, §1); each component is
the image of a modular or Shimura curve; `F_1` contains the image of the diagonal `z ↦ (z, z)`
(`a = b = 0`, `λ = ±1`), whose closure is the image of the compact modular curve `X(1)`. Owned
here: the general curve construction for N ≥ 1, the fact that each component is an irreducible curve on
`X₀¹(1)_{(1)}` whose normalization, genus, intersections with other components and boundary curves,
and self-intersection are expressed by the stabilizer and lattice intersection theory of
van der Geer, Chapter V, §§1–4. Construct the closures and strict transforms of every component,
with multiplicities retained. At every nonzero level define their inverse images under the
finite map to level one, normalize the irreducible components, and determine the ramification
indices from inclusions of cusp and elliptic stabilizers. Prove the projection formula for
intersections and the adjunction identity 2p_a(C)−2 = C²+K·C for each strict transform.
On a nontrivial ideal component use the same construction on the corresponding ideal lattice;
rational conjugation transports its equations and intersection pairing. The theory has no
bound on N or the level. The N ≤ 4 configurations of §6.3 are Checks of this general theory. *Needs:* 4.1; FuchsianOrbifolds
6.1 (the compact `X(1)`) for the diagonal component.

The curve API includes invariance of the defining union under Γ, strict transform and
normalization, additivity of divisor intersections and compatibility with finite-level pullback.

**Checks.**

- At N = 1, a = b = 0 and λ = 1 give z₁−z₂ = 0, the diagonal component.
- At N = 4, λ = 2 gives the same diagonal support; retaining multiplicity and primitive
  component data prevents treating repeated equations as distinct reduced curves.
- Blowing up a smooth point of a curve of multiplicity 1 changes its square from d to d−1;
  blowing up multiplicity 2 changes d to d−4. Boundary intersections must use multiplicities.

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
reaches `8` or `9`, so the configuration is needed. *Needs:* 4.7, 5.3, 6.2.

### 6.4 The classification for D ≤ 500

Van der Geer's theorem (Chapter VII, Theorem 3.3 and the tables of Chapter VII): for `𝔟 = R`,
`X₀¹(1)` is rational iff `D ∈ {5, 8, 12, 13, 17, 21, 24, 28, 33, 60}`; a blown-up K3 surface iff
`D ∈ {29, 37, 40, 41, 44, 56, 57, 69, 105}`; a blown-up honestly elliptic surface iff
`D ∈ {53, 61, 65, 73, 76, 77, 85, 88, 92, 93, 120, 140, 165}`; of general type otherwise. Prove these equivalences for every real quadratic field of fundamental discriminant
1 < D ≤ 500 on the trivial component, including existence of the required curve configurations
and their geometric consequences. Rational cases require a birational rationality proof;
the K3 and elliptic cases require contractions to a minimal surface of the stated type;
the remaining cases require κ = 2. The genus and intersection results of §6.2, §5.3's
configuration criteria, and the Chern computations supply the geometric inputs. A list of
putative curves without existence and exhaustion proves none of these conclusions.
The classification is a theorem about X₀¹(1), not about the success of a checking procedure.
*Needs:* §§4.7, 5.1–5.3, 6.2–6.3; van der Geer, Chapter VII, Theorem 3.3 and classification tables.

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
`(2), 𝔭₂³` blown-up K3. These are geometric theorems with the curve-existence and intersection inputs of §6.2; the
first of them (`D = 5`, `𝔑 = 𝔭₂ = (2)`) is a worked example below. *Needs:* 6.4.

### Examples

The D = 13 configuration proves rationality; D = 29 is a blown-up K3 and D = 53 is honestly elliptic by §6.4. An empty family of proposed configurations proves none of those claims.

### Dependencies

Layers 2–4 for the actual surfaces, curves and numbers; Layer 5 for contraction and classification criteria. The geometric curve theory in §6.2 supplies every divisor index used.

## Layer 7: the LMFDB record

### 7.1 The intrinsic prefix

HMSPrefix F := (𝔑 ≠ 0, [𝔟] ∈ Cl⁺(R), GammaType ∈ {zero, one, full}, AmbientType ∈ {gl, sl})
(fields `level`, `component`, `gammaType`, `ambient`), with `F` and its ordered embeddings as
parameters;
the LMFDB label `2.2.D.1-N-b-t` is a name for it, and the choice of `b` within its narrow class
and of the ideal labels are not targets. Two prefixes give isomorphic complex
surfaces when they differ by `[𝔟] ↦ [α𝔟]`, `α ≫ 0` (0.3), and the `gl` and `sl` surfaces coincide
for gamma type zero when `h⁺ = h` (0.3). *Needs:* 0.2, 0.3.

The prefix API includes equality from the level, narrow component and two group choices,
invariance under totally positive rescaling, and the dependent choice of record branch.

**Checks.**

- Level 0 is excluded; the unit ideal has norm 1 and is admitted.
- Over ℚ(√5), level (4) and type one is admitted, as is full level; their infinity
  translation lattices are R and 4R, so their cusp records are distinct.
- Over ℚ(√3), level one and the two narrow classes yield different cusp periods [4]
  and [3,2]; forgetting the component destroys the invariant.

### 7.2 The record

```text
field_discr = D, level_norm = N(𝔑), narrow_class_nb = h⁺, is_pp = ([𝔟] = [𝔡⁻¹]),
nb_cusps (1.4), cusps: (𝔐, (a : c), (−b_1,…,−b_d), k) per cusp (1.2, 1.5, 2.3),
len_cusp_res (2.6), elliptic points: ((q; a, b), a(Γ; q, a, b)) (3.11), nb_ell, nb_ell_q,
len_ell_res (3.11), len_res, euler_nb = e, K2 = K², chi = χ, h20 = χ − 1, h11 = e − 2χ,
arithmetic genus p_a = χ − 1 (4.7), kodaira_dims = {κ} where the classification determines κ, and the numerical
possibility set of (5.2) otherwise (6.4).
```

Each field is a function of the prefix; the theorems are the identifications of Layers 1–6. The
elliptic-point, resolution, Chern-number, Hodge and Kodaira fields are defined for the gamma type
`zero` (the LMFDB's `gl-0` and `sl-0`, the only types its tables hold), where Layers 3–4 compute
them; for the types `one` and `full` the record carries the prefix and the cusp data of 1.3–1.5
only (Explicit scope exclusions). The
page's Hodge diamond is (1; 0, 0; h20, h11, h20; 0, 0; 1) by 4.7. *Needs:* everything above.

The record API includes independence of ideal and cusp representatives, summation of
per-type counts to the total, and agreement of every numerical field with its geometric
invariant. Full affine cusp data are the §1.5 records for all three gamma types; their periods
use the analytic splitting there. Only the gamma-zero branch carries the elliptic and global
invariants specified here (Assaf et al., §§3.3, 4.4 and 6.2–6.4).

**Checks.**

- D = 5 at unit gamma-zero level gives nb_cusps = 1, nb_ell = 6, len_res = 10,
  (e,K²,χ,h20,h11) = (14,−2,1,0,12).
- D = 12 at unit level has gl and sl values (15,−3,1) and (16,−4,1); the ambient field
  of the prefix therefore cannot be omitted.
- At level (4), one and full have the defined affine cusp data of §1.5; the record type
  does not demand the gamma-zero elliptic formula for these two branches.

### 7.3 Page coverage

| LMFDB column or knowl | milestone |
| --- | --- |
| `field_discr`, `narrow_class_nb`, `nf.narrow_class_number` | 0.1, 0.2 |
| `component_label` (as a narrow class), `is_pp`, `hmsurface.component_ideal` | 0.2, 7.1 |
| `group_type`, `gamma_type`, `hmsurface.congruence_subgroup`, `hmsurface.standard_hmsurfaces`, `hmsurface.x0`, `hmsurface.x01` | HilbertModularForms §1.2; 0.3 |
| `level_label` (as an ideal), `level_norm`, `hmsurface.level`, `hmsurface.levelnorm` | 0.3 |
| `nb_cusps`, `hmsurface.cusps`, cusp table (`M_label` as `𝔐`, coordinates, `self_intersections_minimal`, repetition), `hmsurface.cusp_resolution`, `len_cusp_res` | 1.2, 1.4, 1.5, 2.3, 2.6 |
| `nb_ell`, `nb_ell2`–`nb_ell6`, `hmsurface.elliptic_point`, `rotation_type`, `len_ell_res`, `hmsurface.elliptic_point_resolution` | 3.3, 3.4–3.8, 3.9, 3.11 |
| `len_res`, `hmsurface.resolution` | 4.9 |
| `euler_nb`, `hmsurface.euler_number` | 4.4, 4.7 |
| K2, `hmsurface.k2` | 4.4 |
| chi, `ag.holomorphic_euler_char`, `hmsurface.arithmetic_genus`, `ag.arithmetic_genus` | 4.7 |
| h20, h11, `hmsurface.hodge_numbers`, the Hodge diamond | 4.6, 4.7 |
| `kodaira_dims`, `ag.kodaira_dimension`, `hmsurface.kodaira_dimension`, "known to be" | 5.2, 6.4, 6.5 |
| `hmsurface.label`, `hmsurface.search_input`, sort orders | not a target (database convention) |
| `hmsurface.polarization_module`, moduli interpretation of `x0`/`x01` | HilbertModularVarietiesAndShimuraCurves H1 |

### Examples

The records for D = 5 and D = 12 distinguish component, ambient and gamma type, with the full-level and Γ₁(4) branches tested in §7.2.

### Dependencies

Layers 0–6, with the gamma-zero numerical branch using §§3.11 and 4.9 and every cusp branch using §§1.5 and 2.4.

## Explicit scope exclusions

- Hilbert modular varieties of degree `n > 2`, their cusp singularities and Ehlers' resolutions.
- Modularity of the generating series of Hirzebruch–Zagier divisors; their curve and intersection theory belongs to §6.2.
- Humbert surfaces and the map to the Siegel threefold (the sibling `SiegelModularForms` and the
  toroidal roadmap's Siegel layers).
- Hilbert modular forms as functions (HilbertModularForms), their rings, dimension formulas
  beyond the single use of `dim S₂(Γ₀(𝔑))` in 4.8, and the Hilbert series of Assaf et al., §5.1.
- Canonical models, fields of definition of the components, integral models, bad reduction.
- The quotients of `X(Γ)` by Atkin–Lehner involutions and by the Galois involution, the symmetric
  Hilbert modular surfaces: the groups are extensions of `Γ` by finite groups; they are not in
  the LMFDB's `hmsurface` tables and are not specified here.
- Elliptic-point counts, Chern numbers and Kodaira dimension for Γ₁ and full level.
  Their cusp records, including non-squarefree levels and full affine stabilizers, are in §1.5.
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
`h^{1,1} = 12`, `p_a = 0`; kodairaDims(1, −2) = {−1, 0, 1, 2} using numerical data alone and
`{−1}` by the rationality theorem of 6.3, so `κ = −1` (6.4); 4.8:
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
table is an acceptance test for both. kodairaDims(2, K²) = {0, 1, 2} for `K² < 0`, so for
`D = 29, 37, 41` the record's `kodaira_dims` is `{0, 1, 2}` using numerical data alone and `{0}`
with one; for `D = 53, 61, 73` it is kodairaDims(3, K²) = {1, 2} without and `{1}` with.

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
`κ = 2`. These are the values the classification theorem of §6.4 records. The values of `χ` and
`K²(X)` are Layer 4's (`D = 85`: cusp cycles `(2⁸, 11)` twice on the trivial component and
`(2, 3, 2, 4, 4)` twice on the other, `(2;1,1)⁴ (3;1,1)⁶ (3;1,2)⁶` on both); the
exceptional curves are those Assaf et al. exhibit and are not recomputed here.

### Boundary and off-hypothesis checks

- hjExpansion n r = [] for `r = 0` or `r ≥ n`, and hjExpansion 4 2 = hjExpansion 2 1: a
  non-coprime pair is excluded at RotationType (the field `coprime`), not by the expansion.
  `(3; 1, 2)` and `(3; 2, 1)` are the same singularity with the factors swapped, normalised to
  `(3; 1, 2)` since `2⁻¹ = 2 mod 3`; the swap relation is inversion of the second exponent:
  `(5;1,2)` and `(5;1,3)` are swaps of each other and are **distinct** types, while `(12;1,5)`
  and `(12;1,7)` are each their own swap.
- `(2; 1, 1)` is the only type of order `2`; an alleged type `(4; 1, 2)` is rejected by
  `gcd(2, 4) ≠ 1` (not an isolated fixed point).
- A basis `(x, y)` of `M` with `v₁(x)v₂(y) − v₂(x)v₁(y) < 0` is not oriented (convention 5), and
  the basis-independence API requires orientation and a reduced quotient: for `M = ℤ + ℤ√3` the oriented basis
  `(√3, 1)` gives the period `(4)`, while the basis `(1, √3)` would give `(2, 3)`, the dual cycle,
  not a rotation of the same cycle.
- Over `ℚ(√5)`, no elliptic point of order `4` or `6` exists (3.3); over `ℚ(√2)` none of order `5`
  or `6`; `nb_ell12 = 0` for every `sl` surface and for every `gl` surface with `D ≠ 12`.
- For `D = 5` the sum `1/15 + 1 + 3 + 5/3 + 8/3 + 28/5` is `14`. Replacing `(3;1,1), (3;1,2)` by
  `(3;1,1)²` gives `K² = 2/15 − 1 − 2/3 − 4/5 = −7/3`: 4.5 rejects it. Replacing `(5;1,2), (5;1,3)`
  by `(5;1,1), (5;1,4)` gives `e = 15`, `K² = −3`, `χ = 1`, all integers: 4.5 does **not** reject
  it, and 3.7 does (`ζ_{v₂}` is the image of `ζ_{v₁}` under `√5 ↦ −√5`, which sends `ζ_5` to
  `ζ_5^{±2}`, never to `ζ_5^{±1}`). Integrality is necessary, not sufficient.
- kodairaPossibilitiesMinimal(1, 8) = {−1, 2}, kodairaPossibilitiesMinimal(2, 0) = {0, 1}
  and kodairaPossibilitiesMinimal(1, −2) = ∅ (no minimal surface with `q = 0` has `K² < 0`):
  the record's `kodaira_dims` is a set, and the page's "known to be" requires a geometric classification theorem
  (6.4).
- `is_pp` is a property of the narrow class: `𝔡 = (√D)` and `√D` has mixed sign, so `[𝔡⁻¹]` is
  the nontrivial element of `ker(Cl⁺(R) → Cl(R))` when `N(ε) = 1` (for `ℚ(√3)` it is the
  component with cusp cycle `(−2, −3, −2, −3)`, not the trivial one) and is trivial when
  `N(ε) = −1`; for `h⁺ = 1` (for instance `ℚ(√5)`) every component has `is_pp = true`.
- For gamma type zero, the gl and sl projective groups coincide iff `N(ε) = −1` (0.3); for `D = 12` they do not,
  and the `gl` surface has an elliptic point of order `12` that the `sl` surface lacks.

## Downstream consumers

No roadmap consumes a target of this roadmap by section. HilbertModularForms is a supplier of
Layers 0–1 and of §§0.5, 4.6 and 4.8, and it defers to this roadmap the surfaces `Γ\ℍ²` for real
quadratic `F`, their cusp resolutions, elliptic points, Euler numbers and closed dimension
formulas. The LMFDB record is assembled in Layer 7. The supply direction is from
HilbertModularForms and the arithmetic and compactification contracts to the surface geometry.

### Internal ordering

- **Layer 0** first; it is short and every later layer uses it.
- **Layers 1 and 3** are independent of each other given Layer 0 (cusps versus elliptic points).
- **Layer 2** needs Layer 1 for 2.3–2.6 and 1.5; its continued-fraction core 2.1–2.2 also uses §0.1 for units
  and AutomorphicSpectralTheory §4.17a for the maximal-order comparison. 3.9 needs 2.1 only.
- **Layer 4** needs Layers 1–3 for 4.4; 4.2 (Siegel's formula) is independent of everything but
  Mathlib and ImaginaryQuadraticClassNumber H2.2 and can proceed in parallel with Layers 1–3.
- **Layer 5** is independent of Layers 0–4 (general surface theory) and can proceed in parallel
  with all of them.
- **Layer 6** needs Layers 4 and 5 and, for 6.2–6.3, Layer 2 (the cusp curves it intersects).
- **Layer 7** assembles Layers 0–6; every field of 7.2 except the two Kodaira fields rests on
  4.9 alone, and the Kodaira fields rest on Layer 6.

Dependency graph: `0 → {1, 3}`, `1 → 2`, `{2, 3} → 4`, `5 ∥ {0,…,4}`, `{4, 5} → 6 → 7`, with
`2.1`, `4.2` and `5` as starting points that need no other layer of this roadmap.

## References

- E. Assaf, A. Babei, B. Breen, E. Costa, J. Duque-Rosero, A. Horawa, J. Kieffer, A. Kulkarni,
  G. Molnar, S. Schiavone, J. Voight, *A database of basic numerical invariants of Hilbert
  modular surfaces*, Contemp. Math. 796 (2024), 285–312; arXiv:2301.10302v2, with the author errata to the published article. Cited by section and
  numbered statement: (2.1.4)–(2.1.8), §2.2, Lemma 3.1.2, Lemma 3.1.8, Corollary 3.1.18,
  Corollary 3.1.23, §3.3 ((3.3.1)–(3.3.4), (3.3.10)–(3.3.11)), Lemma 3.3.5, Proposition 3.3.8,
  §4.1 and Lemma 4.1.1 (whose part (b) writes `γ² = u⁻¹ζ` for `γ² = uζ` and bounds `q ≤ 6`,
  omitting the order `12` over `ℚ(√3)`; 3.2–3.3),
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
  119–147; locators here refer to arXiv:2010.00650v1, §2, p. 5, Lemma 3.6, pp. 9–10,
  and Corollary 3.12 (cusps of `Γ₁(𝔑)_𝔟`).
- Y. Hamahata, *Hilbert modular surfaces with `p_g ≤ 1`*, Math. Nachr. 173 (1995), 193–236:
  Theorems 3.5, 4.6, 5.15, 6.13.
- J. Voight, *Quaternion Algebras*, GTM 288, Springer, 2021, author version 1.0.7u: Lemma 30.3.14, §§30.6–30.7,
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
