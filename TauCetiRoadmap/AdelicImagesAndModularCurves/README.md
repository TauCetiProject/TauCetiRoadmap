# Roadmap: adelic Galois images and modular curves `X_H`

**Summary.** For an elliptic curve `E` over a number field `K`, the Galois action on all of the
torsion of `E` is a continuous representation `ρ_E : G_K → GL₂(Ẑ)`, well defined up to conjugacy.
Serre's open image theorem says that its image `H_E` is open when `E` has no complex
multiplication, and the modern description of the arithmetic of `E` — its torsion, its isogenies,
its division fields, the torsion it acquires over extensions — is a description of `H_E`.
Conversely every open subgroup `H ≤ GL₂(Ẑ)` with surjective determinant defines a modular curve
`X_H` over `ℚ` whose non-cuspidal rational points are, up to the two caveats this roadmap states
exactly, the elliptic curves with image inside `H`. This roadmap builds the three sides of that
picture that no roadmap in this repository owns: the group theory of open subgroups of `GL₂(Ẑ)`
(level, index, `Γ_H`, genus, cusps, widths, elliptic points, determinant, `−I`, Cartan and Borel
subgroups, Serre's lifting lemma, entanglement, Gassmann equivalence, twists), the arithmetic of
the images (mod-`N`, `ℓ`-adic and adelic images, Serre's open image theorem with its proof
layered on the suppliers that exist, the CM counterpart, isogeny classes and graphs, Mazur's
torsion theorem as the end of a layered chain, and the shape of isogeny classes over `ℚ` that
Mazur's and Kenku's isogeny theorems force), and the arithmetic gloss on the curves `X_H` (points
against images, cusps and their fields, CM points, isolated points, fibre products, Gassmann
classes, twists, local obstructions, the decomposition of `J_H`). A final layer does the group
theory of `GSp₄(Ẑ)` that the mod-`ℓ` images of genus-two Jacobians are recorded in.

The curves `X_H` themselves are not built here. Katz–Mazur moduli and the compactified coarse
curves at prime level are the [modular-curves roadmap](../ModularCurves/README.md)'s; the
Deligne–Rapoport level-`H` stack `𝒳_H` for every open `H`, its coarse curve `X_H` over `ℤ`,
its cusps away from the level, its cyclotomic structure and the correspondence between its
rational points and Galois images are the [second modular-curves
roadmap](../ModularCurvesPartII/README.md)'s; the analytic quotient `Γ\ℍ`, its compactification
and its genus are the [Fuchsian-orbifolds](../FuchsianOrbifolds/README.md) and
[modular-forms](../ModularForms/README.md) roadmaps'. This roadmap consumes all of them by name
and states, on the group side, the finite computations that the LMFDB's `modcurve` pages
display, together with the theorems identifying those computations with the geometry.

**The carrier.** The profinite integers are Tau Ceti's `TauCeti.zHat`, written additively as
the topological ring `ẑ := Additive TauCeti.zHat` of the
[profinite-arithmetic roadmap](../ProfiniteArithmetic/README.md), Layer 0, with its reductions
`zHat.toZMod n : ẑ →+* ZMod n`, its components `zHat.component ℓ : ẑ →+* ℤ_ℓ` and the
decomposition `ẑ ≃+* ∏_ℓ ℤ_ℓ`. The group is Mathlib's `GL (Fin 2) ẑ`, with the topology of
units of the topological ring of `2 × 2` matrices over `ẑ`. There is no second carrier of
`GL₂(Ẑ)`: it is not defined as an inverse limit of the `GL₂(ℤ/n)`, and that it *is* their
inverse limit is a theorem of Layer 0. Open subgroups are Mathlib's `OpenSubgroup`, closed
subgroups Mathlib's `ClosedSubgroup`, the index Mathlib's `Subgroup.index`, and the image of a
Galois representation is a conjugacy class of closed subgroups.

Suggested home: `TauCeti/NumberTheory/AdelicImages/`, with subdirectories `GL2Zhat/` (Layers
0–2), `GaloisImage/` (Layer 3), `OpenImage/` (Layer 4), `ModularCurve/` (Layer 5),
`IsogenyClass/` (Layer 6) and `GSp4/` (Layer 7).

## Scope and ownership

### Owned here

- **Layer 0.** The profinite group `GL₂(Ẑ) = GL (Fin 2) ẑ`: its reductions
  `red n : GL₂(Ẑ) →* GL₂(ℤ/n)`, the kernels `Γ(n)`, the inverse-limit property, the
  subgroups `SL₂(Ẑ)` and the determinant `det : GL₂(Ẑ) →* ẑˣ`; open subgroups and their
  **level**, **index**, `±H`, **projective index**, **determinant image**, the predicates
  `−I ∈ H` and `det H = ẑˣ`; the standard open subgroups (preimages of MC2 §3.8's finite-level
  subgroups and of the Cartan subgroups of étale `ℤ/N`-algebras); the congruence subgroup
  `Γ_H := H ∩ SL₂(ℤ)`, its **`SL₂`-level** and **`PSL₂`-index**, and the density of `SL₂(ℤ)`
  in `SL₂(Ẑ)`.
- **Layer 1.** The finite coset computations of the LMFDB's `gl2.genus` knowl: `ν₂`, `ν₃`,
  the cusps of `H` as `⟨T⟩`-orbits with their **widths**, the **genus** `g(H)`, the Galois
  action on cusps through `(ℤ/N)ˣ`, **cusp orbits**, **rational cusps** and **cusp fields**;
  and the theorems identifying `ν₂, ν₃, ν∞, g(H)` with MF Layer 10's counts on the compact
  Riemann surface `X(Γ_{±H})`.
- **Layer 2.** Cartan subgroups of `GL₂(R)` for `R = ℤ/N, ℤ_ℓ, ẑ` attached to an étale
  algebra, in particular the Cartan `C_𝒪 = Aut_𝒪` of an imaginary quadratic order; Serre's
  lifting lemma and its failures at `ℓ = 2, 3`; the commutator subgroup of `GL₂(Ẑ)` and the
  index-two subgroups containing it; **entanglement index** and **entanglement quotient**;
  Zywina's **agreeable** subgroups and the agreeable closure; the **invariants of Gassmann-equivalent
  subgroups** (the equivalence itself is consumed from `FiniteGroupInvariants` 7.3);
  **twists** `H₁ ∩ SL₂(Ẑ) = H₂ ∩ SL₂(Ẑ)`, **quadratic refinements**, **relative index**;
  the **isogeny orbits** `[M, n, m]` and the three field-degree invariants.
- **Layer 3.** The adelic Tate module `T̂E = ∏_ℓ T_ℓ E`, the adelic representation `ρ_E`,
  its reductions `ρ_{E,N}` and components `ρ_{E,ℓ^∞}`, the determinant as the cyclotomic
  character `χ : G_K → ẑˣ`; the **mod-`N`**, **`ℓ`-adic** and **adelic images** as conjugacy
  classes of closed subgroups; **adelic level, index and genus**; **non-maximal primes**
  (relative to `Aut_𝒪` in the CM case); division fields and **torsion growth**; the
  **index-two obstruction** over `ℚ` and **Serre curves**.
- **Layer 4.** Serre's open image theorem for non-CM curves over number fields — `ℓ`-adic
  openness for every `ℓ`, surjectivity for almost all `ℓ`, adelic openness — with every input
  named, on top of the `ℚ_ℓ`-analytic Lie theory of AdelicAlgebraicGroups AA.4.2; the CM
  counterpart: the image lies in `Aut_𝒪(T̂E)` or its normaliser according to
  whether `𝒪 ⊂ K`, and is open there.
- **Layer 5.** The arithmetic gloss on `X_H` over `ℚ` and over number fields: the identification
  of MC2's cusps, widths, Galois action, `j`-degree and genus with Layers 0–1; points of `X_H`
  against images, with the `−I` and `j ∈ {0, 1728}` caveats stated as theorems; **CM points**
  and the `cm_discriminants` of `H`; **isolated points**; **fibre products**; Gassmann classes
  and isogenous Jacobians; twists and the cyclotomic isomorphism; **local obstructions** and
  the real-point criterion; the decomposition of `J_H` into the `A_f` with multiplicities,
  **simple**, **squarefree**, **newform level**, **conductor**, **analytic rank** and
  **genus minus rank** as derived invariants.
- **Layer 6.** `K`-isogeny classes, the **isogeny matrix**, **isogeny graph**, **class
  degree**, the **isogeny degrees** of a curve, the dictionary with `X₀(N)(K)`; Mazur's
  torsion theorem as the last milestone of a layered chain over `ℚ`, including the rational
  points of the curves `X₁(N)` of composite level that the chain needs; what Mazur's and Kenku's
  isogeny theorems (consumed) force on the isogeny degrees, class degree, class size and
  isogeny graph over `ℚ`; the finiteness and shape of isogeny classes over number fields.
- **Layer 7.** `GSp₄(Ẑ)`, the `ẑ`-points of AGR §7.3's similitude group (the group, its
  multiplier and their laws are consumed): reductions, open subgroups, level and index, orbit
  signatures, finite cardinalities; the mod-`ℓ` image of a genus-two Jacobian, its **non-maximal
  primes** and **two-torsion field**; the subgroup configurations of `GSp₄(𝔽_ℓ)` with a
  single-label rule, and Mitchell's classification of the maximal subgroups of `PSp₄(𝔽_ℓ)`.

### Not owned here

- Katz–Mazur moduli problems, Drinfeld level structures, the integral curves and their bad
  fibres: MC and MC2. This roadmap never constructs a modular curve.
- Models of `X_H` (canonical, plane, Weierstrass, embedded), gonality and gonality bounds,
  the `j`-map as a rational function of model coordinates: `CanonicalModelsAndGonality`. The
  LMFDB's embedded model is that roadmap's complete model (its 2.5, 9.3) of the divisor of
  weight-`k` forms on `X(Γ_{±H})`, MF 10C's section-space divisor, which is consumed here as it
  stands; no milestone of this roadmap names a model.
- Label components beyond the intrinsic prefix, orderings and normal forms fixed by
  convention, stored lists, and the completeness of database tables are not targets: the final
  integer `n` of an RSZB label `N.i.g.c.n`, the Gassmann letter `c`, `canonical_conjugator`,
  canonical generators, `psl2label`, `sl2label`, CP, SZ, RZB, S and Zywina labels, the choice
  of the minimal twist as the least label, `reductions`, `parents`, `factorization` as label
  lists, `known_points` counts and `trace_hash`. This roadmap states the intrinsic **prefix** `(N, i, g)` and the coarse prefix `(M, j, g)` of
  `±H`, and the predicates `fine` (`−I ∉ H`) and `coarse`.
- Modular forms, Hecke operators, newforms, `L`-functions and their analytic ranks: MF and
  LFunctions. The analytic rank of `X_H` is defined here as a sum of analytic ranks of newforms
  supplied there.
- Endomorphism algebras and Sato–Tate groups: `SatoTateGroups`. Genus-two curve models,
  Igusa invariants: `HyperellipticCurves`. The Hasse–Weil bound: SSF §5.11.
- Modular degree, Manin constant, periods, optimal curves:
  `EllipticCurvePeriodsAndModularParametrizations`.
- The theory of Galois representations in general (conductors, Weil–Deligne representations,
  big-image conditions): AGR.

## Pinned conventions

1. **The ring and the group.** `ẑ := Additive TauCeti.zHat` with the ring structure of PA
   Layer 0; `GL₂(Ẑ) := GL (Fin 2) ẑ` with the topology of units of `Matrix (Fin 2) (Fin 2) ẑ`
   (Mathlib's `Units` topology, the product topology on matrices). `red n := GL.map (zHat.toZMod n)`,
   `Γ(n) := ker (red n)` for `n ≥ 1`, and `SL₂(Ẑ) := ker det`. Finite levels are indexed by
   `ℕ+` as in PA: `ZMod 0 = ℤ` is not a finite quotient.
2. **The right action on frames and the matrix of a Galois element.** As in MC Convention 5
   and MC2 §3.8, `g = [[a, b], [c, d]]` acts on an ordered basis (frame) `(P, Q)` of `E[N]` by
   `(P, Q)·g = (aP + cQ, bP + dQ)`. For `σ ∈ G_K`, `ρ_{E,N}(σ)` is the matrix with
   `(σP, σQ) = (P, Q)·ρ_{E,N}(σ)`, i.e. the matrix whose columns are the coordinates of `σP`
   and `σQ` in the frame. This is a homomorphism (the frame action is a right action), it is
   the convention of Zywina 2015 and Rouse–Sutherland–Zureick-Brown 2022, and changing the
   frame by `h ∈ GL₂(ℤ/N)` conjugates it to `h⁻¹ ρ h`. A subgroup `H̄ ≤ GL₂(ℤ/N)` acts on
   `(ℤ/N)²` on the *left* on column vectors wherever the LMFDB speaks of "the left action of
   `H` on `(ℤ/M)²`" (isogeny orbits, Layer 2.7); this is the same matrix read on coordinates,
   since `σ(xP + yQ)` has coordinate vector `ρ_{E,N}(σ)·(x, y)ᵗ`, so the frame action on the
   right and the coordinate action on the left never disagree.
3. **Level.** The level of an open `H ≤ GL₂(Ẑ)` is the least `N ≥ 1` with `Γ(N) ≤ H`;
   equivalently (Layer 0.2) `H` is the full preimage of its image `H̄_N ≤ GL₂(ℤ/N)`. The level
   of `GL₂(Ẑ)` is `1`. The level of an open subgroup of `GL₂(ℤ_ℓ)` is a power of `ℓ`, the
   least `ℓ^k` with `ker (GL₂(ℤ_ℓ) → GL₂(ℤ/ℓ^k)) ≤ H`.
4. **Index, projective index, `±H`.** `index H := Subgroup.index H`, finite for open `H` and
   equal to `[GL₂(ℤ/N) : H̄_N]` for any `N` with `Γ(N) ≤ H`. `±H := H.adjoinNegOne`
   (Mathlib's `Subgroup.adjoinNegOne`), the subgroup generated by `H` and `−I`; the projective
   index is `index (±H)`, equal to `index H` when `−I ∈ H` and to `index H / 2` otherwise. `H`
   is **fine** when `−I ∉ H` and **coarse** otherwise; the coarse group of `H` is `±H`.
5. **`Γ_H`, `SL₂`-level, `PSL₂`-index.** `Γ_H := H.comap (mapGL ẑ) ≤ SL(2, ℤ)`, the preimage
   of `H` under `SL(2, ℤ) → GL₂(ẑ)`. The `SL₂`-level of `H` is the least `M ≥ 1` with
   `Gamma M ≤ Γ_H` (Mathlib's principal congruence subgroup); it divides the level. The
   `PSL₂`-index of `H` is `(Γ_{±H}).index`, the index in `SL(2, ℤ)` of `±H ∩ SL(2, ℤ)`, equal
   to the index of its image in `PSL₂(ℤ)` because `Γ_{±H}` contains `−I`. The genus,
   cusps, widths and elliptic points of `H` are those of `Γ_{±H}`, never of `Γ_H`: a fine `H`
   and its coarse group `±H` have the same curve.
6. **The finite coset model.** For `N` with `Γ(N) ≤ H` write `Γ̄_H := ±H̄_N ∩ SL₂(ℤ/N)`. The
   invariants are read on the right coset space `Γ̄_H \ SL₂(ℤ/N)` with the right action of
   `SL₂(ℤ/N)`: `ν₂(H)` is the number of cosets fixed by `S := [[0, 1], [−1, 0]]`, `ν₃(H)` the
   number fixed by `R := [[0, 1], [−1, −1]]`, the **cusps** of `H` are the orbits of
   `T := [[1, 1], [0, 1]]`, the **width** of a cusp is the size of its orbit, and
   `g(H) := 1 + i(H)/12 − ν₂(H)/4 − ν₃(H)/3 − ν∞(H)/2` with `i(H) = [SL₂(ℤ/N) : Γ̄_H]` the
   `PSL₂`-index and `ν∞(H)` the number of cusps. These are the LMFDB's `gl2.genus` conventions
   verbatim; `R` has order three and `S` order four in `SL₂`, order two in `PSL₂`.
7. **Cusps as double cosets and the Galois action.** When `det H = ẑˣ`, the cusps of `H` are
   also the double cosets `±H̄_N \ GL₂(ℤ/N) / ⟨T⟩`, in bijection with the `T`-orbits of
   convention 6 through `SL₂(ℤ/N) ⊂ GL₂(ℤ/N)`; `e ∈ (ℤ/N)ˣ` acts on them by right
   multiplication by `[[e, 0], [0, 1]]`, and `σ ∈ G_ℚ` acts through `e = χ_N(σ)`, where
   `σ(ζ_N) = ζ_N^e`. A cusp is **rational** when fixed by every `e`; its **field** is the
   subfield of `ℚ(ζ_N)` fixed by its stabiliser. The **cusp orbits** are the multiset of
   orbit sizes. Without `det H = ẑˣ` the double-coset set is larger than the `T`-orbit set
   (Layer 1.3 states the exact relation) and the LMFDB records neither.
8. **Images are conjugacy classes.** The mod-`N` image of `E/K` is the `GL₂(ℤ/N)`-conjugacy
   class of `ρ_{E,N}(G_K)`, the `ℓ`-adic image the `GL₂(ℤ_ℓ)`-conjugacy class of
   `ρ_{E,ℓ^∞}(G_K)`, the adelic image `H_E` the `GL₂(Ẑ)`-conjugacy class of the closed
   subgroup `ρ_E(G_K)`, an element of PA 2.3's `ClosedSubgroupConjClasses (GL₂(Ẑ))`. Every
   invariant of an image is proved conjugation-invariant before it is applied to the class.
   "The image is `H`" means "the image is the class of `H`".
9. **The adelic Tate module** is `T̂E := ∏_{ℓ} T_ℓ E` over the primes `ℓ`, a module over
   `∏_ℓ ℤ_ℓ ≃ ẑ` through `zHat.ringEquivPiPadicInt`, with `T_ℓ E` Tau Ceti's `TateModule ℓ`
   of the points of `E` over a fixed separable closure `K̄` of `K`. Its level-`N` quotient is
   identified with `E[N]` through the Chinese remainder theorem (Layer 3.1); nothing is stated
   on an inverse limit over all `n` other than through this identification.
10. **The cyclotomic character** `χ : G_K → ẑˣ` is `zHat.unitsLift` applied to Mathlib's
    `modularCyclotomicCharacter` at every level `N` (PA 0.4); its reduction mod `N` is the
    action on `μ_N`, and `det ∘ ρ_E = χ`.
11. **Non-CM** means `GeometricEnd E = ℤ` (EC's `¬ HasGeometricCM E`). **CM by `𝒪`** means a
    `CMAction 𝒪 E` over `K̄` with `GeometricEnd E ≃+* 𝒪` for an imaginary quadratic order
    `𝒪`, and the Cartan subgroup `C_𝒪 := Aut_{𝒪 ⊗ ẑ}(T̂E)`, the `𝒪`-linear automorphisms,
    with `N_𝒪 := ⟨C_𝒪, ι⟩` the `𝒪`-linear and `𝒪`-antilinear automorphisms (`ι` conjugation on
    `𝒪`, acting at every `ℓ` at once); `[N_𝒪 : C_𝒪] = 2`, and `N_𝒪` is a proper subgroup of the
    normaliser of `C_𝒪` in `GL(T̂E)` (0.3).
12. **Isogeny classes.** The `K`-isogeny class of `E` is the set of `K`-isomorphism classes of
    elliptic curves `E'/K` admitting a `K`-isogeny `E → E'` (EC's `Isogeny`, which is nonzero
    by construction). The isogeny matrix entry `(i, j)` is the minimum of `deg φ` over all
    `K`-isogenies `φ : E_i → E_j`; Layer 6.1 proves a minimiser is cyclic, so this is the
    LMFDB's minimum over cyclic isogenies. The isogeny graph is the simple graph with an edge
    between distinct classes whose matrix entry is prime. The isogeny degrees of `E` are the
    `n ≥ 1` such that `E` has a `K`-rational cyclic isogeny of degree `n`; the class degree is
    the least common multiple of the matrix entries.
13. **Analytic data** (rank of `J_H`, the LMFDB's genus minus rank) are the numbers the formulas define
    — the order of vanishing at `s = 1` of the `L`-functions of the newforms in the
    decomposition of `J_H` — and nothing here identifies them with Mordell–Weil ranks.
14. **Genus-two side.** `GSp₄(R) := {g ∈ GL₄(R) : g · J · gᵀ = ν(g) · J, ν(g) ∈ Rˣ}` with
    Mathlib's `Matrix.J (Fin 2) R = fromBlocks 0 (−1) 1 0` on `Fin 2 ⊕ Fin 2`, matching
    Mathlib's `symplecticGroup` (which is `ν = 1`, defined by `A * J * Aᵀ = J`). This is AGR
    §7.3's `SimilitudeGroup.GSp` in rank four, whose Gram matrix `−Matrix.J` defines the same group
    with the same multiplier; `GSp₄(Ẑ)`
    is the subgroup of `GL (Fin 2 ⊕ Fin 2) ẑ` so defined. The mod-`ℓ` image of a principally
    polarised abelian surface is a `GSp₄(𝔽_ℓ)`-conjugacy class, read in a symplectic frame of
    `A[ℓ]` for the Weil pairing.

## Exact supplier contracts

Every milestone lists what it rests on. Each prerequisite is one of: a Mathlib declaration at
the pin; a Tau Ceti declaration at the pin; an earlier milestone of this roadmap; a named
layer or milestone of another roadmap of this repository, cited by that roadmap's own
numbering; or a supplier gap declared below, in which case the statement using it says so.
Nothing rests on anything else.

### From Mathlib

- `Matrix.GeneralLinearGroup` (`GL n R`), `GeneralLinearGroup.map`, `GeneralLinearGroup.det`,
  `SpecialLinearGroup.mapGL`, `SpecialLinearGroup.map`, and the finite-field cardinalities
  `Matrix.card_GL_field`, `Matrix.card_SL_field`.
- The topology of units: `Units` of a topological monoid is a topological group, compact when
  the monoid is compact and `T1` (`Units.isClosedEmbedding_embedProduct` and the `CompactSpace`
  instance in `Topology/Algebra/Group/Units.lean`); `Units.map` of a continuous homomorphism is
  continuous; `Matrix m n R` carries the product topology and is a topological ring
  (`Matrix.topologicalRing`).
- `OpenSubgroup G` with `OpenSubgroup.comap`, `ClosedSubgroup G`, `Subgroup.index`,
  `Subgroup.relIndex`, `Subgroup.FiniteIndex`, `Subgroup.normalizer`, `ConjAct`,
  `MulAction.orbitRel.Quotient`, `Subgroup.goursat`.
- The congruence subgroups `CongruenceSubgroup.Gamma`, `Gamma0`, `Gamma1`,
  `IsCongruenceSubgroup`, `Subgroup.adjoinNegOne`, `Subgroup.IsArithmetic`, the cusp
  vocabulary of `NumberTheory/ModularForms/Cusps.lean` (`IsCusp`, `CuspOrbits`,
  `strictWidthInfty`, `widthInfty`) and the modular group `ModularGroup.S`, `ModularGroup.T`.
- `modularCyclotomicCharacter`, `rootsOfUnity`, `IsPrimitiveRoot`,
  `Polynomial.cyclotomic.irreducible_rat`, `ZMod.unitsMap`, `ZMod.chineseRemainder`.
- `WeierstrassCurve`, `WeierstrassCurve.IsElliptic`, `WeierstrassCurve.Affine.Point` with its
  `AddCommGroup`, `WeierstrassCurve.j`, `AddSubgroup.torsionBy`, `VariableChange`.
- `Field.absoluteGaloisGroup`, the Krull topology, `NumberField`, `AlgebraicClosure`.
- `Matrix.J`, `Matrix.symplecticGroup`, `Matrix.ProjectiveSpecialLinearGroup` and
  `ProjectiveSpecialLinearGroup.rank_two_simple'`, `Matrix.SL2.commutator_eq_top`.
- Hermite's theorem `NumberField.finite_of_discr_bdd_of_isReal` and `…_of_isComplex`,
  `NumberField.InfinitePlace`.

### From Tau Ceti

- The profinite integers: `TauCeti.zHat`, the ring `Additive TauCeti.zHat`
  (`TauCeti.Topology.Algebra.Group.Profinite.ZHat.Ring`), `zHat.toZMod` and `zHat.ringLift`
  (`.ZMod`), `zHat.component` (`.Component`), `zHat.ringEquivPiPadicInt` and `zHat.idem`
  (`.Decomposition`), `zHat.unitsEquivPiPadicInt` and `zHat.unitsLift` (`.Units`),
  `zHat.continuousAutEquivUnits` (`TauCeti.Topology.Algebra.Group.ContinuousAut.ZHat`).
- `TauCeti.Supernatural`, `TauCeti.profiniteOrder`, `Subgroup.profiniteIndex`.
- The Tate module: `TauCeti.TateModule ℓ A` with its `ℤ_ℓ`-module structure and inverse-limit
  topology (`TauCeti.Algebra.Module.Torsion.TateModule`), `WeierstrassCurve.finrank_tateModule`
  and `nonempty_linearEquiv_tateModule` (`…TateModule.Basic`),
  `WeierstrassCurve.tateModuleGaloisRepresentation` with
  `continuous_tateModuleGaloisRepresentation_apply` (`…TateModule.Galois`),
  `WeierstrassCurve.tateModuleWeilPairing` (`…TateModule.WeilPairing`),
  `TauCeti.det_tateModuleGaloisRepresentation` (`…TateModule.Determinant`).
- Isogenies: `TauCeti.Isogeny`, `Isogeny.degree`, `degree_comp`, `Isogeny.ker`,
  `card_ker_le_degree`, `Isogeny.galoisConj`, the descent criteria
  (`TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.*`), `WeierstrassCurve.autGroup` and
  `autGroupMulEquiv` (`…EllipticCurve.Aut`), the quadratic twist (`…EllipticCurve.QuadraticTwist`).
- Congruence-subgroup arithmetic: `Gamma0_prime_index`, `Gamma0_prime_power_index`,
  `Gamma_le_Gamma_of_dvd`, `neg_one_mem_Gamma0`, `withCenter_le_Gamma0`
  (`TauCeti.NumberTheory.ModularForms.CongruenceSubgroups.Basic`),
  `Matrix.SpecialLinearGroup.map_intCast_zmod_surjective`
  (`TauCeti.LinearAlgebra.Matrix.SpecialLinearGroup.Basic`), `Subgroup.integerCuspWidth`
  (`…ModularForms.Cusps.Basic`), the stabiliser orders `TauCeti.ModularGroup.ellipticOrder`
  with `card_stabilizer_psl_I = 2`, `card_stabilizer_psl_ρ = 3`
  (`TauCeti.NumberTheory.Modular.Stabilizer`), the relations `S² = 1`, `(TS)³ = 1` in
  `PSL(2, ℤ)` (`…Modular.Relations`).
- `natCard_GL_fin_two` (`TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Card`) and the
  `GL₂` toolkit of `TauCeti.RepresentationTheory.CharacterTable.GL2.*` (diagonal and
  non-split tori, conjugacy classes of `GL₂(𝔽_q)`).
- `Field.absoluteGaloisGroup` is profinite (`TauCeti.absoluteGaloisGroupRestrictEquiv` and its
  instances), `TauCeti.inertiaSubgroup`, `TauCeti.inertiaPadicTameCharacter`,
  `TauCeti.continuousLocalCyclotomicCharacter`.

### From other roadmaps

The roadmaps consumed, with the relative links used throughout:

- [ProfiniteArithmetic](../ProfiniteArithmetic/README.md) (PA): Layer 0 (the ring `ẑ`, its
  projections, components, units and `zHat.unitsLift`), Layer 2.3 (`ClosedSubgroup`
  conjugacy classes `ClosedSubgroupConjClasses`).
- [ProfiniteProPGroups](../ProfiniteProPGroups/README.md) (PPG): Layer 1 (supernatural order
  and `Subgroup.profiniteIndex`), used only to say that the index of a closed subgroup is a
  supernatural number and is a natural number exactly for open subgroups.
- [ModularCurvesPartII](../ModularCurvesPartII/README.md) (MC2): §3.8 (the finite-level
  standard subgroups `levelGamma0`, `levelGamma1`, `levelGamma1Mu`, `splitCartan`,
  `splitCartanNormalizer`, `nonsplitCartan`, `nonsplitCartanNormalizer`, `projectiveIndex`,
  `levelDet`, `levelPullback`, `levelConj`), §3.9 (level-`H` structures), §3.12 (the stack
  `𝒳_H`), §§5.8–5.12 (the coarse curve `X_H`, the `j`-degree, the cusp divisor, cusps away
  from the level with their widths and Galois action, the cyclotomic structure), §§5.15–5.17
  (level maps, quotients, the Katz–Mazur comparison), §6.1 (compact analytic–algebraic
  comparison), §6.3 and §8.3 (cusp and component fields), §9.6 (Cartan curves), §9.7 (rational
  points of `X_H` and Galois images), Layer 13 (modular Jacobians) and Layer 16 (the quotients
  `A_f`, `dim A_f = [K_f : ℚ]`).
- [ModularCurves](../ModularCurves/README.md) (MC): Convention 5 (the right action on frames),
  Layer 2 (isogenies and the Weil pairing at scheme level), Layer 8D (`[Γ₀(N)]`), Layers 9–10
  (quotients, coarse curves and the prime-level compactifications).
- [ModularForms](../ModularForms/README.md) (MF): Layer 10A (cusp and elliptic-point counts
  `ε∞, ε₂, ε₃` of a congruence subgroup and the degree of `X(Γ) → X(1)`), Layer 10B (the
  genus formula `g = 1 + d/12 − ε₂/4 − ε₃/3 − ε∞/2` on the compact Riemann surface), Layer 4
  (newforms), Layer 7 (`L`-functions and analytic rank), Layer 8G (coefficient fields).
- [FuchsianOrbifolds](../FuchsianOrbifolds/README.md) (FO): Layers 3–5 (cusp data, widths,
  compactification, degree and Riemann–Hurwitz).
- [EllipticCurves](../EllipticCurves/README.md) (EC): Layer 1 (isogenies, `Isogeny.degree`,
  `[n]`, formal groups), Layer 2 (`E[N] ≃+ (ZMod N)²`, the Weil pairing, the Tate module),
  Layer 4 (reduction, Tate's algorithm, the Tate curve), Layer 5 (twists), Layer 6
  (Mordell–Weil), Layer 7 (descent) and its CM vocabulary `CMAction`, `HasGeometricCM`,
  `GeometricEnd`.
- [ArithmeticGaloisRepresentations](../ArithmeticGaloisRepresentations/README.md) (AGR):
  §2.3 (fundamental characters of tame inertia), Layer 4 (Borel and Cartan subgroups over finite
  fields, Dickson's classification `GL2Subgroup.dickson_projectiveImage`, Serre's Propositions
  15–18, its §4.5), §§6.1–6.4 (the Tate module as a continuous representation, its determinant,
  isogeny compatibility), §7.3 (similitude groups: `SimilitudeGroup.GSp`,
  `SimilitudeGroup.multiplier`, `det g = ν(g)^m` on `GSp_{2m}`), §7.5 (`GSp₄`-valued
  representations).
- [AdelicAlgebraicGroups](../AdelicAlgebraicGroups/README.md) (AA): AA.4.2, its milestone
  **Closed subgroups of p-adic Lie groups** (the analytic structure on a closed subgroup of a
  finite-dimensional `ℚ_p`-analytic Lie group, `Lie(C)` as a `ℚ_p`-Lie subalgebra, local
  exponential charts, and openness when `Lie(C)` is everything).
- [FaltingsFinitenessAndIsogenyTheorems](../FaltingsFinitenessAndIsogenyTheorems/README.md)
  (FF): R28.4.5 (`tate_semisimple`, `tate_end_iso`), R28.4.7 (`isogenous_iff_localFactors`),
  R28.6 (`elliptic_semisimple`, `elliptic_tate_hom_iso`, `elliptic_isogenous_iff_ap`,
  `finite_ellipticIsogenyClass`).
- [EisensteinIdealAndRationalTorsion](../EisensteinIdealAndRationalTorsion/README.md) (EI):
  §8.8 (`all_prime_torsion`: a rational point of prime order on an elliptic curve over `ℚ` has
  order `2`, `3`, `5` or `7`), under that section's own hypotheses (EI §8.1's level-thirteen data
  and §8.5's class-number datum), which 6.4 inherits.
- [EllipticCurveModularityPartII](../EllipticCurveModularityPartII/README.md) (EM2): §5.0a
  (`HasCyclicIsogeny`; Mazur's isogeny theorem `prime_isogeny_degrees` and
  `noncm_prime_isogeny_degrees`), §5.0b (Kenku's `cyclic_isogeny_degrees`), §6.0b (the
  `j`-images of `Y₀(11)(ℚ)`, `Y₀(17)(ℚ)`, `Y₀(37)(ℚ)`), §6.0f (the isogeny-degree bound over a
  number field).
- [EffectiveDiophantineMethods](../EffectiveDiophantineMethods/README.md) (ED): §§3.5–3.11
  (exact `2`-Selmer groups and descent via a rational `2`-isogeny for elliptic curves over `ℚ`),
  §3.20 (exact torsion subgroups from reductions), §3.23 (the `x − T` rank bound for genus-two
  Jacobians). These are methods applied in 6.4 to specific modular curves; ED itself treats no
  modular curve `X₁(N)`.
- [ShimuraVarieties](../ShimuraVarieties/README.md) (SV): §5.10 (the main theorem of complex
  multiplication).
- [ClassFieldTheory](../ClassFieldTheory/README.md) (CFT): Layer 11 (global Artin
  reciprocity), used through SV §5.10 and for the abelian division fields of CM curves.
- [Chebotarev](../Chebotarev/README.md): the density theorem for finite Galois extensions.
- [NumberFieldArithmetic](../../Completed/NumberFieldArithmetic/README.md) (NFA): decomposition
  groups, the Artin symbol, the splitting of a prime in a quadratic field.
- [ImaginaryQuadraticClassNumber](../ImaginaryQuadraticClassNumber/README.md) (IQ): the
  thirteen imaginary quadratic orders of class number one.
- [JacobianChallenge](../JacobianChallenge/README.md) (JC): Riemann–Roch for curves over a
  field, the Jacobian of a curve.
- [AlgebraicCurves](../AlgebraicCurves/README.md) (AC): function fields, closed points and
  their degrees, finite morphisms of curves.
- [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) (SSF): §5.11
  (`weil_bound_via_surfaces`, the Hasse–Weil bound `|#C(𝔽_q) − (q + 1)| ≤ 2g√q` for a smooth
  projective geometrically irreducible curve of genus `g` over `𝔽_q`).
- `CanonicalModelsAndGonality` (CMG): models of `X_H` (the explicit models of the curves
  `X₁(N)` and `X₀(N)` used in 6.4), Layer 7 (isolated, parametrized and sporadic points, Frey's
  criterion), Layer 8 (Abramovich's linear lower bound on gonality).

Sibling roadmaps whose material is named but not specified here:
`SatoTateGroups` (endomorphism algebras, Sato–Tate groups of elliptic curves and abelian
surfaces), `HyperellipticCurves` (models and invariants of genus-two curves),
`EllipticCurvePeriodsAndModularParametrizations` (modular degree, Manin constant, periods).

### Consumed, not redefined

Every object below is used under its supplier's name and is not defined again here.

| Object | Supplier |
| --- | --- |
| `ẑ`, `zHat.toZMod`, `zHat.component`, `zHat.ringEquivPiPadicInt`, `zHat.unitsLift` | Tau Ceti `TauCeti.Topology.Algebra.Group.Profinite.ZHat.*`, specified by PA Layer 0 |
| `ClosedSubgroupConjClasses G` | PA 2.3 |
| `Subgroup.profiniteIndex` | Tau Ceti, specified by PPG Layer 1 |
| Gassmann equivalence: `Subgroup.AlmostConjugate` on a finite group (Tau Ceti main `TauCeti.GroupTheory.AlmostConjugate`, cited in prose) and `Subgroup.AlmostConjugateOfFiniteIndex` with its reduction to a common finite quotient | `FiniteGroupInvariants` 7.1, 7.3 |
| `levelGamma0 N`, `levelGamma1 N`, `splitCartan ℓ`, `splitCartanNormalizer ℓ`, `nonsplitCartan ℓ ε`, `nonsplitCartanNormalizer ℓ ε`, `projectiveIndex`, `levelDet`, `levelPullback`, `levelConj` as subgroups of `GL₂(ℤ/n)` | MC2 §3.8 |
| `Gamma N`, `Gamma0 N`, `Gamma1 N`, `IsCongruenceSubgroup`, `Subgroup.adjoinNegOne`, `Matrix.SpecialLinearGroup.mapGL`, `Matrix.GeneralLinearGroup.map`, `Matrix.GeneralLinearGroup.det` | Mathlib |
| `Gamma0_prime_index`, `Gamma0_prime_power_index`, `Matrix.SpecialLinearGroup.map_intCast_zmod_surjective`, `natCard_GL_fin_two` | Tau Ceti |
| Borel, split and non-split Cartan subgroups over finite fields, Dickson's classification, Serre's Propositions 15–18 | AGR §§4.2–4.5 |
| `SimilitudeGroup.GSp`, `SimilitudeGroup.multiplier`, `det g = ν(g)^m`, the comparison of the Gram matrices `−Matrix.J` and `Matrix.J` | AGR §7.3 |
| Closed subgroups of `ℚ_p`-analytic Lie groups, `Lie(C)`, exponential charts, openness from a full Lie algebra | AA.4.2 |
| `ε₂, ε₃, ε∞`, the genus of `X(Γ)` and `deg(X(Γ) → X(1)) = [PSL₂(ℤ) : Γ̄]` | MF 10A–10B on FO Layers 3–5 |
| `TateModule ℓ`, `tateModuleGaloisRepresentation`, `tateModuleWeilPairing`, `det_tateModuleGaloisRepresentation`, `finrank_tateModule` | Tau Ceti `TauCeti.AlgebraicGeometry.EllipticCurve.TateModule.*` |
| `Isogeny`, `Isogeny.degree`, `Isogeny.ker`, `[n]`, `autGroup`, `quadraticTwist` | Tau Ceti `TauCeti.AlgebraicGeometry.EllipticCurve.*`, specified by EC Layers 1, 2, 5 |
| `torsion_addEquiv_prod` (`E[N] ≃+ (ZMod N)²`), `CMAction`, `HasGeometricCM`, `GeometricEnd` | EC Layers 1–2 |
| `𝒳_H`, `X_H`, `levelStack.map`, `levelMap`, `conjIso`, `toCyclotomicBase`, the cusp set `⟨±u⟩\GL₂(ℤ/n)/H̄` with widths and Galois action | MC2 §§3.12, 5.8–5.12, 5.15 |
| The dictionary between `Y_H(K)` and images, `j ∉ {0, 1728}`, `−I ∈ H̄` | MC2 §9.7 |
| `cartanCurve`, `splitCartanCurve_iso_gammaZero`, `gammaZeroPlus` | MC2 §§9.5–9.8 |
| `modularQuotient` (`A_f`), `dim A_f = [K_f : ℚ]`, `J₁(N)`, `J₀(N)` | MC2 §§13.1, 16.2, 16.4, 16.6 |
| `tate_semisimple`, `tate_end_iso`, `isogenous_iff_localFactors`, `finite_ellipticIsogenyClass` | FF R28.4.5, R28.4.7, R28.6 |
| `all_prime_torsion` (prime orders `2, 3, 5, 7` only), with its hypotheses | EI §8.8 |
| `HasCyclicIsogeny`; Mazur's isogeny theorem `prime_isogeny_degrees`, `noncm_prime_isogeny_degrees`; Kenku's `cyclic_isogeny_degrees`; the `j`-images of `Y₀(11)(ℚ)`, `Y₀(17)(ℚ)`, `Y₀(37)(ℚ)` | EM2 §§5.0a–5.0b, 6.0b |
| The degree bound `10⁷ d² (max{h_F(E), 985} + 4 log d)²` for a geometric isogeny between geometrically isogenous curves over a degree-`d` field, and for every cyclic isogeny from a non-CM `E` | EM2 §6.0f |
| `2`-descent over `ℚ`, descent via a `2`-isogeny, the genus-two `x − T` rank bound, exact torsion subgroups | ED §§3.5–3.11, 3.23, 3.20 |
| Frey's criterion, Abramovich's gonality bound, isolated and parametrized points, models of `X_H` | CMG Layers 7–8 |
| The main theorem of complex multiplication | SV §5.10 |
| The Hasse–Weil bound `weil_bound_via_surfaces` for curves over `𝔽_q` | SSF §5.11 |
| The thirteen class-number-one orders and their `j`-invariants | IQ |
| `modularCyclotomicCharacter`, `Polynomial.cyclotomic.irreducible_rat`, Hermite's theorem `NumberField.finite_of_discr_bdd_of_isReal`/`…_of_isComplex`, `Matrix.card_GL_field`, `Matrix.J`, `Matrix.symplecticGroup`, `ProjectiveSpecialLinearGroup.rank_two_simple'` | Mathlib |

### Supplier gaps

The following `gaps` entries specify required inputs that no cited contract supplies
unconditionally. A gap supplies no theorem; a statement here that uses one is conditional on it and
says so.

- `gap:abelian-surface-open-image`: supplier
  [ArithmeticGaloisRepresentations](../ArithmeticGaloisRepresentations/README.md) Layer 7 (its
  big-image layer); needs: for a principally polarised abelian surface `A` over a number field `K`
  with `End(A_{K̄}) = ℤ`, that `ρ_{A,ℓ^∞}(G_K)` is open in `GSp₄(ℤ_ℓ)` for every `ℓ` and that
  `ρ̄_{A,ℓ}(G_K) ⊇ Sp₄(𝔽_ℓ)` for all but finitely many `ℓ`, with `End(A_{K̄}) = ℤ` as the input
  (not a hypothesis on the residual images); Serre, *Résumé des cours de 1985–1986*, §2.3,
  Théorème 3 and its corollary, p. 97. The finite-group criteria of AGR §§7.9–7.11 (adequate,
  enormous, vast images) take large residual images as hypotheses and do not supply it. 7.2 uses
  this gap for the finiteness of `nonmaximalPrimes A` and for nothing else.

## What is missing

Nothing in Mathlib or Tau Ceti names `GL₂(Ẑ)`, an open subgroup's level or genus, a Galois
image as a conjugacy class, an adelic Tate module, an isogeny class, or `GSp₄`. In particular:

- the topological group `GL (Fin 2) ẑ` has no `CompactSpace` or `TotallyDisconnectedSpace`
  instance assembled for it, no reduction maps and no inverse-limit theorem;
- Tau Ceti's `TateModule` is `ℓ`-adic; the product over all `ℓ` with its `ẑ`-structure, the
  identification of its level-`N` quotient with `E[N]`, and the adelic representation do not
  exist;
- there is no notion of "the image of a Galois representation up to conjugacy" and no
  invariant of such an image;
- `Isogeny` has no notion of isogeny class, cyclic isogeny of a given degree over the base
  field, or minimal-degree isogeny between two curves;
- the finite-group formulas `ν₂, ν₃, ν∞, g(H)` exist nowhere, and MF Layer 10's counts are
  stated on the Riemann surface, not on cosets of a finite group;
- Dickson's classification is a target of AGR Layer 4 (consumed), but Serre's lifting lemma,
  the commutator subgroup of `GL₂(Ẑ)`, entanglement and agreeability exist nowhere (Gassmann
  equivalence is Tau Ceti main's `Subgroup.AlmostConjugate`, specified for finite-index subgroups
  by `FiniteGroupInvariants` 7.3);
- Serre's open image theorem is stated by no roadmap; its inputs are scattered over FF, AGR,
  EC, Chebotarev and Mathlib, and Layer 4 is the assembly;
- Mazur's torsion theorem is stated by no roadmap as a theorem about elliptic curves (EI states
  its prime-order half), and nothing derives the shape of isogeny classes over `ℚ` from Mazur's
  and Kenku's isogeny theorems (EM2 §§5.0a–5.0b);
- `GSp₄` is not in Mathlib, which has only `Sp`; the group and its multiplier are AGR §7.3's,
  and its adelic points, open subgroups, orbit signatures and the subgroup types of `GSp₄(𝔽_ℓ)`
  exist nowhere.

## Layer 0: the profinite group `GL₂(Ẑ)` and its open subgroups

Suggested file: `GL2Zhat/Basic.lean`, `GL2Zhat/Level.lean`, `GL2Zhat/Standard.lean`,
`GL2Zhat/CongruenceSubgroup.lean`.

### 0.1 The group, its reductions and the inverse-limit property

- `GL₂(Ẑ) := GL (Fin 2) ẑ` is a compact, Hausdorff, totally disconnected topological group:
  the units of the compact Hausdorff totally disconnected topological ring
  `Matrix (Fin 2) (Fin 2) ẑ` (Mathlib supplies the topological group and `CompactSpace`
  instances; total disconnectedness is inherited along the closed embedding
  `Units.embedProduct`). Register these as instances on `GL (Fin 2) ẑ`; no `ProfiniteGrp`
  wrapper is introduced, and `ProfiniteGrp.of` is used only where a categorical limit is
  genuinely needed.
- `red n : GL₂(Ẑ) →* GL₂(ℤ/n)` is `GeneralLinearGroup.map (zHat.toZMod n)` for `n : ℕ+`;
  it is continuous (the target is discrete and finite), surjective (lift a matrix entrywise by
  surjectivity of `zHat.toZMod n` and correct the determinant through `zHat.isUnit_iff_toZMod`,
  or by the surjectivity of `SL₂(Ẑ) → SL₂(ℤ/n)` of 0.4), and compatible along divisibility:
  `GL.map (ZMod.castHom h _) ∘ red m = red n` for `n ∣ m`.
- `Γ(n) := ker (red n)`, an open normal subgroup; `Γ(1) = ⊤`; `Γ(m) ≤ Γ(n)` for `n ∣ m`;
  `Γ(m) ⊓ Γ(n) = Γ(lcm m n)`; the `Γ(n)` form a neighbourhood basis of `1`: every open
  subgroup of `GL₂(Ẑ)` contains some `Γ(n)` (from `zHat.exists_monoidHom_mk_eq_toZMod`
  applied entrywise, or from the inverse-limit description below).
- **The inverse-limit property.** Two elements with the same images under every `red n` are
  equal (`zHat.ext_of_toZMod` entrywise), and a compatible family of elements of the
  `GL₂(ℤ/n)` comes from a unique element of `GL₂(Ẑ)` (`zHat.existsUnique_forall_toZMod_eq`
  entrywise, with the determinant a unit at every level, hence a unit of `ẑ`). A map into
  `GL₂(Ẑ)` is continuous as soon as every `red n ∘ f` is. So `GL₂(Ẑ) ≅ lim GL₂(ℤ/n)` as
  topological groups; this is a theorem about the carrier, not a definition.
- **Cardinalities.** `|GL₂(ℤ/N)| = N⁴ ∏_{p ∣ N} (1 − p⁻¹)(1 − p⁻²)`, from `Matrix.card_GL_field`
  at the primes and the kernel counts of `GL₂(ℤ/p^{k+1}) → GL₂(ℤ/p^k)` (order `p⁴`), assembled
  by the Chinese remainder theorem; equivalently `φ(N) · N · (N/∏ p)² · ∏_{p∣N}(p² − 1)`, the
  form the LMFDB displays. `|SL₂(ℤ/N)| = |GL₂(ℤ/N)| / φ(N)`.
- **Determinant and `SL₂(Ẑ)`.** `det : GL₂(Ẑ) →* ẑˣ` is continuous and surjective;
  `SL₂(Ẑ) := ker det`, closed; `red n ∘ det = det ∘ red n` under `Units.map (zHat.toZMod n)`;
  `ẑˣ ≃ₜ* ∏_ℓ ℤ_ℓˣ` is Tau Ceti's `zHat.unitsEquivPiPadicInt`.
- **The product decomposition.** `GL₂(Ẑ) ≃ₜ* ∏_ℓ GL₂(ℤ_ℓ)` through `zHat.ringEquivPiPadicInt`
  entrywise, with projections `pr_ℓ := GL.map (zHat.component ℓ)`; `red (ℓ^k) = red_{ℓ^k} ∘ pr_ℓ`
  through `PadicInt.toZModPow`.

*Needs:* Tau Ceti PA Layer 0 declarations; Mathlib `Units` topology, `Matrix.topologicalRing`,
`GeneralLinearGroup.map`, `Matrix.card_GL_field`.

In `Suggested.lean` the inverse-limit property is the pair `red_ext` (uniqueness) and
`exists_red_eq` (existence of a lift of a compatible family).

**Checks.**

- `|GL₂(ℤ/N)|` for `N = 1, 2, 3, 5, 9` is `1, 6, 48, 480, 3888` by both displayed formulas, and
  dividing by `φ(N)` gives `|SL₂(ℤ/N)| = 1, 6, 24, 120, 648`.
- Compatibility: `T = [[1, 1], [0, 1]]` reduces modulo `4`, `2`, `1` to matrices whose upper-right
  entries are `1`, `1`, `0`, each the reduction of the previous one; the constant family `I` has
  the single lift `I`; and `Γ(2) ⊓ Γ(3) = Γ(6)`.
- (rejection) the levels are indexed by `ℕ+`: at `n = 0` the target would be `GL₂(ZMod 0) =
  GL₂(ℤ)`, and no continuous homomorphism from the compact `GL₂(Ẑ)` onto the infinite discrete
  `GL₂(ℤ)` exists, so `red 0` is not a reduction.

### 0.2 Open subgroups: level, index, `±H`, determinant

For `H : OpenSubgroup GL₂(Ẑ)`:

- **Level.** `level H := sInf {N : ℕ | 0 < N ∧ Γ(N) ≤ H}`, a positive integer by 0.1;
  `Γ(level H) ≤ H`; `Γ(N) ≤ H ↔ level H ∣ N` (because `Γ(N) ⊔ Γ(M) = Γ(gcd N M)`, the
  Chinese remainder theorem on kernels); `H = (red N)⁻¹(red N '' H)` exactly when
  `Γ(N) ≤ H`. The image `H̄_N := red N '' H` for `N` a multiple of the level determines `H`,
  and `H ↦ H̄_N` is an order isomorphism between open subgroups containing `Γ(N)` and
  subgroups of `GL₂(ℤ/N)`, inverse to `H̄ ↦ (red N)⁻¹ H̄` (this is MC2 §3.8's bijection, now
  stated on the carrier). `level H = 1 ↔ H = ⊤`.
- **Index.** `H.index` is finite and equals `[GL₂(ℤ/N) : H̄_N]` for every `N` with
  `Γ(N) ≤ H`; it equals the PPG supernatural index `profiniteIndex` read as a natural number.
  `index (H ⊓ H') ≤ index H · index H'`, `level (H ⊓ H') ∣ lcm (level H) (level H')`, and
  `H ⊓ H'` has level `lcm` when the levels are coprime (the fibre-product case of Layer 5.5).
- **`−I` and `±H`.** `±H := H.adjoinNegOne`; `−I ∈ H ↔ ±H = H`; `[±H : H] ∈ {1, 2}`
  (`Subgroup.relIndex_adjoinNegOne_eq_two`); the projective index `index (±H)`; `level (±H)`
  divides `level H` and may be smaller: `Γ₁(5)` and `±Γ₁(5) = Γ_{±1}(5)` both have level `5`,
  while `H := {g ∈ Γ(2) : g₁₁ ≡ 1 mod 4}` (a subgroup, since `Γ(2)/Γ(4) ≅ M₂(𝔽₂)` additively via
  `g = I + 2A ↦ A`) has `−I ∉ H`, `level H = 4` and `±H = Γ(2)` of level `2`.
- **Determinant image.** `det H ≤ ẑˣ` is open; `detLevel H` is the least `M` with
  `ker (ẑˣ → (ℤ/M)ˣ) ≤ det H`, dividing `level H`; `IsFullDet H := det H = ⊤`;
  `IsFullDet H ↔ det H̄_N = (ℤ/N)ˣ` for `N` a multiple of the level (MC2 `levelDet`). When
  `det H ≠ ⊤` the LMFDB label carries the prefix `M.d.m` of `det H ≤ GL₁(Ẑ)`: `M = detLevel H`,
  `d = [ẑˣ : det H]`; the ordinal `m` is not a target.
- **Conjugation.** `g ∈ GL₂(Ẑ)` acts on open subgroups by `H ↦ g⁻¹Hg` (the LMFDB's `H^g`);
  level, index, projective index, `det H`, `−I ∈ H` and `IsFullDet` are invariant.
- **Open subgroups of `GL₂(ℤ_ℓ)`** are treated in parallel, with level a power of `ℓ`; the
  `ℓ`-adic projection of an open `H ≤ GL₂(Ẑ)` is open, with `level (pr_ℓ H) ∣ ℓ^{v_ℓ(level H)}`
  and strict divisibility possible for entangled `H` (Layer 2.3): `S_{−3}` of 2.4 has level `6`
  while `pr_2 S_{−3} = GL₂(ℤ₂)` and `pr_3 S_{−3} = GL₂(ℤ₃)` both have level `1`.

*Needs:* 0.1; Mathlib `OpenSubgroup`, `Subgroup.index`, `Subgroup.adjoinNegOne`.

**Checks.**

- `⊤`, `Γ₀(2)`, `Γ₀(3)`, `Γ(3)` have levels `1, 2, 3, 3` and indices `1, 3, 4, 48`, read on their
  images in `GL₂(ℤ/N)` at their levels.
- Fine against coarse: `Γ₁(3)` has image of order `6` in `GL₂(𝔽₃)` and `±Γ₁(3)` of order `12`,
  so `index Γ₁(3) = 8` and `index (±Γ₁(3)) = 4 = 8/2`.
- Determinant: `Γ(3)` and `±Γ(3)` have `detLevel = 3` and `[ẑˣ : det] = 2`, indices `48` and `24`,
  and both have `PSL₂`-index `12` (0.4), so level, index, determinant index and `PSL₂`-index are
  four different invariants.
- (rejection) `H = {g ∈ Γ(2) : g₁₁ ≡ 1 mod 4}` has level `4` while `±H = Γ(2)` has level `2`:
  the level of `±H` can drop.

### 0.3 The standard open subgroups

Each is the preimage under `red N` of the finite-level subgroup named by MC2 §3.8 (consumed:
the subgroups, their orders, `projectiveIndex`, `levelDet`); what is owned here is the open
subgroup of `GL₂(Ẑ)`, its level, and the Cartan subgroups at composite level, which MC2
states only at primes.

- `Γ₀(N)`, `Γ₁(N)`, `Γ(N)`, `Γ_{±1}(N) := ±Γ₁(N)`, `Γ_arith(N)` (image `[[1, 0], [0, *]]`),
  `Γ_{arith,1}(M, MN)` (image `[[1, M*], [0, *]] ≤ GL₂(ℤ/MN)`), `Γ_{arith,±1}(M, MN)`: levels
  `N` (for `N ≥ 2`; all are `⊤` at `N = 1`), `MN`; indices `ψ(N)`, `φ(N)ψ(N)`,
  `|GL₂(ℤ/N)|`, …, with `ψ(N) = N ∏_{p∣N}(1 + 1/p)`; `−I ∈ Γ₀(N)` always, `−I ∈ Γ₁(N) ↔ N ∣ 2`;
  all have `IsFullDet` except `Γ(N)` (`det Γ(N) = ker(ẑˣ → (ℤ/N)ˣ)`).
- **Cartan subgroups of an étale algebra.** For a commutative ring `R` and a free rank-two
  étale `R`-algebra `A` with an `R`-basis, `cartan A ≤ GL₂(R)` is the image of
  `Aˣ → Aut_R(A) ≅ GL₂(R)` by multiplication; `extendedCartan A` is generated by `cartan A` and
  the canonical involution of `A`. For `R = ℤ/N`, `A` is determined up to isomorphism by its
  type at each prime `p ∣ N` (split `ℤ/p^k × ℤ/p^k` or non-split `W(𝔽_{p²})/p^k`), and
  `C_s(N)`, `C_ns(N)` are the Cartans of the everywhere-split and everywhere-non-split algebras,
  `C_s⁺(N)`, `C_ns⁺(N)` the extended Cartans. At a prime `ℓ` these are MC2 §3.8's
  `splitCartan`, `nonsplitCartan`, `splitCartanNormalizer` (for odd `ℓ`), `nonsplitCartanNormalizer`
  (MC2's `C_s⁺(2)` is the monomial group of order `2`, which is the extended Cartan of the
  split algebra `𝔽₂ × 𝔽₂`; `C_ns⁺(2) = GL₂(𝔽₂)`), and the normaliser statements of AGR §4.2 apply.
  Orders: `|C_s(N)| = φ(N)²`, `|C_ns(N)| = N² ∏_{p∣N}(1 − p⁻²)`, the extended ones twice as
  large; `−I` lies in every Cartan; `det` is surjective on every Cartan and extended Cartan.
- **The CM Cartan.** For an imaginary quadratic order `𝒪` and `R ∈ {ℤ/N, ℤ_ℓ, ẑ}`,
  `𝒪 ⊗ R` is free of rank two with basis `(1, ω)`; `C_𝒪(R) := cartan (𝒪 ⊗ R)` when `𝒪 ⊗ R` is
  étale over `R` (i.e. `N` or `ℓ` prime to `disc 𝒪`), and in general `C_𝒪(R) := (𝒪 ⊗ R)ˣ`
  acting by multiplication, a closed subgroup of `GL₂(R)` whose reduction at the primes
  dividing `disc 𝒪` is not a Cartan subgroup. `N_𝒪(R) := ⟨C_𝒪(R), ι⟩` with `ι` the conjugation
  of `𝒪` extended `R`-linearly: the `𝒪`-linear and `𝒪`-antilinear automorphisms, `C_𝒪(R)` of
  index two in it. Over `ℤ_ℓ` this is the normaliser of `C_𝒪(ℤ_ℓ)` in `GL₂(ℤ_ℓ)` (2.1); over `ẑ`
  it is **not**: the normaliser of `C_𝒪(ẑ) = ∏_ℓ C_𝒪(ℤ_ℓ)` in `∏_ℓ GL₂(ℤ_ℓ)` is `∏_ℓ N_𝒪(ℤ_ℓ)`,
  in which `C_𝒪(ẑ)` has uncountable index (conjugate at one prime, identity at the others), and
  the CM image of Layer 4.5 lies in `N_𝒪(ẑ)`, not merely in that normaliser.
- **The exceptional levels** `X_{S₄}(ℓ)`, `X_{A₄}(ℓ)`, `X_{A₅}(ℓ)`: for a prime `ℓ ≥ 5`, the
  full preimages `G_{S₄}(ℓ)`, `G_{A₄}(ℓ)`, `G_{A₅}(ℓ)` in `GL₂(ℤ/ℓ)` (all scalars included) of the
  subgroups of `PGL₂(𝔽_ℓ)` isomorphic to `S₄`, `A₄`, `A₅` (AGR §§4.3–4.4 supplies existence and
  conjugacy: `S₄` and `A₄` for every `ℓ ≥ 5`, `A₅` for `ℓ ≡ ±1 mod 5`); their indices are
  `|PGL₂(𝔽_ℓ)|/24`, `/12`, `/60`. Their determinant images are forced, not chosen: `det` modulo
  squares, `GL₂(𝔽_ℓ) → 𝔽_ℓˣ/𝔽_ℓˣ² ≅ C₂`, factors through `PGL₂(𝔽_ℓ)` (a scalar has square
  determinant) and is the quotient `PGL₂(𝔽_ℓ)/PSL₂(𝔽_ℓ)`. Since `A₄` and `A₅` have no quotient of
  order two, `det G_{A₄}(ℓ) = det G_{A₅}(ℓ) = 𝔽_ℓˣ²`, of index `2`, with canonical field
  `ℚ(√ℓ*)`, `ℓ* = (−1)^{(ℓ−1)/2} ℓ` (5.1). For `S₄`, `det G_{S₄}(ℓ) = 𝔽_ℓˣ` when the `S₄` is not
  contained in `PSL₂(𝔽_ℓ)`, i.e. `ℓ ≡ ±3 mod 8`, and `𝔽_ℓˣ²` when `ℓ ≡ ±1 mod 8`. So
  `G_{S₄}(ℓ)` has `IsFullDet` exactly for `ℓ ≡ ±3 mod 8`, and `G_{A₄}(ℓ)`, `G_{A₅}(ℓ)` never.

*Needs:* 0.2; MC2 §3.8; AGR §§4.2–4.4; Mathlib `Algebra.IsEtale` is not needed — the étale
rank-two algebras over `ℤ/p^k` are classified directly by the discriminant of the basis.

Of the standard subgroups, `Suggested.lean` declares only `Γ₀(N)` (`Gamma0Zhat`); the others,
the Cartans and the exceptional preimages are specified with these Checks in this README only.

**Checks.**

- `|C_ns(15)| = 15²(1 − 1/9)(1 − 1/25) = 192`, against `|C_s(15)| = φ(15)² = 64` (worked
  example 11).
- At `ℓ = 13`: `|C_ns⁺(13)| = 336 = 2·(13² − 1)` and `[GL₂(𝔽₁₃) : C_ns⁺(13)] = 26208/336 = 78`,
  the index of `X_ns⁺(13)` (worked examples 3 and 11).
- At `N = 2`: `C_ns(2)` has order `3` and is the kernel of the sign `ε` of 2.4, and
  `C_ns⁺(2) = GL₂(𝔽₂)`.
- (boundary) `−I ∈ C_ns(N)` and `det C_ns(N) = (ℤ/N)ˣ` for every `N`; the class of `C_ns(N)` does
  not depend on the basis `(1, ω)` chosen at each prime.
- (rejection) at `ℓ = 5`, `G_{A₄}(5)` has order `48` and determinant image `{1, 4}`, of order `2`
  in `𝔽₅ˣ`: its index is `10`, its determinant index `2`, and its `PSL₂`-index (the degree of each
  geometric component over `X(1)`, 0.4) is `5`. Full determinant cannot be imposed on it.
- At `ℓ = 13 ≡ −3 mod 8`, `G_{S₄}(13)` has `IsFullDet` and index `|PGL₂(𝔽₁₃)|/24 = 2184/24 = 91`
  (worked example 3).

### 0.4 `Γ_H`, the `SL₂`-level, the `PSL₂`-index, and density

- `Γ_H := H.comap (mapGL ẑ : SL(2, ℤ) →* GL₂(Ẑ))`; it contains `Gamma N` for `N = level H`,
  so it is a congruence subgroup of finite index (Mathlib's `IsCongruenceSubgroup` and
  `instFiniteIndexGamma`). `Γ_{Γ₀(N)} = Gamma0 N`, `Γ_{Γ₁(N)} = Gamma1 N`, `Γ_{Γ(N)} = Gamma N`
  (the `Ẑ`-level form of MC2 `levelGamma0_comap`).
- **`SL₂`-level** `sl2Level H := sInf {M : ℕ | 0 < M ∧ Gamma M ≤ Γ_H}`; `sl2Level H ∣ level H`,
  with strict divisibility possible: the index-two subgroup `S_D` of Layer 3.5 has level
  `lcm(2, |D|)` and `SL₂`-level `2`.
- **Density.** The closure of `mapGL ẑ '' SL(2, ℤ)` in `GL₂(Ẑ)` is `SL₂(Ẑ)`: surjectivity of
  `SL₂(ℤ) → SL₂(ℤ/N)` at every level (Tau Ceti `map_intCast_zmod_surjective`) and compactness.
  Consequently `H ∩ SL₂(Ẑ)` is the closure of `Γ_H`, the `SL₂`-level of `H` is the level of
  `H ∩ SL₂(Ẑ)` as an open subgroup of `SL₂(Ẑ)`, and two open subgroups with the same `Γ_H`
  have the same intersection with `SL₂(Ẑ)` (the twist relation of Layer 2.6).
- **`PSL₂`-index** `pslIndex H := (Γ_{±H}).index = [SL₂(ℤ/N) : Γ̄_H]` for `Γ̄_H` as in
  convention 6; `pslIndex H = index (±H)` when `IsFullDet H` (strong approximation: the map
  `SL₂(ℤ/N)/Γ̄_H → GL₂(ℤ/N)/±H̄_N` is a bijection exactly when `det H̄_N = (ℤ/N)ˣ`), and in
  general `index (±H) = pslIndex H · [ (ℤ/N)ˣ : det H̄_N ]`. For `Γ₀(p^k)` this is Tau Ceti's
  `Gamma0_prime_power_index`, which is the bridge check of `Suggested.lean`.
- `Γ_{±H} = Γ_H.adjoinNegOne` for every `H`: `mapGL ẑ` sends `−γ` to `−mapGL ẑ γ`, so the preimage
  of `±H = H ∪ (−I)H` is `Γ_H ∪ (−Γ_H)`.

*Needs:* 0.2, 0.3; Tau Ceti `map_intCast_zmod_surjective`, `Gamma0_prime_power_index`; Mathlib
`CongruenceSubgroup`.

**Checks.**

- `S_{37}` (2.4) has level `74` and `SL₂`-level `2`: `2 ∣ 74`, and the two are different.
- `pslIndex Γ₀(9) = 12 = index Γ₀(9)` (full determinant), while `±Γ(3)` has index `24 = 12 · 2`,
  `PSL₂`-index `12` and determinant index `2`, as the general formula requires.
- Bridge: `Γ_{Γ₀(9)} = Gamma0 9` and `pslIndex Γ₀(9) = 3¹ · (3 + 1) = 12`, Tau Ceti's
  `Gamma0_prime_power_index` (`pslIndex_gamma0_prime_pow` in `Suggested.lean`).
- (rejection) `pslIndex_eq_index_pm` needs `IsFullDet`: for `Γ(3)`, `pslIndex = 12 ≠ 24 = index (±Γ(3))`.

### Examples

Worked examples 1, 2, 10 and 11: levels, indices, `±H`, determinant images and orders of
`GL₂(ℤ/N)` for `Γ₀(11)`, `Γ₁(11)`, `Γ(5)`, `X_arith(5)`; the exceptional preimage `G_{A₄}(5)` of
0.3's Checks.

### Dependencies

PA Layer 0 and PA 2.3 through Tau Ceti's `zHat` API; PPG Layer 1; MC2 §3.8; AGR §§4.2–4.4;
Mathlib `GL`, `SL`, `Units` topology, `OpenSubgroup`, `Subgroup.index`, `Subgroup.adjoinNegOne`,
`CongruenceSubgroup.Gamma0`; Tau Ceti `map_intCast_zmod_surjective`, `Gamma0_prime_power_index`.

## Layer 1: cusps, elliptic points and the genus of an open subgroup

Suggested file: `GL2Zhat/Genus.lean`, `GL2Zhat/Cusps.lean`, `GL2Zhat/RiemannSurface.lean`.

### 1.1 The coset model and the three counts

For `H` open and `N` a multiple of `level H`, with `Γ̄_H ≤ SL₂(ℤ/N)` as in convention 6:

- the right coset space `Γ̄_H \ SL₂(ℤ/N)` is finite of cardinality `pslIndex H` (0.4) with the
  right action of `SL₂(ℤ/N)`; `ν₂(H)`, `ν₃(H)` are the numbers of fixed points of `S` and `R`,
  `cusps(H)` the set of `⟨T⟩`-orbits, `ν∞(H)` its cardinality, `width c` the orbit size;
- **independence of `N`**: for `N ∣ M` the reduction `SL₂(ℤ/M) → SL₂(ℤ/N)` induces a bijection
  of coset spaces equivariant for `S`, `R`, `T`, so all four numbers and the multiset of
  widths are independent of the chosen multiple of the level, and are defined on `H` itself;
- **conjugation invariance** under `GL₂(Ẑ)`: conjugation by `g` carries the coset space of
  `H` to that of `g⁻¹Hg` equivariantly up to the action of `det g` on `S`, `R`, `T` (which
  preserves the orbit structure since `[[e,0],[0,1]]` normalises `⟨T⟩` and the conjugacy
  classes of `S` and `R` in `GL₂`); so the counts depend only on the conjugacy class;
- `Σ_c width c = pslIndex H`; `ν₂(H) = #{g : g S g⁻¹ ∈ Γ̄_H}/|Γ̄_H|`, equivalently
  `|Γ̄_H ∩ C_S| · |SL₂(ℤ/N)| / (|Γ̄_H| · |C_S|)` with `C_S` the `SL₂(ℤ/N)`-conjugacy class of
  `S`; likewise for `R`;
- the **fine/coarse identity** `ν₂(H) = ν₂(±H)`, etc.: all counts of `H` are those of `±H`.
- For `Γ₀(N)`: `ν₂ = ∏_{p∣N}(1 + (−1/p))` for `4 ∤ N` and `0` otherwise, `ν₃ = ∏(1 + (−3/p))`
  for `9 ∤ N` and `0` otherwise, `ν∞ = Σ_{d∣N} φ(gcd(d, N/d))`, widths `N / gcd(c², N)` at the
  cusp `a/c` (Diamond–Shurman §3.8–3.9); these are theorems about the coset model proved
  through the identification of `Γ̄_{Γ₀(N)} \ SL₂(ℤ/N)` with `ℙ¹(ℤ/N)`.
- **Lean form.** `Suggested.lean` reads `ν₂`, `ν₃`, the cusps and their widths on Mathlib's left
  coset space `SL(2, ℤ) ⧸ Γ_{±H}` with the left action of `SL(2, ℤ)`. The coset `g·Γ_{±H}`
  corresponds to the right coset `Γ_{±H}·g⁻¹`, and reduction mod `N` carries that bijectively onto
  the coset space of convention 6 (surjectivity of `SL₂(ℤ) → SL₂(ℤ/N)` and `Gamma N ≤ Γ_{±H}`).
  Left multiplication by `γ` becomes right multiplication by `γ⁻¹`, and an element and its
  inverse have the same fixed points and the same orbits, so the fixed points of `S` (Mathlib's
  `ModularGroup.S = [[0, −1], [1, 0]]`, the inverse of convention 6's `S`) and of `R`, and the
  `⟨T⟩`-orbits with their sizes, are those of convention 6.

*Needs:* 0.4; Mathlib `MulAction.orbitRel`, `Fintype` of `SL₂(ℤ/N)`.

### 1.2 The genus

`genus H := 1 + pslIndex H / 12 − ν₂ H / 4 − ν₃ H / 3 − ν∞ H / 2`, a rational number by
definition. That it is a non-negative integer is not a formal consequence of the finite data;
it is the comparison theorem 1.4. API: invariance under conjugation and under `H ↦ ±H`;
`genus ⊤ = 0`; `genus (Γ₀(N))` by the closed formula; monotonicity is not formal (`H' ≤ H` gives
`genus H' ≥ genus H` only through Riemann–Hurwitz, 1.4); `genus H = 0` for exactly the fifteen
`Γ₀(N)` with `N ∈ {1,…,10, 12, 13, 16, 18, 25}`.

*Needs:* 1.1.

### 1.3 Cusps as double cosets, the Galois action, rational cusps and cusp fields

- For every open `H`, the map `Γ̄_H \ SL₂(ℤ/N) / ⟨T⟩ → ±H̄_N \ GL₂(ℤ/N) / ⟨T⟩` induced by the
  inclusion is injective, and it is surjective exactly when `det H̄_N · det⟨T⟩ = (ℤ/N)ˣ`, i.e.
  when `IsFullDet H` (the determinant of `T` is `1`). In general the target has
  `[(ℤ/N)ˣ : det H̄_N]` times as many elements, and the LMFDB's cusp data are the source.
- The group `(ℤ/N)ˣ` acts on `±H̄_N \ GL₂(ℤ/N) / ⟨T⟩` by right multiplication by
  `[[e, 0], [0, 1]]`; under `IsFullDet H` this transports to an action on `cusps(H)`, independent
  of `N` and conjugation-invariant. `cuspOrbits H` is the multiset of orbit sizes (the LMFDB's
  `cusp_orbits`, displayed as `n^m` pairs), `rationalCusps H` the number of fixed points,
  `cuspField H c ≤ ℚ(ζ_N)` the fixed field of the stabiliser of `c`, an abelian field of degree
  the orbit size; the width is constant on an orbit.
- Closed forms: for `Γ₀(N)` every cusp `a/c` with `c ∣ N` has field `ℚ(ζ_{gcd(c, N/c)})`, so
  all cusps are rational exactly when `gcd(c, N/c) ≤ 2` for every `c ∣ N`, i.e. `N` is
  squarefree or `N = 4 × squarefree`; for prime `ℓ ≥ 5`, `Γ₁(ℓ)` has `(ℓ − 1)/2` rational
  cusps of width `ℓ` and `(ℓ − 1)/2` cusps of width `1` conjugate over `ℚ(ζ_ℓ)⁺`
  (MC2 §5.11 states the geometric version; here it is the coset computation); `C_ns⁺(ℓ)` has
  `(ℓ − 1)/2` cusps, all of width `ℓ`, forming one orbit; `C_s⁺(ℓ)` has one rational cusp and
  one orbit of size `(ℓ − 1)/2`.

*Needs:* 1.1; the action is pure finite group theory. The identification with the geometric
cusps of `X_H` and their residue fields is Layer 5.1.

`rationalCusps`, `cuspOrbits` and `cuspField` have no declaration in `Suggested.lean`, whose
`Cusps H` is the `⟨T⟩`-orbit set of 1.1; their definitions above (for `IsFullDet H` only) and
these Checks are specified in this README only.

**Checks.**

- `Γ₀(11)`: two cusps, both rational, `cuspOrbits = {1, 1}` (worked example 1).
- `Γ₁(11)`: `rationalCusps = 5` and `cuspOrbits = {1, 1, 1, 1, 1, 5}`, the orbit of size five
  having field `ℚ(ζ₁₁)⁺` (worked example 2).
- `Γ₀(9)`: `cuspOrbits = {1, 1, 2}` and `rationalCusps = 2`; `C_s⁺(13)`: `cuspOrbits = {1, 6}`
  with one rational cusp; `C_ns⁺(13)`: one orbit of six cusps and no rational cusp (worked
  examples 3 and 10).
- (rejection) `Γ(5)` has `det Γ(5) ≠ ẑˣ`: twelve `⟨T⟩`-orbit cusps but `48` double cosets, so
  neither invariant is defined on it; `X_arith(5)`, of full determinant, has
  `cuspOrbits = {1, 1, 2, 4, 4}` and `rationalCusps = 2` (worked example 10).
- (comparison) the orbit sizes sum to `ν∞(H)`, the cardinality of `Cusps H` in `Suggested.lean`.

### 1.4 Comparison with the compact Riemann surface

For `Γ := Γ_{±H} ≤ SL(2, ℤ)`, a congruence subgroup containing `−I`, MF Layer 10A supplies the
compact Riemann surface `X(Γ)` (FO Layer 4), its cusp count `ε∞(Γ)`, its elliptic-point counts
`ε₂(Γ)`, `ε₃(Γ)` in the effective `PSL₂` action, and the degree `[PSL₂(ℤ) : Γ̄]` of
`X(Γ) → X(1)`; MF Layer 10B the genus `g(X(Γ)) = 1 + d/12 − ε₂/4 − ε₃/3 − ε∞/2`. Prove:

- `ε∞(Γ) = ν∞(H)`: the cusps `Γ \ ℙ¹(ℚ)` are the `Γ`-orbits of `SL₂(ℤ)/⟨±T⟩ · ∞`, and
  reduction mod `N` identifies `Γ \ SL₂(ℤ) / ⟨T⟩` with `Γ̄_H \ SL₂(ℤ/N) / ⟨T⟩` (surjectivity of
  `SL₂(ℤ) → SL₂(ℤ/N)` and `Gamma N ≤ Γ`); the width of a cusp in FO's sense (the strict
  width of the conjugated stabiliser, `Subgroup.integerCuspWidth` at `∞`, `w = h` since
  `−I ∈ Γ`) equals the orbit size of 1.1;
- `ε₂(Γ) = ν₂(H)` and `ε₃(Γ) = ν₃(H)`: an elliptic point of `X(Γ)` of order `2` (resp. `3`) is
  a `Γ`-orbit of `SL₂(ℤ)·i` (resp. `SL₂(ℤ)·ρ`) whose stabiliser in `Γ̄` is nontrivial; the
  orbits of `Γ` on `SL₂(ℤ)/Stab(i)` with nontrivial stabiliser correspond to cosets `Γ g` with
  `g S g⁻¹ ∈ Γ`, and reduction mod `N` carries this to the fixed-point count of 1.1 (Tau
  Ceti's `card_stabilizer_psl_I = 2`, `card_stabilizer_psl_ρ = 3` fix which matrices to test);
- `[PSL₂(ℤ) : Γ̄] = pslIndex H` (reduction mod `N` again);
- hence `genus H = g(X(Γ_{±H}))`, an integer `≥ 0`, and `genus H' ≥ genus H` for `H' ≤ H`
  (Riemann–Hurwitz for `X(Γ') → X(Γ)`, FO Layer 5).

This is the theorem the LMFDB's `gl2.genus` knowl asserts in one sentence; everything above the
finite computation is consumed, and the four equalities are the owned content.

*Needs:* 1.1–1.3; MF 10A–10B; FO Layers 3–5; Tau Ceti `Stabilizer`, `map_intCast_zmod_surjective`.

### 1.5 Relative index and covering degree

For open `H ≤ G`: `relativeIndex H G := [G : H]`, the degree of the covering of Riemann
surfaces `X(Γ_{±H}) → X(Γ_{±G})` is `[Γ_{±G} : Γ_{±H}] = pslIndex H / pslIndex G`, which equals
`[±G : ±H]` when `det H = det G` (in particular when both have `IsFullDet`; not in general:
`G = ⊤`, `H = Γ(3)` has `[⊤ : ±Γ(3)] = 24` and `pslIndex Γ(3) = 12`), and `[±G : ±H]` is
`[G : H]/2` when `−I ∈ G ∖ H` and `[G : H]` otherwise; `H` is a **minimal cover** of `G` when
`H` is a maximal proper open subgroup of `G`; `H` is an **index-two refinement** of `G` when
`H < G` and `G = ±H`, in which case the covering has degree one.

*Needs:* 0.2, 1.4.

### Examples

Worked examples 1, 2, 3 and 10: `ν₂`, `ν₃`, cusps, widths, cusp orbits and genus of `Γ₀(11)`,
`Γ₁(11)`, `Γ₀(13)`, `C_s⁺(13)`, `C_ns⁺(13)`, `Γ₀(9)`, `Γ₀(16)`, `Γ₀(20)`, `X_arith(5)`.

### Dependencies

Layer 0; MF Layers 10A–10B; FO Layers 3–5; MC2 §§5.10–5.11 for the geometric cusp count named
in 1.3; Tau Ceti `card_stabilizer_psl_I`, `card_stabilizer_psl_ρ`, `Subgroup.integerCuspWidth`;
Mathlib `MulAction.orbitRel`, `MulAction.fixedBy`.

## Layer 2: Cartan subgroups, lifting, entanglement, twists and Gassmann equivalence

Suggested file: `GL2Zhat/Cartan.lean`, `GL2Zhat/Lifting.lean`, `GL2Zhat/Commutator.lean`,
`GL2Zhat/Entanglement.lean`, `GL2Zhat/Agreeable.lean`, `GL2Zhat/Twist.lean`,
`GL2Zhat/IsogenyOrbits.lean`, `GL2Zhat/Gassmann.lean`.

### 2.1 Cartan subgroups of `GL₂(R)`

For a commutative ring `R` and a commutative `R`-algebra `A` that is free of rank two with a
basis `(1, ω)`, so `A = R[ω]/(ω² − tω + n)`:

- `cartan A ≤ GL₂(R)` is the image of `Aˣ → Aut_R(A) ≅ GL₂(R)`, `a ↦ (x ↦ ax)` in the basis
  `(1, ω)`; the map is injective, so `cartan A ≅ Aˣ` is abelian. The **canonical involution**
  `ι : ω ↦ t − ω` is an `R`-algebra automorphism for every `(t, n)`; `extendedCartan A` is the
  subgroup generated by `cartan A` and `ι`, and `ι · a · ι⁻¹ = ι(a)`, so
  `extendedCartan A = cartan A ⋊ ⟨ι⟩` with `[extendedCartan A : cartan A] ∈ {1, 2}`. Since
  `ι(1) = 1`, `ι ∈ cartan A` iff `ι = id` iff `2ω = t` in `A` iff `2 = 0` and `t = 0` in `R`; so
  the index is `2` unless `R` has characteristic `2` and `t = 0` (then `A` is not étale: for
  `R = ℤ/N` the index is `2` for every étale `A` and every `N ≥ 2`, including the split algebra
  over `𝔽₂`, where `cartan` is trivial and `ι` is the swap).
- **Étale rank-two algebras over `ℤ/p^k`.** `A` is étale over `ℤ/p^k` iff the discriminant
  `t² − 4n` is a unit for `p` odd, iff `t` is odd for `p = 2`; an étale `A` is isomorphic to
  the split algebra `ℤ/p^k × ℤ/p^k` (iff `t² − 4n` is a square, resp. `n` is even for `p = 2`)
  or to the non-split algebra `W_k(𝔽_{p²}) = ℤ_{p²}/p^k` (`ℤ_{p²}` the unramified quadratic
  extension of `ℤ_p`). Over `ℤ/N` an étale `A` is a product of its `p`-parts (Chinese
  remainder theorem) and is determined up to isomorphism by the set of `p ∣ N` at which it is
  split; `cartan A = ∏_{p ∣ N} cartan A_p` under `GL₂(ℤ/N) ≅ ∏ GL₂(ℤ/p^{k_p})`.
- **Orders.** `|cartan (R × R)| = |Rˣ|²`, so `|C_s(N)| = φ(N)²`;
  `|cartan W_k(𝔽_{p²})| = p^{2(k−1)}(p² − 1)`, so `|C_ns(N)| = N² ∏_{p ∣ N}(1 − p⁻²)`;
  `|C_s⁺(N)| = 2|C_s(N)|` and `|C_ns⁺(N)| = 2|C_ns(N)|` for `N ≥ 3`; `−I = cartan(−1)` lies in
  every Cartan; `det (cartan a) = N_{A/R}(a)` is the norm, surjective onto `Rˣ` for étale `A`
  over `ℤ/N`, `ℤ_ℓ` and `ẑ`.
- **Conjugacy and normalisers.** Two Cartans of étale algebras of the same type at every `p` are
  conjugate in `GL₂(ℤ/N)` (choice of basis); over a field `k`,
  `N_{GL₂(k)}(cartan A) = extendedCartan A` except for `k = 𝔽₂` and `A` split (AGR §4.2, consumed, where the
  Borel/Cartan dictionary over finite fields lives); over `ℤ_ℓ` (every `ℓ`),
  `N(cartan A) = extendedCartan A` and the index is `2`: an element normalising `cartan A`
  permutes the two eigenlines of an element of `cartan A` with distinct eigenvalues
  (`diag(1, 3)` in the split case at `ℓ = 2`, so the exception of `𝔽₂` does not lift). Over
  `ẑ` the normaliser of `cartan A = ∏_ℓ cartan A_ℓ` is `∏_ℓ extendedCartan A_ℓ`, in which
  `cartan A` has uncountable index; `extendedCartan A` (one involution for all `ℓ`) is the
  index-two subgroup `⟨cartan A, ι⟩`. Over `ℤ/p^k` with `p` odd the normaliser is
  `extendedCartan`; over `ℤ/2^k` the normaliser of `C_s(2^k)` strictly contains `C_s⁺(2^k)` for
  every `k ≥ 1` (`I + 2^{k−1}E₁₂` centralises every `diag(a, d)`, as `2^{k−1}(d − a) ≡ 0 mod 2^k`;
  orders `6, 32, 128` against `2, 8, 32` for `k = 1, 2, 3`), these elements tending to `I` in `ℤ₂`.
- **Semisimple elements.** An element of `GL₂(𝔽_ℓ)` whose characteristic polynomial is
  irreducible lies in exactly one non-split Cartan subgroup, and one with two distinct
  eigenvalues in `𝔽_ℓ` lies in exactly one split Cartan subgroup (its centraliser).
- **The CM Cartan.** For an imaginary quadratic order `𝒪 = ℤ[ω]` of discriminant `D` and
  `R ∈ {ℤ/N, ℤ_ℓ, ẑ}`, `𝒪 ⊗ R` is free with basis `(1, ω)`; `C_𝒪(R) := (𝒪 ⊗ R)ˣ` acting by
  multiplication, `N_𝒪(R)` its normaliser. `𝒪 ⊗ ℤ/N` is étale iff `gcd(D, N) = 1`, and then
  `C_𝒪(ℤ/N) = cartan (𝒪 ⊗ ℤ/N)` is split at `p ∣ N` iff `(D/p) = 1` and non-split iff
  `(D/p) = −1`. At `p ∣ D` the reduction `𝒪 ⊗ 𝔽_p = 𝔽_p[x]/(x²)` is not étale and
  `C_𝒪(𝔽_p) = (𝔽_p[x]/(x²))ˣ` has order `p(p − 1)`, strictly between the orders of the split and
  non-split Cartans: `(p − 1)² < p(p − 1) < p² − 1`. Over `ℤ_ℓ`, `C_𝒪(ℤ_ℓ)` is
  the full unit group of the order `𝒪 ⊗ ℤ_ℓ` in the étale quadratic `ℚ_ℓ`-algebra
  `ℚ(𝒪) ⊗ ℚ_ℓ`, and `N_𝒪(ℤ_ℓ) = ⟨C_𝒪(ℤ_ℓ), ι⟩` is its normaliser in `GL₂(ℤ_ℓ)` for every `ℓ`,
  including `ℓ ∣ D` (a normalising element induces a ring automorphism of the reduced ring
  `𝒪 ⊗ ℤ_ℓ`, which is `id` or conjugation); `C_𝒪(ẑ) = ∏_ℓ C_𝒪(ℤ_ℓ)` is closed in `GL₂(Ẑ)`, not
  open, `N_𝒪(ẑ) = ⟨C_𝒪(ẑ), ι⟩` has `[N_𝒪(ẑ) : C_𝒪(ẑ)] = 2`, and the normaliser of `C_𝒪(ẑ)` in
  `GL₂(Ẑ)` is the strictly larger `∏_ℓ N_𝒪(ℤ_ℓ)` (0.3).

*Needs:* 0.1–0.3; AGR §4.2; Mathlib `Units`, `Algebra.norm`, `ZMod.chineseRemainder`.

**Checks.**

- At `p = 5`: the split Cartan has order `16`, the ramified unit group `(𝔽₅[x]/(x²))ˣ` order `20`,
  the non-split Cartan order `24`.
- At `p = 2`: the same three orders are `1`, `2`, `3`; the ramified group `{1, 1 + x}` is
  neither Cartan.
- `C_s(2^k)` has normaliser of order `6, 32, 128` against `|C_s⁺(2^k)| = 2, 8, 32` for
  `k = 1, 2, 3`, while over `ℤ₂` the normaliser of the split Cartan is the extended Cartan.

### 2.2 Serre's lifting lemma and its failures at `ℓ = 2, 3`

- **Lemma (Serre, *Abelian ℓ-adic representations*, IV-23, Lemma 3).** For a prime `ℓ ≥ 5`
  and a closed subgroup `H ≤ SL₂(ℤ_ℓ)` with `red ℓ '' H = SL₂(𝔽_ℓ)`, `H = SL₂(ℤ_ℓ)`. Proof
  route: the kernel of `SL₂(ℤ/ℓ^{k+1}) → SL₂(ℤ/ℓ^k)` is `1 + ℓ^k 𝔰𝔩₂(𝔽_ℓ)` for `k ≥ 1`;
  `SL₂(𝔽_ℓ)` is perfect for `ℓ ≥ 5` (Mathlib `Matrix.SL2.commutator_eq_top`, which needs an
  `a ∈ 𝔽_ℓ` with `a ≠ 0`, `a² ≠ 1`), so the image of `H` mod `ℓ²` contains the commutators
  `[1 + ℓX, g̃]`, which fill `1 + ℓ 𝔰𝔩₂`; then `(1 + ℓ^k X)^ℓ ≡ 1 + ℓ^{k+1} X mod ℓ^{k+2}` for
  `k ≥ 1`, `ℓ` odd, pushes the kernel up one level at a time, and closedness finishes.
- **`GL₂` form.** For `ℓ ≥ 5` and `H ≤ GL₂(ℤ_ℓ)` closed with `red ℓ '' H ⊇ SL₂(𝔽_ℓ)`: the closed
  commutator subgroup of `H` lies in `SL₂(ℤ_ℓ)` and reduces onto `[SL₂(𝔽_ℓ), SL₂(𝔽_ℓ)] = SL₂(𝔽_ℓ)`,
  so by the lemma it is `SL₂(ℤ_ℓ)`; hence `H ⊇ SL₂(ℤ_ℓ)` and `H = det⁻¹(det H)`. So `H` is open
  iff `det H` is open in `ℤ_ℓˣ`, the level of `H` is the level of `det H` (`1` when
  `det H = ℤ_ℓˣ`, otherwise the least `ℓ^k`, `k ≥ 1`, with `1 + ℓ^k ℤ_ℓ ⊆ det H`, as
  `det Γ(ℓ^k) = 1 + ℓ^k ℤ_ℓ`), and `H = GL₂(ℤ_ℓ)` iff `det H = ℤ_ℓˣ`. The residual condition alone
  decides neither openness nor maximality, since `ℤ_ℓˣ = μ_{ℓ−1} × (1 + ℓℤ_ℓ)` and the second
  factor is invisible modulo `ℓ`. In particular `red ℓ '' H = GL₂(𝔽_ℓ)` and `det H = ℤ_ℓˣ`
  together give `H = GL₂(ℤ_ℓ)`. For an open `H ≤ GL₂(Ẑ)` with `IsFullDet H` (so `det (pr_ℓ H) =
  ℤ_ℓˣ`) this reads: if `pr_ℓ H ≠ GL₂(ℤ_ℓ)` for some `ℓ ≥ 5` then `red ℓ '' H` does not contain
  `SL₂(𝔽_ℓ)`. In `Suggested.lean` the lemma is `eq_top_of_isClosed_of_map_eq_top` and the `GL₂`
  form is `eq_comap_map_det_of_isClosed`.
- **`ℓ = 3`.** `red 9 '' H = SL₂(ℤ/9)` implies `H = SL₂(ℤ_3)` (the same induction from `k = 2`),
  and `red 3 '' H = SL₂(𝔽_3)` does not: `SL₂(ℤ/9) → SL₂(𝔽_3)` has a section, and its image is
  a proper closed subgroup of `SL₂(ℤ/9)`, hence of `SL₂(ℤ_3)`, surjecting mod `3`. The elliptic
  curves realising this (surjective mod `3`, not mod `9`) are Elkies' (Elkies 2006).
- **`ℓ = 2`.** For `H ≤ SL₂(ℤ₂)` closed, `red 4 '' H = SL₂(ℤ/4)` already implies `H = SL₂(ℤ₂)`:
  no proper subgroup of `SL₂(ℤ/8)` surjects onto `SL₂(ℤ/4)` (a finite check), and from level `8`
  the squaring `(1 + 4X)² ≡ 1 + 8X mod 16` climbs as before (`k ≥ 2`); `red 2 '' H = SL₂(𝔽₂)` does
  not suffice. For `GL₂(ℤ₂)` the threshold is `8`: `red 8 '' H = GL₂(ℤ/8)` implies `H = GL₂(ℤ₂)`,
  while `GL₂(ℤ/8)` has four index-two subgroups surjecting onto `GL₂(ℤ/4)` (Dokchitser–Dokchitser
  2012), so `red 4 '' H = GL₂(ℤ/4)` does not. At `9` and `8` the residual condition also controls
  the determinant: a closed subgroup of `ℤ₃ˣ ≅ ℤ/2 × ℤ₃` (resp. `ℤ₂ˣ ≅ ℤ/2 × ℤ₂`) that surjects onto
  `(ℤ/9)ˣ` (resp. `(ℤ/8)ˣ`) surjects onto its Frattini quotient, hence is everything. So the
  `GL₂` criteria are: `red ℓ '' H = GL₂(𝔽_ℓ)` together with `det H = ℤ_ℓˣ` for `ℓ ≥ 5`, `red 9 '' H =
  GL₂(ℤ/9)` for `ℓ = 3`, `red 8 '' H = GL₂(ℤ/8)` for `ℓ = 2`; these are what the non-maximal-prime
  criterion 3.4 and the LMFDB's `nonmax_primes` column depend on.

*Needs:* 0.1; Mathlib `Matrix.SL2.commutator_eq_top`, `ZMod` kernels; the `𝔰𝔩₂` kernel
computation is owned here.

**Checks.**

- (rejection) `H = SL₂(ℤ₅)` is closed with `red 5 '' H = SL₂(𝔽₅)`, and `H = det⁻¹(det H)` with
  `det H = {1}`; it is not open, so the residual hypothesis does not give openness.
- (rejection) `H = det⁻¹(μ₄ · (1 + 25ℤ₅))` is open of level `25` and index `5`, and
  `red 5 '' H = GL₂(𝔽₅)` (its determinant reduces onto `𝔽₅ˣ = μ₄`); so `red ℓ '' H = GL₂(𝔽_ℓ)` does
  not give `H = GL₂(ℤ_ℓ)` without `det H = ℤ_ℓˣ`, and the formula gives index `[ℤ₅ˣ : det H] = 5`
  and level `25`.
- `H = GL₂(ℤ₅)`: residual image and determinant both full, and `H = GL₂(ℤ₅)`.

### 2.3 Projections, products and the entanglement index

- For an open `H ≤ GL₂(Ẑ)` and a prime `ℓ`, `pr_ℓ H ≤ GL₂(ℤ_ℓ)` (0.1) is open, of level
  dividing `ℓ^{v_ℓ(level H)}`; `pr_ℓ H = GL₂(ℤ_ℓ)` for every `ℓ ∤ level H`. The **product
  group** `∏_ℓ pr_ℓ H`, read in `GL₂(Ẑ)` through `GL₂(Ẑ) ≃ ∏_ℓ GL₂(ℤ_ℓ)`, is open, contains
  `H`, and has level `∏_ℓ level (pr_ℓ H)`, which divides `level H`.
- `entanglementIndex H := [∏_ℓ pr_ℓ H : H]`, finite; `entanglementIndex H = 1` iff `H` is the
  product of its projections iff `index H = ∏_ℓ index (pr_ℓ H)`. Invariant under conjugation.
  When `H ⊴ ∏_ℓ pr_ℓ H`, `entanglementQuotient H := (∏_ℓ pr_ℓ H)/H`, a finite group; the LMFDB
  records its abstract isomorphism type (its isomorphism invariants are `FiniteGroupInvariants`';
  its label is not a target).
- For a finite set `S` of primes, `pr_S H ≤ ∏_{ℓ ∈ S} GL₂(ℤ_ℓ)` and the **`(ℓ, ℓ')`-entanglement**
  predicate `pr_{ℓ,ℓ'} H ≠ pr_ℓ H × pr_{ℓ'} H`; `entanglementIndex H = 1` iff no pair is
  entangled and no "higher" entanglement occurs, and the index is computed at level
  `N = level H` as `[∏_{ℓ ∣ N} pr_ℓ H̄_N : H̄_N]` in `GL₂(ℤ/N) ≅ ∏_{ℓ ∣ N} GL₂(ℤ/ℓ^{v_ℓ(N)})`.
- The index-two subgroups `S_χ` of 2.4 with `χ` of conductor divisible by an odd prime have
  `entanglementIndex = 2` and `entanglementQuotient ≅ ℤ/2`; `S_χ` with `χ` of conductor
  `1`, `4` or `8` has `entanglementIndex = 1`.

*Needs:* 0.1, 0.2; Mathlib `Subgroup.pi`, `Subgroup.index` of a product.

`entanglementIndex` and `entanglementQuotient` have no declaration in `Suggested.lean`; their
definitions above and these Checks are specified in this README only.

**Checks.**

- (boundary) `entanglementIndex ⊤ = 1`: `GL₂(Ẑ)` is the product of its projections.
- `S_{37}`, the image of `37.a1`: `entanglementIndex = 2` with quotient `ℤ/2` (worked
  example 4).
- `S_{−3}` has `pr_2 S_{−3} = GL₂(ℤ₂)` and `pr_3 S_{−3} = GL₂(ℤ₃)` (0.2), so its product group is
  `GL₂(Ẑ)` and `entanglementIndex S_{−3} = [GL₂(Ẑ) : S_{−3}] = 2`: full projections do not make
  a subgroup a product.
- `S_{−4}`: the condition `ε(g mod 2) = χ_{−4}(det g)` reads the `2`-component alone, so `S_{−4}`
  is the preimage of `pr_2 S_{−4}` and `entanglementIndex S_{−4} = 1`.

### 2.4 The commutator subgroup, the abelianisation and the index-two subgroups

- `ε : GL₂(𝔽₂) → {±1}` is the sign of the permutation of the three nonzero vectors of `𝔽₂²`
  (`GL₂(𝔽₂) ≅ S₃`); `ker ε` is the non-split Cartan `C_ns(2)` of order `3`.
- **Theorem.** `[GL₂(Ẑ), GL₂(Ẑ)] = {g ∈ SL₂(Ẑ) : ε(red 2 g) = 1}`, an open subgroup of index
  `2` in `SL₂(Ẑ)`; equivalently `(det, ε ∘ red 2) : GL₂(Ẑ) → ẑˣ × {±1}` is the abelianisation.
  Here `[GL₂(Ẑ), GL₂(Ẑ)]` is the abstract commutator subgroup (Mathlib's `commutator`), generated
  by commutators without closure; its closure is the closed commutator subgroup, and the theorem
  includes that the two coincide. In `Suggested.lean` this is `mem_commutator_iff`, with `ε(x) = 1`
  written `x ^ 3 = 1`. Proof route, by an explicit commutator width that is uniform in `ℓ`:
  1. **Single commutators.** In `GL₂(R)` for a commutative ring `R`: `[diag(a, 1), [[1, y], [0, 1]]]
     = [[1, (a − 1)y], [0, 1]]`, its transpose analogue for lower unipotents, and
     `[diag(a, 1), w] = diag(a, a⁻¹)` with `w = [[0, 1], [−1, 0]]`, for every `a ∈ Rˣ`, `y ∈ R`.
  2. **Odd `ℓ`.** In `ℤ_ℓ` the element `a = 2` is a unit with `a − 1 = 1`, so every elementary
     matrix of `SL₂(ℤ_ℓ)` is one commutator. An element `g = [[a, b], [c, d]] ∈ SL₂(ℤ_ℓ)` with `a` a
     unit is `[[1, 0], [c/a, 1]] · diag(a, a⁻¹) · [[1, b/a], [0, 1]]`, a product of three
     commutators; if `a` is not a unit then `c` is, and `[[1, 1], [0, 1]] g` has unit corner. So
     `[GL₂(ℤ_ℓ), GL₂(ℤ_ℓ)] = SL₂(ℤ_ℓ)` with every element a product of at most four commutators.
  3. **`ℓ = 2`.** Here `2` is not a unit and step 2 fails: `[[1, 1], [0, 1]]` reduces to a
     transposition of `GL₂(𝔽₂) ≅ S₃`, so it is not a product of commutators. Instead take `a = 3` in
     step 1, giving every `[[1, 2y], [0, 1]]` and `[[1, 0], [2y, 1]]` as one commutator. An element
     of `Γ(2) ∩ SL₂(ℤ₂)` has unit corner, and the factorisation of step 2 has even off-diagonal
     factors, so it is a product of three commutators. The commutator `[s, t]` of
     `s = [[0, 1], [1, 0]]` and `t = [[1, 1], [0, 1]]` is `[[1, −1], [1, 0]]`, which reduces to an
     element of order three. Hence `K₂ := {g ∈ SL₂(ℤ₂) : ε(red 2 g) = 1} = (Γ(2) ∩ SL₂(ℤ₂)) · ⟨[s, t]⟩`
     consists of products of at most five commutators, and `[GL₂(ℤ₂), GL₂(ℤ₂)] = K₂` because
     `GL₂(ℤ₂)/K₂` embeds in the abelian `ℤ₂ˣ × {±1}` through `(det, ε ∘ red 2)`.
  4. **Assembly.** Under `GL₂(Ẑ) ≃ ∏_ℓ GL₂(ℤ_ℓ)` the factorisations of steps 2–3 are made in every
     component at once, so every element of `K₂ × ∏_{ℓ odd} SL₂(ℤ_ℓ) = {g ∈ SL₂(Ẑ) : ε(red 2 g) = 1}`
     is a product of at most five commutators of `GL₂(Ẑ)`. This subgroup is therefore the abstract
     commutator subgroup, and it is closed.
  This is the group-theoretic content of Serre 1972 §5.5 and Zywina 2010 §1; no theorem on
  commutator subgroups of general profinite groups is used.
- **Open subgroups containing the commutator subgroup** correspond to open subgroups of
  `ẑˣ × {±1}`. The ones of index two are: `det⁻¹(ker χ)` for a quadratic character
  `χ : ẑˣ → {±1}` (not of full determinant), and
  `S_χ := {g : ε(red 2 g) = χ(det g)}` for every continuous quadratic character `χ` including
  the trivial one (continuity is what makes `S_χ` open). `S_χ` has `IsFullDet`, contains `−I`, has `S_χ ∩ SL₂(Ẑ) = [GL₂(Ẑ), GL₂(Ẑ)]` for every
  `χ`, `pslIndex = 2`, `ν₂ = 0`, `ν₃ = 2`, one cusp of width `2`, genus `0`,
  `level S_χ = lcm(2, cond χ)` and `sl2Level S_χ = 2`. For a fundamental discriminant `D`
  (or `D = 1`) write `S_D := S_{χ_D}` with `χ_D` the Kronecker character of conductor `|D|`:
  `level S_D = 2|D|` for `D` odd, `|D|` for `D ≡ 0 mod 4`, `2` for `D = 1`. `S_D` is the
  group of the index-two obstruction 3.5; its level is the adelic level of a Serre curve.

*Needs:* 0.1 (the product decomposition), 0.4 and 1.1–1.2 (for the invariants of `S_χ`);
Mathlib `commutator`, `Abelianization`.

The subgroups `S_χ` have no declaration in `Suggested.lean`; their definition above (with `ε`
the sign of the action of `GL₂(𝔽₂)` on the three nonzero vectors of `𝔽₂²`) and these Checks are
specified in this README only.

**Checks.**

- `S_1 = ker (ε ∘ red 2) = (red 2)⁻¹ C_ns(2)`, prefix `2.2.0`: index `2`, `ν₂ = 0`, `ν₃ = 2`, one
  cusp of width `2`, genus `0`, `sl2Level = 2` (worked example 4).
- `S_{37}` has level `74 = 2·37` and `sl2Level = 2` (worked example 4).
- `ker ε = C_ns(2)` has order `3`, through `GL₂(𝔽₂) ≅ S₃`.
- (rejection) for a discontinuous quadratic character `χ` of `ẑˣ` the set
  `{g : ε(red 2 g) = χ(det g)}` is an index-two subgroup that is not open: if it contained
  `Γ(N)` with `N` even, `ker χ` would contain the open `det Γ(N)`.
- (comparison) `S_χ ∩ SL₂(Ẑ)` is Mathlib's commutator subgroup `⁅GL₂(Ẑ), GL₂(Ẑ)⁆` for every
  `χ`.
- In `GL₂(ℤ₂)` the elementary matrix `[[1, 1], [0, 1]]` is not a product of commutators (it has
  `ε = −1`), while `[[1, 2], [0, 1]] = [diag(3, 1), [[1, 1], [0, 1]]]` is one commutator.

### 2.5 Agreeable subgroups and the agreeable closure

Following Zywina (*Explicit open images*, §1.4): an open `H ≤ GL₂(Ẑ)` is **agreeable** when
`IsFullDet H`, `H` contains the scalars `ẑˣ · I`, and `level H` and `level (H ∩ SL₂(Ẑ))` (the
`SL₂`-level, 0.4) have the same odd prime divisors.

- `GL₂(Ẑ)`, `Γ₀(N)`, `C_s⁺(N)`, `C_ns⁺(N)` are agreeable, and so is `S_χ` exactly when the
  conductor of `χ` is a power of `2` (conductor `1`, `4` or `8`, level `2`, `4` or `8`); when the
  conductor has an odd prime factor `p`, `p` divides `level S_χ` but not `sl2Level S_χ = 2`.
  `Γ₁(N)` is agreeable iff `N ∣ 2`; an agreeable `H` is coarse (`−I ∈ H`).
- **Agreeable closure** `agreeableClosure H := ⋂ {G agreeable : H ≤ G}`, for `IsFullDet H`: an
  open subgroup (it contains `H`). **Theorem (Zywina, *Explicit open images*, Prop. 8.1, whose
  input group has full determinant).** For `IsFullDet H` the closure is agreeable,
  `H ⊴ agreeableClosure H`, `[agreeableClosure H, agreeableClosure H] = [H, H]`, so the
  **agreeable quotient** `agreeableClosure H / H` is a finite abelian group. Invariance under
  conjugation; `agreeableClosure` is idempotent and monotone on subgroups with `IsFullDet`.
  Without `IsFullDet` the intersection need not be agreeable, since an agreeable group has full
  determinant and an intersection of such groups need not.

*Needs:* 0.2, 0.4, 2.4.

**Checks.**

- `S_8` has level `8` and `SL₂`-level `2`, both with no odd prime divisor; it contains the scalars
  (`ε(red 2 (uI)) = 1 = χ_8(u²)`) and has full determinant, so it is agreeable.
- (rejection) `S_{37}` has level `74` and `SL₂`-level `2`, with odd prime divisors `{37}` against
  `∅`: not agreeable. Its only overgroups are itself and `GL₂(Ẑ)`, so
  `agreeableClosure S_{37} = GL₂(Ẑ)`, with quotient of order `2`.
- `agreeableClosure Γ₁(11) = Γ₀(11)`, quotient `(ℤ/11)ˣ` (worked example 2).
- (rejection) `Γ(3)` lies in the four agreeable conjugates of `Γ₀(3)` (the stabilisers of the four
  lines of `𝔽₃²`), whose intersection reduces modulo `3` to the scalars `{±I}`, of determinant
  `1`; so the intersection of the agreeable groups containing `Γ(3)` does not have full
  determinant and is not agreeable. The `IsFullDet` hypothesis of the theorem excludes `Γ(3)`.

### 2.6 Twists and quadratic refinements

- `IsTwist H₁ H₂ := H₁ ⊓ SL₂(Ẑ) = H₂ ⊓ SL₂(Ẑ)`, an equivalence relation on open subgroups.
  Twists have the same `Γ_H` (0.4), `SL₂`-level, `PSL₂`-index, `ν₂`, `ν₃`, cusps, widths and
  genus (all are read on `±H̄_N ∩ SL₂(ℤ/N)`, and `±(H ∩ SL₂(Ẑ)) = ±H ∩ SL₂(Ẑ)`); twists with
  `IsFullDet` have the same index, since `index H = pslIndex (±H) · [ẑˣ : det H]` when
  `−I ∈ H` and twice that otherwise (0.4); their levels may differ (`S_χ` for varying `χ` are
  pairwise twists of levels `lcm(2, cond χ)`), so a twist class with `IsFullDet` is infinite
  in general but has finitely many members of each level, and a least level. The LMFDB's
  **minimal twist** is one member of that least level; the choice among them is not a target.
- Every twist `H'` of `H` normalises `Γ := H ∩ SL₂(Ẑ)`, and `H' ↦ det H'`-fibres: for
  `IsFullDet` twists `H'/Γ ≅ ẑˣ` through `det`.
- **Quadratic refinements.** For a coarse `H` (`−I ∈ H`), a quadratic refinement is an open
  `H' < H` with `−I ∉ H'` and `±H' = H`; equivalently `H' = ker ψ` for a continuous character
  `ψ : H → {±1}` with `ψ(−I) = −1`. For each `M ≥ 1` there are finitely many of level dividing
  `M` (they correspond to subgroups of the finite group `H̄_M`); there can be infinitely many in
  all, since multiplying `ψ` by `χ ∘ det` for a quadratic character `χ` of `ẑˣ` gives another one
  (`χ(det(−I)) = 1`), and the conductors of such `χ` are unbounded. They are twists of each other
  exactly when they agree on `H ∩ SL₂(Ẑ)`, and `X_{H'} = X_H` as curves over `ℚ` (5.7) while the
  fine moduli interpretations differ (5.2). The fine label prefix `N.i.g−M.c.m.n` records
  `(level H', index H', genus H')` and `M = level H`.

*Needs:* 0.2, 0.4, 1.1–1.2.

**Checks.**

- The `S_χ` (2.4) are pairwise twists, with levels `lcm(2, cond χ)`: an infinite twist class with
  finitely many members of each level and least level `2` (`S_1`).
- (rejection) `H = Γ₀(3)` has the quadratic refinements `ker(ψ · (χ_q ∘ det))`, `ψ` the
  upper-left entry modulo `3` and `χ_q` a quadratic character of conductor `q` prime to `3`: each
  excludes `−I` and has `±` equal to `Γ₀(3)`, and different `q` give different kernels, of
  levels growing with `q`. So finiteness holds only for a bounded level.
- `⊤` and `H₃ := det⁻¹(ker(ẑˣ → (ℤ/3)ˣ))` are twists (both contain `SL₂(Ẑ)`) with the same `PSL₂`-index `1`,
  genus `0`, one cusp; they differ in determinant index (`1` against `2`), and their curves differ
  over `ℚ` (5.1, 5.7).

### 2.7 Isogeny orbits and the three field degrees

For `N ≥ 1` and `H̄ ≤ GL₂(ℤ/N)` acting on column vectors of `(ℤ/N)²` (convention 2) and on the
set `Cyc_n(M)` of cyclic subgroups of order `n` of `(ℤ/M)²` for `M ∣ N`, `n ∣ M` (through
`H̄ → GL₂(ℤ/M)`):

- `isogenyOrbits H N := {(M, n, m) : M ∣ N, n ∣ M, m = #{C ∈ Cyc_n(M) : H̄_M · C = C} > 0}` for
  `N` a multiple of `level H` (`m` counts the cyclic subgroups **fixed** by `H`); the set depends
  on `N`, since its entries run over the divisors `M` of `N`. Each entry depends only on
  `H̄_M = red M '' H`, so for `N ∣ N'` the entries of `isogenyOrbits H N` are exactly the entries of
  `isogenyOrbits H N'` with `M ∣ N`. The LMFDB's `isogeny_orbits` is `isogenyOrbits H (level H)`.
  Conjugation-invariant.
- `torsionFieldDegree H N := |H̄_N|`; `cyclicTorsionFieldDegree H N := min` over points
  `P ∈ (ℤ/N)²` of exact order `N` of the orbit size `|H̄_N · P|`;
  `cyclicIsogenyFieldDegree H N := min` over `C ∈ Cyc_N(N)` of `|H̄_N · C|`. Each is the index
  of a stabiliser, divides `|H̄_N|`, and is conjugation-invariant. For `Γ₀(N)`:
  `cyclicIsogenyFieldDegree = 1`, `cyclicTorsionFieldDegree = φ(N)`; for `Γ₁(N)` both are `1`;
  for `GL₂(Ẑ)` they are `|ℙ¹(ℤ/N)| = ψ(N)` and `|{P of order N}| = N² ∏_{p∣N}(1 − p⁻²)`.
- Their arithmetic meaning (the minimal degree of an extension over which a curve with image
  `H` acquires a cyclic `N`-isogeny, a point of order `N`, or full `N`-torsion) is 3.6.

*Needs:* 0.2; Mathlib `MulAction.orbit`, `Subgroup.index` as orbit size.

**Checks.**

- `isogenyOrbits ⊤ 1 = {(1, 1, 1)}`, while `isogenyOrbits ⊤ 2 = {(1, 1, 1), (2, 1, 1)}`: the
  extra entry is attached to `M = 2`, and `GL₂(𝔽₂)` fixes none of the three lines of `𝔽₂²`.
- `Γ₀(5)`: `cyclicIsogenyFieldDegree = 1`, `cyclicTorsionFieldDegree = 4`; `Γ₁(5)`: both `1`;
  `GL₂(Ẑ)` at `N = 5`: `6` and `24`, with `torsionFieldDegree = 480`.
- `isogenyOrbits Γ₀(9) 9` contains `(9, 9, 1)` (the cyclic subgroup `⟨e₁⟩` of order `9`), and
  `(3, 3, 1)`.

### 2.8 Gassmann equivalence

- **Consumed.** For a finite group `G` and `H₁, H₂ ≤ G`, Gassmann equivalence is Tau Ceti main's
  `Subgroup.AlmostConjugate H₁ H₂` (`TauCeti.GroupTheory.AlmostConjugate`, cited in prose: every
  conjugacy class meets `H₁` and `H₂` in the same number of elements, equivalently
  `Ind_{H₁}^G 1 = Ind_{H₂}^G 1`, equivalently `ℚ[G/H₁] ≅ ℚ[G/H₂]` as `G`-modules), with its laws
  stated by `FiniteGroupInvariants` 7.1. For a group `Γ` and finite-index `H₁, H₂ ≤ Γ`,
  `FiniteGroupInvariants` 7.3 defines `Subgroup.AlmostConjugateOfFiniteIndex H₁ H₂ := ∀ γ : Γ,
  Nat.card (fixedBy (Γ ⧸ H₁) γ) = Nat.card (fixedBy (Γ ⧸ H₂) γ)` and proves it equivalent to
  almost conjugacy of the images in `Γ ⧸ N` for any finite-index normal `N ≤ H₁ ⊓ H₂`,
  independently of `N`. For open `H₁, H₂ ≤ GL₂(Ẑ)`, "`H₁` and `H₂` are Gassmann equivalent" *is*
  `AlmostConjugateOfFiniteIndex H₁ H₂`, and 7.3 applied to `N = Γ(M)` for a common multiple `M` of
  the levels says it is almost conjugacy of `H̄₁, H̄₂` in `GL₂(ℤ/M)`. Nothing of this is reproved
  here, and `Suggested.lean` declares no Gassmann predicate: its invariance theorem takes the
  unfolded `AlmostConjugateOfFiniteIndex` as hypothesis.
- **Owned: the invariants.** Gassmann-equivalent open subgroups have the same index, the same level
  (`Γ(N)/Γ(M)` is a union of conjugacy classes, and `H̄ ⊇ C` iff `|H̄ ∩ C| = |C|`), the same
  truth value of `−I ∈ H` (a singleton class) and the same `det H` (classes have constant
  determinant), the same `pslIndex`, `ν₂`, `ν₃`, `ν∞` and the same multiset of cusp widths,
  hence the same genus: each of these is a sum of class-intersection counts of `±H̄_M` with
  the `GL₂(ℤ/M)`-classes of `S`, `R` and the powers `T^k` (Burnside's lemma for `ν∞` and for
  the number of `⟨T⟩`-orbits of each size), and `|±H̄ ∩ C| = |H̄ ∩ C| + |H̄ ∩ (−C)|` when
  `−I ∉ H̄`. The `gassmannClass H` is the set of open subgroups Gassmann equivalent to `H`, a
  finite union of conjugacy classes. The letter `c` of an RSZB label indexes these classes
  among subgroups of the same `(N, i, g)`; the letter is not a target, the equivalence relation
  is `FiniteGroupInvariants`', and the invariance theorem is owned here. The
  isogeny of Jacobians is 5.6.

*Needs:* 1.1–1.3; `FiniteGroupInvariants` 7.1, 7.3 (Tau Ceti main `Subgroup.AlmostConjugate`);
Mathlib `ConjClasses`, `MulAction` fixed points, Burnside's lemma
(`MulAction.card_orbit_mul_card_stabilizer_eq_card_group`, `Equiv.Perm` cycle counts).

### Examples

Worked examples 2, 3 and 4: the agreeable closure of `Γ₁(11)`, the Gassmann boundary check at
level `13`, the subgroups `S_χ` with their entanglement indices; the Checks of 2.2, 2.5 and 2.6
are the counterexamples that fix the hypotheses of those milestones.

### Dependencies

Layers 0–1; AGR §4.2; `FiniteGroupInvariants` 7.1, 7.3; Mathlib `commutator`, `Abelianization`,
`Matrix.SL2.commutator_eq_top`, `ConjClasses`, Burnside's lemma.

## Layer 3: the adelic representation and its image

Suggested file: `GaloisImage/AdelicTateModule.lean`, `GaloisImage/Representation.lean`,
`GaloisImage/Image.lean`, `GaloisImage/Invariants.lean`, `GaloisImage/SerreCurve.lean`,
`GaloisImage/DivisionFields.lean`.

Standing hypotheses: `K` is a field of characteristic zero (a number field from 3.4 on), `K̄` a
separable closure with `G_K := K̄ ≃ₐ[K] K̄` in its Krull topology (Tau Ceti supplies that it is
profinite), `E` an elliptic curve over `K` (`WeierstrassCurve K` with `IsElliptic`), and `E(K̄)`
its points over `K̄`, written `E⁄K̄` as in Tau Ceti's `TateModule` files.

### 3.1 The adelic Tate module and its finite levels

- `T̂E := ∀ ℓ : Nat.Primes, TateModule ℓ (E⁄K̄).toAffine.Point`, a module over `∏_ℓ ℤ_ℓ`
  componentwise and hence over `ẑ` through `zHat.ringEquivPiPadicInt` (convention 9). It is a
  free `ẑ`-module of rank two: each `T_ℓ E` is free of rank two over `ℤ_ℓ`
  (`nonempty_linearEquiv_tateModule`, which needs `(ℓ : K̄) ≠ 0`, automatic in characteristic
  zero), and a family of `ℤ_ℓ`-bases is a `ẑ`-basis. It is compact (each factor is), and the
  `ẑ`-module topology is the product topology.
- **Finite levels.** For `N : ℕ+`, `T̂E ⊗_ẑ ℤ/N ≅ T̂E / N·T̂E ≅ E[N] := E(K̄)[N]` (Mathlib
  `AddSubgroup.torsionBy`): the quotient `T_ℓ E / ℓ^k T_ℓ E ≅ E[ℓ^k]` is Tau Ceti's level
  projection, and the Chinese remainder theorem `E[N] ≅ ⊕_{ℓ^k ∥ N} E[ℓ^k]` assembles them.
  The isomorphism is `G_K`-equivariant and natural in `E` (isogenies), and
  `E[N] ≃+ (ℤ/N)²` (EC Layer 2, `torsion_addEquiv_prod`) is recovered from a `ẑ`-basis.
- **Frames.** A frame of `E[N]` is an ordered `ℤ/N`-basis `(P, Q)`; a frame of `T̂E` is an
  ordered `ẑ`-basis, and reduces to a compatible family of frames of every `E[N]`;
  `GL₂(Ẑ)` acts simply transitively on frames of `T̂E` on the right (convention 2), and the
  reductions `red N` are compatible with reduction of frames.
- `Aut_ẑ(T̂E) ≅ GL₂(Ẑ)` after a frame, with the change-of-frame formula `h⁻¹ · g · h`; the
  Weil pairings `e_{ℓ^k}` (Tau Ceti `tateModuleWeilPairing`) assemble to a perfect alternating
  `ẑ`-bilinear `ê : T̂E × T̂E → ẑ(1) := ∏_ℓ ℤ_ℓ(1)`, and `det` on `Aut_ẑ(T̂E)` is the action on
  `ẑ(1)`.

*Needs:* Tau Ceti `TateModule`, `nonempty_linearEquiv_tateModule`, `tateModuleWeilPairing`;
PA Layer 0; Mathlib `ZMod.chineseRemainder`, `Module.Free`.

### 3.2 The adelic representation

- `ρ_E : G_K →* Aut_ẑ(T̂E)`, `σ ↦ (σ acting on every T_ℓ E)`, is the product of Tau Ceti's
  `tateModuleGaloisRepresentation ℓ`; it is `ẑ`-linear and continuous (continuity of each
  component, `continuous_tateModuleGaloisRepresentation_apply`, and 0.1's inverse-limit
  criterion). In a frame (a `ẑ`-basis of `T̂E`) it is `ρ_E : G_K →* GL₂(Ẑ)`, `σ` going to the
  matrix of convention 2 (columns the coordinates of the images of the frame), a continuous
  homomorphism, with
  `red N ∘ ρ_E = ρ_{E,N}` the action on `E[N]` in the reduced frame (the convention-2 matrix)
  and `pr_ℓ ∘ ρ_E = ρ_{E,ℓ^∞}` the `ℓ`-adic representation in the `ℓ`-adic frame.
- `det ∘ ρ_E = χ`, the cyclotomic character of convention 10: at every `ℓ` this is Tau Ceti's
  `det_tateModuleGaloisRepresentation`, and `χ` is characterised by its reductions.
- **Functoriality.** A `K`-isogeny `φ : E → E'` induces `T̂φ : T̂E → T̂E'`, `G_K`-equivariant,
  injective with image of index `deg φ`; in frames, `ρ_{E'} = A ρ_E A⁻¹` with
  `A ∈ GL₂(ẑ ⊗ ℚ) = GL₂(𝔸_f)` the matrix of `T̂φ`. A `K`-isomorphism gives `A ∈ GL₂(Ẑ)`, so
  isomorphic curves have conjugate representations. Base change to `L/K` restricts `ρ_E` to
  the open subgroup `G_L`. The quadratic twist `E^d` (Tau Ceti `quadraticTwist`) has
  `ρ_{E^d} = χ_d · ρ_E` with `χ_d : G_K → {±1}` the character of `K(√d)`, so
  `ρ_{E^d}(σ) ∈ ±ρ_E(σ)` for all `σ`; more generally a twist by a cocycle in `Aut(E_{K̄})` (EC Layer 5)
  multiplies `ρ_E` by the cocycle's image in `GL₂(Ẑ)`.
- **Complex conjugation.** For a real embedding `K ↪ ℝ` and the induced `c ∈ G_K`, `ρ_E(c)` has
  `det = −1` and `ρ_E(c)² = 1`; in a frame it is `GL₂(Ẑ)`-conjugate to `diag(1, −1)` or to
  `[[1, 1], [0, −1]]`, the two classes of such involutions, according as `E(ℝ)` has two or one
  connected components, i.e. as the discriminant is positive or negative (EC Layer 4 real
  locus); the two classes coincide after reduction mod any odd `N`.

*Needs:* 3.1; Tau Ceti `tateModuleGaloisRepresentation`, `det_tateModuleGaloisRepresentation`,
`Isogeny`, `quadraticTwist`; EC Layers 1, 4, 5; PA 0.4 (`zHat.unitsLift`).

The adelic representation and the cyclotomic character have no declaration in
`Suggested.lean`, whose Layer 3 is the adelic Tate module of 3.1; their definitions above and
these Checks are specified in this README only.

**Checks.**

- For `11.a2`, `red 5 ∘ ρ_E` has image conjugate to `{diag(1, u)}` of order `4`, and
  `ℚ(E[5]) = ℚ(ζ₅)` (worked example 5); its determinant `u` is the mod-`5` cyclotomic character.
- A change of frame by `h` replaces `ρ_E` by `h⁻¹ ρ_E h`; `ρ_E` and `χ` are separate targets, so
  `det ∘ ρ_E = χ` constrains `ρ_E`.
- Complex conjugation: for `37.a1` (`Δ = 37 > 0`, two real components) `ρ_E(c)` is conjugate to
  `diag(1, −1)`; for every `E/ℚ` it has determinant `−1` and order two.
- (rejection) the action on `E[N]` read in a frame by rows instead of columns gives the transpose
  of `ρ_{E,N}`, an anti-homomorphism; convention 2's matrices compose.

### 3.3 Images as conjugacy classes of closed subgroups

- `adelicImage E : ClosedSubgroupConjClasses GL₂(Ẑ)` (PA 2.3, Tau Ceti
  `ClosedSubgroupConjClasses`): the class of the closed subgroup `ρ_E(G_K)` (closed as a
  continuous image of a compact group) in any frame; independence of the frame is the
  change-of-frame formula. Likewise `modNImage E N : ConjClasses (Subgroup GL₂(ℤ/N))` and
  `elladicImage E ℓ : ClosedSubgroupConjClasses GL₂(ℤ_ℓ)`. Convention 8 is the API rule: every
  invariant is first defined on subgroups and proved conjugation-invariant, then applied to
  the class (`ClosedSubgroupConjClasses.lift`).
- **Compatibilities.** `red N '' (adelicImage E) = modNImage E N`, `pr_ℓ (adelicImage E) =
  elladicImage E ℓ`, and `red (ℓ^k) (elladicImage E ℓ) = modNImage E (ℓ^k)`, as conjugacy
  classes. `ρ_E(G_K) ≤ det⁻¹(χ(G_K))`, and `det (adelicImage E) = χ(G_K)`, the open subgroup
  of `ẑˣ` fixing `K ∩ ℚ(μ_∞)`; so `IsFullDet` holds for the image iff `K ∩ ℚ(μ_∞) = ℚ`, in
  particular over `K = ℚ` (`Polynomial.cyclotomic.irreducible_rat`).
- **Containment.** `ImageLE E H := ∃ frame, ρ_E(G_K) ≤ H` for a subgroup `H ≤ GL₂(Ẑ)`
  (equivalently the class of the image contains a member below `H`); `ImageLE E H ↔ ImageLE E
  (g⁻¹Hg)`; `ImageLE E H → ImageLE E H'` for `H ≤ H'`; `ImageLE E (red N)⁻¹(H̄) ↔` the mod-`N`
  image is conjugate into `H̄`; for a quadratic twist, `ImageLE (E^d) H ↔ ImageLE E H` when
  `−I ∈ H`.
- **Invariance.** `adelicImage` is invariant under `K`-isomorphism, and for an isogeny `φ` the
  images of `E` and `E'` are commensurable: `ρ_{E'}(G_K) ∩ ρ_E(G_K)` has finite index in both
  (3.2's `A` normalises an open subgroup). Base change: `adelicImage (E_L)` is the class of
  `ρ_E(G_L)`, of finite index `≤ [L : K]` in a member of `adelicImage E`.
- **Open iff finite index.** For a closed subgroup of the profinite `GL₂(Ẑ)`, open and finite
  index are equivalent: Mathlib's `Subgroup.isOpen_of_isClosed_of_finiteIndex` (a closed subgroup
  of finite index is open) and `Subgroup.quotient_finite_of_isOpen` (an open subgroup of a compact
  group has finite index), consumed.

*Needs:* 3.2; PA 2.3; Mathlib `ConjClasses`, `OpenSubgroup`, `ClosedSubgroup`.

`adelicImage` and `ImageLE` have no declaration in `Suggested.lean`; their definitions above and
these Checks are specified in this README only.

**Checks.**

- `11.a2` has `ImageLE E Γ₀(5)` and `ImageLE E Γ₁(5)` (a rational `5`-isogeny and a rational
  point of order `5`), and not `ImageLE E Γ(5)`, since `ℚ(E[5]) = ℚ(ζ₅) ≠ ℚ` (worked example 5).
- `15.a5` has `ImageLE E Γ(2)`: all of `E[2]` is rational (worked example 6).
- `37.a1` has image the class of `S_{37}` (worked example 4).
- (boundary) `ImageLE E ⊤` for every `E`; over `ℚ` the image has full determinant.
- (comparison) the image is an element of Tau Ceti's `ClosedSubgroupConjClasses` of `GL₂(Ẑ)`.

### 3.4 Level, index, genus and the non-maximal primes

For `K` a number field:

- When `adelicImage E` is open (every non-CM `E`, Layer 4): `adelicLevel E`, `adelicIndex E`,
  `adelicGenus E` are `level`, `index`, `genus` (0.2, 1.2) of any member of the class, and
  `0` when the image is not open (CM `E`, whose level and index are `cmLevel`, `cmIndex` below); the
  class is the class of an open subgroup `H_E` with `IsFullDet` iff `K ∩ ℚ(μ_∞) = ℚ`. The
  RSZB label prefix of `H_E` is `(adelicLevel E, adelicIndex E, adelicGenus E)` when
  `IsFullDet`, and `M.d.m−N.i.g` with `(M, d) = (detLevel H_E, [ẑˣ : det H_E])` otherwise; the
  trailing ordinals are not targets. Likewise `elladicLevel E ℓ` (a power of `ℓ`),
  `elladicIndex E ℓ`, `elladicGenus E ℓ` (the genus of `(pr_ℓ)⁻¹(elladicImage E ℓ)`), and the
  mod-`ℓ` prefix `(ℓ, [GL₂(𝔽_ℓ) : ρ̄_{E,ℓ}(G_K)], genus)` of the full preimage of the mod-`ℓ`
  image. `∏_ℓ elladicLevel E ℓ ∣ adelicLevel E`, with equality when `entanglementIndex H_E = 1`
  but not only then: `Γ₀(2) ×_{ℤ/2} Γ₀(3) = {g ∈ Γ₀(6) : ε(g mod 2) = χ_{−3}(det g)}` has level
  `6 = 2·3`, projections `Γ₀(2)`, `Γ₀(3)`, and entanglement index `2`.
- **Non-maximal primes (non-CM).** `nonmaximalPrimes E := {ℓ : elladicImage E ℓ ≠ GL₂(ℤ_ℓ)}`,
  finite (Layer 4). For `ℓ ≥ 5`: if `ρ̄_{E,ℓ}(G_K) ⊇ SL₂(𝔽_ℓ)` then the `ℓ`-adic image is
  `det⁻¹(χ_ℓ(G_K))` (2.2), so `ℓ ∉ nonmaximalPrimes E` iff `ρ̄_{E,ℓ}(G_K) = GL₂(𝔽_ℓ)` and
  `χ_ℓ(G_K) = ℤ_ℓˣ`. The second condition is `K ∩ ℚ(μ_{ℓ^∞}) = ℚ`; it holds over `K = ℚ` and for
  every `ℓ` unramified in `K`, so over `ℚ` the criterion is surjectivity modulo `ℓ`. For `ℓ = 3` the
  criterion is surjectivity of `ρ_{E,9}` and for `ℓ = 2` of `ρ_{E,8}`, which force `χ_ℓ(G_K) =
  ℤ_ℓˣ` (2.2); the mod-`ℓ` criterion is strictly weaker at `2` and `3`. `nonmaximalPrimes E ⊆ {ℓ ∣ adelicLevel E}`
  and `adelicIndex E = (∏_ℓ elladicIndex E ℓ) · entanglementIndex H_E`.
- **The CM case.** For `E` with CM by `𝒪` (convention 11): `ρ_E(G_K) ≤ N_𝒪(ẑ)`, and
  `ρ_E(G_K) ≤ C_𝒪(ẑ)` iff `ℚ(𝒪) ⊆ K` (the endomorphisms are defined over `K(𝒪)`, EC Layer 7),
  with `ρ_E(G_K) ∩ C_𝒪(ẑ) = ρ_E(G_{K(𝒪)})` of index two otherwise. A prime `ℓ` is **maximal**
  for `E` when `pr_ℓ ρ_E(G_K) = N_𝒪(ℤ_ℓ)` (resp. `= C_𝒪(ℤ_ℓ)` when `ℚ(𝒪) ⊆ K`), and
  `nonmaximalPrimes E` is the set of the others, finite (4.4); the LMFDB's `cm_ramp` is
  `{ℓ ∣ disc 𝒪} ∖ nonmaximalPrimes E`. The images are never open in `GL₂(Ẑ)`; their level and
  index are taken inside `N_𝒪(ẑ)`: `cmLevel E` is the least `N` with `ρ_E(G_K) ⊇ N_𝒪(ẑ) ∩ Γ(N)`
  (resp. with `C_𝒪`), and `cmIndex E := [N_𝒪(ẑ) : ρ_E(G_K)]`. Lozano-Robledo's classification
  (arXiv:1809.02584, Theorems 1.2 and 1.4) concerns elliptic curves over `ℚ(j(E))`, which is `ℚ`
  for the thirteen rational CM `j`-invariants, and treats `j = 0` and `j = 1728` with their own
  hypotheses on `ℓ`; it is consumed over that base field only, as the statements the LMFDB's
  `web_ec.py` applies to curves over `ℚ`: for `E/ℚ` with `j(E) = 0` and `ℓ > 3` a non-maximal
  `ℓ`-adic image has index `3` in `N_𝒪(ℤ_ℓ)` (Theorem 1.4), and for `E/ℚ` with `j(E) = 1728` every
  `ℓ ≥ 3` is maximal (Theorem 1.2(4)). Over a larger `K` neither statement is claimed: the image
  shrinks at every `ℓ` ramified in `K` (4.5).
- **Serre invariants.** For `E/ℚ` and a prime `ℓ`, the Serre weight `k(ρ̄_{E,ℓ})` and Serre
  conductor `N(ρ̄_{E,ℓ})` are AGR's (its §3.5 Artin conductor and its Layer 4 weight recipe for
  two-dimensional residual representations); `serreInvariants E := {(ℓ, k, M) : (k, M) ≠
  (2, N_E)}`, finite. The knowl's characterisation — `(k, M)` is the least `(level, weight)` of
  a newform `f` with `ρ̄_f ≅ ρ̄_{E,ℓ}` — is the implication "Serre's modularity conjecture
  (Khare–Wintenberger) ⇒ `(k, M)` is attained", stated as such and not as a definition.

*Needs:* 0.2, 1.2, 2.1–2.3, 3.3; AGR §3.5, Layer 4; EC Layer 7.

`adelicLevel`, `adelicIndex`, `adelicGenus` and `nonmaximalPrimes` have no declaration in
`Suggested.lean`; their definitions above and these Checks are specified in this README only.

**Checks.**

- `37.a1`: `adelicLevel = 74`, `adelicIndex = 2`, `adelicGenus = 0`, `nonmaximalPrimes = ∅`
  (worked example 4).
- `11.a2`: `nonmaximalPrimes = {5}` and `adelicIndex ≥ 120`; `14.a6`: `nonmaximalPrimes = {2, 3}`;
  `1225.b2`: `nonmaximalPrimes = {37}` (worked examples 5–7).
- `11.a3`: its `5`-adic image has level `25`, not `5` (worked example 5).
- (rejection) the CM curve `121.b2` has an image that is not open in `GL₂(Ẑ)`, so its adelic level,
  index and genus are the junk `0`, and its non-maximal primes are read inside `N_𝒪` (worked
  example 8).
- (rejection) over a number field `K` containing the quintic subfield of `ℚ(ζ₂₅)`, `χ₅(G_K) ⊆
  μ₄ · (1 + 25ℤ₅)`, so `5 ∈ nonmaximalPrimes E` for every non-CM `E/K`, even when `ρ̄_{E,5}` is
  surjective: the mod-`5` criterion needs `χ₅(G_K) = ℤ₅ˣ`.

### 3.5 The index-two obstruction over `ℚ` and Serre curves

- For `E/ℚ` with discriminant `Δ` (of any Weierstrass model; the class of `Δ` in `ℚˣ/ℚˣ²` is
  model-independent) let `D ∈ {1} ∪ {fundamental discriminants}` be the discriminant of
  `ℚ(√Δ)`. Then `√Δ ∈ ℚ(E[2])` with `σ(√Δ) = ε(ρ̄_{E,2}(σ)) √Δ` (the discriminant of the
  2-division polynomial is `16Δ`, and `ε` is the sign of the permutation of its roots), and
  `√Δ ∈ ℚ(ζ_{|D|})` with `σ(√Δ) = χ_D(χ(σ)) √Δ`; hence **`ρ_E(G_ℚ) ≤ S_D`** (2.4), so
  `adelicIndex E ≥ 2` for every `E/ℚ` with open image — the image of `G_ℚ` is never all of
  `GL₂(Ẑ)` (Serre 1972 §5.5; Zywina 2010).
- `IsSerreCurve E := adelicIndex E = 2`, i.e. `ρ_E(G_ℚ) = S_D`. For a Serre curve:
  `adelicLevel E = level S_D` (`2|D|`, `|D|`, or `2`, 2.4), `adelicGenus E = 0`,
  `entanglementIndex = 2` iff `D` has an odd prime divisor, and `ρ̄_{E,N}` is surjective for
  every `N` coprime to `level S_D`. `nonmaximalPrimes E = ∅` unless `D ∈ {1, −4, 8, −8}`, where it
  is `{2}`: for these `D` the condition `ε(g mod 2) = χ_D(det g)` involves the `2`-component
  alone, so `pr_2 S_D` has index two in `GL₂(ℤ₂)`, and its first non-full reduction is modulo `2`
  for `D = 1` (`pr_2 S_1` reduces onto `C_ns(2)`, of order `3`), modulo `4` for `D = −4`
  (`χ_{−4}(det g)` depends on `det g mod 4`), and modulo `8` for `D = ±8` (every matrix modulo `4`
  lifts to matrices modulo `8` with both values of `χ_{±8}(det)`, as `χ_{±8}(d + 4) = −χ_{±8}(d)`).
  When `D` has an odd prime factor, `pr_ℓ S_D = GL₂(ℤ_ℓ)` for all `ℓ` (2.3). Conversely `E` is a
  Serre curve iff `ρ_E(G_ℚ) ⊇ [GL₂(Ẑ), GL₂(Ẑ)]` (an index-two subgroup containing the
  commutator subgroup is determined by its image in the abelianisation, 2.4), iff
  `[GL₂(ℤ/M) : ρ_{E,M}(G_ℚ)] = 2` for every `M` divisible by `level S_D`. Surjectivity of every
  `ρ_{E,ℓ^∞}` together with index two at the single level `level S_D` is **not** sufficient:
  `GL₂(ℤ/4)` and `GL₂(𝔽₃)` have the common quotient `S₄` (`GL₂(ℤ/4)` has a normal subgroup of
  order `4` with quotient `S₄ ≅ PGL₂(𝔽₃)`), and a fibre product over it has surjective `2`- and
  `3`-adic projections and index `24` in `GL₂(Ẑ)`.
- Over a number field `K` the sign relation reads `ε(ρ̄_{E,2}(σ)) = χ_Δ(σ)` for `σ ∈ G_K`, with
  `χ_Δ : G_K → {±1}` the character of `K(√Δ)/K` (trivial when `√Δ ∈ K`). It factors through the
  determinant only when `K(√Δ) ⊆ K(μ_∞)`: then `χ_Δ` is trivial on `ker χ = G_{K(μ_∞)}`, so
  `χ_Δ = ξ ∘ χ` for a continuous character `ξ` of the open subgroup `χ(G_K) ≤ ẑˣ`, and
  `ρ_E(G_K) ≤ {g ∈ det⁻¹(χ(G_K)) : ε(red 2 g) = ξ(det g)}`, a subgroup of index two in
  `det⁻¹(χ(G_K))` (`ε` is nontrivial on `SL₂(Ẑ)`). When `K(√Δ) ⊄ K(μ_∞)` no relation between sign and
  determinant follows: some `σ` fixes `K(μ_∞)` and moves `√Δ`, so `det ρ_E(σ) = 1` while
  `ε(ρ̄_{E,2}(σ)) = −1`. Over `ℚ` every quadratic field is cyclotomic, which is why the
  obstruction is universal there.

*Needs:* 2.4, 3.2–3.4; Mathlib `Polynomial.discriminant`, `IsCyclotomicExtension`,
Kronecker–Weber for quadratic fields (`ZMod.χ₄`, `ZMod.χ₈`, quadratic characters in
`Mathlib/NumberTheory/LegendreSymbol/`).

`IsSerreCurve` and the index-two obstruction have no declaration in `Suggested.lean`; their
statements above and these Checks are specified in this README only.

**Checks.**

- `37.a1` is a Serre curve: `D = 37`, image `S_{37}`, `adelicLevel = 74` (worked example 4).
- `11.a1`, `11.a2`, `11.a3` have adelic index at least `120`: not Serre curves (worked
  example 5).
- `15.a5` has image inside `Γ(2)`, of index `|GL₂(𝔽₂)| = 6`, so `adelicIndex ≥ 6` and it is not
  a Serre curve (worked example 6).
- (rejection) no `E/ℚ` has image `GL₂(Ẑ)`: `adelicIndex E ≥ 2` for every `E/ℚ` with open image.
- Boundary cases: `S_1` reduces modulo `2` onto `C_ns(2)` of order `3`, not `6`, so `D = 1` gives
  `nonmaximalPrimes = {2}`; `S_8` and `S_{−8}` reduce modulo `4` onto all `96` elements of
  `GL₂(ℤ/4)` and first fail modulo `8`; `S_{−4}` first fails modulo `4`.

### 3.6 Division fields, field degrees and torsion growth

- `divisionField E N := K(E[N])`, the fixed field of `ker ρ_{E,N}`;
  `Gal(K(E[N])/K) ≅ ρ_{E,N}(G_K)`, so `[K(E[N]) : K] = |H̄_N|` for `H̄_N` the mod-`N` image: the
  `torsionFieldDegree` of 2.7. `K(E[N]) ⊇ K(ζ_N)` (Weil pairing), `K(E[M]) ⊆ K(E[N])` for
  `M ∣ N`, and `K(E[∞]) := ⋃_N K(E[N])` has `Gal ≅ ρ_E(G_K)`.
- **Galois correspondence for level structures.** For a point `P ∈ E[N]` of exact order `N`,
  `[K(P) : K] = |H̄_N · P|`; for a cyclic `C ≤ E[N]` of order `N`, `[K(C) : K] = |H̄_N · C|`
  (orbit sizes under the image, in coordinates). Hence the minimal degree of `L/K` with a point
  of order `N` in `E(L)` is `cyclicTorsionFieldDegree H_E N`, and the minimal degree with a
  `L`-rational cyclic `N`-isogeny is `cyclicIsogenyFieldDegree H_E N` (2.7): the three
  "field degree" invariants of the knowl `modcurve.level_structure`.
- **Torsion growth** (`ec.q.torsion_growth`): for `L/K` finite, `HasTorsionGrowth E L :=
  E(K)_tors < E(L)_tors`; **primitive** when `E(L)_tors > E(L')_tors` for every proper
  `K ⊆ L' ⊊ L`. `E(L)_tors = ⋃_N E[N]^{ρ_E(G_L)}`, so growth is read on the image:
  `E(L)[N] = (ℤ/N)²`-fixed vectors of `ρ_{E,N}(G_L)`. The knowl's two statements about `E/ℚ` are
  consumed as cited theorems: every `E/ℚ` has torsion growth in some field of degree `2`, `3` or
  `4`, and growth in degree `d` requires a prime factor `≤ 7` of `d` (González-Jiménez–Najman,
  *Growth of torsion groups of elliptic curves upon base change*, Theorem 7.2); no primitive
  growth occurs in degree `22` (doi:10.1080/10586458.2020.1771638, Lemma 2.11, as the knowl
  cites it), whence the knowl's list `2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 14, 15, 16, 18, 20, 21` of
  degrees `< 24` with primitive growth. The first statement has an elementary proof from the
  image (a root of the `2`-division cubic has degree `≤ 3`, and if `E[2] ⊆ E(ℚ)` a half of a
  rational `2`-torsion point has degree `≤ 4`).
- **Isogeny orbits realised.** For `E` with mod-`M` image `H̄_M`, the `G_K`-orbits on cyclic
  subgroups of `E[M]` of order `n` are the `H̄_M`-orbits on `Cyc_n(M)`, and the fixed ones (2.7's
  `m`) are the `K`-rational cyclic `n`-isogenies. For **non-CM** `E` the orbit sizes are the
  degrees of the irreducible factors over `K` of the modular polynomial `Φ_n(j(E), X)` (MC Layer
  8D's `[Γ₀(n)]` moduli, consumed): the roots `j(E/C)` are then pairwise distinct, since
  `E/C ≅ E/C'` gives an endomorphism `E → E/C ≅ E/C' → E` of degree `n²`, i.e. `±[n]`, forcing
  `C = C'`; for CM `E` (not only `j ∈ {0, 1728}`) `Φ_n(j(E), X)` can have repeated roots. This is
  the knowl's reading of `isogeny_orbits`.

*Needs:* 2.7, 3.2–3.3; Mathlib `IntermediateField.fixedField`, `IsGalois`; EC Layer 6
(torsion subgroups); MC Layer 8D.

### Examples

Worked examples 4, 5 and 6: the image `S_{37}` of `37.a1`, the mod-`5` images in the class
`11.a`, torsion growth of `11.a2`, the image of `15.a5` inside `Γ(2)`.

### Dependencies

Layers 0–2; Tau Ceti `TateModule`, `tateModuleGaloisRepresentation`,
`det_tateModuleGaloisRepresentation`, `tateModuleWeilPairing`, `ClosedSubgroupConjClasses`;
PA 0.4, 2.3; EC Layers 1, 4–7; AGR §3.5, Layer 4; MC Layer 8D.

## Layer 4: Serre's open image theorem and the CM counterpart

Suggested file: `OpenImage/LieAlgebra.lean`, `OpenImage/Elladic.lean`, `OpenImage/AlmostAll.lean`,
`OpenImage/Adelic.lean`, `OpenImage/CM.lean`.

Standing hypotheses: `K` a number field, `E/K` an elliptic curve. The theorem is assembled from
suppliers; every input is named, and the three statements are separate milestones because the
LMFDB uses them separately (`ℓ`-adic images are open; almost all are maximal; the adelic image
is open with a level and an index).

### 4.1 Lie algebras of closed subgroups of `GL₂(ℤ_ℓ)` and the openness criterion

The analytic Lie theory is consumed from AdelicAlgebraicGroups AA.4.2 (its milestone **Closed
subgroups of p-adic Lie groups**), applied to the `ℚ_ℓ`-analytic group `L = GL₂(ℚ_ℓ)` with
`Lie(L) = 𝔤𝔩₂(ℚ_ℓ)`: a closed `H ≤ GL₂(ℤ_ℓ) ⊆ GL₂(ℚ_ℓ)` is a `ℚ_ℓ`-analytic subgroup with a
`ℚ_ℓ`-Lie subalgebra `Lie H ⊆ 𝔤𝔩₂(ℚ_ℓ)`, stable under conjugation by `H`, and `H` is open as soon
as `Lie H = 𝔤𝔩₂(ℚ_ℓ)` (AA.4.2's openness from a full Lie algebra; conversely an open `H` has the
full Lie algebra). What is owned here is the rank-two input that the open image theorem feeds
into that criterion:

- **The criterion in rank two.** For closed `H ≤ GL₂(ℤ_ℓ)`: `H` is open iff `Lie H = 𝔤𝔩₂(ℚ_ℓ)`
  iff `H ∩ Γ(ℓ^k)` has finite index in `Γ(ℓ^k)` for some (every) `k ≥ 1` (`k ≥ 2` when `ℓ = 2`),
  the specialisation of AA.4.2 together with 0.1's neighbourhood basis `Γ(ℓ^k)`.
- **Subalgebras of `𝔤𝔩₂`.** A `ℚ_ℓ`-subalgebra `𝔤 ⊆ 𝔤𝔩₂(ℚ_ℓ)` that acts irreducibly on `ℚ_ℓ²`
  with commutant `End_𝔤(ℚ_ℓ²) = ℚ_ℓ` and contains the scalars is all of `𝔤𝔩₂`: the irreducible
  subalgebras are the subalgebras of a non-split Cartan subalgebra `F ⊂ 𝔤𝔩₂` (`F` a quadratic
  field) not contained in the scalars — of dimension one or two, all with commutant `F` — and
  `𝔰𝔩₂`, `𝔤𝔩₂`.
- **Measure of the trace-zero locus.** For an open `H ≤ GL₂(ℤ_ℓ)` and the normalised Haar
  measure `μ_H`, `μ_H({g ∈ H : tr g = 0}) = 0`: the set `{tr ≡ 0 mod ℓ^n}` has measure
  `O(ℓ^{−n})` in `GL₂(ℤ_ℓ)` and `H ⊇ Γ(ℓ^k)` for some `k`.

*Needs:* AA.4.2 (closed subgroups of `ℚ_p`-analytic Lie groups, `Lie(C)`, openness from a full Lie
algebra); 0.1; Mathlib `PadicInt`, `MeasureTheory.Measure.haar`.

**Checks.**

- `GL₂(ℤ₅)`, `SL₂(ℤ₅)`, `{1}` have Lie algebras of dimensions `4`, `3`, `0`; only the first is
  open in `GL₂(ℤ₅)`, as the criterion says.
- `ℤ_p ⊂ ℚ_p` (AA.4.2's own Check) is the one-dimensional instance; `GL₂(ℤ_ℓ) ⊂ GL₂(ℚ_ℓ)` is the
  instance used here, with dimensions `4 = 4`.
- Trace-zero locus: modulo `5ⁿ` the matrices of trace `0` number `5^{3n}` among `5^{4n}`, a
  proportion `5^{−n} → 0`.

### 4.2 `ℓ`-adic openness for non-CM curves

**Theorem (Serre, *Abelian ℓ-adic representations*, IV.2.2, Theorem 1).** If `E` has no
geometric CM (convention 11), then for every prime `ℓ` the `ℓ`-adic image `ρ_{E,ℓ^∞}(G_K)` is
open in `GL₂(ℤ_ℓ)`. Proof route, with suppliers:

1. **Semisimplicity and the commutant.** `V_ℓ E := T_ℓ E ⊗ ℚ_ℓ` is a semisimple `G_K`-module
   and `End_{G_K}(V_ℓ E) = End_K(E) ⊗ ℚ_ℓ` (Faltings; FF R28.6.2 `elliptic_semisimple`, R28.6.3
   `elliptic_tate_hom_iso`, consumed). Non-CM gives `End_K(E) = ℤ`, so the commutant is `ℚ_ℓ`
   and `V_ℓ E` is absolutely irreducible.
2. **The Lie algebra contains the scalars.** `det ρ_{E,ℓ^∞} = χ_ℓ` has open image in `ℤ_ℓˣ`
   (3.3), so `Lie (ρ_{E,ℓ^∞}(G_K))` contains an element of nonzero trace; the Lie algebra of
   the image of an inertia group at a prime `v ∣ ℓ` of good reduction contains a semisimple
   element of nonzero trace with distinct eigenvalues: `diag(1, 0)` in the ordinary case (the
   inertia image is `{[[u, x], [0, 1]]}` or its diagonal part, Serre 1972 §1.11, acting through
   the cyclotomic character on the formal group and trivially on the étale quotient), the whole
   non-split Cartan subalgebra in the supersingular case (Serre 1972 §1.12; the formal group of
   height two); consumed from AGR §2.3's fundamental characters and EC Layer 4's formal group at
   `v`. Together with absolute irreducibility this gives the scalars.
3. **Irreducibility of the Lie algebra.** `Lie H` acts irreducibly: a `Lie H`-stable line would
   be `H⁰`-stable for an open subgroup `H⁰ ≤ H`, i.e. `G_L`-stable for a finite `L/K`, making
   `E_L` have a `G_L`-stable line in `V_ℓ`, hence (Faltings over `L`) `End_L(E) ⊗ ℚ_ℓ`
   non-trivial — contradiction with non-CM over `K̄`. The commutant of `Lie H` equals that of
   `H⁰`, which is `ℚ_ℓ` by step 1 over `L`.
4. **Conclusion** by 4.1: `Lie H = 𝔤𝔩₂`, so `H` is open.

Consequences: `elladicIndex E ℓ`, `elladicLevel E ℓ` are finite for every `ℓ`; the mod-`ℓ^k`
images stabilise: `ρ_{E,ℓ^∞}(G_K)` is the preimage of `ρ_{E,ℓ^k}(G_K)` for `ℓ^k = elladicLevel`.

*Needs:* 3.2–3.4, 4.1; FF R28.6.2–R28.6.3; AGR §2.3; EC Layer 4, Layer 7 (`GeometricEnd`).

The open image theorems 4.2–4.4 have no declaration in `Suggested.lean`, since the adelic
representation has none; their statements and these Checks are specified in this README only.

**Checks.**

- `37.a1`: every `ℓ`-adic image is all of `GL₂(ℤ_ℓ)` (worked example 4).
- `11.a3`: the `5`-adic image is open, of level `25` (worked example 5).
- (rejection) the CM curve `121.b2` has `ℓ`-adic images inside `N_𝒪(ℤ_ℓ)`, of infinite index in
  `GL₂(ℤ_ℓ)`: the non-CM hypothesis is needed (worked example 8).

### 4.3 Surjectivity for almost all `ℓ`

**Theorem (Serre 1972, §4).** If `E` has no geometric CM, `ρ̄_{E,ℓ}` is surjective onto
`GL₂(𝔽_ℓ)` for all but finitely many `ℓ`, hence (2.2) `ρ_{E,ℓ^∞}` is surjective for all but
finitely many `ℓ` and `nonmaximalPrimes E` is finite. Proof route, for `ℓ` large enough that
`ℓ ∤ [K ∩ ℚ(μ_∞) : ℚ]`, `ℓ` is unramified in `K` and `E` has good reduction at every `v ∣ ℓ`:

1. **Determinant.** For such `ℓ`, `K ∩ ℚ(μ_{ℓ^∞}) = ℚ` (`ℚ(μ_{ℓ^∞})` is totally ramified at `ℓ`),
   so `det ρ_{E,ℓ^∞} = χ_ℓ` is surjective onto `ℤ_ℓˣ` and `det ρ̄_{E,ℓ} = χ̄_ℓ` onto `𝔽_ℓˣ` (3.3);
   this is the determinant hypothesis of 2.2's `GL₂` form.
2. **Dickson.** If `G := ρ̄_{E,ℓ}(G_K) ⊉ SL₂(𝔽_ℓ)` then `G` lies in a Borel subgroup, in the
   normaliser of a Cartan subgroup, or its projective image is `A₄`, `S₄`, `A₅`
   (AGR §4.4 `dickson_projectiveImage`, §4.3; consumed).
3. **Inertia at `ℓ`.** For `v ∣ ℓ` with `K_v/ℚ_ℓ` unramified, the image of inertia `I_v` under
   `ρ̄_{E,ℓ}` is `{diag(u, 1)}` or `{[[u, x], [0, 1]]}` (good ordinary reduction) or a non-split
   Cartan of order `ℓ² − 1` (supersingular) — Serre 1972 §1.11, Props. 11–12, via the fundamental
   characters of tame inertia, AGR §2.3, and the formal group of `E` at `v`, EC Layer 4. In
   particular `G` contains a semisimple element whose image in `PGL₂(𝔽_ℓ)` has order `ℓ − 1`
   (eigenvalues `u, 1` with `u` a generator) or `ℓ + 1` (eigenvalues `α, α^ℓ`, `α` a generator of
   `𝔽_{ℓ²}ˣ`), exceeding `5`, the largest element order in `A₄`, `S₄`, `A₅`, as soon as `ℓ ≥ 7`;
   this excludes the exceptional projective images for `ℓ ≥ 7`.
4. **Borel case for infinitely many `ℓ` is impossible.** A Borel image is a `G_K`-stable line
   `C ⊂ E[ℓ]`, and the quotient `E → E/C` (EC Layer 1, Tau Ceti's isogeny with kernel a rational
   finite subgroup) is a `K`-rational cyclic `ℓ`-isogeny. The isogeny class of `E` is finite (FF R28.6.5), so some
   `E'` receives `K`-rational cyclic isogenies of infinitely many prime degrees from `E`; but
   `Hom_K(E, E')` is infinite cyclic (FF R28.6.6) generated by one isogeny `φ`, every element is
   `nφ` of degree `n² deg φ`, cyclic only for `n = 1` — contradiction.
5. **Cartan-normaliser case for infinitely many `ℓ` is impossible.** If `G ≤ N(C)` with
   `G ⊄ C`, the character `ε_ℓ : G_K → G/(G ∩ C) = {±1}` is unramified outside the bad primes
   of `E` and (by step 3, as the inertia image lies in `C` for `ℓ` large) outside `ℓ`; there are
   finitely many quadratic characters of `G_K` unramified outside a fixed finite set (Hermite;
   Mathlib `NumberField.finite_of_discr_bdd_of_isReal`/`_isComplex`), so one `ε` occurs for
   infinitely many `ℓ`. For `σ` with `ε(σ) = −1`, `tr ρ̄_{E,ℓ}(σ) = 0` for infinitely many `ℓ`,
   so `tr ρ_{E,ℓ₀^∞}(σ) = 0` for a fixed `ℓ₀` (the trace is an algebraic integer independent of
   `ℓ` on Frobenius elements, EC Layer 4 `a_v`, and by Chebotarev every `σ` of the open set
   `ε = −1` is approximated by Frobenius elements). Then the trace-zero locus of the open image
   `ρ_{E,ℓ₀^∞}(G_K)` (4.2) has positive Haar measure, contradicting 4.1. (The Chebotarev input
   is the density theorem for the finite extensions `K(E[ℓ₀^k])/K`, [Chebotarev
   roadmap](../Chebotarev/README.md), passed to the limit over `k`.)
6. **Borel/Cartan for a single large `ℓ`.** Steps 4–5 exclude the two families for infinitely
   many `ℓ`; `A₄, S₄, A₅` are excluded by step 3. Hence `G ⊇ SL₂(𝔽_ℓ)` for `ℓ` large, and with
   step 1, `G = GL₂(𝔽_ℓ)`.

No effective bound is claimed (Serre's uniformity question is not a target); the theorem is
finiteness of `nonmaximalPrimes E`, and the LMFDB's per-curve list is a computation decided
by 2.2 and the mod-`ℓ` image at the listed primes.

*Needs:* 2.2, 3.2–3.4, 4.1–4.2; AGR §§2.3, 4.3–4.4; FF R28.6.5–R28.6.6; EC Layer 4; Chebotarev;
Mathlib Hermite theorem.

**Checks.**

- `nonmaximalPrimes` is `∅` for `37.a1`, `{5}` for `11.a2`, `{2, 3}` for `14.a6` and `{37}` for
  `1225.b2` (worked examples 4–7).
- (rejection) the CM curve `121.b2` has non-surjective mod-`ℓ` image at each prime worked
  example 8 lists: a split Cartan normaliser at `3` and `5`, a non-split one at `7` and `13`, a
  Borel at `11`.

### 4.4 Adelic openness

**Theorem (Serre 1972, §4, Théorème 3).** If `E` has no geometric CM, `ρ_E(G_K)` is open in
`GL₂(Ẑ)`; so `adelicLevel E`, `adelicIndex E`, `adelicGenus E` are finite, and `adelicImage E`
is the class of an open subgroup `H_E` with `H_E ⊇ Γ(adelicLevel E)`. Proof route:

1. By 4.3 choose `ℓ₀ ≥ 5` with `ρ_{E,ℓ^∞}` surjective for all `ℓ ≥ ℓ₀`. The closure of the
   commutator subgroup of `H := ρ_E(G_K)` is a closed subgroup of `∏_ℓ SL₂(ℤ_ℓ)` whose projection
   to `SL₂(ℤ_ℓ)` is all of it for `ℓ ≥ ℓ₀` (`SL₂(ℤ_ℓ)` is perfect for `ℓ ≥ 5`, 2.4).
2. **Serre's product lemma.** A closed subgroup of `∏_{ℓ ≥ ℓ₀} SL₂(ℤ_ℓ)` surjecting onto every
   factor is the whole product: for two distinct `ℓ, ℓ'`, Goursat's lemma (Mathlib
   `Subgroup.goursat`) and the facts that `SL₂(𝔽_ℓ)` has `PSL₂(𝔽_ℓ)` as its only non-abelian
   simple quotient (Mathlib `ProjectiveSpecialLinearGroup.rank_two_simple'`), that
   `PSL₂(𝔽_ℓ) ≇ PSL₂(𝔽_ℓ')` (orders), and that a closed subgroup of `SL₂(ℤ_ℓ)` surjecting
   mod `ℓ` is everything (2.2), give the product for two factors; finite products by
   induction; the infinite product by closedness. Serre 1972 §4.4, in the proof of Théorème 3,
   takes this lemma from *Abelian ℓ-adic representations*, p. IV-19; the argument just given is
   owned here as a target.
3. Hence `H ⊇ ∏_{ℓ ≥ ℓ₀} SL₂(ℤ_ℓ)`, so `H` is the preimage of its image `H̄` in
   `∏_{ℓ<ℓ₀} GL₂(ℤ_ℓ) × ∏_{ℓ≥ℓ₀} ℤ_ℓˣ` (the second factor through `det`). Let `H_S` be the
   projection of `H` to `G_S := ∏_{ℓ<ℓ₀} GL₂(ℤ_ℓ)`; each `pr_ℓ H` is open (4.2). Inside the open
   pro-`ℓ` subgroups `U_ℓ := Γ(ℓ^{k})` (`k = 1`, or `2` at `ℓ = 2`), the subgroup
   `H_S ∩ ∏_{ℓ<ℓ₀} U_ℓ` has open pro-`ℓ` projections for pairwise distinct `ℓ`, which have no
   common nontrivial quotient, so Goursat's lemma (iterated over the finitely many factors) makes
   it the product of its projections: `H_S` is open in `G_S`. The commutator subgroup of `H_S`
   is then open in `∏_{ℓ<ℓ₀} SL₂(ℤ_ℓ)` (Lie algebra `[𝔤𝔩₂, 𝔤𝔩₂] = 𝔰𝔩₂`, 4.1) and lies in
   `H̄ ∩ (G_S × 1)`; `det H = χ(G_K)` is open in `ẑˣ` (3.3); so `H̄` meets the kernel of
   `det × id : G_S × ∏_{ℓ≥ℓ₀} ℤ_ℓˣ → ẑˣ` in an open subgroup and surjects onto an open subgroup of
   `ẑˣ`, hence is open. Therefore `H ⊇ Γ(N)` for some `N`, and `H` is open.

Consequences recorded as API: `adelicLevel E` is divisible exactly by the primes in
`nonmaximalPrimes E ∪ {entangled primes}`; `adelicIndex E = (∏_ℓ elladicIndex E ℓ) ·
entanglementIndex H_E`; `adelicIndex E ≥ 2` over `ℚ` (3.5); `adelicGenus E` is the genus of the
"maximal modular curve on which `E` defines a rational point" (5.2 makes this literal).

*Needs:* 2.2, 2.4, 3.3, 4.2–4.3; Mathlib `Subgroup.goursat`, `rank_two_simple'`.

**Checks.**

- `37.a1`: the image is open, the class of `S_{37}`, with `adelicLevel = 74` and
  `adelicIndex = 2` (worked example 4).
- `11.a2`, `11.a3`: open images of index at least `120` (worked example 5).
- (rejection) the CM curve `121.b2` has an image that is not open in `GL₂(Ẑ)` (4.5, worked
  example 8).

### 4.5 The CM counterpart

For `E` with CM by the imaginary quadratic order `𝒪` (convention 11), `F := ℚ(𝒪)`:

- `ρ_E(G_{K·F})` lies in `C_𝒪(ẑ) = (𝒪 ⊗ ẑ)ˣ` and is **open in `C_𝒪(ẑ)`**: the main theorem of
  complex multiplication (SV §5.10, consumed) identifies `ρ_E|_{G_{KF}}` with the composite of
  the Artin map `G_{KF}^{ab} ≅ 𝔸_{KF}ˣ / \overline{(KF)ˣ (KF)_∞ˣ}` (CFT Layer 11) with a
  continuous homomorphism `𝔸_{KF,f}ˣ → (𝒪 ⊗ ẑ)ˣ` given by the Grössencharacter of `E/KF`
  (SV §5.10); its image is open because the Grössencharacter is a continuous open map on the
  finite ideles: on the open subgroup `(𝒪 ⊗ ẑ)ˣ ∩ ker ψ_f` of the unit ideles of `KF` it is
  `u ↦ N_{KF/F}(u)⁻¹`, whose image is open in `(𝒪 ⊗ ẑ)ˣ` (the "idelic" form of the CM theory:
  a unit idele `u` acts on `T̂E` by `ψ(u)·N(u)_f⁻¹`, with `ψ(u) ∈ 𝒪ˣ`).
- `ρ_E(G_K) ≤ N_𝒪(ẑ)`, equal to `ρ_E(G_{KF})` when `F ⊆ K` and containing it with index two
  otherwise (an element `σ ∉ G_{KF}` acts on `End(E_{K̄}) ≅ 𝒪` by the nontrivial automorphism,
  so `ρ_E(σ)` is `𝒪`-antilinear at every `ℓ` simultaneously, i.e. lies in `C_𝒪(ẑ)·ι`, the
  nontrivial coset of 0.3's `N_𝒪(ẑ) = ⟨C_𝒪(ẑ), ι⟩`); so the image is open in `N_𝒪(ẑ)` (it is
  not open in the normaliser `∏_ℓ N_𝒪(ℤ_ℓ)` of `C_𝒪(ẑ)`, 0.3) and `cmIndex E`, `cmLevel E` are
  finite. At a prime `ℓ` the image of `G_{KF}` in `C_𝒪(ℤ_ℓ)` contains `ψ(u) · N_{KF/F}(u)_ℓ⁻¹` for
  the unit ideles `u ∈ ∏_{λ ∣ ℓ} 𝒪_{KF,λ}ˣ`, where `N_{KF/F}` is the local norm and `ψ` the finite
  part of the Grössencharacter, which is trivial on these units when `E/KF` has good reduction at
  every `λ ∣ ℓ`. The norm on local units is onto `(𝒪_F ⊗ ℤ_ℓ)ˣ` when `ℓ` is unramified in `KF/F`,
  and in general its image is the subgroup of norms from the completions of `KF`, of finite index,
  which shrinks the image at the primes ramified in `KF`. Hence `pr_ℓ ρ_E(G_K) = N_𝒪(ℤ_ℓ)` (resp.
  `C_𝒪(ℤ_ℓ)`) for every `ℓ` not dividing `disc 𝒪`, unramified in `KF`, and below no prime of bad
  reduction of `E/KF`, and `nonmaximalPrimes E` (3.4) is contained in the finite set of the
  remaining `ℓ`. Good reduction at `ℓ` alone does not suffice.
- Over `ℚ`: `𝒪` is one of the thirteen class-number-one orders (IQ, consumed), `F ⊄ ℚ`, so
  `ρ_E(G_ℚ) ≤ N_𝒪(ẑ)` with `ρ_E(G_F) = ρ_E(G_ℚ) ∩ C_𝒪(ẑ)`; the explicit `ℓ`-adic images and
  the finite list of `(𝒪, ℓ)` with non-maximal image are Lozano-Robledo's theorems
  (arXiv:1809.02584), consumed as the statements the LMFDB applies; for `ℓ ∤ 2·disc 𝒪·N_E` the
  mod-`ℓ` image is `C⁺_s(ℓ)` or `C⁺_ns(ℓ)` according to `(disc 𝒪 / ℓ) = ±1` (the good-reduction
  case above reduced mod `ℓ`; Serre 1972 §4.5 for the general shape), and the index at the
  finitely many `ℓ ∣ N_E` is a computation on the stored images.

*Needs:* 2.1, 3.2–3.4; SV §5.10; CFT Layer 11; EC Layer 7; IQ.

**Checks.**

- (rejection) `E : y² = x³ − x` (CM by `ℤ[i]`, conductor `32`) over `K = ℚ(i, E[5])` has good
  reduction above `5`, yet `ρ̄_{E,5}(G_K) = 1` while `C_𝒪(𝔽₅)` is the split Cartan of order
  `(5 − 1)² = 16`: here `5` ramifies in `K`, so `5` is in the exceptional set.
- `121.b2` over `ℚ` (`D = −11`): mod-`ℓ` image the split Cartan normaliser at `3`, `5` and the
  non-split one at `7`, `13`, all maximal; the ramified `ℓ = 11` divides `disc 𝒪` (worked
  example 8).
- `27.a3` (`D = −3`) at the ramified `ℓ = 3`: mod-`3` image inside a Borel subgroup of order `6`,
  not a Cartan normaliser (worked example 8).

### Examples

Worked examples 4, 5, 7 and 8: open images of `37.a1`, `11.a2`, `11.a3`, `1225.b2`; the CM images
of `121.b2`, `27.a3`, `32.a4`; the CM base-change Check of 4.5.

### Dependencies

Layers 2–3; AA.4.2; FF R28.6.2–R28.6.6; AGR §§2.3, 4.3–4.4; EC Layers 4, 7; Chebotarev;
SV §5.10; CFT Layer 11; IQ; Mathlib Hermite's theorem, `Subgroup.goursat`,
`ProjectiveSpecialLinearGroup.rank_two_simple'`.

## Layer 5: the arithmetic of `X_H`

Suggested file: `ModularCurve/Comparison.lean`, `ModularCurve/Points.lean`, `ModularCurve/CM.lean`,
`ModularCurve/Isolated.lean`, `ModularCurve/FibreProduct.lean`, `ModularCurve/Gassmann.lean`,
`ModularCurve/Twist.lean`, `ModularCurve/Local.lean`, `ModularCurve/Jacobian.lean`.

Standing hypotheses: `H ≤ GL₂(Ẑ)` open; `X_H` is MC2's compactified coarse curve over `ℚ`
(MC2 §§5.8–5.12), an integral projective curve with the `j`-map `j : X_H → X(1) ≅ ℙ¹_ℚ`
(MC2 §5.10), smooth over `ℤ[1/N]` for `N = level H`, geometrically connected iff `IsFullDet H`
(MC2 §5.12); `Y_H := j⁻¹(𝔸¹)`. Nothing here constructs `X_H`; everything here identifies its
arithmetic with Layers 0–4.

### 5.1 Comparison: genus, cusps, Galois action, components, canonical field

- **Components and the canonical field.** `π₀((X_H)_{ℚ̄}) ≅ det H̄_N \ (ℤ/N)ˣ`, of cardinality
  `[ẑˣ : det H]` (MC2 §5.12, §8.3; consumed); the **canonical field of definition**
  `canonicalField H ⊆ ℚ(ζ_N)` is the fixed field of `det H̄_N ≤ (ℤ/N)ˣ ≅ Gal(ℚ(ζ_N)/ℚ)`,
  equal to `H⁰(X_H, 𝒪)`, of degree `[ẑˣ : det H]`; it is `ℚ` iff `IsFullDet H`. Each
  geometric component is a smooth projective geometrically connected curve over
  `canonicalField H`. (The knowl `modcurve.canonical_field`.)
- **Genus.** The genus of every geometric component of `X_H` equals `genus H` (1.2): MC2 §6.1
  identifies `(X_H)_ℂ`'s components with the compact Riemann surface `X(Γ_{±H})` of FO/MF, and
  1.4 identifies its genus with the coset formula. In particular `genus H ∈ ℕ`.
- **Cusps.** The cusps of `X_H` (the fibre `j⁻¹(∞)`, MC2 §5.10–5.11) over `ℚ̄` are in
  `G_ℚ`-equivariant bijection with `±H̄_N \ GL₂(ℤ/N) / ⟨T⟩` with the action of convention 7
  (MC2 §5.11's cusps away from the level and §5.12's cyclotomic structure give the set and the
  action; 1.3 the finite model). Hence `rationalCusps H` is the number of `ℚ`-rational cusps
  of `X_H`, `cuspOrbits H` the multiset of degrees of the closed cusp points, `cuspField H c`
  the residue field of the closed point (MC2 §6.3), and the **width** of a cusp (1.1) is the
  ramification index of `j` at it (MC2 §5.10's cusp divisor `j^*(∞) = Σ_c width(c)·c`), so
  `Σ_c width c = deg j = pslIndex H` when `IsFullDet H` (MC2 §5.10 and 0.4).
- **Elliptic points.** `ν₂(H)` and `ν₃(H)` are the numbers of points of `(X_H)_ℂ` above
  `j = 1728` and `j = 0` whose stabiliser in `Γ_{±H}` is nontrivial (1.4 via MC2 §6.1), i.e.
  the knowl `modcurve.elliptic_points`.
- **Degree.** `deg j = pslIndex H` on each geometric component, and the total degree of
  `j : X_H → ℙ¹_ℚ` is `index (±H) = pslIndex H · [ẑˣ : det H]` (MC2 §5.10 `projectiveIndex`; 0.4).
  For `H ≤ G` the total degree of `X_H → X_G` (MC2 §5.15 level maps) is `[±G : ±H]`; on a
  geometric component of `X_H` and the component of `X_G` below it the degree is
  `pslIndex H / pslIndex G` (1.5), and the two agree when `det H = det G`. An index-two refinement
  (`G = ±H'`) has `[±G : ±H'] = 1`, so it induces an isomorphism `X_{H'} ≅ X_{±H'}` (the knowl
  `modcurve.modular_cover`).

*Needs:* 1.1–1.5; MC2 §§5.10–5.12, 5.15, 6.1, 6.3, 8.3.

**Checks.**

- (rejection) `G = GL₂(Ẑ)` and `H = det⁻¹(ker(ẑˣ → (ℤ/3)ˣ))`: both `PSL₂`-indices are `1`, but
  `X_H` is `ℙ¹` over `ℚ(ζ₃)`, two geometric components, and `X_H → X_G` has total degree
  `[±G : ±H] = 2`.
- `Γ₁(11) ≤ Γ₀(11)`: raw index `10`, `[±Γ₀(11) : ±Γ₁(11)] = 5 = 60/12`, the degree of
  `X₁(11) → X₀(11)`.
- `X(5)`: four geometric components over `ℚ(ζ₅)`, each of degree `pslIndex = 60` over `X(1)`,
  total degree `240 = index (±Γ(5))` (worked example 10).

### 5.2 Points of `X_H` and Galois images

Let `K` be a number field and `IsFullDet H`.

- **The dictionary (MC2 §9.7, consumed).** Non-cuspidal `K`-points of `X_H` correspond to
  `K̄`-isomorphism classes of pairs `(E, [ι]_H)` (`E/K̄` an elliptic curve, `[ι]_H` an `H`-orbit
  of frames of `T̂E`, equivalently of `E[N]`) that are `G_K`-stable; a pair over `K`
  (`E/K` with a `K`-rational `H`-level structure, knowl `modcurve.level_structure`) gives one.
- **Images.** For `E/K` and a non-cuspidal `P ∈ X_H(K)` with `j(P) = j(E)`:
  `P` lies in the image of the pairs over `K` with underlying curve `E` iff `ρ_E(G_K) ≤ H` up
  to conjugacy (`ImageLE E H`, 3.3); this is the knowl's "if `E` admits a rational `H`-level
  structure then the adelic image is conjugate to a subgroup of `H`", and its converse.
  Owned theorem: **a `K̄`-point `P = (E, [ι]_H)` is `G_K`-stable iff `ρ_E(σ) ∈ Aut(E_{K̄})·H` (a
  subset) for every `σ`**, where `Aut(E_{K̄}) ↪ GL₂(Ẑ)` through the frame; `j(E) ∈ j(X_H(K))` if
  some cocycle twist `E'` of `E` (EC Layer 5) has `ImageLE E' H`, and conversely when
  `Aut(E_{K̄}) = {±1}`, i.e. `j(E) ∉ {0, 1728}` (the two bullets below; the converse fails in
  general, which is the knowl's caveat).
- **The `−I` caveat.** If `−I ∈ H` and `j(E) ∉ {0, 1728}`: `Aut(E_{K̄}) = {±1} ⊆ H`, so
  `j(E) ∈ j(X_H(K))` iff `ImageLE E H`, and then every quadratic twist of `E` has
  `ImageLE`, since `ρ_{E^d} = χ_d ρ_E` and `−I ∈ H` (knowl `modcurve.contains_negative_one`);
  the fibre of `{(E,[ι]_H)/K}` over `P` is the set of all quadratic twists of `E` (each with
  its level structures), and the LMFDB lists the minimal twist (a choice that is not a target).
- **The fine case.** Let `−I ∉ H` and let `P ∈ X_{±H}(K)` be non-cuspidal with `j(P) = j(E) ∉
  {0, 1728}`, given by a `G_K`-stable `±H`-orbit `[ι]_{±H}` of frames of `T̂E`. Read `ρ_E` in a
  frame of that orbit; then `ρ_E(G_K) ≤ ±H` and `ψ_{E,P} : G_K → ±H → ±H/H ≅ {±1}` is a continuous
  character, independent of the frame within the orbit. The quadratic twist `E^{ψ_{E,P}}` is the
  **unique** quadratic twist of `E` carrying a `K`-rational `H`-level structure that lies over
  `P`. So `X_H(K) = X_{±H}(K)` (5.1, degree one) and each non-cuspidal `P ∈ X_H(K)` with
  `j(P) ∉ {0, 1728}` corresponds to exactly one `K`-isomorphism class of pairs. Uniqueness is over
  the point `P`, not over its `j`-invariant, and is not a statement about `ImageLE`, which forgets
  the level structure: different points of `X_H(K)` over the same `j` can require different
  twists, and both a curve and a nontrivial twist of it can satisfy `ImageLE · H`. The knowl's
  statement "when `−1 ∉ H` this is almost true, but there may be exceptions at `j = 0, 1728`"
  is exactly: for `j(E) ∈ {0, 1728}`, `Aut(E_{K̄}) ∈ {μ₄, μ₆}` and the twist needed is by a
  cocycle in `H¹(G_K, Aut(E_{K̄}))`, which exists iff the function sending `σ` to the coset
  of `ρ_E(σ)` in `Aut·H` is a cocycle with values in `Aut(E_{K̄})`; so a point with
  `j ∈ {0, 1728}` may have no pair over `K` above it (the obstruction class) or several
  non-isomorphic ones.
- **Degree-`d` points.** The same dictionary over a finite extension `L/K`: closed points of
  `X_H` of degree `d` over `K` are `G_K`-orbits of size `d` of `K̄`-points, i.e. pairs over a
  degree-`d` field; `pointDegree`, `pointResidueField` (knowls `modcurve.point_degree`,
  `modcurve.point_residue_field`) are AC's degree and residue field of a closed point.
- **The adelic genus.** For non-CM `E/K` with image `H_E`: `E` gives a non-cuspidal `K`-point
  of `X_{H_E}` and of every `X_H` with `H_E ≤ H`, and of no `X_H` with `H_E ⊄ H` up to conjugacy
  and `j(E) ∉ {0, 1728}`, `−I ∈ H`. So `(adelicLevel E, adelicIndex E, adelicGenus E)` is the
  prefix of the **maximal** modular curve `X_{H_E}` (coarse version `X_{±H_E}`) on which `E`
  defines a rational point, the knowls `columns.ec_curvedata.adelic_*` verbatim.

*Needs:* 3.2–3.5, 5.1; MC2 §9.7, §5.16; EC Layer 5 (twists as `H¹(G_K, Aut)`).

**Checks.**

- (rejection) In `GL₂(𝔽₃)` with `H̄ = Γ₁(3)` (fine): `diag(1, −1)` fixes `e₁`, and its twist by the
  determinant character is `diag(−1, 1)`, which fixes `e₂`. A non-CM `E/ℚ` with surjective mod-`3`
  image, base-changed to the fixed field `L` of `⟨diag(1, −1)⟩`, has `ImageLE E_L H` and
  `ImageLE E_L^{ψ} H` for the nontrivial twist `ψ`; the two twists give two different points of
  `X₁(3)(L)` over the same `j`.
- `32.a3` (`y² = x³ − x`, `j = 1728`) has no point of order `4`, while its twist `32.a4` does: the
  point of `X₁(4)(ℚ) = X_{±1}(4)(ℚ)` above it is realised by the twist (worked example 9).
- `−I ∈ Γ₀(11)`: the three non-cuspidal points of `X₀(11)(ℚ)` are realised by `121.b2`, `121.c2`,
  `121.a2` and by all their quadratic twists (worked example 1).

### 5.3 CM points and `cm_discriminants`

- A point `P ∈ X_H(K̄)` is a **CM point** when it is non-cuspidal and `j(P)` is the
  `j`-invariant of an elliptic curve with geometric CM (convention 11); the CM `j`-invariants
  in a number field `L` form a finite set (EC Layer 7 / IQ: `j(𝒪)` has degree `h(𝒪)`, and
  `h(𝒪) → ∞`, IQ's class-number growth, consumed), and over `ℚ` they are exactly the thirteen
  values of the knowl `ec.complex_multiplication` with discriminants
  `−3, −4, −7, −8, −11, −12, −16, −19, −27, −28, −43, −67, −163` (IQ; the knowl's list repeats
  `−27` and omits `−28`, a typo in the knowl).
- `cmDiscriminants H := {D : j(𝒪_D) ∈ j(X_H(ℚ))}` for the thirteen class-number-one
  discriminants. By 5.2 this holds iff for one, equivalently every, `E/ℚ` with `j(E) = j(𝒪_D)` the
  image `ρ_E(G_ℚ)` lies, up to conjugacy, in the subset `Aut(E_{ℚ̄}) · H` (twisting `E` by a cocycle
  with values in `Aut(E_{ℚ̄})` multiplies `ρ_E` by those values and preserves the condition). For
  `j(𝒪_D) ∉ {0, 1728}` and `−I ∈ H` this is `ImageLE E H`. At `j ∈ {0, 1728}` the automorphism group
  is `μ₆` or `μ₄`, and the condition keeps it even when `−I ∈ H`: containing `−I` removes only the
  quadratic twists, not the cubic, quartic and sextic ones. The predicate is decided from the
  images of 4.5 (Lozano-Robledo's classification over `ℚ`, consumed). Over number fields `K`, `cmPoints H K` is the
  finite set of CM `j`-invariants of `K` lying in `j(X_H(K))`.
- `knownPoints` (counts of stored points grouped by `j`) is a stored list and is not a target;
  the trichotomy cusp / CM / other on `X_H(K̄)` is owned here.

*Needs:* 3.4, 4.5, 5.2; IQ; EC Layer 7.

**Checks.**

- (rejection) `y² = x³ + 2` has no rational point of order `2` (`x³ = −2` has no rational root),
  while `y² = x³ − 1` has `(1, 0)`; both have `j = 0`. So `−3 ∈ cmDiscriminants Γ₀(2)`, though
  `y² = x³ + 2` has no rational cyclic `2`-isogeny: at `j = 0` the twist cannot be discarded.
- `cmDiscriminants C_ns⁺(13) = {−7, −8, −11, −19, −28, −67, −163}`, the `D` with `(D/13) = −1`
  (worked example 3).
- The thirteen discriminants `−3, −4, −7, −8, −11, −12, −16, −19, −27, −28, −43, −67, −163` are
  pairwise distinct, each with class number one (IQ).

### 5.4 Isolated points and isolated `j`-invariants

`CanonicalModelsAndGonality` Layer 7 supplies, for a curve `X/K` and a closed point `x` of
degree `d`: `IsP1Parametrized x`, `IsAVParametrized x`, `IsIsolated x` (neither), `IsSporadic x`
(fewer than infinitely many points of degree `≤ d`), and their functoriality under finite maps.
Owned here is the modular specialisation:

- `IsIsolatedJInvariant j := ∃ N, ∃ x closed point of X₁(N) with j(x) = j and IsIsolated x`
  (Bourdon–Ejder–Liu–Odumodu–Viray's definition); `IsIsolatedPoint X_H x` is the sibling's
  predicate at `X_H`.
- Every rational point of a curve of genus `≥ 2` is isolated: a degree-one point is
  `ℙ¹`-parametrized only in genus `0` and `AV`-parametrized only when the curve is its own
  Jacobian (genus `1`); it is moreover sporadic by finiteness of `X_H(K)` (consumed by the
  sibling from the heights roadmap); a rational cusp of `X_H` with
  `genus H = 1` and `rank J_H(ℚ) > 0` is AV-parametrized; a point of `ℙ¹_ℚ = X_H` (genus 0) is
  never isolated.
- **CM `j`-invariants in `ℚ` are isolated `j`-invariants.** For a CM `j ∈ ℚ` with CM field `F`
  and a prime `ℓ` split in `F`, 4.5 puts the mod-`ℓ` image of a curve `E/ℚ` with `j(E) = j` in the
  normaliser of a split Cartan, so a nonzero point of one of its two eigenlines has an orbit of
  size at most `2(ℓ − 1)`: `X₁(ℓ)` has a closed point `x` above `j` of degree `d ≤ 2(ℓ − 1)`.
  Abramovich's bound (CMG Layer 8) gives `gon_ℚ(X₁(ℓ)) ≥ (7/800) · (ℓ² − 1)/2`, so `2d < gon_ℚ(X₁(ℓ))`
  once `ℓ` is large. Frey's criterion (CMG Layer 7: a curve with infinitely many points of degree
  `≤ d` has `gon_ℚ ≤ 2d`) then leaves finitely many points of degree `≤ d`, so `x` is sporadic,
  hence isolated. The inequality runs this way: a degree larger than half the gonality gives no
  conclusion. Bourdon–Ejder–Liu–Odumodu–Viray state this CM result in their introduction and
  attribute it to Clark–Cook–Stankewicz (with an appendix by Rice), whose degree computations for
  torsion on CM curves refine the bound `2(ℓ − 1)` used here.
- **Level reduction.** For `H ≤ G` and the cover `f : X_H → X_G`, an isolated `x ∈ X_H` with
  `deg x = deg f · deg f(x)` maps to an isolated `f(x)` (the sibling's functoriality theorem
  instantiated at modular covers).
- **Theorem (Bourdon–Ejder–Liu–Odumodu–Viray, Theorem 1.1).** Let `E` be an elliptic curve without
  CM over the number field `ℚ(j(E))`, let `m` be a positive integer divisible by `2`, `3` and every
  prime `ℓ` whose `ℓ`-adic image is not all of `GL₂(ℤ_ℓ)`, and let `M(E, m)` be the level of the
  `m`-adic image, the image of `G_{ℚ(j(E))}` in `∏_{ℓ ∣ m} GL₂(ℤ_ℓ)`. If `x ∈ X₁(n)` is isolated
  with `j(x) = j(E)`, then the image of `x` in `X₁(gcd(n, M(E, m)))` is isolated. The level is that
  of the joint `m`-adic image, which sees entanglement between the primes dividing `m` that the
  single `ℓ`-adic images do not. Proof route: the degrees of the points of `X₁(n)` and of
  `X₁(gcd(n, M(E, m)))` above `j(E)` are orbit sizes of the `m`-adic image (3.6), the image at
  level `n` is the full preimage of its image at level `gcd(n, M(E, m))` on the `m`-part, and the
  prime-to-`m` part is all of `GL₂`; so `deg x = deg f · deg f(x)` and the previous bullet applies.

*Needs:* 3.4, 3.6, 4.5, 5.1–5.3; `CanonicalModelsAndGonality` Layers 7–8; AC.

**Checks.**

- (rejection) Frey's criterion with `gon = 3`, `d = 1` excludes a parametrized degree-one point
  (`3 > 2`); with `gon = 2`, `d = 3` it excludes nothing (`2 ≤ 6`).
- (rejection) a group like `S_{−3}` (2.4) with full `2`- and `3`-adic projections has no prime
  with non-maximal `ℓ`-adic image, so a rule using only the single `ℓ`-adic images returns level
  `1`; its joint `6`-adic level is `6`, and Theorem 1.1 at `n = 6` returns `gcd(6, 6) = 6`.
- The rational points of `X₀(37)` (genus `2`) are isolated, and so are the five rational points
  of `X₀(11)`: genus `1` rules out `ℙ¹`-parametrization and the finite `J₀(11)(ℚ)` (`11.a2`, rank
  `0`) rules out `AV`-parametrization; on a genus-one curve of positive rank a rational point is
  `AV`-parametrized.

### 5.5 Fibre products

- For open `H, H'`, the fibre product of the stacks `𝒳_H ×_{𝒳(1)} 𝒳_{H'}` (MC2 §3.12, consumed)
  is `⊔_{[g] ∈ H \ GL₂(Ẑ) / H'} 𝒳_{H ∩ gH'g⁻¹}`, so it is connected iff `H·H' = GL₂(Ẑ)`, and then
  equals `𝒳_{H ∩ H'}`. When `level H` and `level H'` are coprime, `H·H' = GL₂(Ẑ)` (`Γ(N)·Γ(N')
  = GL₂(Ẑ)` by the Chinese remainder theorem) and `H ∩ H'` has level `N·N'` and index
  `index H · index H'` (0.2); the coarse curve `X_{H∩H'}` maps birationally onto the fibre
  product of the coarse curves `X_H ×_{X(1)} X_{H'}` (an isomorphism away from the elliptic
  points and cusps, by MC2 §5.16 coarse-space formation). The knowl `modcurve.fiber_product`.
- `IsFibreProduct H` (the LMFDB's "factorization" of `X_H`): `H = H₁ ∩ H₂` with `H₁, H₂ ⊋ H` of
  coprime levels, i.e. for some partition `S₁ ⊔ S₂` of the primes of `level H` into two nonempty
  sets, `H = pr_{S₁}⁻¹(pr_{S₁} H) ∩ pr_{S₂}⁻¹(pr_{S₂} H)` (no entanglement *between* `S₁` and `S₂`;
  each part may itself be entangled, so this is weaker than `entanglementIndex H = 1`). The list
  of factor labels is not a target.

*Needs:* 0.2, 2.3; MC2 §§3.12, 5.16.

### 5.6 Gassmann classes and isogenous Jacobians

- For `IsFullDet` subgroups `H, H'` that are Gassmann equivalent (2.8), `J_H := Jac(X_H)` and
  `J_{H'}` are isogenous over `ℚ`: apply Prasad–Rajan (*On an Archimedean analogue of Tate's
  conjecture*, Cor. 4, cited as the knowl does) to the Galois cover `X_{Γ(N)} → X(1)` with
  group `GL₂(ℤ/N)/{±1}` (MC2 §5.15 quotients), whose quotients by `±H̄_N` and `±H̄'_N` are
  `X_H`, `X_{H'}` (MC2 §5.16): the `ℚ[G]`-module isomorphism `ℚ[G/H̄] ≅ ℚ[G/H̄']` of
  `FiniteGroupInvariants` 7.1 (Gassmann equivalence as equality of permutation characters) gives
  an isogeny of the Jacobians of the quotient curves. Hence `L(J_H, s) = L(J_{H'}, s)` and the
  decompositions 5.9 coincide, which is why the LMFDB stores them per Gassmann class.
- Conversely, isogenous Jacobians do not imply Gassmann equivalence (no converse is claimed).

*Needs:* 2.8, 5.1; MC2 §§5.15–5.16, Layer 13 (Jacobians); JC.

### 5.7 Twists of `X_H` and the cyclotomic isomorphism

- For twists `H₁, H₂` (2.6) and `n` a common multiple of their levels, every geometric component
  of `X_{H₁}` is isomorphic over `ℚ(ζ_n)` to every geometric component of `X_{H₂}`, compatibly
  with the `j`-maps: both are the quotient of a geometric component of `X(n)` by the image of
  `Γ := H₁ ∩ SL₂(Ẑ) = H₂ ∩ SL₂(Ẑ)` once the cyclotomic structure is trivialised (MC2 §5.12, §6
  twisted curves `X(ρ)`, consumed). When both have `IsFullDet` the curves are geometrically
  connected and `X_{H₁} ×_ℚ ℚ(ζ_n) ≅ X_{H₂} ×_ℚ ℚ(ζ_n)`. Without full determinant the numbers of
  components `[ẑˣ : det H_i]` can differ: `⊤` and `det⁻¹(ker(ẑˣ → (ℤ/3)ˣ))` are twists, and over
  `ℚ(ζ₃)` the first is one `ℙ¹` and the second two disjoint copies of `ℙ¹`. In particular twists have the
  same genus, cusp widths and elliptic points (already 2.6), and differ in their `ℚ`-structure:
  rational cusps, rational points, `J_H`.
- `X_H = X_{±H}` as `ℚ`-curves for every `H` (5.1, degree one), so fine and coarse groups give
  the same curve; the LMFDB's `fine` pages share the coarse curve's models.
- **Minimal twist**: the least-label member of the twist class with `IsFullDet` is not a
  target; owned here is that the twist class with `IsFullDet` has members of least level, and that all members
  share `genus`, `cusps`, `cusp_widths`, `nu2`, `nu3`, `psl2index`, `sl2level` (2.6).

*Needs:* 2.6, 5.1; MC2 §§5.12, 6.

### 5.8 Local obstructions and real points

- `HasLocalObstruction H := X_H(ℝ) = ∅ ∨ ∃ p, X_H(ℚ_p) = ∅` (knowl `modcurve.local_obstruction`);
  `obstructionPlaces H` the set of such places. For `IsFullDet H` of genus `0`, `X_H(ℚ) ≠ ∅` iff
  `¬ HasLocalObstruction H` (Hasse–Minkowski for conics, the heights roadmap / Mathlib's
  quadratic-form local-global principle, consumed), and in positive genus the implication
  `X_H(ℚ) ≠ ∅ → ¬ HasLocalObstruction H` only.
- **Real points.** `X_H(ℝ) ≠ ∅` iff `±H̄_N` contains an element `GL₂(ℤ/N)`-conjugate to
  `diag(1, −1)` or to `[[1, 1], [0, −1]]` (the images of complex conjugation, 3.2): a real
  non-cuspidal point is a `G_ℝ`-stable pair, which is an elliptic curve over `ℝ` with level
  structure (every real `j` is the `j` of a real curve, both classes of `ρ_E(c)` occur), and a
  real cusp is a cusp fixed by `c`, which acts as `e = −1 ∈ (ℤ/N)ˣ` (convention 7); the Tate
  curve over `ℝ((q))` shows a real cusp is a limit of real points, so the criterion needs no
  separate cusp clause.
- **`p`-adic points.** Let `IsFullDet H`, so that `X_H` is geometrically connected (5.1). For
  `p ∤ N`, `X_H` has good reduction at `p` (MC2 §5.8–5.9 smoothness over `ℤ[1/N]`) with
  geometrically connected special fibre, and `X_H(ℚ_p) ≠ ∅` as soon as `(X_H)_{𝔽_p}(𝔽_p) ≠ ∅`, by
  Hensel's lemma on the smooth model; the Hasse–Weil bound (SSF §5.11, consumed, for a smooth
  projective geometrically irreducible curve) guarantees an `𝔽_p`-point when
  `p + 1 − 2g√p > 0`, in particular for `p ≥ 4g²`. So
  `obstructionPlaces H ⊆ {∞} ∪ {p ∣ N} ∪ {p < 4 genus H ²}`, a finite, computable set; the
  LMFDB's `obstructions` column lists it (with `0` for `∞`), and `pointless` is the predicate
  `X_H(ℚ) = ∅`, which 5.2 reads as "no `E/ℚ` has `ImageLE E H` up to the `Aut` twist, and no
  rational cusp". Without `IsFullDet` the components of `X_H` are defined over
  `canonicalField H ≠ ℚ`, and `X_H(ℚ_p) = ∅` for every `p` that does not split completely in
  `canonicalField H`, infinitely many `p` (Chebotarev), whatever the genus.

*Needs:* 1.3, 3.2, 5.1–5.2; MC2 §§5.8–5.9; SSF §5.11 (Hasse–Weil); Mathlib
Hensel (`PadicInt` lifting of smooth points, owned here if absent for curves).

**Checks.**

- (rejection) `H = det⁻¹(ker(ẑˣ → (ℤ/3)ˣ))`: genus `0` and level `3`, yet `X_H(ℚ₅) = ∅`, since
  `5 ≢ 1 mod 3` does not split in `canonicalField H = ℚ(ζ₃)`; the finiteness bound needs
  `IsFullDet`.
- The same `H` has `X_H(ℝ) = ∅`: complex conjugation has determinant `−1 ≢ 1 mod 3`.
- `X₀(11)` (`IsFullDet`, genus `1`): `obstructionPlaces ⊆ {∞, 2, 3, 11}` by the bound, and in fact
  empty, as `X₀(11)(ℚ) ≠ ∅` (worked example 1).

### 5.9 The Jacobian `J_H` and its decomposition

Let `IsFullDet H`, `g := genus H ≥ 1`, `N := level H`, `J_H := Jac(X_H)` (JC; MC2 Layer 13 for
modular Jacobians), an abelian variety over `ℚ` of dimension `g`.

- **Decomposition.** `J_H` is `ℚ`-isogenous to `∏_{[f]} A_f^{m_f}`, the product over Galois
  orbits `[f]` of weight-two newforms `f ∈ S₂^{new}(Γ₁(M), ε)` with `M ∣ N²` (a Nebentypus `ε`
  occurs only when the scalar matrices of `H` do not exhaust `ẑˣ · I`: `ε` ranges over the
  characters of `(ℤ/N)ˣ` trivial on `{u : u·I ∈ H̄_N}`), of
  `A_f := modularQuotient f` (MC2 §16.2) with `dim A_f = [K_f : ℚ]` (MC2 §16.4), and
  multiplicities `m_f := dim_ℂ S₂(Γ_{±H})[f] / [K_f : ℚ]` where `S₂(Γ_{±H})[f]` is the
  `f`-isotypic component of `S₂(Γ_{±H}) ⊆ S₂(Γ(N))` under the Hecke operators `T_p`, `p ∤ N`
  (MF Layer 4 newforms; MC2 Layer 13's Hecke action on `J_H` through the correspondences of
  MC2 Layer 9; `Γ(N) ⊇ δ Γ₁(N²) δ⁻¹` for `δ = diag(N, 1)`, so every eigenform on `Γ(N)` is an
  oldform from a newform of level dividing `N²` by MF's newform theory).
  `Σ_f m_f [K_f : ℚ] = g`. The knowl `modcurve.decomposition` records `dims := {[K_f : ℚ]^{m_f}}` and
  `newforms := {label(f)^{m_f}}` (the list of labels is not a target).
- Derived predicates: `IsSimple H := J_H` simple (iff a single orbit with `m_f = 1`);
  `IsSquarefree H := ∀ f, m_f ≤ 1` (knowl `av.squarefree`); `newformLevel H := lcm_f N_f`
  (knowl `modcurve.newform_level`); `conductor J_H = ∏_f N_f^{m_f [K_f : ℚ]}` (the conductor of
  `A_f` is `N_f^{[K_f:ℚ]}`, MC2 §16; conductor of a product is the product).
- **Analytic rank** (convention 13):
  `analyticRank H := Σ_f m_f · Σ_{σ : K_f → ℂ} ord_{s=1} L(f^σ, s)` with MF Layer 7's `L(f, s)`, continued analytically to `s = 1` there (consumed);
  `genusMinusRank H := g − analyticRank H`. The identification with the Mordell–Weil rank of
  `J_H(ℚ)` is the BSD implication and is not a target.
- **Kernel of a modular cover.** For `H ≤ G`, `J_G → J_H` (pullback) has finite kernel and
  `J_H → J_G` (pushforward) is surjective. Its kernel need not be connected: its identity
  component `ker⁰` is an abelian variety of dimension `genus H − genus G`, isogenous to
  `∏ A_f^{m_f(H) − m_f(G)}` (MC2 Layer 13 functoriality), and the component group `ker/ker⁰` is a
  finite group not determined by these dimensions; the knowl `modcurve.modular_cover`.
- **Chen's isogeny** as the worked check: `J_{C_ns⁺(p)}` is `ℚ`-isogenous to the `w_p = +1`
  part of `J₀(p²)^{new}` (Chen 1998; de Smit–Edixhoven 2000), and `X_{C_s⁺(p)} ≅ X₀⁺(p²)`
  (MC2 §9.5), so `J_{C_s⁺(p)}` is isogenous to `J₀⁺(p²) = J_{C_ns⁺(p)} × (\text{old part from } J₀(p))`;
  for `p = 13`, where `J₀(13) = 0`, both Jacobians are the same three-dimensional abelian
  variety up to isogeny (worked example 7).

*Needs:* 1.2, 5.1, 5.6; MC2 Layers 9, 13, 16, §9.5; MF Layers 4, 7, 8G; JC.

**Checks.**

- (rejection) `X₁(11) → X₀(11)` has degree `5` between curves of genus `1`; the pushforward
  `11.a3 → 11.a2` is an isogeny of degree `5`, with geometric kernel of order `5` and `ker⁰ = 0`,
  of dimension `1 − 1 = 0`.
- `X₀(11)`: `dims = {1}`, `analyticRank = 0`, `genusMinusRank = 1` (worked example 1).
- `C_ns⁺(13)` and `C_s⁺(13)` have isogenous three-dimensional Jacobians although the groups are not
  Gassmann equivalent (worked example 3): no converse to 5.6.

### Examples

Worked examples 1, 2, 3, 9 and 10: points, cusps and Jacobians of `X₀(11)`, `X₁(11)`, the level-13
curves with their CM points, the `j ∈ {0, 1728}` boundary checks, the components of `X(5)`; the
Checks of 5.1–5.4 and 5.7–5.9 are the counterexamples fixing degrees, twists, local points and
kernels.

### Dependencies

Layers 1–4; MC2 §§3.12, 5.8–5.17, 6.1, 6.3, 8.3, 9.5–9.7, Layers 9, 13, 16; MF Layers 4, 7, 8G;
`FiniteGroupInvariants` 7.1; CMG Layers 7–8; JC; AC; SSF §5.11.

## Layer 6: isogeny classes, Mazur and Kenku

Suggested file: `IsogenyClass/Cyclic.lean`, `IsogenyClass/Class.lean`, `IsogenyClass/Graph.lean`,
`IsogenyClass/Mazur.lean`, `IsogenyClass/Kenku.lean`, `IsogenyClass/NumberField.lean`.

Standing hypotheses: `K` a number field, `E, E'` elliptic curves over `K`; `Isogeny E E'` is Tau
Ceti's (nonzero by construction), `deg` its degree, `ker` its kernel (EC Layer 1).

### 6.1 Cyclic isogenies and the minimal degree

- `IsCyclic φ := (ker φ)` is a cyclic group (over `K̄`); every isogeny factors uniquely as
  `[m] ∘ φ₀` with `φ₀` cyclic (`m` the largest integer with `E[m] ⊆ ker φ`; EC Layer 1's
  `[m]` and the factorisation through the kernel); `deg φ = m² deg φ₀`.
- `Hom_K(E, E')` is a finitely generated free abelian group. Its rank is `0` when `E` and `E'`
  are not `K`-isogenous. When they are, composing with one `K`-isogeny gives
  `Hom_K(E, E') ⊗ ℚ ≅ End_K(E) ⊗ ℚ`, so the rank is `2` if `E` has CM defined over `K`
  (`End_K(E) ≠ ℤ`) and `1` otherwise. For `K`-isogenous `E, E'` with `End_K(E) = ℤ`,
  `Hom_K(E, E') ≅ ℤ` (FF R28.6.6, consumed) and its generator `φ₀` is cyclic (if `φ₀ = [m] ∘ ψ`
  then `ψ = kφ₀`, so `mk = 1`), unique up to sign: **a unique cyclic degree** between `E` and `E'`,
  equal to `min deg` over all `K`-isogenies. For `K`-isogenous `E, E'` with `End_K(E) ≠ ℤ`, the
  cyclic `K`-isogenies `E → E'` are the primitive vectors of the rank-two lattice `Hom_K(E, E')`,
  on which `deg` is a positive definite binary quadratic form, so they have infinitely many
  degrees (the knowl `ec.isogeny`), and convention 12's minimum is attained and is a cyclic
  degree.
- Over `ℚ`, `End_ℚ(E) = ℤ` always (an imaginary quadratic order is not contained in `ℚ`), so
  every pair of isogenous curves over `ℚ` has a unique cyclic degree.
- Composites: cyclic of coprime degrees compose to cyclic isogenies; `ψ ∘ φ` for cyclic `φ, ψ`
  of the same prime degree `ℓ` is cyclic iff `ψ ≠ ±φ̂ ∘ (unit)`, i.e. iff `ker(ψ∘φ) ≠ E[ℓ]`.

*Needs:* EC Layers 1–2; FF R28.6.6; Mathlib `AddSubgroup.torsionBy`, `IsCyclic`.

**Checks.**

- (rejection) over `K = ℚ(i)`, `E : y² = x³ − x` (CM by `ℤ[i]`, defined over `K`) and the non-CM
  `E' = 37.a1` are not geometrically isogenous: `Hom_K(E, E') = 0` although `End_K(E)` has rank
  `2`.
- `E' = E` over `ℚ(i)`: `Hom_K(E, E) = ℤ[i]`, rank `2`, with cyclic endomorphisms `1 + i`
  (degree `2`) and `2 + i` (degree `5`).
- `[2]` has kernel `E[2]` of order `4`, not cyclic: `m = 2`, `φ₀ = id`, `4 = 2² · 1`.

### 6.2 Isogeny classes, matrices and graphs

- `isogenyClass E` (convention 12): the set of `K`-isomorphism classes of `E'/K` admitting a
  `K`-isogeny `E → E'`; an equivalence class (dual isogeny, composition); **finite** (FF
  R28.6.5 `finite_ellipticIsogenyClass`, consumed). `classSize E := #isogenyClass E`.
- `isogenyMatrix E : Matrix (isogenyClass E) (isogenyClass E) ℕ`, entry `(E_i, E_j) := min deg`
  over `K`-isogenies `E_i → E_j`, symmetric with diagonal `1`, with entry `≤` the product along
  any chain; by 6.1 the entry is a cyclic degree. `isogenyDegrees E := {n : ∃ cyclic
  K-isogeny E → E' of degree n}` (so `1 ∈`, and `isogenyDegrees E = {matrix entries of the row
  of E}` when `End_K(E) = ℤ`); `classDegree E := lcm` of all matrix entries (knowl
  `ec.isogeny_class_degree`).
- `isogenyGraph E`: the simple graph on `isogenyClass E` with an edge between distinct classes
  whose matrix entry is prime; connected (every isogeny is a composite of prime-degree
  isogenies, EC Layer 1).
- **Structure when `End_K(E) = ℤ`** (always over `ℚ`): for each prime `ℓ`, the subgraph of
  `ℓ`-edges on each of its components is a **tree** (a non-backtracking `ℓ`-cycle composes to a
  cyclic endomorphism of degree `ℓ^k > 1`, impossible as `End_K(E) = ℤ`); the class is the
  Cartesian product of its `ℓ`-trees (the unique cyclic isogeny `E → E'` of degree `∏ ℓ^{a_ℓ}`
  factors into its `ℓ`-parts in any order), the graph is the Cartesian product of the
  `ℓ`-trees, the matrix entry is `∏_ℓ ℓ^{d_ℓ(i,j)}` with `d_ℓ` the tree distance, and
  `classDegree E = max` entry `= ∏_ℓ ℓ^{diam_ℓ}`. So the LMFDB's `class_deg`, `isogeny_degrees`
  and `isogeny_matrix` are determined by the trees, and `isogenyDegrees E` is closed under
  taking divisors (a cyclic isogeny of degree `n` has a cyclic sub-isogeny of each degree
  `d ∣ n`).
- Invariance: `isogenyClass`, matrix and graph are functors of the class; base change `K ⊆ L`
  maps `isogenyClass_K E` into `isogenyClass_L E` (possibly non-injectively, possibly not onto).

*Needs:* 6.1; FF R28.6.5; Mathlib `SimpleGraph`, `Matrix`.

### 6.3 The dictionary with `X₀(N)` and `X₁(N)`

- `E/K` has a `K`-rational cyclic `N`-isogeny iff `ImageLE E (Γ₀(N))` iff some non-cuspidal
  point of `X₀(N)(K)` is represented by a pair `(E, C)` whose underlying curve is `E` itself (5.2
  with `H = Γ₀(N)`; MC Layer 8D's `[Γ₀(N)]` is the moduli reading). For `j(E) ∉ {0, 1728}` this is
  equivalent to `j(E) ∈ j(X₀(N)(K))`, as `−I ∈ Γ₀(N)` absorbs the quadratic twists. At
  `j(E) ∈ {0, 1728}` it is not: a point of `X₀(N)(K)` above `j(E)` may be represented only by a
  cubic, quartic or sextic twist of `E` (Rouse–Sutherland–Zureick-Brown, Remark 2.3.2).
- For non-CM `E`, the number of cyclic `N`-isogenies from `E` over `K`, counted up to isomorphism
  of the target with the source fixed, is the number of `G_K`-fixed cyclic subgroups of order `N`
  of `E[N]`, the `m` of `(N, N, m) ∈ isogenyOrbits H_E N'` for a common multiple `N'` of `N` and
  the level (2.7, 3.6). Counted up to automorphisms of the source, it is the number of
  `Aut_K(E)`-orbits on those subgroups, which is smaller when `Aut_K(E) ≠ {±1}`.
- `E(K)` has a point of order `N` iff `ImageLE E (Γ₁(N))` iff `(E, P)` is a non-cuspidal
  `K`-point of `X₁(N)` with `E` the curve of the pair (5.2 fine case for `N ≥ 3`, where
  `−I ∉ Γ₁(N)`: the point of `X₁(N)(K) = X_{±1}(N)(K)` determines the twist `E^{ψ}` carrying the
  point of order `N`); `E(K)[N] = E[N]` iff `ImageLE E (Γ(N))` iff `ζ_N ∈ K` and `E` gives a
  `K`-point of a component of `X(N)` (5.1: `X(N)` has `canonicalField = ℚ(ζ_N)`).
- `E(K)_tors` and `isogenyDegrees E` are read off `H_E`: `E(K)[N] = (ℤ/N)²`-fixed vectors of
  `H̄_N`, `N ∈ isogenyDegrees E` iff `H̄_N` fixes a cyclic subgroup of order `N` (3.6).

*Needs:* 2.7, 3.6, 5.2; MC Layer 8D.

**Checks.**

- (rejection) `y² = x³ + 2` has no rational point of order `2`, hence no rational `2`-isogeny,
  while `y² = x³ − 1` has `(1, 0)`; both have `j = 0 ∈ j(X₀(2)(ℚ))`.
- (rejection) over `ℚ(i)`, `y² = x³ − x` has three rational subgroups of order `2` (`x = 0, ±1`);
  the automorphism `(x, y) ↦ (−x, iy)` swaps the two at `x = ±1`, so there are `3` cyclic
  `2`-isogenies up to isomorphism of the target and `2` up to `Aut_K(E)`.
- `11.a2` has `ImageLE E Γ₁(5)` and a rational point of order `5`, while `11.a1` has neither
  (worked examples 5, 9).

### 6.4 Mazur's torsion theorem over `ℚ`

**Theorem (Mazur 1977, 1978).** For `E/ℚ`, `E(ℚ)_tors` is isomorphic to `ℤ/n` with
`1 ≤ n ≤ 10` or `n = 12`, or to `ℤ/2 × ℤ/2n` with `1 ≤ n ≤ 4`; all fifteen occur. This is the
last milestone of a chain, not a cited fact:

1. **Prime orders.** A rational point of prime order on `E/ℚ` has order `2`, `3`, `5` or `7`
   (EI §8.8 `all_prime_torsion`, consumed under its §8.1 and §8.5 hypotheses, which this chain
   inherits), so the primes dividing `|E(ℚ)_tors|` lie in `{2, 3, 5, 7}`.
2. **Reduction to finitely many `N`.** By the Weil pairing, `E[m] ⊆ E(ℚ)` forces `μ_m ⊆ ℚ`, so
   `E(ℚ)_tors ≅ ℤ/n` or `ℤ/2 × ℤ/2n`. If it is not one of the fifteen groups, then `E(ℚ)` has a
   point of order `N` for some `N` in the set `{14, 15, 16, 18, 20, 21, 24, 25, 27, 35, 49}` of
   minimal excluded orders (every `N` divisible only by `2, 3, 5, 7` and outside
   `{1, …, 10, 12}` has a divisor in it; a finite check), or a subgroup `ℤ/2 × ℤ/2n` with
   `n ∈ {5, 6}`. Kenku's theorem (EM2 §5.0b `cyclic_isogeny_degrees`, consumed) removes
   `N ∈ {20, 24, 35, 49}`: a rational point of order `N` generates a rational cyclic subgroup,
   hence a rational cyclic `N`-isogeny, and these `N` are not in Kenku's set. It also removes
   `ℤ/2 × ℤ/2n` for `n ∈ {5, 6}`: if `P` has order `2n` and `T ∈ E[2] ∖ ⟨P⟩`, the composite
   `E' := E/⟨T⟩ → E → E/⟨P⟩` of the dual isogeny with the quotient map is a rational isogeny of
   degree `4n ∈ {20, 24}` whose kernel is cyclic (the dual maps `E'[2]` onto `⟨T⟩ ⊄ ⟨P⟩`). What is
   left is `N ∈ {14, 15, 16, 18, 21, 25, 27}`, and for each the claim is that `X₁(N)(ℚ)` consists
   of cusps (6.3: a point of order `N` on `E` is a non-cuspidal point of `X₁(N)(ℚ)`).
3. **The composite levels.** Owned targets, one for each `N ∈ {14, 15, 16, 18, 21, 25, 27}`:
   `X₁(N)(ℚ)` is the set of rational cusps of `X₁(N)`. The genera are `1, 1, 2, 2, 5, 12, 13`
   (1.2's coset formula). The explicit models of `X₁(N)` and `X₀(N)` are CMG's. Proof routes:
   - `N ∈ {14, 15}`: with a rational cusp as origin `X₁(N)` is an elliptic curve over `ℚ`;
     descent via a rational `2`-isogeny (ED §§3.10–3.11) gives rank `0`, ED §3.20(b) the exact
     torsion subgroup, and its points are the rational cusps (1.3).
   - `N ∈ {16, 18}`: `X₁(N)` is hyperelliptic of genus `2`; ED §3.23's `x − T` descent gives
     `rank J₁(N)(ℚ) = 0`, ED §3.20(a) the exact torsion of `J₁(N)(ℚ)`, and `X₁(N)(ℚ)` is the finite
     set of points whose Abel–Jacobi image from a rational cusp lies in it: the rational cusps.
   - `N ∈ {21, 27}`: `X₀(21)` and `X₀(27)` have genus `1`. Rank `0` by ED's descent (§§3.10–3.11
     via a rational `2`-isogeny for `X₀(21)`; the full `2`-descent of §§3.5–3.7 for `X₀(27)`, which
     has no rational point of order `2`, with its cubic-field data as an explicit datum as in ED
     §3.26) and the exact torsion by ED §3.20(b) give `X₀(21)(ℚ)` (eight points, four
     non-cuspidal) and `X₀(27)(ℚ)` (three points, one non-cuspidal, the CM point of discriminant
     `−27`). A point of order `N` on `E/ℚ` gives a
     non-cuspidal point of `X₀(N)(ℚ)`, so `j(E)` is one of these finitely many values, none `0` or
     `1728`, and `E = E₀^d` is a quadratic twist of a fixed `E₀` with that `j`. The point of order
     `N` generates one of the finitely many rational cyclic subgroups `C` of order `N` of `E₀`
     (twisting does not change them), and `G_ℚ` acts trivially on `C ⊂ E₀^d` only if its character
     on `C ⊂ E₀` is `χ_d`; so each `C` allows at most one `d`, and ED §3.20(b) shows that none of
     these finitely many `E₀^d` has a point of order `N`.
   - `N = 25`: `X₀(25)` has genus `0`, so the isogeny gives no restriction. The map
     `X₁(25) → X₀(25)` factors through `X_H(25)` for `±1 ≤ H ≤ (ℤ/25)ˣ` (`H` the allowed lower-right
     entries), of genus `0` for `H` the squares (degree `2` over `X₀(25)`) and genus `4` for
     `H = {±1, ±7}` (degree `5`). Owned target: `X_{{±1,±7}}(25)(ℚ)` consists of cusps. Its Jacobian
     is `ℚ`-isogenous to the four-dimensional `A_f` of the single Galois orbit of weight-two
     newforms of level `25` with character of order `5` (5.9: the characters trivial on `{±1, ±7}`
     have order dividing `5`, those of order `5` are primitive of conductor `25`, and
     `S₂(Γ₀(25)) = 0`). The target takes `rank A_f(ℚ) = 0` as an explicit rank datum, as EI §8.1
     and ED §3.26 do for their curves; ED §3.20(a) gives the exact torsion, and the rational points
     are the finitely many Abel–Jacobi preimages of torsion classes from a rational cusp. The
     points of `X₁(25)` above cusps are cusps.
   Mazur's theorem over `ℚ` is therefore proved here from EI §8.8, EM2 §5.0b, these seven targets
   and the hypotheses they carry.
4. **Existence.** Each of the fifteen groups occurs: the Tate normal form `y² + (1−c)xy − by =
   x³ − bx²` with `P = (0,0)` of order `N` for the genus-`0` curves `X₁(N)`, `N ∈ {1,…,10,12}`,
   and the genus-`0` `X₁(2, 2n)`, `n ≤ 4`; representatives are worked example 9.

`torsionStructure E ∈ {15 groups}` is then a total function on `E/ℚ`, and the LMFDB's `torsion`
and `torsion_structure` columns are its values (EC Layer 6 owns `E(K)_tors` itself).

In `Suggested.lean` the classification is `mazur_torsion` (with additive equivalences to the
`ZMod` models) and the existence of all fifteen groups is `mazur_torsion_exists`.

*Needs:* 1.2–1.3, 5.1–5.2, 5.9, 6.3; EI §8.8; EM2 §5.0b; ED §§3.5–3.11, 3.20, 3.23; CMG models of
`X_H`; EC Layer 6.

**Checks.**

- `N = 16`: a point of order `16` is a non-cuspidal point of `X₁(16)(ℚ)`, of genus `2`, excluded by
  its own target; `16` is in Kenku's set, so Kenku does not exclude it.
- `N = 25`: its divisors `1, 5, 25` contain no other excluded level, `25` is in Kenku's set and
  `X₀(25)` has genus `0`; only the target through the genus-four `X_{{±1,±7}}(25)` excludes it.
- (rejection) `ℤ/16` and `(ℤ/2)³` have orders `16` and `8`, both orders of groups in the list,
  but neither is one of the fifteen groups: the classification is up to isomorphism, not by order.
- `ℤ/2 × ℤ/8` is realised by `210.e6` and `ℤ/12` by `90.c7` (worked example 9).

### 6.5 Mazur's and Kenku's isogeny theorems, consumed; the isogeny-class corollaries

- **Consumed.** Mazur's isogeny theorem is EM2 §5.0a's `prime_isogeny_degrees`: if `E/ℚ` has a
  rational cyclic isogeny of prime degree `P`, then `P ∈ {2, 3, 5, 7, 11, 13, 17, 19, 37, 43, 67,
  163}`, and without geometric CM `P ∈ {2, 3, 5, 7, 11, 13, 17, 37}`
  (`noncm_prime_isogeny_degrees`). Kenku's theorem is EM2 §5.0b's `cyclic_isogeny_degrees`: every
  rational cyclic isogeny of `E/ℚ` has degree in Kenku's set `{1, …, 19, 21, 25, 27, 37, 43, 67,
  163}` (twenty-six values). EM2 §6.0b determines the non-cuspidal `j`-images
  `{−11·131³, −2¹⁵, −11²}` of `Y₀(11)(ℚ)`, `{−17²·101³/2, −17·373³/2¹⁷}` of `Y₀(17)(ℚ)` and
  `{−7·137³·2083³, −7·11³}` of `Y₀(37)(ℚ)`.
- **The comparison.** For `E/ℚ`, `n ∈ isogenyDegrees E ↔ HasCyclicIsogeny E n`: EM2's kernel
  condition, cyclic after base change to `ℚ̄`, is 6.1's `IsCyclic`. Both theorems are thereby
  statements about 6.2's objects.
- **Corollaries.** `isogenyDegrees E ⊆` Kenku's set, and `classDegree E ∈` Kenku's set (over
  `ℚ` it is the largest matrix entry, a cyclic degree, 6.1–6.2).
- **The `ℓ`-trees over `ℚ`.** The valence of a vertex `E'` of an `ℓ`-tree of 6.2 is the number of
  `G_ℚ`-stable lines in `E'[ℓ]`. For `ℓ = 2` it is the number of rational roots of the
  `2`-division cubic: `0`, `1` or `3`, never `2`. For odd `ℓ` it is at most `2`: three stable lines
  make the mod-`ℓ` image scalar, with square determinant, while `χ̄_ℓ` takes non-square values. A
  non-backtracking path of length `k` is a cyclic `ℓ^k`-isogeny (6.2), so Kenku's set bounds the
  diameter by `4, 3, 2, 1` for `ℓ = 2, 3, 5, 7` and by `1` for `ℓ ∈ {11, 13, 17, 19, 37, 43, 67,
  163}`. Hence the odd `ℓ`-trees are paths with at most `4, 3, 2, 2` vertices, and the `2`-trees
  have all valences in `{1, 3}` and diameter at most `4`: a vertex, an edge, the star with three
  leaves, and the trees with `6` and `8` vertices whose internal vertices form a path of `2` or
  `3` vertices. The remaining such tree, with `10` vertices (a centre whose three neighbours all
  have valence `3`), is excluded: at its centre all six cyclic subgroups of order `4` of `E[4]`
  would be rational, so the mod-`4` image would be scalar with determinant `1`, while `χ₄` is onto
  `(ℤ/4)ˣ`.
- **The class sizes.** The class is the Cartesian product of its `ℓ`-trees and
  `classDegree E = ∏_ℓ ℓ^{diam_ℓ}` lies in Kenku's set (6.2). The products of the trees above
  that satisfy this have `1, 2, 3, 4, 6, 8` vertices: a single tree (sizes `1, 2, 4, 6, 8` for
  `ℓ = 2`, up to `4` for `ℓ = 3`, up to `3` for `ℓ = 5`, `2` otherwise); a `2`-edge times a `3`-edge,
  `5`-edge or `7`-edge (degrees `6, 10, 14`, size `4`); a `3`-edge times a `5`-edge or `7`-edge
  (degrees `15, 21`, size `4`); a `2`-edge times a three-vertex `3`-path (degree `18`, size `6`);
  the `2`-star times a `3`-edge (degree `12`, size `8`). Every other product has degree outside
  Kenku's set (`20, 22, 24, 26, 28, 30, 33, 35, 36, 45, 48, 50, 54, …`). So `classSize E ∈ {1, 2,
  3, 4, 6, 8}`; the possible isogeny graphs are those products, and which of them occur is Kenku's
  table. For `P ∈ {19, 43, 67, 163}` a
  curve with a rational `P`-isogeny has geometric CM (`noncm_prime_isogeny_degrees`) and
  `cmDiscriminants Γ₀(P) = {−P}` (5.3), so the one non-cuspidal point of `X₀(P)(ℚ)` is the CM
  point of discriminant `−P` (6.3). The LMFDB's `isogeny_degrees` and `class_deg` over `ℚ` take
  values in Kenku's set.

*Needs:* 4.5, 5.3, 6.1–6.3; EM2 §§5.0a–5.0b, 6.0b.

**Checks.**

- (rejection) the `2`-tree with a centre and three arms of length two has `7` vertices, valences
  at most `3`, diameter `4` and all distances giving degrees `1, 2, 4, 8, 16` in Kenku's set; it is
  excluded because its three arm vertices have valence `2`.
- `15.a`: the eight-vertex `2`-tree, `classDegree = 16`, `classSize = 8`; `14.a`: a `2`-edge times a
  three-vertex `3`-path, `classDegree = 18`, `classSize = 6` (worked example 6).
- `27.a`: the four-vertex `3`-path `1–3–9–27`; `11.a`: the three-vertex `5`-path (worked examples 5,
  8).

### 6.6 Isogeny classes over number fields

- Finiteness (6.2) and the matrix/graph definitions hold over every number field; the LMFDB's
  `ecnf` `isogeny_matrix`, `isogeny_degrees` and `class_deg` are 6.2's objects over `K`. When
  `End_K(E) ≠ ℤ` (CM defined over `K`), 6.2's tree structure fails and the matrix entries are
  minima of infinite sets; the LMFDB's convention is convention 12's minimum.
- For `E/K` non-CM, `N ∈ isogenyDegrees E → N ∣ adelicLevel E`, so `isogenyDegrees E` is finite
  (4.4): if `ℓ^k ∥ N` and `ℓ^j ∥ adelicLevel E` with `j < k`, then `H̄_{ℓ^k}` contains the image
  `1 + ℓ^j M₂(ℤ/ℓ^k)` of `Γ(ℓ^j)`, and a cyclic subgroup `C = ⟨v⟩` of order `ℓ^k` fixed by it
  would contain `ℓ^j X v` for every `X`, i.e. all of `ℓ^j (ℤ/ℓ^k)² ≅ (ℤ/ℓ^{k−j})²`, which is not
  cyclic. Likewise a point of order `N` in `E(K)` forces `N ∣ adelicLevel E`. `classSize E` is
  bounded in terms of `adelicIndex E`.
- The quantitative statements over `K` are EM2 §6.0f's, consumed: for `K` of degree `d` and
  geometrically isogenous `E, E'` over `K` there is a geometric isogeny `E → E'` of degree at
  most `B(d, h_F(E)) = 10⁷ d² (max{h_F(E), 985} + 4 log d)²`, with `h_F` the stable height in
  Faltings' normalization, and for non-CM `E` every cyclic `K`-isogeny from `E` has degree at
  most `B(d, h_F(E))`. So for non-CM `E/K`, `isogenyDegrees E ⊆ [1, B(d, h_F(E))]`, a bound in
  the height of `E` beside the bound `N ∣ adelicLevel E` above. A finite list of degrees
  uniform in `E`, as Kenku's set is over `ℚ`, is not a target over any other `K`; the LMFDB's
  `ecnf` pages record the computed classes.

*Needs:* 4.4, 6.2–6.3; EM2 §6.0f.

### Examples

Worked examples 5–9: the classes `11.a`, `15.a`, `14.a`, `27.a`, `32.a`, `49.a`, the prime
isogenies of degree `17`, `37`, `43`, `163`, and one curve for each of Mazur's fifteen groups;
the Checks of 6.4 at `N = 16` and `N = 25`.

### Dependencies

Layer 5 (5.1–5.3, 5.9); EC Layers 1–2, 6; FF R28.6.5–R28.6.6; EI §8.8; EM2 §§5.0a–5.0b, 6.0b,
6.0f; ED §§3.5–3.11, 3.20, 3.23; CMG models of `X_H`; MC Layer 8D.

## Layer 7: `GSp₄(Ẑ)` and the mod-`ℓ` images of abelian surfaces

Suggested file: `GSp4/Basic.lean`, `GSp4/Image.lean`, `GSp4/Subgroups.lean`.

### 7.1 The similitude group

- **Consumed (AGR §7.3).** For a commutative ring `R`, `GSp₄(R)` is AGR's
  `SimilitudeGroup.GSp` in rank four, with its multiplier `ν = SimilitudeGroup.multiplier` and
  the law `det g = ν(g)²`. AGR's Gram matrix is `J₄ = −Matrix.J (Fin 2) R`; since
  `g (−J) gᵀ = ν (−J)` iff `g J gᵀ = ν J`, this is the group `{g : g J gᵀ = ν J, ν ∈ Rˣ}` of
  convention 14 with the same `ν`, and `ker ν` is Mathlib's `symplecticGroup (Fin 2) R`.
  `Suggested.lean` carries a local copy `GSp4` of the carrier only to state the cardinality below.
- **Owned.** `GSp₄(R) = Sp₄(R) · {diag(1, 1, u, u)}`, so `ν` is surjective; scalars `u·I` have
  `ν = u²`; functoriality along ring homomorphisms; `|GSp₄(𝔽_ℓ)| = (ℓ − 1)·|Sp₄(𝔽_ℓ)| =
  (ℓ − 1) ℓ⁴ (ℓ² − 1)(ℓ⁴ − 1)` (`card_GSp4_zmod`).
- `GSp₄(Ẑ) ⊆ GL₄(ẑ)` closed, profinite; reductions `red n : GSp₄(Ẑ) → GSp₄(ℤ/n)` surjective;
  `Γ(n)`; the inverse-limit property; `GSp₄(Ẑ) ≃ ∏_ℓ GSp₄(ℤ_ℓ)`; open subgroups `H` with
  **level** (least `N` with `ker red N ≤ H`) and **index**, conjugation invariance, the
  analogue of 0.2 verbatim (the proofs are the same as for `GL₂`, with `𝔤𝔰𝔭₄` kernels). The
  LMFDB's `gps_gsp4zhat` prefix is `(level, index)`; the ordinal `n`, the `parents` and the
  class signature ordering are not targets.
- **Orbit signatures.** For `N` a multiple of `level H` and `H̄ = red N '' H ≤ GSp₄(ℤ/N)`
  acting on column vectors of `(ℤ/N)⁴`: `orbits H N` is the multiset of `(e, s, m)`, `e ∣ N`,
  with `m` the number of nontrivial `H̄`-orbits of size `s` consisting of vectors of exact order
  `e` (knowl `columns.gps_gsp4zhat.orbits`); `isogenyOrbits H N` the multiset of `(e, s, m)` over
  the action on **`(e, e)`-isogenies**, i.e. on maximal isotropic subgroups `W ⊆ (ℤ/e)⁴` with
  `W ≅ (ℤ/e)²` for `e ∣ N` (the kernels of polarised isogenies of type `(e, e)`, knowl
  `columns.gps_gsp4zhat.isogeny_orbits`). Both depend on `N` through the range of `e`; an entry
  with given `e` depends only on `red e '' H`, so passing from `N` to a multiple keeps the
  entries with `e ∣ N` and adds new ones. The LMFDB's columns are the values at `N = level H`. A
  **quadratic twist** of `H` is an open `H'` with `±H' = ±H` (the analogue of 2.6). All are
  conjugation-invariant.

*Needs:* 0.1–0.2 (methods); AGR §7.3 (`SimilitudeGroup.GSp`, `SimilitudeGroup.multiplier`);
Mathlib `Matrix.J`, `symplecticGroup`.

**Checks.**

- `g = diag(1, 1, u, u)`: with `J` and with AGR's `−J` alike, `ν(g) = u` and `det g = u² = ν(g)²`.
- `|GSp₄(𝔽₂)| = 1 · 16 · 3 · 15 = 720` and `|GSp₄(𝔽₃)| = 2 · 81 · 8 · 80 = 103680`.
- (rejection) for `H = GSp₄(Ẑ)`, `orbits H 1` is empty (no nonzero vectors), while `orbits H 2`
  contains `(2, 15, 1)` (the fifteen nonzero vectors of `𝔽₂⁴`, one orbit); the signature depends on
  `N`.

### 7.2 The mod-`ℓ` image of a principally polarised abelian surface

For `A/K` a principally polarised abelian surface (the Jacobian of a genus-two curve `C/K`,
`HyperellipticCurves` for the curve, JC for `Jac`):

- `A[ℓ]` is a `4`-dimensional `𝔽_ℓ`-space with the Weil pairing `e_ℓ`, perfect and alternating
  (JC / MC Layer 2 for the pairing at scheme level, consumed); a **symplectic frame** is a basis
  in which `e_ℓ` is `J`; `G_K` preserves `e_ℓ` up to `χ̄_ℓ`, so in a symplectic frame
  `ρ_{A,ℓ} : G_K → GSp₄(𝔽_ℓ)` with `ν ∘ ρ_{A,ℓ} = χ̄_ℓ`; the image `modlImage A ℓ` is a
  `GSp₄(𝔽_ℓ)`-conjugacy class (convention 14); the adelic version `ρ_A : G_K → GSp₄(Ẑ)` on
  `T̂A = ∏ T_ℓ A` with `ν ∘ ρ_A = χ`, as in 3.1–3.3 with `GSp₄` in place of `GL₂` (AGR §6
  supplies the Tate module of an abelian variety as a continuous representation; AGR §7.5 the
  `GSp4Rep` shell).
- **Non-maximal primes.** For `End(A_{K̄}) = ℤ` (`SatoTateGroups`: Sato–Tate group `USp(4)`),
  `nonmaximalPrimes A := {ℓ : modlImage A ℓ ≠ GSp₄(𝔽_ℓ)}`; over `ℚ`, `ν ∘ ρ_{A,ℓ} = χ̄_ℓ` is
  surjective, so non-maximal means `⊉ Sp₄(𝔽_ℓ)`. Finiteness of `nonmaximalPrimes A` is Serre's open
  image theorem for abelian surfaces with `End(A_{K̄}) = ℤ`, which no cited roadmap supplies: it is
  the declared gap `gap:abelian-surface-open-image`, and the finiteness statement here is
  conditional on it. The definition of `nonmaximalPrimes A` and everything else in 7.2–7.3 are
  unconditional. The LMFDB records the finite list only for `USp(4)` (knowl
  `g2c.galois_rep.non_maximal_primes`). The image prefix `(ℓ, [GSp₄(𝔽_ℓ) : G])` is
  intrinsic (knowl `g2c.galois_rep_modell_image`); the tiebreaker is not a target.
- **The two-torsion field.** For `C : y² = f(x)` with `deg f ∈ {5, 6}`, `K(A[2])` is the
  splitting field of `f` (the `2`-torsion of `Jac(C)` is spanned by the differences of
  Weierstrass points; `HyperellipticCurves` supplies the Weierstrass points as the roots of
  `f` and `∞`), `Gal(K(A[2])/K) ↪ Sp₄(𝔽₂) ≅ S₆` acting on the six roots (with `∞` for
  `deg f = 5`), and `2 ∉ nonmaximalPrimes A` iff `Gal(f) ≅ S₆` (resp. the index-`6` embedding
  of `S₅` is never all of `S₆`, so `deg f = 5` forces `2 ∈ nonmaximalPrimes A`). The LMFDB's
  `two_torsion_field` is this splitting field (its label is not a target).

*Needs:* 7.1; AGR §§6, 7.5; `gap:abelian-surface-open-image` (finiteness only); JC;
`HyperellipticCurves`; `SatoTateGroups`.

**Checks.**

- For `C : y² = f(x)` with `deg f = 6` and `Gal(f) ≅ S₆`, `Gal(K(A[2])/K) ≅ S₆ ≅ Sp₄(𝔽₂)`, of
  order `720`, so `2` is maximal.
- (rejection) for `deg f = 5` the image is at most `S₅`, of index `6` in `Sp₄(𝔽₂)`, so
  `2 ∈ nonmaximalPrimes A` always.
- Over `ℚ`, `ν ∘ ρ_{A,ℓ} = χ̄_ℓ` is onto `𝔽_ℓˣ`, so `modlImage A ℓ = GSp₄(𝔽_ℓ)` iff it contains
  `Sp₄(𝔽_ℓ)`.

### 7.3 Subgroup types of `GSp₄(𝔽_ℓ)` and Mitchell's classification

For a non-maximal `ℓ` let `G := modlImage A ℓ`, a subgroup of `GSp₄(𝔽_ℓ)` not containing
`Sp₄(𝔽_ℓ)`, acting on `V = 𝔽_ℓ⁴` with the symplectic form `e_ℓ`.

- **Configurations.** The following are predicates on `G`, each conjugation-invariant and
  decidable: `G` stabilises a line (equivalently its orthogonal `3`-space); `G` stabilises a
  totally isotropic plane; `G` stabilises a non-degenerate plane `W` (and then `W^⊥`, so
  `V = W ⊕ W^⊥` is `G`-stable); `G` permutes a decomposition `V = V₁ ⊕ V₂` into two planes, both
  non-degenerate or both totally isotropic; `V` is not a semisimple `𝔽_ℓ[G]`-module (some
  `G`-stable subspace has no `G`-stable complement). They overlap and do not partition the
  subgroups: the trivial group stabilises every line and every plane, and the group generated by a
  symplectic transvection stabilises a line and is not semisimple.
- **The single label.** `modlImageType A ℓ ∈ {nss, 1p3, 2p2, irred, cusp}`, the five values of the
  knowl `g2c.galois_rep_image`, is defined by the first clause that applies: `nss` if `V` is not a
  semisimple `𝔽_ℓ[G]`-module; else `1p3` if `G` stabilises a line; else `2p2` if `G` stabilises a
  plane; else (`V` is irreducible) `irred` if `G` permutes a decomposition into two planes; else
  `cusp`. It is a function of the conjugacy class by construction and uses no classification; the
  trivial group gets `1p3` and a transvection group `nss`. The database's sixth entry `?` means
  "not computed" and is not a value.
- **Residual subspaces are not decompositions.** A `G`-stable line is a `K`-rational subgroup of
  order `ℓ` of `A`, and a `G`-stable totally isotropic plane the kernel of a `K`-rational
  `(ℓ, ℓ)`-isogeny. A decomposition of `A` up to isogeny is a statement in characteristic zero
  (`End(A_K) ≠ ℤ`); it makes `V_ℓ A` reducible for every `ℓ`, whereas a stable subspace of `A[ℓ]`
  at one `ℓ` gives no decomposition of `A`.
- **Mitchell's theorem.** For a prime `ℓ ≥ 5`, every maximal subgroup of `PSp₄(𝔽_ℓ)` is the
  stabiliser of a point or of a totally isotropic line of the symplectic polar space of
  `PG(3, 𝔽_ℓ)` (the two parabolics), the stabiliser of a pair of polar non-isotropic lines
  (`(PSL₂(𝔽_ℓ) × PSL₂(𝔽_ℓ)).2`, the stabiliser of a decomposition into two non-degenerate
  planes), the stabiliser of a quadric (`PSL₂(𝔽_{ℓ²}).2`), the image of `PSL₂(𝔽_ℓ)` under the
  symmetric cube (the stabiliser of a twisted cubic, `ℓ ≥ 7`), or one of the exceptional groups
  `2⁴.S₅` of order `1920` (`ℓ ≡ ±1 mod 8`), `2⁴.A₅` of order `960` (`ℓ ≡ ±3 mod 8`), `S₆` of order
  `720` (`ℓ ≡ ±1 mod 12`), `A₆` of order `360` (`ℓ ≡ ±5 mod 12`), `A₇` of order `2520` (`ℓ = 7`
  only). By Dirichlet's theorem each exceptional family other than `A₇` occurs for infinitely many
  `ℓ`; `A₇` occurs once. Proof ingredients: a subgroup of `PSp₄(𝔽_ℓ)` either fixes one of the
  configurations listed (a point, a totally isotropic line, a pair of polar lines, a quadric, a
  twisted cubic) or acts primitively on the points of the polar space; the line and plane
  stabilisers are analysed through Dickson's classification of the subgroups of `PSL₂(𝔽_ℓ)` (AGR
  §4.4, consumed), and in the primitive case the bounds on element orders and Sylow subgroups that
  this forces leave only the exceptional groups. Locators: Mitchell 1914, the main theorem;
  Dieulefait 2002, §2, the list of maximal subgroups of `PSp₄(𝔽_ℓ)` recalled before his
  Theorem 2.1 (which itself concerns the image of inertia); Bray–Holt–Roney-Dougal 2013,
  Chapter 8, the tables for `Sp₄(q)`. The theorem is owned here as a target with this proof
  route; it is not verified against a stored list.

*Needs:* 7.1–7.2; AGR §4.4 (Dickson, for the line and plane stabilisers); Mathlib `Subgroup`,
`Matrix.symplecticGroup`.

**Checks.**

- (rejection) the trivial subgroup of `Sp₄(𝔽₃)` stabilises all `40` lines and all `130` planes
  of `𝔽₃⁴`: it satisfies three configurations at once, and the rule gives it the single label
  `1p3`.
- A nontrivial symplectic transvection stabilises a line and has no stable complement to its
  image line: label `nss`, although it also stabilises a line.
- (rejection) the `A₇` family occurs for the single prime `ℓ = 7`, not infinitely often.
- `|Sp₄(𝔽₃)| = 51840` and `|GSp₄(𝔽₃)| = 103680 = 2 · 51840` (7.1).

### Examples

Worked example 11: `|GSp₄(𝔽₂)| = 720 = |S₆|`, `|GSp₄(𝔽₃)| = 103680`; the Checks of 7.1–7.3.

### Dependencies

The methods of Layer 0; AGR §§4.4, 6, 7.3, 7.5; `gap:abelian-surface-open-image` (for the
finiteness of `nonmaximalPrimes A` only); JC; `HyperellipticCurves`; `SatoTateGroups`; Mathlib
`Matrix.J`, `Matrix.symplecticGroup`.

## Explicit scope exclusions

- **No modular curve is constructed here.** `X_H`, its stack, its compactification, its
  integral models, its cusps as points, its `j`-map as a morphism and the dictionary between
  its points and pairs `(E, [ι]_H)` are MC and MC2's; Layers 1 and 5 state finite computations
  and identify them with those objects.
- **Models and gonality** of `X_H` (canonical, plane, Weierstrass, embedded weight-`k` models,
  `gon_ℚ`, `gon_ℚ̄`, bounds, the `j`-map as a rational function in model coordinates), the
  general theory of isolated points of curves: `CanonicalModelsAndGonality`. The
  `known_points` lists are not targets.
- **Orderings and stored lists are not targets**: RSZB ordinals `n`, Gassmann letters `c`,
  `canonical_conjugator`, generators, `psl2label`/`sl2label`/CP/SZ/RZB/S/Zywina labels,
  `coarse_label` beyond its prefix, the fine label, `parents`, `reductions`, `factorization` as
  lists, `minimal_twist` as a least label, `trace_hash`, the Cremona/LMFDB isogeny-class letters
  and curve numbers, and `two_torsion_field` labels.
- **Finite-index non-congruence subgroups** of `PSL₂(ℤ)`, their permutation triples, Farey
  symbols and Wohlfahrt's theorem: `NoncongruenceModularForms`, whose Layer 2 states the
  comparison of its coset invariants with Layer 1's for a congruence `Γ̄`; the only contact.
- **Modular forms, newforms, Hecke algebras, `L`-functions, analytic ranks of newforms**: MF
  and LFunctions; `A_f` and `J₀(N)`, `J₁(N)`: MC2 Layers 13, 16.
- **Shimura curves** `X(D; N)` and quaternionic level structures: `QuaternionArithmetic`.
- **Endomorphism algebras and Sato–Tate groups** (`USp(4)` as the hypothesis of 7.2):
  `SatoTateGroups`. **Genus-two curve models and invariants**: `HyperellipticCurves`.
  **Hasse–Weil for curves over finite fields**: SSF §5.11.
- **Modular degrees, Manin constants, periods, BSD data**:
  `EllipticCurvePeriodsAndModularParametrizations`.
- **Serre's uniformity question**, effective bounds in 4.3, the classification of all possible
  images over `ℚ` (Zywina's conjectural list), Serre's conjecture itself, and the Mordell–Weil
  rank of `J_H`: not targets; 3.4 and 5.9 state the implications from the named hypotheses.
- **Serre's open image theorem for abelian surfaces** (7.2) is not proved here: it is the declared
  supplier gap `gap:abelian-surface-open-image`, assigned to AGR Layer 7, and only the finiteness
  of `nonmaximalPrimes A` depends on it. Only the `GL₂` theorem is proved in this roadmap.

## Worked examples (acceptance criteria)

Every number below was checked by computation (Sage: the coset model of convention 6 on
`GL₂(ℤ/N)`, `isogeny_class`, `division_field`, `galois_representation`, modular symbols) or
carries its citation. Label prefixes are `(level, index, genus)`; trailing ordinals are not
targets and are not stated. Each item names the milestone that computes it.

1. **`X₀(11)`, `H = Γ₀(11)`, prefix `11.12.1`.** Level `11` (0.2), index `12` (0.2), `−I ∈ H`
   (coarse), `IsFullDet` (0.3); `pslIndex = 12` (0.4); `ν₂ = ν₃ = 0`, two cusps of widths `1`
   and `11`, both rational, `cuspOrbits = {1, 1}` (1.1, 1.3); `genus = 1 + 12/12 − 0 − 0 − 1 = 1`
   (1.2). `Γ_H = Gamma0 11` and `pslIndex = [SL₂(ℤ) : Γ₀(11)] = 12` is the bridge check through
   `Gamma0_prime_power_index` (0.4). `X₀(11)(ℚ)` has five points: the two cusps and three
   non-cuspidal points with `j ∈ {−32768, −121, −24729001}`, realised by `121.b2` (CM by `−11`),
   `121.c2` and `121.a2` (`121.a` and `121.c` are quadratic twists by `−11` of each other, and the
   `11`-isogeny swaps their two `j`-invariants) (5.2, 6.3); the three `j`-values are EM2 §6.0b's
   level-`11` table and `11 ∈` Mazur's list (6.5). `J_H`
   is the elliptic curve `11.a2` of analytic rank `0`, so `dims = {1}`, `newforms = {11.2.a.a}`,
   `analyticRank = 0`, `genusMinusRank = 1`, `IsSimple`, `IsSquarefree` (5.9). Agreeable (2.5).
2. **`X₁(11)`, `H = Γ₁(11)`, fine, prefix `11.120.1`, coarse group `Γ_{±1}(11)` of prefix
   `11.60.1`.** `−I ∉ Γ₁(11)` (0.3), `index = 120`, `index (±H) = 60` (0.2), `pslIndex = 60`;
   ten cusps: five rational of width `11` and one Galois orbit of five cusps of width `1` with
   field `ℚ(ζ₁₁)⁺` (1.3, 5.1), `cuspOrbits = {1, 1, 1, 1, 1, 5}`, `rationalCusps = 5`;
   `genus = 1 + 60/12 − 0 − 0 − 10/2 = 1` (1.2); the same genus, cusps and widths as `Γ_{±1}(11)` (fine/coarse
   identity, 1.1). `X₁(11) = X_{±1}(11)` as curves (5.7), the elliptic curve `11.a3` of rank `0`
   with five rational points, all cusps: no `E/ℚ` has a point of order `11` (6.4, EI §8.8).
   `agreeableClosure (Γ₁(11)) = Γ₀(11)` with quotient `(ℤ/11)ˣ ≅ ℤ/10` (2.5).
3. **Level `13`.** `|GL₂(𝔽₁₃)| = 26208` (0.1). `X₀(13) = 13.14.0`: `ν₂ = ν₃ = 2`, two rational
   cusps of widths `1, 13`, genus `0` (1.1–1.2). `X₁(13)`: fine, index `168`, coarse index `84`,
   genus `2`, twelve cusps (six rational of width `13`, one orbit of six of width `1`) (1.3);
   `X₁(13)(ℚ)` is its six rational cusps (6.4). `X_s⁺(13) = X_{C_s⁺(13)}`, prefix `13.91.3`:
   `ν₂ = 7`, `ν₃ = 1`, seven cusps all of width `13`, `cuspOrbits = {1, 6}`, `rationalCusps = 1`,
   genus `3` (1.1–1.3, 2.1). `X_ns⁺(13) = X_{C_ns⁺(13)}`, prefix `13.78.3`: `ν₂ = 6`, `ν₃ = 0`, six
   cusps of width `13` in one orbit, no rational cusp, genus `3`. `X_{S₄}(13)`: index
   `|PGL₂(𝔽₁₃)|/24 = 91` (0.3), genus `3` (Banwait–Cremona 2014). **Boundary check for 5.6 and
   2.8:** `X_s⁺(13) ≅ X_ns⁺(13)` over `ℚ` (Baran 2014) although `C_s⁺(13)` and `C_ns⁺(13)` have
   different indices, so are neither conjugate, twists, nor Gassmann equivalent: isomorphic
   curves do not force Gassmann equivalence. Their common Jacobian is the three-dimensional
   `w₁₃ = +1` part of `J₀(169)^{new}` (5.9, Chen's isogeny; `S₂(Γ₀(13)) = 0`,
   `dim S₂^{new}(Γ₀(169)) = 8`). `X_ns⁺(13)(ℚ)` consists of seven CM points, with
   `cmDiscriminants = {−7, −8, −11, −19, −28, −67, −163}`, exactly the class-number-one
   discriminants `D` with `(D/13) = −1` (5.3, 4.5); `X_s⁺(13)(ℚ)` is one cusp and six CM points
   with `cmDiscriminants = {−3, −4, −12, −16, −27, −43}`, the `D` with `(D/13) = 1`
   (Balakrishnan–Dogra–Müller–Tuitman–Vonk 2019).
4. **Serre's curve `37.a1`** (`y² + y = x³ − x`). Non-CM, rank `1`, trivial torsion;
   `ρ̄_{E,ℓ}` surjective for every `ℓ` (Serre 1972 §5.5), so `nonmaximalPrimes = ∅` (3.4);
   `Δ = 37`, `D = 37`, `ℚ(E[2])` has degree `6` and contains `√37 ∈ ℚ(ζ₃₇)` (3.5); the image is
   `S_{37}` (Lang–Trotter 1976): `IsSerreCurve`, `adelicIndex = 2`, `adelicLevel = 2·37 = 74`,
   `adelicGenus = 0`, `entanglementIndex = 2` with quotient `ℤ/2` (2.3, 3.5);
   `|GL₂(ℤ/74)| = 10933056 = φ(74)·74·(74/74)²·(2² − 1)(37² − 1)` (0.1), so `|H̄_{74}| = 5466528`.
   `isogenyClass = {37.a1}`, `classDegree = 1` (6.2). `J_{S_{37}}`: genus `0`, no decomposition.
   **Boundary check:** `S_1 = ker (ε ∘ red 2) = (red 2)⁻¹ C_ns(2)`, prefix `2.2.0`: index `2`,
   `ν₂ = 0`, `ν₃ = 2`, one cusp of width `2`, genus `0`, `sl2Level = 2` (2.4), the common
   `SL₂`-part of every `S_χ`; `S_{37}` has level `74` but `sl2Level = 2` (0.4).
5. **The class `11.a`.** Three curves `11.a1, 11.a2, 11.a3`, `isogenyMatrix =
   [[1, 5, 25], [5, 1, 5], [25, 5, 1]]`, a `5`-tree (path) with `11.a2` in the middle,
   `classDegree = 25 = max entry`, `isogenyDegrees (11.a2) = {1, 5}`, `isogenyDegrees (11.a1) =
   isogenyDegrees (11.a3) = {1, 5, 25}`, `classSize = 3` (6.2); `25 ∈` Kenku's set (6.5).
   `11.a2`: `E(ℚ)_tors = ℤ/5`, `ℚ(E[5]) = ℚ(ζ₅)` of degree `4`, mod-`5` image `{diag(1, u)}` of
   order `4`, prefix `5.120.0` (fine), coarse prefix `5.60.0` (3.4, 3.6); `nonmaximalPrimes =
   {5}`; `E(ℚ(ζ₅))_tors = ℤ/5 × ℤ/5` (torsion growth, 3.6) while over `ℚ(√5)` and `ℚ(√−11)`
   the torsion stays `ℤ/5`. `11.a3` (`= X₁(11)`): `ℚ(E[5])` of degree `20`, mod-`5` image
   `[[1, *], [0, *]]`, prefix `5.24.0`; since `11.a3` has a cyclic `25`-isogeny its `5`-adic
   image has level `25`, not `5` (2.2 and 6.3: a level-`5` group contains `Γ(5)`, which fixes no
   cyclic subgroup of order `25`). All three have adelic index `≥ 120`: none is a Serre curve.
6. **The class `15.a`** (Kenku's maximum). Eight curves, `classDegree = 16 = max entry`, every
   edge of degree `2`: the `2`-tree on eight vertices (6.2, 6.5); torsion structures `ℤ/2 × ℤ/4`
   (`15.a5`), `ℤ/8` (`15.a8`), `ℤ/4` (`15.a4`), `ℤ/2 × ℤ/2` (`15.a2`) (6.4). `15.a5` has all of
   `E[2]` rational: mod-`2` image trivial, `2 ∈ nonmaximalPrimes`, image inside `Γ(2)` of prefix
   `2.6.0` (three rational cusps of width `2`). `14.a`: six curves, `classDegree = 18`, graph the
   Cartesian product of a `2`-edge and a `3`-path (`isogenyMatrix` entries `1, 2, 3, 6, 9, 18`),
   `14.a6` with `E(ℚ)_tors = ℤ/6` and `nonmaximalPrimes = {2, 3}`. **Class statistics as
   acceptance data for 6.2 and 6.5:** over all `1245` isogeny classes of conductor `≤ 600`,
   `classSize ∈ {1, 2, 3, 4, 6, 8}` with counts `455, 463, 52, 221, 38, 16`, `classDegree = max
   entry` in every class, and the cyclic degrees occurring are `1–16, 18, 19, 21, 25, 27`
   (`17, 37, 43, 67, 163` first occur at conductors `14450, 1225, 1849, …`).
7. **Prime isogenies beyond `19`.** `1225.b2` (`y² + xy + y = x³ + x² − 8x + 6`, `j = −7·11³`): a
   rational `37`-isogeny, `isogenyDegrees = {1, 37}`, `classSize = 2`, `nonmaximalPrimes = {37}`
   (Borel mod `37`); the curve `[1, 1, 0, −660, −7600]` of conductor `14450` (`j = −17·373³/2¹⁷`):
   a `17`-isogeny; the CM curves `[0, 0, 1, −860, 9707]` (conductor `1849 = 43²`, `D = −43`) and
   `[0, 0, 1, −2174420, 1234136692]` (conductor `26569 = 163²`, `D = −163`): `43`- and
   `163`-isogenies (6.5; the rational CM points of `X₀(43)`, `X₀(163)`, 5.3). `X₀(N)` has genus
   `0` exactly for `N ∈ {1,…,10, 12, 13, 16, 18, 25}` and genus `1` for `N ∈ {11, 14, 15, 17, 19,
   20, 21, 24, 27, 32, 36, 49}` (1.2); `genus X₀(37) = 2`, `X₀(43) = 3`, `X₀(67) = 5`,
   `X₀(163) = 13`.
8. **CM curves.** `121.b2` (`j = −32768`, `D = −11`): `ρ_E(G_ℚ) ≤ N_𝒪` (4.5); mod-`ℓ` image the
   normaliser of a split Cartan for `ℓ ∈ {3, 5}` (`(−11/ℓ) = 1`; at `ℓ = 3` the dihedral group
   of order `8`), of a non-split Cartan for `ℓ ∈ {7, 13}`, and a Borel at the ramified `ℓ = 11`
   (the `11`-isogeny `121.b2 → 121.b1`, both with `j = −32768`; `classDegree = 11`) (2.1, 3.4,
   6.2). `27.a3` (`j = 0`, `D = −3`): class of four curves, `classDegree = 27`, the `3`-path
   `1–3–9–27`; `32.a4` (`j = 1728`, `D = −4`): four curves, `classDegree = 4`, the `2`-star with
   centre `32.a3`; at `ℓ = 3`, `32.a4` has mod-`3` image the normaliser of the non-split Cartan,
   the semidihedral group of order `16` (`(−4/3) = −1`), while `27.a3` (ramified `ℓ = 3`,
   `E(ℚ)_tors = ℤ/3`) has mod-`3` image inside the Borel `[[1, *], [0, *]]` of order `6`, a
   boundary check for 4.5's good-reduction hypothesis. `49.a4` (`D = −7`): four curves,
   `classDegree = 14`, graph the product of a `2`-edge and a `7`-edge (a `4`-cycle), `36.a4`
   (`D = −3`): product of a `2`-edge and a `3`-edge — the product-of-trees theorem of 6.2 holds
   for them since `End_ℚ = ℤ`. The thirteen CM `j`-invariants with their discriminants (5.3):
   `0 (−3), 1728 (−4), −3375 (−7), 8000 (−8), −32768 (−11), 54000 (−12), 287496 (−16),
   −884736 (−19), −12288000 (−27), 16581375 (−28), −884736000 (−43), −147197952000 (−67),
   −262537412640768000 (−163)`.
9. **Mazur's fifteen torsion structures (6.4), one curve each:** trivial `11.a1`; `ℤ/2`
   `14.a2`; `ℤ/3` `19.a2`; `ℤ/4` `15.a4`; `ℤ/5` `11.a2`; `ℤ/6` `14.a6`; `ℤ/7` `26.b2`; `ℤ/8`
   `15.a8`; `ℤ/9` `54.b2`; `ℤ/10` `66.c3`; `ℤ/12` `90.c7`; `ℤ/2 × ℤ/2` `15.a2`; `ℤ/2 × ℤ/4`
   `15.a5`; `ℤ/2 × ℤ/6` `30.a6`; `ℤ/2 × ℤ/8` `210.e6`. `Γ₁(N)` has genus `0` exactly for
   `N ∈ {1,…,10, 12}` and genus `1` for `N ∈ {11, 14, 15}` (1.2), the dividing line of 6.4's
   step 2. **Boundary checks for the `j ∈ {0, 1728}` clause of 5.2:** `y² = x³ + 4x = 32.a4`
   (`j = 1728`) has `E(ℚ)_tors = ℤ/4`, a pair over `ℚ` above the `j = 1728` point of the fine
   curve `X₁(4)`; `y² = x³ + 16 = 27.a4` (`j = 0`) has `E(ℚ)_tors = ℤ/3`, a pair above `j = 0`
   on `X₁(3)`; `y² = x³ − x = 32.a3` (`j = 1728`) has `E(ℚ)_tors = ℤ/2 × ℤ/2` and no point of
   order `4`, so its point of `X₁(4)(ℚ) = X_{±1}(4)(ℚ)` is realised by the twist `32.a4`.
10. **Determinant and components.** `X(5) = X_{Γ(5)}`: `det Γ(5) = ker(ẑˣ → (ℤ/5)ˣ)` of index
    `4`, index `480`, `pslIndex = 60`, genus `0`, twelve `⟨T⟩`-orbit cusps of width `5` but
    `48` double cosets `±H̄ \ GL₂(ℤ/5) / ⟨T⟩` (the factor `[(ℤ/5)ˣ : det H̄] = 4` of 1.3),
    `canonicalField = ℚ(ζ₅)`, four geometric components (5.1). `X_arith(5)`, prefix `5.120.0`,
    fine, `IsFullDet`: twelve cusps of width `5`, `cuspOrbits = {1, 1, 2, 4, 4}`,
    `rationalCusps = 2` (1.3), geometrically a component of `X(5)` (knowl
    `modcurve.canonical_field`). `Γ₀(15)`, prefix `15.24.1`: four cusps of widths `1, 3, 5, 15`,
    all rational (`gcd(c, 15/c) = 1`), `genus 1`; `Γ₀(9)`: four cusps of widths `1, 1, 1, 9` with
    `cuspOrbits = {1, 1, 2}` (the two cusps `1/3`, `2/3` are conjugate over `ℚ(ζ₃)`),
    `rationalCusps = 2` (1.3). `Γ₀(20)`: six cusps `1, 1, 4, 5, 5, 20`, all rational;
    `Γ₀(16)`: six cusps `1, 1, 1, 1, 4, 16`, `cuspOrbits = {1, 1, 1, 1, 2}`.
11. **Orders of `GL₂(ℤ/N)` (0.1):** `|GL₂(ℤ/12)| = 4608`, `|GL₂(ℤ/25)| = 300000`,
    `|GL₂(ℤ/11)| = 13200`, `|GL₂(ℤ/5)| = 480`; **Cartan orders (2.1):** `|C_s(15)| = φ(15)² = 64`,
    `|C_ns(15)| = 15²(1 − 1/9)(1 − 1/25) = 192`, `ψ(15) = 24`; `|C_s⁺(13)| = 288`, `|C_ns⁺(13)| =
    336`, `26208/288 = 91`, `26208/336 = 78`. **`GSp₄` (7.1):** `|GSp₄(𝔽₂)| = 1·16·3·15 = 720 =
    |S₆|`, `|GSp₄(𝔽₃)| = 2·81·8·80 = 103680`, `|Sp₄(𝔽₃)| = 51840`.

## Ordering

```
Layer 0 ──► Layer 1 ──► Layer 2 (2.6, 2.8 need 1; 2.1–2.5, 2.7 need only 0)
   │                       │
   │                       ├──► Layer 3 (3.5 needs 2.4; 3.6 needs 2.7) ──► Layer 4 (needs 2.2, 2.4, 3, AA.4.2)
   │                       │                                                   │
   │                       └──► Layer 5 (5.1 needs 1; 5.2 needs 3; 5.3 needs 4.5; 5.6 needs 2.8;
   │                                      5.9 needs 1 and MC2 Layers 13, 16)
   │                                                                           │
   │                            Layer 6 (6.1–6.2 need only EC/FF; 6.3 needs 5.2; 6.4–6.5 need 5.1–5.3, 5.9)
   │
   └──► Layer 7 (needs only 0's methods and AGR §§4.4, 7.3, 7.5; independent of Layers 1–6)
```

Parallel tracks: the group side `0 → 1 → 2` is startable against Mathlib and Tau Ceti alone;
`6.1–6.2` (isogeny classes) and `7.1` (`GSp₄`) can start at once; `3` starts after `0` and `2.4`;
`4` after `3`; `5.1` after `1`; the rest of `5` after `3` and `4.5`; `6.3–6.5` last.

## References

- J.-P. Serre, *Abelian ℓ-adic representations and elliptic curves*, Benjamin 1968 (Research
  Notes in Mathematics 7, 1998): Ch. IV §2.2 (ℓ-adic open image, non-CM), IV-23 Lemma 3
  (lifting from `SL₂(𝔽_ℓ)`, `ℓ ≥ 5`), p. IV-19 (the lemma on closed subgroups of products of
  `SL₂(ℤ_ℓ)` to which Serre 1972 §4.4 refers).
- J.-P. Serre, *Propriétés galoisiennes des points d'ordre fini des courbes elliptiques*, Invent.
  Math. 15 (1972): §1.11–1.12 (inertia at `ℓ`), §2 (subgroups of `GL₂(𝔽_ℓ)`, Props. 15–18),
  §4 (Théorème 2: surjectivity for almost all `ℓ`; Théorème 3: adelic openness), §5.5 (the curve
  `y² + y = x³ − x`, index-two obstruction).
- J.-P. Serre, *Sur les représentations modulaires de degré 2 de Gal(ℚ̄/ℚ)*, Duke Math. J. 54
  (1987): the Serre weight and conductor.
- B. Mazur, *Modular curves and the Eisenstein ideal*, Publ. Math. IHÉS 47 (1977); *Rational
  isogenies of prime degree*, Invent. Math. 44 (1978), Theorem 1.
- M. A. Kenku, *On the number of ℚ-isomorphism classes of elliptic curves in each ℚ-isogeny
  class*, J. Number Theory 15 (1982).
- D. Zywina, *Elliptic curves with maximal Galois action on their torsion points*, Bull. LMS 42
  (2010): the commutator subgroup of `GL₂(Ẑ)` and the index-two obstruction.
- D. Zywina, *On the possible images of the mod ℓ representations associated to elliptic curves
  over ℚ*, 2015; *Explicit open images for elliptic curves over ℚ*, arXiv:2206.14959, §1.4
  (agreeable) and Prop. 8.1 (agreeable closure).
- J. Rouse, A. V. Sutherland, D. Zureick-Brown, *ℓ-adic images of Galois for elliptic curves
  over ℚ*, Forum Math. Sigma 10 (2022), arXiv:2106.11141: the RSZB labels, §2.4 (ordering),
  Remark 2.3.2 (the twists at `j = 0, 1728`).
- A. V. Sutherland, *Computing images of Galois representations attached to elliptic curves*,
  Forum Math. Sigma 4 (2016), arXiv:1504.07618: mod-`ℓ` image labels.
- A. V. Sutherland, *Stronger arithmetic equivalence*, Discrete Analysis 2021: Gassmann
  equivalence, §2.
- Á. Lozano-Robledo, *Galois representations attached to elliptic curves with complex
  multiplication*, arXiv:1809.02584: Theorems 1.2 and 1.4, for elliptic curves over `ℚ(j)`, used
  over `ℚ` as `web_ec.py` applies them.
- A. Bourdon, Ö. Ejder, Y. Liu, F. Odumodu, B. Viray, *On the level of modular curves that give
  rise to isolated j-invariants*, Adv. Math. 357 (2019): Theorem 1.1 (level reduction) and the
  introduction's account of CM `j`-invariants.
- P. L. Clark, B. Cook, J. Stankewicz, *Torsion points on elliptic curves with complex
  multiplication* (with an appendix by A. Rice), Int. J. Number Theory 9 (2013).
- D. Abramovich, *A linear lower bound on the gonality of modular curves*, Int. Math. Res. Notices
  1996 (through CMG Layer 8).
- B. Baran, *An exceptional isomorphism between modular curves of level 13*, J. Number Theory
  145 (2014).
- J. S. Balakrishnan, N. Dogra, J. S. Müller, J. Tuitman, J. Vonk, *Explicit Chabauty–Kim for the
  split Cartan modular curve of level 13*, Ann. of Math. 189 (2019).
- B. Banwait, J. Cremona, *Tetrahedral elliptic curves and the local-global principle for
  isogenies*, Algebra Number Theory 8 (2014): `X_{S₄}(13)`.
- I. Chen, *The Jacobians of non-split Cartan modular curves*, Proc. LMS 77 (1998); B. de Smit,
  B. Edixhoven, *Sur un résultat d'Imin Chen*, Math. Res. Lett. 7 (2000).
- D. Prasad, C. S. Rajan, *On an Archimedean analogue of Tate's conjecture*, J. Number Theory 99
  (2003), Cor. 4: Gassmann-equivalent quotients have isogenous Jacobians.
- N. D. Elkies, *Elliptic curves with 3-adic Galois representation surjective mod 3 but not mod
  9*, arXiv:math/0612734; T. Dokchitser, V. Dokchitser, *Surjectivity of mod 2ⁿ representations
  of elliptic curves*, Math. Z. 272 (2012).
- S. Lang, H. Trotter, *Frobenius distributions in GL₂-extensions*, LNM 504 (1976): the image of
  Galois for `37.a1`. N. Jones, *Almost all elliptic curves are Serre curves*, Trans. AMS 362
  (2010).
- E. González-Jiménez, F. Najman, *Growth of torsion groups of elliptic curves upon base
  change*, Math. Comp. 89 (2020), Theorem 7.2; the exclusion of degree `22` is Lemma 2.11 of
  doi:10.1080/10586458.2020.1771638 (Experiment. Math.), cited as the knowl `ec.q.torsion_growth`
  cites it.
- F. Diamond, J. Shurman, *A First Course in Modular Forms*, GTM 228, §§3.7–3.9 (cusps, elliptic
  points and genus of `Γ₀(N)`, `Γ₁(N)`).
- N. Katz, B. Mazur, *Arithmetic Moduli of Elliptic Curves*, 1985; P. Deligne, M. Rapoport, *Les
  schémas de modules de courbes elliptiques*, 1973 (through MC and MC2).
- G. Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, Invent. Math. 73
  (1983) (through FF); G. Shimura, *Introduction to the Arithmetic Theory of Automorphic
  Functions*, 1971 (through MC2 §16 and SV §5.10).
- C. Khare, J.-P. Wintenberger, *Serre's modularity conjecture (I), (II)*, Invent. Math. 178
  (2009): the implication of 3.4.
- L. E. Dickson, *Linear Groups with an Exposition of the Galois Field Theory*, 1901 (through
  AGR §4.4). H. H. Mitchell, *The subgroups of the quaternary abelian linear group*, Trans. AMS
  15 (1914); L. Dieulefait, *Explicit determination of the images of the Galois representations
  attached to abelian surfaces with End(A) = ℤ*, Experiment. Math. 11 (2002), §2 (the maximal
  subgroups of `PSp₄(𝔽_ℓ)`; his Theorem 2.1 concerns inertia); J. Bray, D. Holt,
  C. Roney-Dougal, *The maximal subgroups of the low-dimensional finite classical groups*, LMS
  Lecture Note Series 407 (2013).
- J.-P. Serre, *Résumé des cours de 1985–1986*, Annuaire du Collège de France (*Œuvres* IV),
  §2.3, Théorème 3 and its corollary, p. 97: open image for abelian surfaces with `End = ℤ`, the
  content of `gap:abelian-surface-open-image`.
- The LMFDB knowls `gl2.*`, `modcurve.*`, `ec.galois_rep*`, `ec.isogeny*`, `ec.q.serre_invariants`,
  `ec.q.torsion_growth`, `g2c.galois_rep*`, `columns.gps_gl2zhat.*`, `columns.gps_gsp4zhat.*`,
  whose definitions this roadmap formalizes verbatim.
