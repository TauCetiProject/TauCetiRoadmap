# Roadmap: Siegel modular forms

A Siegel modular form of degree `g` is a holomorphic function on the Siegel upper half-space
`ℍ_g` of symmetric complex `g × g` matrices with positive definite imaginary part, automorphic
under `Sp_{2g}(ℤ)`, a congruence subgroup, or a paramodular group, with values in a
finite-dimensional representation `ρ` of `GL_g(ℂ)`. For `g = 1` these are Mathlib's modular
forms; for `g = 2`, with `ρ = Sym^j ⊗ det^k`, they are the objects of the LMFDB's
`siegel_modular_forms` section and the modular side of the paramodular conjecture for abelian
surfaces. This roadmap builds the classical theory: the symplectic action and the slash
operators, Fourier expansions over half-integral matrices and Koecher's principle, Siegel's
`Φ`-operator and cusp forms, the Siegel and Klingen Eisenstein series, finite dimensionality,
Siegel theta series of lattices, Igusa's structure theorem for degree two and the `Γ₀(2)`,
`Γ₀(3)`, `Γ₀(4)` ring theorems the LMFDB records, Hecke operators with their Satake
parameters, the spinor and standard `L`-functions, the Maass (Saito–Kurokawa) lift proved and
the Gritsenko, Ikeda and Miyawaki lifts stated, paramodular newforms, and the paramodular
conjecture stated. Degree two is done in full; general degree is kept wherever it costs nothing,
which is everything up to and including the Hecke algebra and the `L`-functions.

The carrier is `TauCetiRoadmap.SiegelModularForms.SiegelHalfSpace g` (written `ℍ[g]`), the
subtype of the complex vector space `Sym g` of symmetric `g × g` complex matrices cut out by
`Matrix.PosDef (τ.map Complex.im)`, acted on by Tau Ceti's symplectic group
`TauCeti.GLSymplectic (Fin g) ℝ` (a subgroup of `GL (Fin g ⊕ Fin g) ℝ` whose underlying matrices
form Mathlib's `Matrix.symplecticGroup`). A form is a bundled structure
`SiegelModularForm Γ ρ` on a holomorphic weight `ρ`, modelled on Mathlib's `ModularForm`.

Suggested home: `TauCeti/NumberTheory/SiegelModularForms/`, with files for the symplectic
groups and the half-space, weights and slash operators, the bundled forms, Fourier expansions
and Koecher, the `Φ`-operator and cusp forms, Eisenstein series, theta series, the degree-two
rings, Hecke operators, `L`-functions, lifts, paramodular forms, and the LMFDB invariants.

## Prerequisites

Every milestone names its direct prerequisites, each of one of four kinds: a Mathlib
declaration at the pin; a Tau Ceti declaration at the pin; an earlier milestone of this roadmap
(strictly earlier in document order); or a named milestone of another roadmap in this
repository, cited by that roadmap's own numbering. Nothing here waits on a Mathlib pull request
or on an external repository.

The roadmaps consumed are the [modular-forms roadmap](../ModularForms/README.md) (the degree-one
theory: newforms, Hecke operators, `L`-functions, Satake parameters), the
[theta-series roadmap](../ThetaSeries/README.md) (lattice Poisson summation, the real lattice
model, the level and the discriminant character), the
[integral quadratic forms and lattices roadmap](../IntegralLattices/README.md) (Minkowski
reduction of positive definite forms), the `L`-functions roadmap `LFunctions` (the
completed `L`-function data model into which the spinor and standard `L`-functions are
exported), and the [classical groups, part II roadmap](../ClassicalGroupsPartII/README.md) (its
CG.0.1: the symplectic similitude group and its multiplier, whose positive part 0.2 takes). The
[metaplectic groups, Weil representations and automorphic theta kernels
roadmap](../MetaplecticAutomorphicForms/README.md)
owns the metaplectic, theta-kernel and Bump–Friedberg–Hoffstein side of degree two, and the Jacobi
carrier `jacobiSpace` with its theta decomposition (its 6.18 and 6.20), on which Layer 9 is
stated; the [q-series, partition statistics and mock modular forms
roadmap](../QSeriesPartitionsAndMockModularForms/README.md)
supplies the classical theta-component coordinates `θ_{m,μ}` (its §9.1). Their interfaces with
this roadmap are stated in *Scope and ownership*. The sibling `HalfIntegralWeightModularForms`
owns half-integral weight and the classical form of the Jacobi carrier with its half-integral
theta components, and supplies the one identification that the Saito–Kurokawa theorem needs from
outside this roadmap.

## Scope and ownership

### Owned here

- The positive similitude group `GSp⁺_{2g}` (the part of `ClassicalGroupsPartII` CG.0.1's
  similitude group with positive multiplier) with `det M = μ(M)^g`, the dual `M^∨` and the
  semigroups `O_g(m)`, the Siegel upper half-space `ℍ_g` with the action
  `τ ↦ (Aτ + B)(Cτ + D)⁻¹`, the automorphy factor `Cτ + D` and its
  cocycle law, and the arithmetic subgroups `Γ_g = Sp_{2g}(ℤ)`, `Γ_g(N)`, `Γ₀^{(g)}(N)`,
  `Γ₁^{(g)}(N)`, together with the paramodular groups `K(N) ⊂ Sp₄(ℚ)` and
  `Γ^{para}(d) ⊂ Sp_{2g}(ℚ)` (Layer 0).
- Holomorphic weights `ρ`, the slash operators `f ∣_ρ γ`, the spaces `M_ρ(Γ)`, `M_ρ(Γ, ψ)`
  and the graded ring of scalar-valued forms (Layer 1).
- Half-integral matrices, Fourier expansions, Koecher's principle, the coefficient bounds and
  the theory of singular forms (Layer 2).
- Siegel's `Φ`-operator, cusp forms, the Petersson inner product, Siegel's fundamental domain
  and finite dimensionality (Layer 3).
- Siegel and Klingen Eisenstein series, with the Maass–Cohen formula for the Fourier
  coefficients in degree two (Layer 4).
- Siegel theta series of degree `g` of a positive definite lattice, with and without
  pluriharmonic coefficients, theta constants with characteristics and their even-weight
  products (Layer 5).
- Igusa's generators `ψ₄, ψ₆, χ₁₀, χ₁₂, χ₃₅`, Igusa's structure theorem and its Hilbert
  series, Satoh's and Tsushima's theorems for `M_{k,j}(Γ₂)`, Igusa's `Γ(2)` ring, and the
  `Γ₀(2)`, `Γ₀(3)`, `Γ₀(4)` theorems of Ibukiyama, Aoki–Ibukiyama and Hayashida–Ibukiyama
  (Layer 6).
- The Hecke algebra of `(Γ_g, GSp⁺_{2g}(ℚ))`, its action on `M_ρ(Γ)`, eigenforms and Satake
  parameters, and the degree-two coefficient formula for `T(p)` (Layer 7).
- The spinor and standard `L`-functions with their Euler factors, the degree-two quartic Euler
  factor, Andrianov's identity, the analytic continuation and functional equations stated, and
  the export to the completed `L`-function data model (Layer 8).
- The Fourier–Jacobi expansion, the Jacobi Eisenstein series `E_{k,1}` and the operators `V_l` on
  the consumed index-one Jacobi forms, the Maass lift and the Saito–Kurokawa theorem, and the
  Gritsenko, Ikeda and Miyawaki lifts stated (Layer 9).
- Paramodular forms, level-raising operators, newforms, the Roberts–Schmidt local newform
  theory stated, Poor–Yuen's weight-two results stated, and the paramodular conjecture stated
  (Layer 10).
- The LMFDB invariant layer: the families, the intrinsic label prefix, integrality of Fourier
  coefficients, coefficient fields, Galois orbits of eigenforms and the page coverage map
  (Layer 11).

### Consumed, not redefined

- From Mathlib: `Matrix.symplecticGroup`, `Matrix.J`, `SymplecticGroup.det_eq_one`;
  `Matrix.PosDef`, `Matrix.PosSemidef`, `Matrix.IsSymm`, `Matrix.IsHermitian`; `UpperHalfPlane`
  and the degree-one `ModularForm`, `CuspForm`, `SlashAction`, `CongruenceSubgroup.Gamma0`,
  `CongruenceSubgroup.Gamma`; `Representation`; `MvPolynomial.homogeneousSubmodule` and
  `MvPolynomial.IsWeightedHomogeneous`; `Subgroup.Commensurable`; the Hecke-pair definitions
  `IsHeckeTriple`, `HeckeCoset`, `HeckeRing` of `Mathlib/NumberTheory/HeckeRing/Defs.lean`;
  `LSeries`, `ArithmeticFunction`, `DirichletCharacter.LFunction`; `jacobiTheta₂`.
- From Tau Ceti at the pin: `TauCeti.GLSymplectic l R` with `mem_iff`, `mem_iff'`, `map`,
  `symJ`, `mulEquivSymplecticGroup`, the Levi embedding `TauCeti.GLSymplectic.leviHom`, the
  unipotent subgroups `upperUnipotent`/`lowerUnipotent` and the generation theorems of
  `TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Symplectic.*`; the symplectic multiplier
  lemmas `TauCeti.Matrix.det_eq_of_transpose_mul_J_mul_eq_smul` of
  `TauCeti.LinearAlgebra.Matrix.SymplecticMultiplier`; the degree-one Hecke theory of
  `TauCeti.NumberTheory.HeckeRing.*` and `TauCeti.NumberTheory.ModularForms.HeckeSlash.*`; the
  newforms `HeckeRing.GL2.Newform` with their Satake parameters
  `HeckeRing.GL2.Newform.satakeParameters` (`TauCeti.NumberTheory.ModularForms.Newforms.Satake`),
  their `L`-functions (`TauCeti.NumberTheory.ModularForms.LFunction.*`), the level-one graded
  ring `TauCeti.ModularForm.mvPolynomialEquivModularForms`, and the normalized Eisenstein
  series `TauCeti.EisensteinSeries.normalizedCharEisensteinSeriesMF`.
- From the [modular-forms roadmap](../ModularForms/README.md): its *Layer 2* Hecke operators
  `Tₙ` on `M_k(Γ₁(N))`, its *Layer 4* newforms, its *Layer 7* `L`-function `L(s, f)` with Euler
  product, and its *Layer 9* Satake parameters `{α_p, β_p}`; every degree-one object below is
  one of these, named, and never redefined.
- From the [theta-series roadmap](../ThetaSeries/README.md): the real lattice model (its
  *Layer 2*: `IsIntegral`, `IsEven`, the `level` of its 2E; the discriminant character `χ_L` of
  its 6F, a `DirichletCharacter ℂ (level L)`), its *Layer 1* Poisson summation `poissonSummation`
with `gaussian` and
  `fourier_gaussian`, and its degree-one theta series `thetaSeries L` (*Layer 3*) with the two
  modularity theorems (*Layers 5 and 7*). The degree-`g` theta series of Layer 5 below is the
  `g`-variable generalization of that object and specializes to it at `g = 1`.
- From the [integral quadratic forms and lattices roadmap](../IntegralLattices/README.md): its
  *Layer 2* Minkowski reduction of positive definite forms, the input to Siegel's fundamental
  domain (3.3).
- From the `L`-functions roadmap `LFunctions`: its *Layer 0* records `AnalyticLFunctionData`
  and `ArithmeticLFunctionData` with `NormalizationTranslation`; 8.5 fills these records and
  adds no competing `L`-function card.
- From the [classical groups, part II roadmap](../ClassicalGroupsPartII/README.md): its CG.0.1
  symplectic similitude group, whose points over a commutative algebra `A` of a field of
  characteristic zero are the `h ∈ GL_{2g}(A)` with `h J hᵀ = ν(h) J` for a unit `ν(h) ∈ Aˣ`,
  with the multiplier `ν` (a homomorphism, unique for `g ≥ 1`) and the fibre `ν = 1` equal to
  `Sp_{2g}`. Its `J = [[0, 1], [−1, 0]]` is the negative of Mathlib's `J` under the reindexing
  `Fin g ⊕ Fin g ≃ Fin (2g)`, which changes neither the group nor `ν`. 0.2 takes the subgroup of
  `R`-points with `ν > 0` for an ordered field `R`; its multiplier `μ` is `ν` restricted there,
  and no second multiplier is defined here.
- From the [metaplectic groups, Weil representations and automorphic theta kernels
  roadmap](../MetaplecticAutomorphicForms/README.md):
  its 6.18 `jacobiSpace` at the Jacobi lattice `SL₂(ℤ) ⋉ ℤ²`, integral index `m ≥ 1`, weight `k`
  and trivial multiplier, holomorphic in `τ` with the cusp condition, which is the carrier
  `J_{k,m}` on which 9.2–9.6 are stated, read in the classical form of the sibling
  `HalfIntegralWeightModularForms` 6.1; and its 6.20 `jacobi_thetaDecomposition`, the theta
  decomposition of 9.2 and 9.5. Four of its objects are identified with objects here by
  comparison milestones stated in prose: its 8.10 degree-two Siegel space is `ℍ[2]` (0.3 below
  states the identity of the two subtypes); its 8.11–8.12 positive similitudes and their action
  are `GSp⁺₄(ℝ)` acting as in 0.4; its 8.18 genus-two theta series `θ^a_ν(Z, W)` at `W = 0`,
  `ν = 0` is the degree-two theta series of the rank-one lattice `√(2a) ℤ` of 5.1; its 8.19
  half-integral matrix dictionary is the degree-two case of 2.1. Its genuine (half-integral
  weight) Siegel Eisenstein series (8.76–8.80) and its Whittaker analysis are not objects of this
  roadmap.
- From the [q-series, partition statistics and mock modular forms
  roadmap](../QSeriesPartitionsAndMockModularForms/README.md):
  its §9.1 classical theta-component coordinates
  `θ_{m,μ}(τ, z) = ∑_{r ≡ μ (2m)} e(r²τ/(4m) + rz)`, with their identification with `jacobiTheta₂`
  at rescaled arguments and the invariance under `μ ↦ μ + 2m`: the coordinates of the theta
  decomposition in 9.2.
- From the sibling `HalfIntegralWeightModularForms`: the classical form of the carrier `J_{k,m}`
  (its 6.1: the comparison of MetaplecticAutomorphicForms 6.18's specialization with
  Eichler–Zagier's two laws and Fourier condition, the dependence of `c(n, r)` on `4nm − r²`, the
  cusp subspace); the half-integral-weight components `h_μ` of the theta decomposition (6.2);
  the Hecke-equivariant isomorphism `J_{k,1} ≅ M⁺_{k−1/2}(Γ₀(4)) ≅ M_{2k−2}(SL₂(ℤ))` (6.3,
  Eichler–Zagier's theta decomposition and Kohnen's isomorphism), consumed by 9.2 for the
  dimension count and by 9.5 as the identification of the Jacobi eigenvalue system of
  `φ ∈ J_{k,1}` with that of a degree-one eigenform `f ∈ M_{2k−2}(SL₂(ℤ))`; and the
  Skoruppa–Zagier correspondence for `J^{cusp}_{k,N}`, `N > 1` (6.4), consumed by the statement
  of the Gritsenko lift (9.6). No Jacobi carrier is declared here, in prose or in `Suggested.lean`.

### Not owned here

- The algebraic symplectic similitude group, its coordinate Hopf algebra, its multiplier and its
  representations: `ClassicalGroupsPartII`.
- Half-integral weight Siegel modular forms, the theta multiplier, the Kohnen plus space and the
  Shimura lift: `HalfIntegralWeightModularForms`. The Jacobi forms `J_{k,m}` of every index
  `m ≥ 1` as spaces: the carrier and the theta decomposition are `MetaplecticAutomorphicForms`'
  (6.18, 6.20), their classical form, half-integral components and dimension formula are
  `HalfIntegralWeightModularForms`' (6.1–6.3). This roadmap states on that carrier only the
  Jacobi Eisenstein series, the operators `V_l` and the Maass lift.
  Theta constants appear here (5.4) only as holomorphic functions whose products with an
  *even number of factors* (integral weight) are modular; no half-integral-weight
  transformation law is stated.
- The metaplectic cover, the Weil representation, theta kernels and theta lifts, the
  Siegel–Weil formula, Jacobi Eisenstein series of Bump–Friedberg–Hoffstein and genuine
  Eisenstein series: `MetaplecticAutomorphicForms`.
- The Siegel moduli space `A_g`, its toroidal and minimal compactifications, the
  `q`-expansion principle and geometric Siegel modular forms as sections of automorphic
  bundles: `PELModuli` (M5 `siegelModuli`, M6 `siegelStack`), `ShimuraCompactifications` (C4–C5)
  and `AutomorphicBundles`. Everything here is a holomorphic function on `ℍ_g`; the
  identification of `Γ_g \ ℍ_g` with `A_g(ℂ)` is theirs.
- The adelic theory: automorphic representations of `GSp₄`, Arthur's classification and the
  automorphic type letters (F, P, Q, B, Y, G) of the LMFDB, local newform theory as a theorem
  about representations of `GSp₄(ℚ_p)`, and the local factors at primes dividing the level.
  10.4 states the Roberts–Schmidt theorem as the classical consequence this roadmap consumes,
  by citation.
- Abelian surfaces, their conductors and `L`-functions, genus-two curves and their Jacobians:
  the sibling `HyperellipticCurves` (for the `g2c` section) and the abelian-variety roadmaps.
  The paramodular conjecture (10.6) is stated here on the modular side as a predicate
  `IsParamodularPartner` on a newform and a family of local Euler factors; the abelian-variety
  side supplies the Euler factors.
- The classification of abelian surfaces by endomorphism algebra and the Sato–Tate groups:
  `SatoTateGroups`.
- Degree-one theta series with harmonic coefficients, spherical designs and Venkov's theorem: the
  sibling `LatticePackingsAndPerfectForms` (its Layer 5); 5.3 specializes to its 5.6 at `g = 1`.
- Label components beyond the intrinsic prefix, orderings fixed by convention, stored lists, and
  the completeness of database tables are not targets: the LMFDB label index, the ordering of
  Galois orbits within a space, sample names. Layer 11 states only the
  intrinsic label prefix `g.F.N.k.j` and the invariants a search can filter on.
- Dimension formulas for `S_k(Γ_g)` with `g ≥ 3` beyond the statements the LMFDB records
  (Tsuyumine's degree-three ring, Poor–Yuen's degree-four weights `k ≤ 16`), Harder's
  conjecture, and the geometry of `A_2` (the Igusa quartic, cohomology, point counts).

The [theta-series roadmap](../ThetaSeries/README.md) records the boundary from its side
("Siegel and Jacobi theta series" are not owned there), the
[integral quadratic forms and lattices roadmap](../IntegralLattices/README.md) excludes
alternating lattices and Siegel modular forms from its carrier, and the
[modular-forms roadmap](../ModularForms/README.md) states no degree-two object.

## Pinned conventions

Decide these once; the two normalizations of the Hecke action, the two orientations of the
coset representatives in the coefficient formula, and the three normalizations of `χ₁₀` in the
literature are each a source of silent error.

| Object | Convention |
|---|---|
| Index type | All `2g × 2g` matrices are indexed by `Fin g ⊕ Fin g`, matching Mathlib's `Matrix.J` and Tau Ceti's `GLSymplectic`; the blocks are `Matrix.toBlocks₁₁ … toBlocks₂₂`, written `A, B, C, D`. The `Fin (2g)` presentation is reached only through `TauCeti.GLSymplecticFin.mulEquivGLSymplectic` and is never a carrier. |
| The symplectic form | Mathlib's `J = fromBlocks 0 (−1) 1 0`; `M ∈ Sp` means `M J Mᵀ = J` (`GLSymplectic.mem_iff`), equivalently `Mᵀ J M = J` (`mem_iff'`). The group is the same as for the classical `[[0, 1], [−1, 0]]`; no second `J` is introduced. |
| `Sp_{2g}(R)` | `TauCeti.GLSymplectic (Fin g) R`, a subgroup of `GL (Fin g ⊕ Fin g) R`. `Sp_{2g}(ℤ)` acts through `GLSymplectic.map (Int.castRingHom ℝ)`, and `Γ_g` denotes its image, a subgroup of `Sp_{2g}(ℝ)`. Arithmetic subgroups are subgroups of `Sp_{2g}(ℝ)`, as Mathlib's degree-one groups are subgroups of `GL (Fin 2) ℝ`. |
| Similitudes | `GSp⁺_{2g}(R)` is the subgroup of `GL (Fin g ⊕ Fin g) R` of `M` with `M J Mᵀ = μ • J` for some `0 < μ`: the `R`-points of `ClassicalGroupsPartII` CG.0.1's similitude group with positive multiplier. `μ = μ(M)` is CG.0.1's **multiplier** `ν(M)`, a homomorphism to `R_{>0}` on `GSp⁺_{2g}(R)` with kernel `Sp_{2g}(R)`; `Suggested.lean` declares no multiplier and states every law through the defining equation `M J Mᵀ = μ • J`. The semigroup `O_g(m)` is `{M ∈ GSp⁺_{2g}(ℚ) : M integral, μ(M) = m}`. |
| `ℍ_g` | `{τ ∈ Sym g : (τ.map im).PosDef}` as a subtype of the complex vector space `Sym g` of symmetric matrices, with the subspace topology and the charted-space structure of an open subset (as `UpperHalfPlane.Manifold`); **holomorphic** (`Holomorphic f`) means `DifferentiableOn ℂ` of the zero extension of `f` on the open subset `ℍ_g ⊆ Sym g`, which is the holomorphy of `f` and avoids a second topology on the model space (for `g = 1` it is Mathlib's `MDifferentiable 𝓘(ℂ) 𝓘(ℂ)`). Positivity is strict; `τ = X + iY` with `X = τ.re`, `Y = τ.im` real symmetric. |
| The action | `γ • τ = (Aτ + B)(Cτ + D)⁻¹` for `γ ∈ GSp⁺_{2g}(ℝ)`, a left action; `Im(γ • τ) = μ(γ) (C τ̄ + D)⁻ᵀ Y (Cτ + D)⁻¹`. `Sp_{2g}(ℚ)` and `Γ_g` act through their images in `GSp⁺_{2g}(ℝ)`. |
| Weights | A weight is a **holomorphic** finite-dimensional representation `ρ : GL_g(ℂ) → GL(V)`: `Representation ℂ (GL (Fin g) ℂ) V` on a finite-dimensional normed `ℂ`-space whose matrix coefficients are holomorphic on the open set of invertible matrices. Scalar weight `k` is `det^k`. For `g = 2`, `ρ_{k,j} := Sym^j(std) ⊗ det^k`, realized on the homogeneous polynomials of degree `j` in `ℂ[X₀, X₁]` with `A` acting by the substitution `X_i ↦ ∑_l A_{l i} X_l` and the scalar `(det A)^k`; as a normed space the carrier is the coefficient vectors `Fin (j + 1) → ℂ` in the monomial basis `X₀^{j−i} X₁^i` (sup norm), so that the Lean carrier of a weight is always a normed space and the polynomial picture is the definition of the action; its highest weight is `(k + j, k)`, and `(k, j)` is the LMFDB weight. The exponent `e(ρ) := ∑ λ_i − g(g+1)/2` of a weight with highest weight `(λ_1 ≥ … ≥ λ_g)` is `gk − g(g+1)/2` for `det^k` and `2k + j − 3` for `ρ_{k,j}`. |
| Slash operators | For `γ ∈ Sp_{2g}(ℝ)`: `(f ∣_ρ γ)(τ) = ρ(Cτ + D)⁻¹ f(γ • τ)`. For `γ ∈ GSp⁺_{2g}(ℚ)` and an integer `e`: `(f ∣_{ρ,e} γ)(τ) = μ(γ)^e ρ(Cτ + D)⁻¹ f(γ • τ)`, and the Hecke operators use `e = e(ρ)`; this is the knowl's normalization `r(α)^{∑λ_i − g(g+1)/2}`, and for `g = 1`, `k ≥ 1` it is Mathlib's `ModularForm.slash` with its `det^{k−1}`. Right action: `f ∣ (γδ) = (f ∣ γ) ∣ δ`. |
| Modular forms | `M_ρ(Γ)` for an arithmetic `Γ ≤ Sp_{2g}(ℝ)`: holomorphic `f : ℍ_g → V` with `f ∣_ρ γ = f` for `γ ∈ Γ` **and** bounded on every Siegel domain `{Im τ ≥ c·1}` after every slash by `Sp_{2g}(ℚ)` — a structure field, as in Mathlib's `ModularForm`. Koecher's principle (2.4) is the theorem that for `g ≥ 2` the boundedness field follows from the other two, so the constructor `ofInvariant` discharges it; for `g = 1` it is the usual condition at the cusps. Forms with a character `ψ : Γ →* ℂˣ` satisfy `f ∣_ρ γ = ψ(γ) f`. |
| Fourier expansion | For `f` invariant under `τ ↦ τ + S`, `S` integral symmetric, `f(τ) = ∑_T a(T) e(tr(Tτ))` over **half-integral** `T` (symmetric, integral diagonal, `2T` integral; `Matrix.PosSemidef` for `T ≥ 0`), `e(x) = exp(2πix)`, with `a(T) = ∫_{X mod 1} f(X + iY) e(−tr(T(X + iY))) dX`. For translation lattice `N·Sym_g(ℤ)` the index runs over `(1/N)`-half-integral matrices and the character is `e(tr(Tτ)/N)`; `fourierCoeff N f T` is that coefficient. In degree two `T = [[n, r/2], [r/2, m]]` is written `(n, r, m)`, with discriminant `4nm − r²` (the LMFDB's `det(F)`, which is `det(2T)`) and content `gcd(n, r, m)`. |
| `Φ` and cusp forms | `(Φf)(τ') = lim_{t→∞} f(diag(τ', it))`; `f` is a **cusp form** when `Φ(f ∣_ρ γ) = 0` for every `γ ∈ Sp_{2g}(ℚ)`; for `Γ = Γ_g` this is `a(T) = 0` for every singular `T` (3.2). |
| Hecke operators | `T(m) f = ∑_{γ ∈ Γ_g \ O_g(m)} f ∣_{ρ, e(ρ)} γ`, and `T(p) = Γ_g diag(1_g, p1_g) Γ_g`, `T_i(p²) = Γ_g diag(1_{g−i}, p1_i, p²1_{g−i}, p1_i) Γ_g`, `T(p²) = ∑_i T_i(p²)`. With this normalization the eigenvalue of `T(p)` on a normalized eigenform of `M_k(SL₂(ℤ))` is `a_p`, and on `E_k^{(g)}` it is `∏_{i=1}^{g}(1 + p^{k−i})`. The degree-two coefficient formula (7.5) uses the representatives `R_p = {[[1,0],[0,p]]} ∪ {[[p, j],[0, 1]] : 0 ≤ j < p}` with `T[U] = UᵀTU`; the lower-triangular family `[[p,0],[j,1]]` gives a **different, wrong** operator. |
| Satake parameters | `(α₀, α₁, …, α_g) ∈ (ℂˣ)^{g+1}` modulo the Weyl group `W = S_g ⋉ (ℤ/2)^g`, in the arithmetic normalization: `λ(p) = α₀(1 + σ₁ + … + σ_g)` with `σ_i` the elementary symmetric functions of `α₁, …, α_g`, and `α₀² α₁ ⋯ α_g = p^{∑λ_i − g(g+1)/2}` (van der Geer §19). For `E_k^{(g)}`: `α₀ = 1`, `α_i = p^{k−i}`. |
| `L`-functions | Spinor: `L(s, F, spin) = ∏_p Q_p(p^{−s})⁻¹` with `Q_p(X) = (1 − α₀X) ∏_{∅ ≠ I ⊆ {1..g}} (1 − α₀ α_I X)`, degree `2^g`. Standard: `L(s, F, st) = ∏_p [(1 − X) ∏_{i=1}^{g} (1 − α_i X)(1 − α_i⁻¹ X)]⁻¹` at `X = p^{−s}`, degree `2g + 1`. In degree two, weight `(k, j)`: `Q_p(X) = 1 − λ(p)X + (λ(p)² − λ(p²) − p^{2k+j−4})X² − λ(p)p^{2k+j−3}X³ + p^{4k+2j−6}X⁴`, the motivic weight is `w = 2k + j − 3`, and the functional equation relates `s` and `w + 1 − s = 2k + j − 2 − s` (center `s = k + j/2 − 1`; for `χ₁₀`, `s = 9`). The arithmetic normalization is primary; the analytic one is reached through `LFunctions`' `NormalizationTranslation` with weight `w`. |
| Igusa's generators | `ψ_k := E_k^{(2)}` with constant term `1`. `χ₁₀` and `χ₁₂` are the cusp forms normalized by `a((1,1,1)) = 1`; **Igusa's** `χ₁₀`, `χ₁₂` are `−¼` and `1/12` times these (verified from the Maass–Cohen formula: `−43867·2^{−12}3^{−5}5^{−2}7^{−1}53^{−1}(ψ₄ψ₆ − ψ₁₀)` has `a((1,1,1)) = −1/4`), and the LMFDB's `C = −4χ₁₀`, `D = 12χ₁₂` are the forms pinned here. `χ₃₅` is normalized by `a((2,1,3)) = 1`; its coefficients vanish at every `T` with `r = 0` or `n = m`, and `(2, ±1, 3)`, `(3, ±1, 2)` are its first nonzero ones, with `a((2,−1,3)) = a((3,1,2)) = −1`. |
| Theta series | For a positive definite real lattice `L ⊆ E` in the [theta-series roadmap](../ThetaSeries/README.md)'s model, `θ_L^{(g)}(τ) = ∑_{v ∈ L^g} exp(π i tr(Gram(v) τ))` with `Gram(v)_{ij} = ⟪v_i, v_j⟫`; for even `L` the coefficient at `T` is `#{v ∈ L^g : Gram(v) = 2T}`. At `g = 1` this is `thetaSeries L`. |
| Paramodular group | `K(N) = Stab_{Sp₄(ℚ)}(ℤ ⊕ ℤ ⊕ ℤ ⊕ Nℤ)` (column vectors), equal to the matrices of the entrywise shape `[[*, N*, *, *], [*, *, *, */N], [*, N*, *, *], [N*, N*, N*, *]]` in `Sp₄(ℚ)` with `* ∈ ℤ`; `K(1) = Γ₂`. Weight `(k, j)` forms on `K(N)` are automorphic under the image of `K(N)` in `Sp₄(ℝ)`; the paramodular Fricke involution is `μ_N = m(A_N) = diag(A_N, A_Nᵀ)` with `A_N = [[0, √N], [1/√N, 0]]`, i.e. `μ_N = [[0, √N, 0, 0], [1/√N, 0, 0, 0], [0, 0, 0, 1/√N], [0, 0, √N, 0]]`, which normalizes `K(N)` (it carries the lattice `ℤ ⊕ ℤ ⊕ ℤ ⊕ Nℤ` to a multiple of its `J`-dual) and satisfies `μ_N² = 1`; on `ℍ[2]` it acts by `(τ', z, τ'') ↦ (Nτ'', z, τ'/N)`. |
| Jacobi forms | `J_{k,m}` is `MetaplecticAutomorphicForms` 6.18's `jacobiSpace` at `SL₂(ℤ) ⋉ ℤ²`, index `m`, weight `k`, trivial multiplier, holomorphic with the cusp condition, read in the classical form of the sibling `HalfIntegralWeightModularForms` 6.1: functions on `ℍ × ℂ` with Eichler–Zagier's two transformation laws and `c(n, r) = 0` unless `4nm − r² ≥ 0`; for `m = 1`, `c(n, r)` depends only on `4n − r²`. No Jacobi space of any index is defined here. |
| Label prefix | `g.F.N.k.j` with `g` the degree, `F` the family (`Sp4Z`, `Sp4Z_2`, `Sp4Z_j`, `Gamma0_2`, `Gamma0_3`, `Gamma0_3_psi_3`, `Gamma0_4`, `Gamma0_4_psi_4`, `Gamma1_2`, `Gamma_2`, `Kp`, `Sp6Z`, `Sp8Z`), `N` the level and `(k, j)` the weight; the orbit letters and sample names are not part of the API. |

## What Mathlib supplies

- `Mathlib/LinearAlgebra/SymplecticGroup.lean`: `Matrix.J`, `Matrix.symplecticGroup` (a
  submonoid with a hand-built group structure), `SymplecticGroup.mem_iff`, `mem_iff'`,
  `neg_mem`, `transpose_mem`, `inv_eq_symplectic_inv`, `det_eq_one`.
- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosDef`, `Matrix.PosSemidef`,
  `PosDef.det_pos`, `PosDef.isUnit`, `posDef_iff_dotProduct_mulVec`; `Matrix/Symmetric.lean`
  and `Matrix/Hermitian.lean`: `IsSymm`, `IsSymm.map`, `isHermitian_iff_isSymm` (for `ℝ`,
  Hermitian is symmetric).
- `Mathlib/Data/Matrix/Block.lean`: `fromBlocks`, `toBlocks₁₁ … toBlocks₂₂`,
  `fromBlocks_multiply`; `Mathlib/Analysis/Matrix/Normed.lean`: `Matrix.normedAddCommGroup`,
  `Matrix.normedSpace` (local instances; every norm on `Sym g` gives the same holomorphic
  functions).
- `Mathlib/Geometry/Manifold/*`: `IsOpenEmbedding.singletonChartedSpace`, `MDifferentiable`,
  `modelWithCornersSelf`; `Mathlib/Analysis/Complex/UpperHalfPlane/{Basic,Topology,Manifold}.lean`
  is the degree-one model of 0.3.
- `Mathlib/NumberTheory/ModularForms/*`: `ModularForm`, `CuspForm`, `SlashAction`,
  `ModularForm.slash`, `CongruenceSubgroup.Gamma/Gamma0/Gamma1`, `IsArithmetic`,
  `Subgroup.HasDetOne`, `qExpansion`, `EisensteinSeries.E`, `CuspForm.discriminant`, the
  level-one dimension formula and Sturm bound; `JacobiTheta/TwoVariable.lean`: `jacobiTheta₂`
  (the rank-one, degree-one theta with characteristics of 5.4).
- `Mathlib/NumberTheory/HeckeRing/Defs.lean`: `IsHeckeTriple`, `HeckeCoset`, `HeckeCosetModule`,
  `HeckeRing`; `Mathlib/GroupTheory/Commensurable.lean`: `Subgroup.Commensurable`;
  `Mathlib/GroupTheory/Coset/Defs.lean`: `QuotientGroup.rightRel`.
- `Mathlib/RepresentationTheory/Basic.lean`: `Representation`;
  `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean` and `WeightedHomogeneous.lean`:
  `homogeneousSubmodule`, `IsWeightedHomogeneous`; `Mathlib/Algebra/MvPolynomial/Basic.lean`:
  `aeval` (the linear substitution of 1.1).
- `Mathlib/NumberTheory/LSeries/*`, `ArithmeticFunction`, `EulerProduct/*`,
  `DirichletCharacter/*` with `DirichletCharacter.LFunction` at negative integers (Cohen's
  function, 4.2); `Mathlib/NumberTheory/Bernoulli.lean`.

Mathlib has no Siegel upper half-space, no symplectic action on it, no vector-valued modular
form, no Siegel modular form of any degree `≥ 2`, no Siegel Eisenstein series, no Hecke
operator on Siegel modular forms, and no paramodular group.

## What Tau Ceti supplies

- `TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Symplectic.Basic`: `TauCeti.GLSymplectic l R`
  as a subgroup of `GL (l ⊕ l) R`, `GLSymplectic.mem_iff`, `mem_iff'`, `ofSymplecticGroup`,
  `mulEquivSymplecticGroup`, `symJ`, `map`; `TauCeti.GLSymplecticFin m R` with
  `mulEquivGLSymplectic`. `…/Symplectic/Levi.lean`: `leviHom : GL l R →* GLSymplectic l R`
  (`A ↦ diag(A, A⁻ᵀ)`). `…/Symplectic/UnipotentGeneration.lean`: `upperUnipotent B`
  (`[[1, B], [0, 1]]` for symmetric `B`), `lowerUnipotent`, and the generation theorems
  `eq_top_of_root_subgroups` (`TorusGeneration.lean`), which give the generators of `Γ_g`
  used in 0.6 and 5.2. `TauCeti.LinearAlgebra.SymplecticGroup`: `fromBlocks_upper_mem`,
  `fromBlocks_lower_mem`, `fromBlocks_diagonal_mem`, `transpose_eq_J_conj_inv`.
- `TauCeti.LinearAlgebra.Matrix.SymplecticMultiplier`: `transpose_mul_J_mul_eq_det_smul`,
  `det_eq_of_transpose_mul_J_mul_eq_smul` (`Mᵀ J M = d J ⟹ det M = d^g`), the multiplier
  lemmas of 0.2.
- `TauCeti.Topology.Algebra.SymplecticGroup`: `isClosed_symplecticGroup`, `isClosed_GLSymplectic`.
- The degree-one theory at the pin: `TauCeti.NumberTheory.HeckeRing.*` (the abstract Hecke
  ring with its convolution product, the `GL_n` and `GL₂` double-coset theory),
  `TauCeti.NumberTheory.ModularForms.HeckeSlash.*` (`Tₙ` on `M_k(Γ₁(N))`),
  `…ModularForms.Newforms.Newform` (`HeckeRing.GL2.Newform`, `EigenformAwayFromLevel`),
  `…Newforms.Satake` (`satakeParameters`, `satakeAngle`), `…ModularForms.LFunction.*`
  (`ModularForm.LSeries_qExpansion_coeff_eq`, `CuspForm.hasEntireExtension_qExpansion_coeff`,
  the Euler product and functional equation), `…LevelOne.GradedRing`
  (`mvPolynomialEquivModularForms`), `…EisensteinSeries.Normalized`
  (`normalizedCharEisensteinSeriesMF`), `…ModularForms.FiniteDimensional`,
  `…ModularForms.SturmBound`, `…ModularForms.Petersson.*`.
- `TauCeti.LinearAlgebra.IntegralLattice.*` and `TauCeti.NumberTheory.IntegralLattice.*`: the
  rational lattice carrier and, on Tau Ceti main,
`TauCeti.NumberTheory.ModularForms.ThetaSeries.Basic`
  (`thetaSeries`, `thetaCoset`, their summability and locally uniform convergence) and
  `TauCeti.NumberTheory.ModularForms.JacobiTheta.OneVariable`, the landed part of the
  theta-series roadmap, which 5.1 generalizes to degree `g`.
- `TauCeti.AlgebraicGeometry.AbelianVariety.Basic`: the abelian-variety carrier that the
  prose statement of the paramodular conjecture (10.6) refers to.

## What is missing (build here)

The positive similitude group and the Siegel upper half-space with its action; holomorphic weights
and slash operators; Siegel modular forms of degree `g ≥ 2` with and without character; Fourier
expansions over half-integral matrices, Koecher's principle, the coefficient bounds and
singular forms; the `Φ`-operator, cusp forms, the Petersson product, Siegel's fundamental
domain and finite dimensionality; Siegel and Klingen Eisenstein series and the degree-two
Maass–Cohen coefficient formula; degree-`g` theta series of lattices, pluriharmonic theta
series and theta constants; `ψ₄, ψ₆, χ₁₀, χ₁₂, χ₃₅` and Igusa's theorem; Satoh's module,
Tsushima's formula and the `Γ(2)`, `Γ₀(2)`, `Γ₀(3)`, `Γ₀(4)` rings; the Hecke algebra of
`(Γ_g, GSp⁺_{2g}(ℚ))`, its action, eigenforms, Satake parameters and the degree-two
coefficient formula; spinor and standard `L`-functions; the Fourier–Jacobi expansion, the Jacobi
Eisenstein series and `V_l`, the Maass lift and the Saito–Kurokawa theorem, and the statements of
the Gritsenko, Ikeda and Miyawaki lifts; paramodular groups, forms, level raising, newforms, the
Roberts–Schmidt and Poor–Yuen statements and the paramodular conjecture; the LMFDB invariants.

---

## Layer 0: symplectic groups and the Siegel upper half-space

Everything is stated for arbitrary `g ≥ 1`; `g = 1` recovers `SL₂` and Mathlib's `ℍ`, and
every milestone of this layer carries that comparison as an acceptance test.

### 0.1 The symplectic group in block coordinates

For a commutative ring `R`, `Sp_{2g}(R) := TauCeti.GLSymplectic (Fin g) R`. Prove the block
form of membership: `M = [[A, B], [C, D]]` lies in `Sp_{2g}(R)` iff `A Bᵀ = B Aᵀ`,
`C Dᵀ = D Cᵀ`, `A Dᵀ − B Cᵀ = 1`, iff `Aᵀ C = Cᵀ A`, `Bᵀ D = Dᵀ B`, `Aᵀ D − Cᵀ B = 1`
(van der Geer, Exercise 2.1); the inverse `M⁻¹ = [[Dᵀ, −Bᵀ], [−Cᵀ, Aᵀ]]`; `det M = 1`
(`SymplecticGroup.det_eq_one`, a bridge check); the elements `J`, `n(S) = [[1, S], [0, 1]]`
for symmetric `S` (`upperUnipotent`), `m(U) = diag(U, U⁻ᵀ)` for `U ∈ GL_g(R)` (`leviHom`);
and the generation of `Γ_g = Sp_{2g}(ℤ)` by `J` and the `n(S)`, `S` integral symmetric (van der
Geer, Exercise 2.2), derived from Tau Ceti's root-subgroup generation theorems over `ℤ` or
proved directly by the Euclidean algorithm on the last row. For `g = 1`,
`GLSymplectic (Fin 1) R ≃* SL(2, R)` (as `Matrix.SpecialLinearGroup`), the comparison every
subsequent `g = 1` check routes through.

*Prerequisites:* Tau Ceti `GLSymplectic.mem_iff`, `mem_iff'`, `upperUnipotent`, `leviHom`,
`eq_top_of_root_subgroups`; Mathlib `SymplecticGroup.det_eq_one`, `fromBlocks_multiply`.

For `g = 1` the comparison `GLSymplectic (Fin 1) R ≃* SL(2, R)` (through `Fin 1 ⊕ Fin 1 ≃ Fin 2`)
is specified in this README only.

**Checks.**

- At `g = 1` the condition `M J Mᵀ = J` is `det M = 1`: the comparison is a bijection onto
  `Matrix.SpecialLinearGroup (Fin 2) R`.
- `J = [[0, −1], [1, 0]]` maps to Mathlib's `ModularGroup.S`, and `n(1) = [[1, 1], [0, 1]]` to
  `ModularGroup.T`.
- `diag(2, 1/2)` lies in `Sp₂(ℚ)` and maps to itself; `diag(1, −1)` (determinant `−1`) is rejected.

### 0.2 Symplectic similitudes

For a linearly ordered field `R` (of characteristic zero, so a `ℚ`-algebra), consume
`ClassicalGroupsPartII` CG.0.1's similitude group: its `R`-points are the
`M ∈ GL (Fin g ⊕ Fin g) R` with `M J Mᵀ = ν(M) J` for a unit `ν(M)` (CG.0.1's `J` is `−J`, which
changes neither the condition nor `ν`), the multiplier `ν` is a homomorphism, unique for `g ≥ 1`,
and its fibre `ν = 1` is `Sp_{2g}(R)`. Define `GSp⁺_{2g}(R)` as the subgroup of these `M` with
`ν(M) > 0`, and write `μ` for `ν` restricted to it, a homomorphism `GSp⁺_{2g}(R) →* R_{>0}` with
kernel `Sp_{2g}(R)`. Prove: `det M = μ(M)^g` (Tau Ceti's
`det_eq_of_transpose_mul_J_mul_eq_smul`, applied to `Mᵀ J M = μ(M) J`, which is equivalent to
`M J Mᵀ = μ(M) J` for invertible `M`); positive scalars `c·1` have `μ = c²`;
`M^∨ := μ(M) M⁻¹ = [[Dᵀ, −Bᵀ], [−Cᵀ, Aᵀ]]` is an anti-involution with `μ(M^∨) = μ(M)`;
`diag(1_g, m 1_g)` has multiplier `m`. Define the semigroup `O_g(m) ⊆ GSp⁺_{2g}(ℚ)` of integral
matrices of multiplier `m` and the embeddings
`Sp_{2g}(ℤ) → Sp_{2g}(ℚ) → GSp⁺_{2g}(ℚ) → GSp⁺_{2g}(ℝ)`.
⚠ `diag(1_g, −1_g)` satisfies the relation with `μ = −1` and is excluded; `GSp⁺` is connected
through the positivity of `μ`, not through `det`, which is `μ^g` and so positive for every
sign of `μ` when `g` is even.

*Prerequisites:* 0.1; `ClassicalGroupsPartII` CG.0.1; Tau Ceti `SymplecticMultiplier`.

### 0.3 The Siegel upper half-space

Define `Sym g := {τ : Matrix (Fin g) (Fin g) ℂ // τ.IsSymm}` as a `ℂ`-submodule of the matrix
space with the sup norm (a local instance; finite dimension `g(g+1)/2`), and
`ℍ[g] := {τ : Sym g // ((τ : Matrix) .map Complex.im).PosDef}`. Prove: `ℍ[g]` is open in `Sym g`
(positive definiteness is open), so the coercion is an open embedding and `ℍ[g]` carries the
charted-space and manifold structure `IsOpenEmbedding.singletonChartedSpace`; `τ.im` and `τ.re`
are real symmetric with `τ.im.PosDef`, hence `det(Im τ) > 0` (`PosDef.det_pos`, a bridge
check); the base point `i·1_g ∈ ℍ[g]`; `ℍ[g]` is contractible and connected (convex in `Sym g`:
the positive definite cone is convex); `τ ↦ −τ⁻¹` and `τ ↦ τ + S` for real symmetric `S`
preserve `ℍ[g]`; `diag(τ₁, τ₂) ∈ ℍ[g₁ + g₂]` for `τ_i ∈ ℍ[g_i]`, through `finSumFinEquiv`.
For `g = 1`, `ℍ[1] ≃ UpperHalfPlane` as topological spaces and as charted spaces, by
`τ ↦ τ 0 0`. The degree-two subtype `SiegelSpace` of `MetaplecticAutomorphicForms` 8.10 is
`ℍ[2]`: the same condition on the same matrices, so a consumer of both sees one type up to the
definitional unfolding of `Sym 2`. ⚠ `[[i, 1], [0, i]]` is not symmetric and `1_2` has
imaginary part `0`; neither is in `ℍ[2]`, and both are rejection tests.

*Prerequisites:* Mathlib `Matrix.PosDef`, `PosDef.det_pos`, `Matrix.normedAddCommGroup`,
`IsOpenEmbedding.singletonChartedSpace`, `UpperHalfPlane`.

### 0.4 The action of `GSp⁺_{2g}(ℝ)`

For `γ = [[A, B], [C, D]] ∈ GSp⁺_{2g}(ℝ)` and `τ ∈ ℍ[g]` prove `det(Cτ + D) ≠ 0`, define
`γ • τ := (Aτ + B)(Cτ + D)⁻¹`, and prove it symmetric with
`Im(γ • τ) = μ(γ) (C τ̄ + D)⁻ᵀ (Im τ) (Cτ + D)⁻¹`, hence in `ℍ[g]`; the `MulAction` laws;
continuity and holomorphy of `τ ↦ γ • τ`; that positive scalars act trivially, so the action
factors through `PGSp⁺`; that `−1` acts trivially; transitivity of `Sp_{2g}(ℝ)` with stabilizer
of `i·1_g` the group `{[[A, B], [−B, A]]} ≅ U(g)` (van der Geer §2); and that `Γ_g` acts
properly discontinuously. The formulas `J • τ = −τ⁻¹`, `n(S) • τ = τ + S`, `m(U) • τ = U τ Uᵀ`
are the three generator laws every subsequent transformation argument uses. For `g = 1` the action
is Mathlib's Möbius action under the comparison of 0.3.

*Prerequisites:* 0.2, 0.3; Mathlib `UpperHalfPlane.MoebiusAction`.

### 0.5 The automorphy factor

Define `j(γ, τ) := Cτ + D ∈ GL_g(ℂ)` (as `Matrix.GeneralLinearGroup.mkOfDetNeZero`), prove the
cocycle law `j(γδ, τ) = j(γ, δ • τ) j(δ, τ)`, `j(1, τ) = 1`, `j(−1, τ) = −1`, holomorphy in
`τ`, and `det j(γ, τ) ≠ 0`. The scalar cocycle is `det j(γ, τ)^k`; for `γ ∈ Sp_{2g}(ℝ)`,
`det(Im(γ • τ)) = |det j(γ, τ)|^{−2} det(Im τ)`, so `det(Im τ)^k |f(τ)|²` is the invariant
built from a weight-`k` form in 3.4.

*Prerequisites:* 0.4; Mathlib `mkOfDetNeZero`.

### 0.6 Arithmetic subgroups

Define, as subgroups of `Sp_{2g}(ℝ)`: `Γ_g` (the image of `Sp_{2g}(ℤ)`), `Γ_g(N)` (the kernel of
reduction modulo `N`), `Γ₀^{(g)}(N)` (`C ≡ 0 mod N`), `Γ₁^{(g)}(N)` (`C ≡ 0`, `A ≡ D ≡ 1 mod N`),
and the class `IsArithmetic Γ := Subgroup.Commensurable Γ Γ_g`, the exact analogue of Mathlib's
degree-one `IsArithmetic`. Prove `Γ_g(N)` normal of finite index,
`Γ_g(N) ≤ Γ₁^{(g)}(N) ≤ Γ₀^{(g)}(N)`,
that every subgroup containing some `Γ_g(N)` is arithmetic (a **congruence subgroup of level
`N`**, the knowl's definition), that `−1 ∈ Γ₀^{(g)}(N)` and `−1 ∈ Γ_g(N)` iff `N ≤ 2`, the
order of `Sp_{2g}(ℤ/N)` for prime `N` (`p^{g²} ∏_{i=1}^{g}(p^{2i} − 1)`), the index
`[Γ_g : Γ₀^{(g)}(p)] = ∏_{i=1}^{g}(1 + p^i)` (the number of Lagrangian subspaces of `𝔽_p^{2g}`:
`(1 + p)(1 + p²) = 15` for `g = 2`, `p = 2`), and for arithmetic `Γ` the **translation lattice**
`L_Γ := {S ∈ Sym_g(ℚ) : n(S) ∈ Γ}`, a lattice commensurable with `Sym_g(ℤ)`, with
`L_{Γ_g} = L_{Γ₀(N)} = Sym_g(ℤ)` and `L_{Γ_g(N)} = N·Sym_g(ℤ)`. For `g = 1` the three families
are Mathlib's `Gamma`, `Gamma0`, `Gamma1` under 0.1.

*Prerequisites:* 0.1; Mathlib `Subgroup.Commensurable`, `CongruenceSubgroup.*`.

### 0.7 Paramodular groups

For `g = 2` and `N ≥ 1` define `K(N) ≤ Sp₄(ℚ)` as the stabilizer of the lattice
`ℤ ⊕ ℤ ⊕ ℤ ⊕ Nℤ` of column vectors, and prove the entrywise description of the conventions
table (the three `N*` entries and the one `*/N` entry), `K(1) = Γ₂`, and that `K(N) ∩ Γ₂` is
the subgroup of `Γ₂` whose `(1,2)`, `(3,2)`, `(4,1)`, `(4,2)`, `(4,3)` entries are divisible by
`N`, of finite index in both `K(N)` and `Γ₂` (it contains `Γ₂(N)`, and
`[Γ₂ : K(p) ∩ Γ₂] = p³ + p² + p + 1` for a prime `p`, the number of hyperplanes of `𝔽_p⁴`, on
which `Sp₄(𝔽_p)` acts transitively), so `K(N)` (as a subgroup of `Sp₄(ℝ)`) is arithmetic;
`K(N) ⊄ Γ₂` for `N > 1` (the element `n(diag(0, 1/N))`); `−1 ∈ K(N)`; the translation lattice
`L_{K(N)} = {[[a, b], [b, c/N]] : a, b, c ∈ ℤ}`; and that the Fricke element `μ_N` of the
conventions table normalizes `K(N)` and is an involution (`μ_N² = 1`; `μ_N ∉ K(N)` for `N > 1`).
⚠ `diag(A_Nᵀ, A_N)`, the same matrix with the two blocks interchanged, does not normalize
`K(N)`: it carries `ℤ ⊕ ℤ ⊕ ℤ ⊕ Nℤ` to a multiple of `ℤ ⊕ Nℤ ⊕ N²ℤ ⊕ ℤ`, whose stabilizer is a
different conjugate of `K(N)`. In general degree define
`Γ^{para}(d) = δ Γ δ⁻¹` for `d = diag(d₁, …, d_g)` with `d_i ∣ d_{i+1}`,
`Γ = {γ ∈ GL_{2g}(ℤ) : γᵀ T γ = T}`, `T = [[0, d], [−d, 0]]`, `δ = diag(1_g, d)`, and prove
`K(N) = Γ^{para}(1, N)`
(the knowl `paramodulargroup.sp2gr`). The group `Γ` is the automorphism group of a polarized
symplectic lattice of type `d`; this roadmap uses only its image in `Sp_{2g}(ℚ)`.

*Prerequisites:* 0.2, 0.6.

## Layer 1: weights, slash operators, and the bundled forms

### 1.1 Holomorphic weights

Define `Weight g V` as a `Representation ℂ (GL (Fin g) ℂ) V` on a finite-dimensional normed
`ℂ`-space `V` whose matrix function `A ↦ ρ(A)` (extended by `0` off the units) is holomorphic
on the open set of invertible matrices; this is the "finite-dimensional complex representation"
of the knowl `mf.siegel`, restricted to the holomorphic ones so that slashing preserves
holomorphy. Construct `det^k` for `k : ℤ` (on `V = ℂ`), the tensor product and direct sum of
weights, and the dual; prove the standard facts about highest weights that the rest of the
roadmap quotes: an irreducible holomorphic weight is determined by `(λ₁ ≥ … ≥ λ_g) ∈ ℤ^g`, the
central character is `c ↦ c^{∑λ_i}`, and `ρ(−1) = (−1)^{∑λ_i}`. For `g = 2` construct
`ρ_{k,j}` on `MvPolynomial.homogeneousSubmodule (Fin 2) ℂ j` with `A` acting by
`MvPolynomial.aeval (fun i ↦ ∑_l A_{l i} • X_l)` (prove it preserves homogeneous degree and
is multiplicative) scaled by `(det A)^k`; prove `dim = j + 1`, highest weight `(k + j, k)`,
`ρ_{k,0} = det^k`, `ρ_{k,j}(−1) = (−1)^j`, and `ρ_{k,j} ⊗ ρ_{k',j'} ⊇ ρ_{k+k', j+j'}` through
polynomial multiplication (the ring structure of 1.3). ⚠ The highest weight is `(k + j, k)`,
not `(k, j)`: the LMFDB's "weight `(k, j)`" is the pair of the pinned convention, and
`e(ρ_{k,j}) = 2k + j − 3`.

*Prerequisites:* Mathlib `Representation`, `homogeneousSubmodule`, `aeval`, `det`.

### 1.2 Slash operators

Define `f ∣_ρ γ` for `γ ∈ Sp_{2g}(ℝ)` and `f ∣_{ρ,e} γ` for `γ ∈ GSp⁺_{2g}(ℚ)` as in the
conventions table, prove the right-action laws from the cocycle of 0.5, linearity in `f`,
`f ∣_ρ (−1) = ρ(−1)⁻¹ f`, preservation of holomorphy (here the holomorphy of `ρ` enters), and
the compatibility `f ∣_{ρ,e} γ = f ∣_ρ γ` for `γ ∈ Sp_{2g}(ℚ)`. For scalar weight write
`f ∣_k γ`. For `g = 1`, `k ≥ 1` and `e = k − 1`, `f ∣_{k, k−1} γ` is Mathlib's `f ∣[k] γ`
(`ModularForm.slash`), the bridge check of this layer. ⚠ `f ∣_{ρ,e}` with `e ≠ e(ρ)` is a
legitimate operator (it differs by the scalar `μ(γ)^{e − e(ρ)}`), and the Hecke operators of
Layer 7 are stated for `e = e(ρ)` only; nothing is proved about Hecke operators in another
normalization.

*Prerequisites:* 0.4, 0.5, 1.1; Mathlib `ModularForm.slash`.

### 1.3 Siegel modular forms

Define the structure `SiegelModularForm Γ ρ` for an arithmetic `Γ ≤ Sp_{2g}(ℝ)`: a function
`ℍ[g] → V`, holomorphic (`Holomorphic`, 0.3), invariant under `∣_ρ γ` for `γ ∈ Γ`, and bounded
on `{Im τ ≥ c·1}` after every slash by `Sp_{2g}(ℚ)` (the structure field that Koecher
discharges for `g ≥ 2`). Define `SiegelModularFormWithChar Γ ρ ψ` for `ψ : Γ →* ℂˣ` the same
way with `f ∣_ρ γ = ψ(γ) f`, and `M_ρ(Γ)`, `M_ρ(Γ, ψ)` as the `ℂ`-vector spaces of these, with
`FunLike` instances and extensionality. Prove: `M_ρ(Γ) ⊆ M_ρ(Γ')` for `Γ' ≤ Γ`; slashing by
`δ ∈ Sp_{2g}(ℚ)` maps `M_ρ(Γ)` to `M_ρ(δ⁻¹Γδ)`; the product of scalar-valued forms of weights
`k`, `k'` is a form of weight `k + k'`, giving the graded ring `M_*(Γ) = ⨁_k M_k(Γ)` with the
constant `1` in weight `0`; for `g = 2` the polynomial product
`M_{k,j}(Γ) × M_{k',j'}(Γ) → M_{k+k', j+j'}(Γ)` (van der Geer §3); the **parity lemma**: if `−1 ∈ Γ`
and `M_ρ(Γ, ψ) ≠ 0` then
`ψ(−1) ρ(−1) = 1`, so `M_k(Γ_g) = 0` for `kg` odd (van der Geer, Corollary 4.2) and
`M_{k,j}(Γ₂) = 0` for `j` odd (the LMFDB's dimension tables show zeros at odd `j` for this
reason); and the `g = 1` comparison `SiegelModularForm Γ (det^k) ≃ ModularForm Γ' k` for the
image `Γ'` of `Γ` in `GL (Fin 2) ℝ`, through 0.1, 0.3 and 1.2.

*Prerequisites:* 0.6, 1.1, 1.2; Mathlib `ModularForm`, `MDifferentiable`.

The `g = 1` comparison isomorphism is specified in this README only.

**Checks.**

- The comparison `M_k(Γ₁) ≃ ModularForm 𝒮ℒ k` is `ℂ`-linear and sends the constant `1` of weight `0`
  to the constant modular form `1`.
- Both sides vanish for odd `k` (the parity lemma here, `−1 ∈ SL₂(ℤ)` in Mathlib) and
  `dim M_{12}(Γ₁) = 2` on both sides.
- The boundedness field of `SiegelModularForm` at `g = 1` corresponds to Mathlib's boundedness at
  the cusps; dropping it admits `j(τ)`, which is holomorphic and `SL₂(ℤ)`-invariant (2.4).

## Layer 2: Fourier expansions and Koecher's principle

### 2.1 Half-integral matrices

Define `HalfIntegral g` as the symmetric rational `g × g` matrices with integral diagonal and
`2T` integral (van der Geer, Definition 4.1; the `(n, r, m)` coordinates in degree two), the
predicates `IsPosSemidef T` and `IsPosDef T` (through `Matrix.PosSemidef`/`PosDef` of the real
matrix), the pairing `tr(Tτ)` with `tr(T S) ∈ ℤ` for integral symmetric `S` (so
`e(tr(Tτ))` is `Sym_g(ℤ)`-periodic, and these are exactly the characters of
`Sym_g(ℝ)/Sym_g(ℤ)`), the `GL_g(ℤ)`-action `T ↦ UᵀTU` preserving everything, the **content**
`c(T)` (the gcd of the entries of `2T` and the diagonal of `T`) and, in degree two, the
discriminant `4nm − r²`. Prove Minkowski's finiteness: for each `C` the set of positive
semidefinite half-integral `T` with `tr T ≤ C` is finite; and that each `GL₂(ℤ)`-class of a
positive definite `(n, r, m)` contains exactly one **reduced** representative, where reduced
means `|r| ≤ n ≤ m`, and `r ≥ 0` if `|r| = n` or `n = m` (so `(1, −1, 1)` is not reduced and
`(1, 1, 1)` is). The reduced forms are the LMFDB's row labels `F` in its coefficient tables,
listed by `det(F) = 4nm − r²`. For `g = 1`, `HalfIntegral 1 = ℤ` and the discriminant is the
index.

*Prerequisites:* Mathlib `Matrix.PosSemidef`; the
[integral quadratic forms and lattices roadmap](../IntegralLattices/README.md) *Layer 2*
(reduction of positive definite binary forms) for the degree-two reduction.

### 2.2 Fourier coefficients and the expansion

For `N ≥ 1` and `f : ℍ[g] → V` invariant under `τ ↦ τ + N S` (`S` integral symmetric) define
`fourierCoeff N f T := N^{−g(g+1)/2} ∫_{X ∈ [0, N)^{g(g+1)/2}} f(X + iY) e(−tr(T(X + iY))/N) dX`
for `T ∈ HalfIntegral g`, prove it independent of `Y`, and prove for holomorphic `f` the
expansion `f(τ) = ∑_T fourierCoeff N f T · e(tr(Tτ)/N)`, absolutely and locally uniformly
convergent (`HasSum` over `HalfIntegral g`), with uniqueness of coefficients. Every arithmetic
`Γ` has `N·Sym_g(ℤ) ≤ L_Γ` for some `N` (0.6), so every `f ∈ M_ρ(Γ)` has such an expansion;
for `Γ_g`, `Γ₀^{(g)}(N)` and `Γ₁^{(g)}(N)` take `N = 1`, for `Γ_g(N)` take `N`, and for `K(N)`
take `N = 1` and prove that the coefficients are supported on the half-integral `T` with
`(2,2)`-entry in `Nℤ` (the dual of the translation lattice `L_{K(N)}` of 0.7): the `K(N)`
expansion is written in the coordinates `(n, r, Nm)`, "`a(n, r, Nm)`", which is how Gritsenko
lifts are written (9.6). Prove the equivariance `a(UᵀTU) = ρ(Uᵀ) a(T)` for
`U ∈ GL_g(ℤ)` with `m(U) ∈ Γ` (van der Geer (4)), which in scalar weight reads
`a(UᵀTU) = det(U)^k a(T)`, so coefficients are determined on reduced forms up to sign. For
`g = 1` this is Mathlib's `qExpansion` coefficient.

*Prerequisites:* 1.3, 2.1; Mathlib `MeasureTheory.integral`, `HasSum`, `qExpansion`.

### 2.3 Boundedness on Siegel domains

Prove van der Geer's Theorem 4.3 in the form the structure of 1.3 needs: a holomorphic
`f : ℍ[g] → V` invariant under `τ ↦ τ + S` and under `τ ↦ UτUᵀ` for `U ∈ GL_g(ℤ)` (with the
weight twist) whose Fourier coefficients vanish off the positive semidefinite cone is bounded
on every `{Im τ ≥ c·1}`, `c > 0`, with the bound `∑_{T ≥ 0} |a(T)| e^{−2π c · tr T}`.

*Prerequisites:* 2.2.

### 2.4 Koecher's principle

For `g ≥ 2`, an arithmetic `Γ` and a holomorphic `f : ℍ[g] → V` with `f ∣_ρ γ = f` for all
`γ ∈ Γ`, prove `fourierCoeff N f T = 0` unless `T` is positive semidefinite (van der Geer,
Theorem 4.4; Freitag; the argument: a primitive isotropic-negative vector, completed to
`U ∈ GL_g(ℤ)`, and the unipotent `v_m` with `tr(v_mᵀ T v_m) → −∞`), and deduce the
boundedness field of 1.3 for `f` and for all its slashes by `Sp_{2g}(ℚ)` (2.3 applied to each
`f ∣_ρ δ`, which is invariant under the arithmetic group `δ⁻¹Γδ`). Package this as the
constructor `SiegelModularForm.ofInvariant` for `g ≥ 2`, and record that for `g = 1` the
conclusion is false (`j(τ)` is `SL₂(ℤ)`-invariant and holomorphic with `a(−1) = 1`): that is why
the boundedness is a field and the constructor carries `2 ≤ g`. Corollaries: `M_k(Γ_g) = 0`
for `k < 0` (Corollary 4.5), `M_0(Γ) = ℂ` (constants) for every arithmetic `Γ` and `g ≥ 2`,
and `a(0) ∈ V^{GL_g(ℤ)}`.

*Prerequisites:* 2.2, 2.3; 0.6 for the finite-index group `δ⁻¹Γδ`.

### 2.5 Coefficient bounds

Prove Hecke's bounds: for `f ∈ M_k(Γ)` scalar-valued, `a(T) = O(det(T)^k)` on positive
definite `T` (Fourier integral over `Y = T⁻¹`); for a cusp form, `|a(T)| ≤ C det(T)^{k/2}`,
from the boundedness of `det(Im τ)^{k/2} |f(τ)|` on `ℍ[g]` (3.2 supplies cuspidality, so state
this one after 3.2 as 3.2's corollary and here only the `det(T)^k` bound). These give the
abscissae of convergence in Layer 8.

*Prerequisites:* 2.2, 2.4.

### 2.6 Singular forms

Define `f` to be **singular** when `a(T) = 0` for every nonsingular `T`, and the rank
`rank(f) = max{rank T : a(T) ≠ 0}`. State the theorem of Freitag, Saldaña and Weissauer (van der
Geer's attribution): a
nonzero `f ∈ M_ρ(Γ_g)` with irreducible `ρ` of highest weight `(λ₁, …, λ_g)` is singular iff
`2λ_g < g` (van der Geer, Theorem 6.2); in scalar weight, `f ∈ M_k(Γ_g)` nonzero is singular
iff `2k < g`, so `S_k(Γ_g) = 0` for `2k < g`, and every nonzero form of weight `k < g/2` has
rank `≤ 2k`. State also Freitag's `M_ρ(Γ_g) ≠ 0 ⟹ λ_g ≥ 1` for nontrivial irreducible `ρ`
(Proposition 4.6; its proof passes through Hilbert modular forms and is not reproduced). Both
are stated milestones whose proofs are long; the degree-two instances needed by the LMFDB
tables (`S_k(Γ₂) = 0` for `k < 1`, i.e. nothing beyond 2.4) do not depend on them.

*Prerequisites:* 2.2, 2.4.

## Layer 3: the `Φ`-operator, cusp forms, the Petersson product, finite dimensionality

### 3.1 The Siegel `Φ`-operator

For `f : ℍ[g+1] → V` bounded on Siegel domains define
`(Φ f)(τ') := lim_{t → ∞} f(diag(τ', i t))` (`Filter.limUnder atTop`), prove the limit exists
for `f ∈ M_ρ(Γ_{g+1})` with the Fourier description
`(Φf)(τ') = ∑_{T' ≥ 0} a(diag(T', 0)) e(tr(T'τ'))` (van der Geer, Definition 5.1), that
`Φ f ∈ M_{ρ'}(Γ_g)` where `ρ'` is the
restriction of `ρ` to the subspace `V' = span(Φf)` under `GL_g × {1}` (highest weight
`(λ₁, …, λ_g)` for irreducible `ρ`), that `Φ` is linear and multiplicative on scalar forms,
that `Φ: M_k(Γ_{g+1}) → M_k(Γ_g)` in scalar weight, that `Φ: M_{k,j}(Γ₂) → M_{k+j}(SL₂(ℤ))`
(the image of `ρ_{k,j}` restricted to `GL₁ × 1` is spanned by `X₀^j`, on which `diag(a, 1)`
acts by `a^{k+j}`), and `Φ(f ∣_ρ m(U)) = (Φ f) ∣ m(U')` for block-diagonal `U`. For a
congruence subgroup `Γ` of level `N` the same definition gives `Φ: M_ρ(Γ) → M_{ρ'}(Γ')` for
the degree-`g` group `Γ'` of the matrices `[[A', B'], [C', D']]` whose block-diagonal
extension lies in `Γ` (for `Γ₀^{(g+1)}(N)` this is `Γ₀^{(g)}(N)`).

*Prerequisites:* 1.3, 2.2, 2.4; Mathlib `Filter.limUnder`.

### 3.2 Cusp forms

Define `IsCuspForm f := ∀ γ ∈ Sp_{2g}(ℚ), Φ(f ∣_ρ γ) = 0` (the knowl `mf.siegel.cusp_form`),
`S_ρ(Γ) ≤ M_ρ(Γ)` and `S_ρ(Γ, ψ)`, and prove: for `Γ = Γ_g` it suffices to take `γ = 1`, and
`f` is cuspidal iff `a(T) = 0` for every singular `T ≥ 0` (van der Geer, Exercise 5.3; the
Klingen parabolics have representatives in `Γ_g`); for a congruence subgroup there are finitely
many conditions, indexed by the double cosets `Γ \ Sp_{2g}(ℚ) / P_{g−1}` (the one-dimensional
cusps); `S_ρ(Γ)` is stable under slashing by the normalizer of `Γ` in `GSp⁺_{2g}(ℚ)`; the
product of a form and a cusp form is a cusp form; the cusp-form coefficient bound
`a(T) = O(det(T)^{k/2})` (2.5); and `S_k(Γ_g)` is the kernel of `Φ` on `M_k(Γ_g)`. For `g = 1`
this is Mathlib's `CuspForm` under 1.3.

*Prerequisites:* 2.5, 3.1; Mathlib `CuspForm`.

### 3.3 Siegel's fundamental domain

Define Minkowski reduction of positive definite real `Y` (`hᵀYh ≥ y_{kk}` for primitive `h`
with `(h_k, …, h_g) = 1`, and `y_{k,k+1} ≥ 0`) consuming the
[integral quadratic forms and lattices roadmap](../IntegralLattices/README.md) *Layer 2*, and
Siegel's set `F_g = {τ : |det j(γ, τ)| ≥ 1 ∀γ ∈ Γ_g, Im τ Minkowski reduced, |x_{ij}| ≤ 1/2}`
(van der Geer §2). Prove: `F_g` is a fundamental domain for `Γ_g` (every orbit meets it, and
two interior points in one orbit coincide), its closure is contained in a Siegel domain
`{Im τ ≥ c_g · 1, |x_{ij}| ≤ 1/2}`, and the invariant measure `det(Y)^{−(g+1)} ∏ dx_{ij} dy_{ij}`
gives it finite volume. For an arithmetic `Γ` a fundamental domain is a finite union of
translates `γ_i F_g`, `γ_i` running over `Γ \ Γ_g`-cosets (after intersecting with `Γ_g`).
The constant `c_g` is Siegel's and its existence, not its value, is the target.

*Prerequisites:* 0.4, 0.6; the integral quadratic forms and lattices roadmap *Layer 2*.

### 3.4 The Petersson inner product

Define, for `f₁, f₂ ∈ M_ρ(Γ)` with at least one cuspidal and a `ρ`-admissible Hermitian form
`( , )` on `V` (`(ρ(A)v, w) = (v, ρ(Aᵀ)w)`, which exists and is unique up to scalar for
irreducible `ρ`, van der Geer §3),
`⟨f₁, f₂⟩ := ∫_{Γ \ ℍ_g} (ρ(Im τ) f₁(τ), f₂(τ)) det(Y)^{−(g+1)} dX dY`, prove convergence
(cuspidality gives exponential decay on Siegel domains), independence of the fundamental
domain, positive definiteness on `S_ρ(Γ)`, invariance under `f ↦ f ∣_ρ δ` for `δ` normalizing
`Γ`, and the orthogonal decomposition `M_ρ(Γ) = S_ρ(Γ) ⊕ N_ρ(Γ)` with `N_ρ := S_ρ^⊥`
(finite-dimensional by 3.5, so the complement exists). In scalar weight the integrand is
`det(Y)^k f₁ f̄₂`. For `g = 1` this is the Petersson product of the
[modular-forms roadmap](../ModularForms/README.md) *Layer 3*.

*Prerequisites:* 3.2, 3.3.

The Petersson product (an integral over `Γ \ ℍ_g`, which needs Siegel's fundamental domain of 3.3)
is specified in this README only.

**Checks.**

- `⟨χ₁₀, χ₁₀⟩` is real and positive (6.1: `χ₁₀` is a nonzero cusp form).
- `⟨χ₁₀, ψ₁₀⟩ = 0`: Siegel Eisenstein series are orthogonal to cusp forms (unfolding against
  `Φ χ₁₀ = 0`).
- `⟨f₂, f₁⟩` is the complex conjugate of `⟨f₁, f₂⟩`, and the product is unchanged under
  `f ↦ f ∣_ρ δ` for `δ` normalizing `Γ`.
- For `g = 1` it is the Petersson product of the modular-forms roadmap *Layer 3*, with the same
  measure `y^{k−2} dx dy` and no volume normalization.

### 3.5 Finite dimensionality

Prove `FiniteDimensional ℂ (M_ρ(Γ))` for every arithmetic `Γ` and holomorphic `ρ`, by the
classical route: a form all of whose Fourier coefficients `a(T)` with `tr T ≤ C(g, ρ)` vanish is
zero (the maximum of `det(Y)^{λ_g/2}‖f‖` on the fundamental domain, compared with the Fourier
bound on the Siegel domain containing it), so `f ↦ (a(T))_{tr T ≤ C}` is injective into a
finite-dimensional space (2.1). State the bound `C(g, k) = k·c_g'` explicitly for scalar weight
as the Siegel–Eichler analogue of the Sturm bound, with its `g = 1` value Mathlib's
`sturm_bound_levelOne`. Corollaries: `dim M_ρ(Γ) ≤ dim M_ρ(Γ')` for `Γ' ≤ Γ` with equality iff
the restriction is onto; `M_ρ(Γ) = ⨁` over the characters of `Γ/Γ'` when `Γ' ⊴ Γ` of finite
abelian quotient (the nebentypus decomposition, which is how `M_k(Γ₀(3)) ⊕ M_k(Γ₀(3), ψ₃)`
of 6.6 sits inside `M_k(Γ₀(3) ∩ ker ψ₃)`). Finite dimensionality for `g = 1` is Tau Ceti's
`TauCeti.NumberTheory.ModularForms.FiniteDimensional`, consumed, not reproved.

*Prerequisites:* 2.1, 2.5, 3.3; Tau Ceti `ModularForms.FiniteDimensional`.


## Layer 4: Siegel and Klingen Eisenstein series

### 4.1 The Siegel Eisenstein series

For even `k > g + 1` define `E_k^{(g)}(τ) := ∑_{(C, D)} det(Cτ + D)^{−k}`, the sum over a set
of representatives of `GL_g(ℤ) \ {bottom rows (C, D) of elements of Γ_g}` (equivalently over
`P_g \ Γ_g` for the Siegel parabolic `P_g = {C = 0}`; the knowl `mf.siegel.eisenstein_series`),
prove absolute and locally uniform convergence for `k > g + 1` (Freitag, Hilfssatz I.5.1, through
the counting of coprime symmetric pairs), holomorphy, `E_k^{(g)} ∈ M_k(Γ_g)` with constant term
`a(0) = 1`, `Φ E_k^{(g)} = E_k^{(g−1)}` with `E_k^{(0)} = 1`, and `E_k^{(1)}` is the normalized
Eisenstein series `E_k` of Mathlib (`EisensteinSeries.E`, up to the constant making `a(0) = 1`),
the bridge check of this layer. Prove that `E_k^{(g)} ∉ S_k(Γ_g)` and that every form in
`M_k(Γ_g)` with `a(0) ≠ 0` is `a(0) E_k^{(g)}` plus a form with `a(0) = 0`. Siegel's theorem that
the coefficients `a(T)` are rational numbers is stated (Siegel 1935; in degree two it is the
corollary of 4.2). In degree two `ψ_k := E_k^{(2)}` for `k ∈ {4, 6, 10, 12}` are the generators
of 6.1. ⚠ `k` even is part of the hypothesis: for odd `k` the sum is `0` since `(C, D)` and
`(−C, −D)` both occur, and `M_k(Γ_g) = 0` for `kg` odd by the parity lemma of 1.3 anyway.

*Prerequisites:* 1.3, 2.2, 3.1, 3.2; Mathlib `EisensteinSeries.E`.

### 4.2 The Fourier coefficients in degree two (the Maass–Cohen formula)

Define Cohen's function `H(r, N)` for `r ≥ 2` and `N ≥ 0` with `N ≡ 0, 3 mod 4`:
`H(r, 0) = ζ(1 − 2r)`, and for `N = |D| f²` with `D` a negative fundamental discriminant,
`H(r, N) = L(1 − r, χ_D) ∑_{d ∣ f} μ(d) χ_D(d) d^{r−1} σ_{2r−1}(f/d)` (Cohen 1975; Eichler–Zagier
§2, where `L(1 − r, χ_D) = −B_{r, χ_D}/r` is Mathlib's `DirichletCharacter.LFunction` at a
negative integer, the generalized Bernoulli number). Prove the **Maass–Cohen formula**: for even
`k ≥ 4` and `T = (n, r, m)` half-integral positive semidefinite with content `c` and
`N = 4nm − r² > 0`,
`a(E_k^{(2)}; T) = ∑_{d ∣ c} d^{k−1} · 2 H(k − 1, N/d²) / (ζ(1 − k) ζ(3 − 2k))`,
and for `N = 0`, `T ≠ 0`, `a(T) = −(2k/B_k) σ_{k−1}(c)` (the degree-one coefficient). The
route is 9.3's: `E_k^{(2)}` is `−(2k/B_k)` times the Maass lift of the Jacobi Eisenstein series
`E_{k,1}`, whose coefficients are Cohen's (Eichler–Zagier Theorem 2.1 and §6); state the formula
here as a
theorem of this layer with that proof route, so that the normalizations of Layer 6 rest on it.
Acceptance values: `a(ψ₄; (1,0,0)) = 240`, `a(ψ₄; (1,1,1)) = 13440`, `a(ψ₄; (1,0,1)) = 30240`,
`a(ψ₆; (1,1,1)) = 44352`, `a(ψ₆; (1,0,1)) = 166320`, `a(ψ₆; (1,2,1)) = −504`.

*Prerequisites:* 2.1, 4.1; Mathlib `DirichletCharacter.LFunction`, `bernoulli`,
`ArithmeticFunction.sigma`, `ArithmeticFunction.moebius`.

Cohen's function is specified in this README only.

**Checks.**

- `H(3, 0) = ζ(−5) = −1/252`.
- `H(3, 3) = L(−2, χ₋₃) = −2/9` and `H(3, 4) = L(−2, χ₋₄) = −1/2` (PARI `lfun`); with 9.2 these give
  the Jacobi coefficients `c(3) = 56`, `c(4) = 126` of `E_{4,1}` and so
  `a(ψ₄; (1,1,1)) = 240 · 56 = 13440`, `a(ψ₄; (1,0,1)) = 240 · 126 = 30240`.
- `N ≡ 1, 2 mod 4` is outside the definition (`N = 1, 2` are discriminants of no binary form); a
  formalisation must not assign these a nonzero value.
- The formula specializes to Mathlib's `DirichletCharacter.LFunction` at a negative integer for
  `f = 1`, with no second `L`-value introduced.

### 4.3 Klingen Eisenstein series

For `0 ≤ r ≤ g`, even `k > g + r + 1` and a cusp form `f ∈ S_k(Γ_r)` define
`E_{g,r,k}(f)(τ) := ∑_{γ ∈ P_{g,r} \ Γ_g} f((γ • τ)^*) det(Cτ + D)^{−k}`, where `τ^*` is the
upper-left
`r × r` block and `P_{g,r}` is the Klingen parabolic of van der Geer §5 (van der Geer, Theorem
5.4: the series converges to an element of `M_k(Γ_g)` with `Φ^{g−r} E_{g,r,k}(f) = f`; `r = 0`
gives 4.1). Prove Theorem 5.4 and its Corollary 5.5: `Φ : M_k(Γ_g) → M_k(Γ_{g−1})` is surjective
for even `k > 2g`, so for even `k > 2g`
`M_k(Γ_g) = ⨁_{r=0}^{g} E_{g,r,k}(S_k(Γ_r))` with `E_{g,g,k} = id` on `S_k(Γ_g)`, and the summands
are mutually orthogonal for the Petersson product (3.4) wherever it is defined. In degree two
this is `M_k(Γ₂) = ℂ ψ_k ⊕ E_{2,1,k}(S_k(SL₂(ℤ))) ⊕ S_k(Γ₂)` for even `k ≥ 6`, and
`M_4(Γ₂) = ℂ ψ₄`; the three summands are the LMFDB's **Eisenstein**, **Klingen** and cusp
columns, with `dim E_{2,1,k}(S_k(Γ₁)) = dim S_k(SL₂(ℤ))`. For vector-valued weight state
Arakawa's theorem (Arakawa 1983): for `j > 0` and `k > 4`, `Φ : M_{k,j}(Γ₂) → S_{k+j}(SL₂(ℤ))`
is surjective with a Hecke-equivariant Klingen section `E_{k,j}`, so
`M_{k,j}(Γ₂) = E_{k,j}(S_{k+j}(SL₂(ℤ))) ⊕ S_{k,j}(Γ₂)` and there is no Siegel Eisenstein series
for `j > 0` (the knowl `mf.siegel.subspace.degree.two`). ⚠ The Klingen construction needs `k`
beyond the convergence bound; `M_{k,j}(Γ₂)` for `k ≤ 4`, `j > 0` is handled by 6.4's dimension
formula and not by this decomposition.

*Prerequisites:* 3.1, 3.2, 3.4, 4.1.

## Layer 5: Siegel theta series

### 5.1 The degree-`g` theta series of a lattice

For a positive definite real lattice `L ⊆ E` in the [theta-series
roadmap](../ThetaSeries/README.md)'s
model (its *Layer 2*: `Submodule ℤ E` with `IsZLattice ℝ L` in a real inner product space of
dimension `m`) define `θ_L^{(g)}(τ) := ∑_{v ∈ L^g} exp(π i tr(Gram(v) τ))` on `ℍ[g]`, with
`Gram(v)_{ij} = ⟪v_i, v_j⟫`, prove absolute and locally uniform convergence (the Gaussian
bound `|exp(π i tr(Gram(v) τ))| = exp(−π tr(Gram(v) Y)) ≤ exp(−π c ∑ ‖v_i‖²)` on `Y ≥ c·1`),
holomorphy, the Fourier expansion `θ_L^{(g)} = ∑_T r_L(T) e(tr(Tτ))` over half-integral
`T ≥ 0` with `r_L(T) := #{v ∈ L^g : Gram(v) = 2T}` for even `L` (finite by 2.1), the
specializations `θ_L^{(1)} = thetaSeries L` (that roadmap's *Layer 3*) and
`Φ θ_L^{(g+1)} = θ_L^{(g)}`, and the restriction to the diagonal
`θ_L^{(g₁+g₂)}(diag(τ₁, τ₂)) = θ_L^{(g₁)}(τ₁) θ_L^{(g₂)}(τ₂)`. For `g = 2` and `L = √(2a) ℤ` this is
the `W = 0`, `ν = 0`
specialization of `MetaplecticAutomorphicForms` 8.18, stated as a comparison.

*Prerequisites:* 0.3, 2.1, 2.2, 3.1; the theta-series roadmap *Layers 2–3*; Mathlib `IsZLattice`.

### 5.2 Modularity of theta series

Prove, by the degree-`g` Poisson summation of the Gaussian `v ↦ exp(π i tr(Gram(v) τ))` on
`E^g` (Mathlib's `SchwartzMap` Poisson summation in the form of the theta-series roadmap's
*Layer 1*, applied to `E^g` with the lattice `L^g` and dual `(L^∨)^g`), the transformation
`θ_L^{(g)}(−τ⁻¹) = (det(τ/i))^{m/2} covol(L)^{−1} θ_{L^∨}^{(g)}(τ)`, where for odd `m` the
power `det(τ/i)^{1/2}` is the holomorphic square root on the simply connected `ℍ_g` that is
positive at `τ = iY` (⚠ for `g ≥ 3` this is not the principal branch: at `τ = (1 + 2i)·1₃`,
`det(τ/i) = (1 − 2i)³ = −11 + 2i` and the principal square root differs from the continued one
by the sign; for `g ≤ 2`, `det(τ/i) = det(Y) ∏(1 − iλ_j)` has argument in `(−π, π)` and the two
agree; `Suggested.lean` states the even-rank case, where the power is `det(τ/i)^{m/2}` with
`m/2 ∈ ℕ`), and deduce, with the
generators `J`, `n(S)` of 0.1 and the level theory of that roadmap's *Layer 2*: for an **even
unimodular** `L` of rank `m = 2k` (so `8 ∣ m`), `θ_L^{(g)} ∈ M_k(Γ_g)` (van der Geer §7;
Freitag 1983, Chapter I; Andrianov–Maloletkin 1975); for an even `L` of rank `m ≡ 0 mod 4` and level
`ℓ`,
`θ_L^{(g)} ∈ M_{m/2}(Γ₀^{(g)}(ℓ), χ_L ∘ det D)` where `χ_L` is the discriminant character of
that roadmap's *Layer 6* (`χ_L(·) = ((−1)^{m/2} det L / ·)`, a Kronecker symbol), evaluated on
`det D` for `γ = [[A, B], [C, D]] ∈ Γ₀^{(g)}(ℓ)` (Andrianov–Maloletkin 1975); for `m ≡ 2 mod 4`
the same statement with the odd weight `m/2` and the same character. The knowl
`mf.siegel.theta_series` is the `4 ∣ m` case. The `g = 1` case is that roadmap's *Layers 5 and
7*, consumed as the bridge check: both sides of the comparison are stated on
`thetaSeries L`. Examples that Layer 6 consumes: `A₂` (rank 2, level 3) gives
`α₁ := θ_{A₂}^{(2)} ∈ M_1(Γ₀(3), ψ₃)`; `E₆` and `E₆^* = 3E₆⁻¹` (rank 6, level 3) give forms in
`M_3(Γ₀(3), ψ₃)`; `E₈` gives `θ_{E₈}^{(g)} ∈ M_4(Γ_g)`, equal to `ψ₄` for `g = 2` (both have
`a(0) = 1` and `M_4(Γ₂)` is one-dimensional by 6.3), with `r_{E₈}((1,1,1)) = 13440` and
`r_{E₈}((1,0,1)) = 30240` as the acceptance values.

*Prerequisites:* 0.1, 0.6, 1.3, 5.1; the theta-series roadmap *Layers 1, 2, 5, 6, 7*.

### 5.3 Theta series with pluriharmonic coefficients

Define, for `P ∈ ℂ[X]` a polynomial in the `m × g` matrix variable `X`, **pluriharmonic**
(`∑_t ∂²P/∂X_{it}∂X_{jt} = 0` for all `i, j`; the knowl's definition) and **homogeneous of weight
`ρ`** (`P(XA) = ρ(A) P(X)` for `A ∈ GL_g(ℂ)`, with `P` valued in `V`; scalar case
`P(XA) = det(A)^ν P(X)`), the series `θ_{L,P}^{(g)}(τ) := ∑_{v ∈ L^g} P(B v) exp(π i tr(Gram(v) τ))`
where `B` is a Gram square root (`BᵀB = Gram`, so `P(Bv)` is `P` evaluated at the coordinates of
`v` in an orthonormal basis). Prove convergence and holomorphy, that pluriharmonicity makes
`P(X) exp(−π tr(XᵀX Y))` an eigenfunction of the Fourier transform, hence the same
transformation law as 5.2 with weight `det^{m/2} ⊗ ρ`, and that for `ρ` nontrivial the result is
a **cusp form**: `θ_{L,P}^{(g)} ∈ S_{det^{m/2} ⊗ ρ}(Γ₀^{(g)}(ℓ), χ_L)` (Freitag 1983, Chapter I,
the theta series with harmonic coefficients; the knowl `mf.siegel.theta_series`, "theta series
with pluriharmonics"). At `g = 1`, `L` even unimodular and `P` harmonic of degree `d`,
`θ_{L,P}^{(1)}`
is the sibling `LatticePackingsAndPerfectForms`' `Θ_{L,P}` (its 5.6, a cusp form of weight
`m/2 + d` for `SL₂(ℤ)`), consumed by comparison exactly as 5.1 consumes the scalar degree-one theta
series, not reproved. Acceptance:
Ibukiyama's form `F ∈ S_{8,6}(Γ₂)` (weight `(k, j) = (8, 6)`) from the rank-16 lattice
`Γ = {x ∈ ℚ¹⁶ : 2x_i ∈ ℤ, x_i − x_j ∈ ℤ, ∑ x_i ∈ 2ℤ}` (the `D₁₆⁺` lattice of that roadmap's
*Layer 8*) with `P_ν(x, y) = (x, a)^{6−ν} (y, a)^{ν}`, `a = (2, i, i, i, i, 0, …, 0)`, is
nonzero (van der Geer §25), and `S_{8,6}(Γ₂)` is one-dimensional (6.4). The `γ₄ ∈ S_4(Γ₀(3))`
of 6.6 is `θ_{S,P}` for the rank-4 lattice `S` and quadratic `P` of the knowl
`mf.siegel.family.gamma0_3`.

*Prerequisites:* 1.1, 3.2, 5.2.

### 5.4 Theta constants with characteristics

For `g ≥ 1` and a characteristic `ε = (ε', ε'') ∈ {0,1}^g × {0,1}^g` define
`θ_ε(τ) := ∑_{n ∈ ℤ^g} exp(π i [(n + ε'/2) τ (n + ε'/2)ᵀ + (n + ε'/2) · ε''])` on `ℍ[g]`
(Igusa's normalization, as in the knowls `mf.siegel.theta_constant` and
`mf.siegel.family.gamma_2`), prove convergence and holomorphy, that `θ_ε = 0` iff `ε` is **odd**
(`ε' · ε'' ≡ 1 mod 2`), that there are `2^{g−1}(2^g + 1)` even characteristics (`3`, `10`, `36`
for `g = 1, 2, 3`), the transformation of the *set* `{θ_ε²}` under `J` and `n(S)` (each generator
permutes the even characteristics up to eighth roots of unity and the common automorphy factor
`det(Cτ + D)^{1/2}`, stated for the squares so that no half-integral weight is named), and the
`g = 1` comparison with Mathlib's `jacobiTheta₂` at `z ∈ {0, 1/2, τ/2, (1+τ)/2}`. Define
`θ_{ε₁} ⋯ θ_{ε_{2n}}` products with an even number of factors and prove: a product of all
`2^{g−1}(2^g + 1)` even theta constants, raised to a power making the total weight integral, is a
modular form on `Γ_g` with a character of `Γ_g / Γ_g(2)`; in degree two
`χ₅ := ∏_{ε even} θ_ε ∈ M_5(Γ₂, ε_{S₆})` for the sign character of `Γ₂/Γ₂(2) ≅ S₆`, and
`χ₅² = ∏_{ε even} θ_ε² ∈ S_{10}(Γ₂)` with `a(χ₅²; (1,1,1)) = 4096`, `a(χ₅²; (1,0,1)) = −8192`
(the normalization `χ₅² = 2^{12} · C = −2^{14} χ₁₀^{Igusa}` of 6.1 and 6.5). In degree three the
product of the 36 even theta constants is a cusp form of weight 18 on `Γ₃`. The fourth powers
`x_i := θ_{n_i}⁴` of the ten even theta constants in degree two are modular forms of weight 2 on
`Γ₂(2)`; the `X, Y, Z, K, f₂, f₆` of 6.7 and 6.8 are the named polynomials in them.

*Prerequisites:* 0.1, 0.6, 1.3, 3.2; Mathlib `jacobiTheta₂`.

## Layer 6: the degree-two rings

### 6.1 Igusa's generators `ψ₄, ψ₆, χ₁₀, χ₁₂`

With `ψ_k = E_k^{(2)}` (4.1) define
`χ₁₀ := −4 · (−43867 · 2^{−12} 3^{−5} 5^{−2} 7^{−1} 53^{−1}) (ψ₄ψ₆ − ψ₁₀)` and
`χ₁₂ := 12 · (131 · 593 · 2^{−13} 3^{−7} 5^{−3} 7^{−2} 337^{−1}) (441 ψ₄³ + 250 ψ₆² − 691 ψ₁₂)`,
the LMFDB's `C` and `D` (knowl `mf.siegel.family.sp4z`), and prove: both are cusp forms
(`Φ(ψ₄ψ₆ − ψ₁₀) = E₄E₆ − E₁₀ = 0` and `Φ(441ψ₄³ + 250ψ₆² − 691ψ₁₂) = 441E₄³ + 250E₆² − 691E₁₂ = 0`
in `M_{10}(SL₂(ℤ))`, `M_{12}(SL₂(ℤ))`, by Tau Ceti's level-one graded ring, and 3.2), with
`a(χ₁₀; (1,1,1)) = a(χ₁₂; (1,1,1)) = 1` (4.2: this fixes the two rational constants), that
`−¼ χ₁₀` and `(1/12) χ₁₂` are Igusa's `χ₁₀`, `χ₁₂` (Igusa 1962, whose normalization is
`χ₁₀ = −2^{−14} χ₅²`, 5.4), the acceptance coefficients `a(χ₁₀; (1,0,1)) = −2`,
`a(χ₁₀; (2,1,1)) = −16`, `a(χ₁₀; (1,0,2)) = 36`, `a(χ₁₀; (2,2,2)) = 240`,
`a(χ₁₂; (1,0,1)) = 10`, `a(χ₁₂; (2,1,1)) = −88`, `a(χ₁₂; (1,0,2)) = −132`,
`a(χ₁₂; (2,2,2)) = 2784`, and Witt's restriction to the diagonal `δ : ℍ × ℍ → ℍ[2]`,
`(τ₁, τ₂) ↦ diag(τ₁, τ₂)` (van der Geer §8): `f ∘ δ ∈ M_k(SL₂(ℤ)) ⊗ M_k(SL₂(ℤ))` is symmetric
for `f ∈ M_k(Γ₂)`, with `(f ∘ δ)`'s coefficient at `q₁^n q₂^m` equal to `∑_r a(f; (n, r, m))`;
`ψ₄ ∘ δ = E₄ ⊗ E₄` and `ψ₆ ∘ δ = E₆ ⊗ E₆` (one-dimensional targets; the coefficient check
`30240 + 2·13440 + 2·240 = 240²`); `χ₁₀ ∘ δ = 0`, with `χ₁₀` vanishing to order exactly 2
along `z = 0`; and `χ₁₂ ∘ δ = 12 · Δ ⊗ Δ` (coefficient `10 + 2·1 = 12` at `q₁q₂`; Igusa's
`(1/12)χ₁₂` restricts to `Δ ⊗ Δ`, which is the origin of his normalization). ⚠ `ψ_k ∘ δ ≠ E_k ⊗ E_k`
as soon as `dim M_k(SL₂(ℤ)) > 1`: `ψ₁₂ ∘ δ` has a `Δ ⊗ Δ` component.

*Prerequisites:* 3.2, 4.1, 4.2; Tau Ceti `mvPolynomialEquivModularForms`.

### 6.2 The odd generator `χ₃₅`

Define `W := det [[4ψ₄, 6ψ₆, 10χ₁₀, 12χ₁₂], [∂₁₁ψ₄, …], [∂₁₂ψ₄, …], [∂₂₂ψ₄, …]]` with
`∂_{ij} := (2πi)⁻¹ ∂/∂τ_{ij}` (so `∂₁₁, ∂₁₂, ∂₂₂` multiply the coefficient at `(n, r, m)` by
`n, r, m`; without the `(2πi)⁻¹` every coefficient of `W` below carries a factor `(2πi)³`), the
Wronskian of `(ψ₄, ψ₆, χ₁₀, χ₁₂)` with respect to `(τ₁₁, τ₁₂, τ₂₂)` (rows: the forms times their
weights, then the three normalized partial derivatives), prove `W ∈ S_{35}(Γ₂)` (the Wronskian of
forms of weights
`k_i` is a form of weight `∑k_i + 3`, by the chain rule for `γ • τ` and `det j(γ,τ)^{−3}` as the
Jacobian factor; Aoki–Ibukiyama 2005, Theorem 4.1 — the construction of the LMFDB's `Gamma0_3`
`χ₁₄` is the same determinant), `W ≠ 0`, and define `χ₃₅ := W / a(W; (2,1,3))`, so that
`a(χ₃₅; (2,1,3)) = 1`. Prove the antisymmetries `a(χ₃₅; (n, −r, m)) = −a(χ₃₅; (n, r, m))` (from
`m(diag(1,−1)) ∈ Γ₂`, 2.2 with `det U = −1` and odd weight) and
`a(χ₃₅; (m, r, n)) = −a(χ₃₅; (n, r, m))` (from `m([[0,1],[1,0]])`), hence `a(χ₃₅; T) = 0` when
`r = 0` or `n = m`, and the acceptance values `a(χ₃₅; (2,−1,3)) = −1`, `a(χ₃₅; (3,1,2)) = −1`,
`a(χ₃₅; (2,3,4)) = −1`, `a(χ₃₅; (2,1,4)) = −69`. State `χ₃₅² = R(ψ₄, ψ₆, χ₁₀, χ₁₂)` for the
isobaric polynomial `R` of weight 70 (Igusa 1967, p. 849; existence of `R` is a corollary of 6.3,
its coefficients are a target determined by the first coefficients of `χ₃₅²`).

*Prerequisites:* 1.3, 2.2, 3.2, 6.1.

### 6.3 Igusa's structure theorem

Prove (van der Geer, Theorem 9.1; Igusa 1962, 1964): `ψ₄, ψ₆, χ₁₀, χ₁₂` are algebraically
independent, `⨁_{k even} M_k(Γ₂) = ℂ[ψ₄, ψ₆, χ₁₀, χ₁₂]` (as the `MvPolynomial`-algebra
isomorphism `MvPolynomial (Fin 4) ℂ ≃ₐ ⨁_{k even} M_k(Γ₂)`, graded with weights `4, 6, 10, 12`,
the degree-two analogue of Tau Ceti's `mvPolynomialEquivModularForms`),
`⨁_{k odd} M_k(Γ₂) = χ₃₅ · ℂ[ψ₄, ψ₆, χ₁₀, χ₁₂]`, hence
`M_*(Γ₂) = ℂ[ψ₄, ψ₆, χ₁₀, χ₁₂, χ₃₅]/(χ₃₅² − R)`, and the cusp ideal
`⨁_k S_k(Γ₂) = (χ₁₀, χ₁₂) ⊕ χ₃₅ ℂ[…]`. Proof route: van der Geer §9 (Witt's restriction to the
diagonal, the
exact sequences `0 → χ₁₀ M_{k−10}(Γ₂) → M_k^{≥2n}(Γ₂) → Sym²(M_{k+2n}^{≥n}(Γ₁))`, and the
Fourier–Jacobi coefficient argument for odd weight). Corollaries: the Hilbert series
`∑ dim M_k(Γ₂) t^k = (1 + t³⁵)/((1 − t⁴)(1 − t⁶)(1 − t¹⁰)(1 − t¹²))`; `dim M_k(Γ₂)` for
`k = 0, 4, 6, 8, 10, 12, 14, 16, 18, 20` is `1, 1, 1, 1, 2, 3, 2, 4, 4, 5`; `M_k(Γ₂) = 0` for odd
`k < 35`, `M_{35} = ℂχ₃₅`, `M_{37} = 0`, `M_{39} = ℂψ₄χ₃₅`;
`dim S_k(Γ₂) = dim M_k(Γ₂) − 1 − dim S_k(SL₂(ℤ))` for even `k ≥ 4` (4.3); `S_{10}(Γ₂) = ℂχ₁₀`,
`S_{12}(Γ₂) = ℂχ₁₂`, and
`dim S_{20}(Γ₂) = 3`. Every form in `M_k(Γ₂)` has Fourier coefficients in the `ℚ`-span of
those of the monomials, hence rational if it is a rational combination of monomials (11.2).

*Prerequisites:* 3.5, 4.3, 6.1, 6.2; Tau Ceti `mvPolynomialEquivModularForms`.

### 6.4 Vector-valued forms of degree two: Satoh's brackets and Tsushima's formula

Define the **Satoh bracket** `[f, g] := (1/(2πi)) ((1/k) g ∇f − (1/l) f ∇g) ∈ M_{k+l, 2}(Γ₂)`
for `f ∈ M_k(Γ₂)`, `g ∈ M_l(Γ₂)`, with `∇f` the symmetric matrix of partial derivatives
`(∂f/∂τ_{ij})` realized in `ρ_{k+l, 2}` as the quadratic form `X ↦ Xᵀ (∇f) X` on
`homogeneousSubmodule (Fin 2) ℂ 2` (the knowl `mf.siegel.family.sp4z_2`; van der Geer §25), and
prove it is a form of weight `(k + l, 2)` (the derivative of the automorphy factor is the
`Sym²`-twist). Prove **Satoh's theorem** (Satoh 1986): for even `k`,
`M_{k,2}(Γ₂) = M_{k−10}[ψ₄,ψ₆] ⊕ M_{k−14}[ψ₄,χ₁₀] ⊕ M_{k−16}[ψ₄,χ₁₂] ⊕ V_{k−16}[ψ₆,χ₁₀] ⊕ V_{k−18}[ψ₆,χ₁₂] ⊕ V_{k−22}[χ₁₀,χ₁₂]` with `V_k := M_k(Γ₂) ∩ ℂ[ψ₆, χ₁₀, χ₁₂]`, and its
consequences
`∑_{k even} dim M_{k,2}(Γ₂) t^k = (t¹⁰ + t¹⁴ + t¹⁶)/((1−t⁴)(1−t⁶)(1−t¹⁰)(1−t¹²)) + (t¹⁶ + t¹⁸ + t²²)/((1−t⁶)(1−t¹⁰)(1−t¹²))`, `dim S_{k,2}(Γ₂) = dim M_{k,2}(Γ₂) − dim S_{k+2}(SL₂(ℤ))`
for `k > 4` (4.3), with `dim M_{k,2}` for `k = 10, 12, 14, 16, 18, 20, 22` equal to
`1, 0, 2, 3, 3, 4, 7` and `dim S_{k,2}` equal to `0, 0, 1, 2, 2, 3, 5`; `M_{k,2}(Γ₂) = 0` for
`k < 10` even. State **Tsushima's dimension formula** for `dim S_{k,j}(Γ₂)` (Tsushima 1983,
Theorem 4; valid for `k ≥ 5`, `j ≥ 0`, with Petersson's and Taïbi's extensions to `k = 4` and
`k = 3`) as the explicit quasi-polynomial in `(k, j)` (periodic in `k` modulo 12 and `j` modulo
12 after a polynomial part), the source of the LMFDB's `Sp4Z_j` tables, and the acceptance values
`dim S_{k,j}(Γ₂)` for `(k, j) = (8, 6), (10, 4), (14, 2), (16, 2), (20, 2), (12, 6), (6, 12)`
equal to `1, 1, 1, 2, 3, 2, 1` (van der Geer §25, table), with the parity law `S_{k,j} = 0` for
odd `j` (1.3). State Ibukiyama's generators of the modules `⨁_k M_{k,4}(Γ₂)` and
`⨁_k M_{k,6}(Γ₂)` over `ℂ[ψ₄, ψ₆, χ₁₀, χ₁₂]` (Ibukiyama 2012, "Vector valued Siegel modular
forms of symmetric tensor weight of small degrees", Theorems for `j = 4, 6`), by citation.

*Prerequisites:* 1.1, 1.3, 3.5, 4.3, 6.3.

### 6.5 Igusa's ring for `Γ₂(2)`

Prove, as stated in the knowl `mf.siegel.family.gamma_2` (Igusa 1964): the ten fourth powers
`x_i = θ_{n_i}⁴` (5.4) span a five-dimensional space `V ⊆ M_2(Γ₂(2))` (five linear relations),
`⨁_{k even} M_k(Γ₂(2)) ≅ ℂ[x₁, …, x₅]/(f)` with `f` the Igusa quartic (of weight 8, i.e. degree
4 in the `x_i`), and `M_*(Γ₂(2)) = M_*^{even}[χ₅]/(χ₅² + 2^{14} χ₁₀^{Igusa})`, that is
`χ₅² = −2^{14} · (−¼ χ₁₀) = 2^{12} χ₁₀` in the normalization of 6.1. Prove the quotients
`Γ₂/Γ₂(2) ≅ Sp₄(𝔽₂) ≅ S₆` (order `720`), `Γ₁(2)/Γ₂(2) ≅ (ℤ/2)³`, `Γ₀(2)/Γ₂(2) ≅ ℤ/2 × S₄`,
`Γ₀(2)/Γ₁(2) ≅ S₃`, and that `M_{k,j}(Γ₂(2))` is an `S₆`-representation with
`M_{k,j}(Γ₂) = M_{k,j}(Γ₂(2))^{S₆}`, `M_{k,j}(Γ₀(2))` the invariants of `Γ₀(2)/Γ₂(2)` and
`M_{k,j}(Γ₁(2))` those of `(ℤ/2)³`; the isotypic multiplicities `m_λ(k, j)`, `l_λ(k, j)`
(for `M` and `S`) indexed by the eleven partitions `λ ⊢ 6` are the invariants the LMFDB's
`Gamma_2`, `Gamma1_2`, `Gamma0_2` dimension tables display, with the branching
`S₆ ↓ S₃` of the knowl (`m_{[6]} + m_{[4,2]} + m_{[2³]}` for `Γ₀(2)`). State the generating
functions `∑_k m_λ(k, j) t^k` for `j ∈ {0, 2, 4, 6, 8, 10, 12, 14, 16}` as rational functions
(Cléry–van der Geer–Grushevsky 2015; Bergström–Faber–van der Geer 2008) — the stored rational
functions of the LMFDB's `smf_dims` table are the certificate against which the statements are
checked, so each `(λ, j)` is a theorem whose proof is the comparison of two rational functions.

*Prerequisites:* 0.6, 1.3, 3.5, 5.4, 6.1; Mathlib `Equiv.Perm`, `Representation`.

### 6.6 Ibukiyama's rings for `Γ₀(3)` and the character `ψ₃`

Define `ψ₃ : Γ₀^{(2)}(3) →* {±1}`, `ψ₃(γ) := (−3 / det D)` (Kronecker symbol; `det D` is prime
to 3 on `Γ₀(3)`), the discriminant character of the lattice `A₂` (5.2), and the forms of the
knowl `mf.siegel.family.gamma0_3`: `α₁ := θ_{A₂}^{(2)} ∈ M_1(Γ₀(3), ψ₃)`,
`β₃ := θ_{E₆} − 10 θ_{A₂}³ + 9 θ_{E₆^*}`, `δ₃ := θ_{E₆} − 9 θ_{E₆^*}`, both in `M_3(Γ₀(3), ψ₃)`
(degree-two theta series of 5.2; `E₆^* = 3E₆⁻¹` is even of determinant `3⁵` and level `3`) and
neither cuspidal: with `θ_{E₆}^{(1)} = 1 + 72q + 270q² + 720q³ + …`,
`θ_{A₂}^{(1)} = 1 + 6q + 6q³ + …` and `θ_{E₆^*}^{(1)} = 1 + 54q² + 72q³ + …`,
`Φβ₃ = −108q − 324q² − 972q³ − …` and
`Φδ₃ = −8 + 72q − 216q² + …`. The knowl writes `S_3` for both; the one linear relation among the
three degree-one theta series is `θ_{E₆} − 4θ_{A₂}³ + 3θ_{E₆^*} = 0`, so `dim S_3(Γ₀(3), ψ₃) ≤ 1`,
and the ring statement below uses only that `α₁³, β₃, δ₃` is a basis of `M_3(Γ₀(3), ψ₃)`, which
holds for any two combinations of `θ_{E₆}, θ_{A₂}³, θ_{E₆^*}` independent modulo `ℂα₁³`;
`γ₄ := θ_{S,P} ∈ S_4(Γ₀(3))` (5.3, with the knowl's `S` and pluriharmonic `P`), and
`χ₁₄ := 2^{−9} 3^{−10} (2πi)^{−3} det [[α₁, 3β₃, 4γ₄, 3δ₃], [∂_τ α₁, …], [∂_z …], [∂_ω …]] ∈ S_{14}(Γ₀(3), ψ₃)`
(the weight-scaled Wronskian construction of 6.2, first row `k_i f_i` for the weights
`1, 3, 4, 3`, which is the row that makes the determinant modular; the knowl prints the first
row as `α₁, 3β₃, 4γ₄/2, 3δ₄`, and its constant `2^{−9} 3^{−10} (2πi)^{−3}` is Ibukiyama's for
his normalization of `γ₄`, so the first reduced `T₀` with `a(χ₁₄; T₀) ≠ 0` together with that
coefficient is a target and `χ₁₄` is pinned by it, not by the constant).
State **Ibukiyama's theorems** (Ibukiyama 1991): `α₁, β₃, γ₄, δ₃` are algebraically independent;
with `B := ℂ[α₁, β₃, γ₄, δ₃]` and `C := ℂ[α₁², β₃², γ₄, δ₃²]`,
`M_*(Γ₀(3)) = B^{even} ⊕ C α₁χ₁₄ ⊕ C β₃χ₁₄ ⊕ C δ₃χ₁₄ ⊕ C α₁β₃δ₃χ₁₄` and
`⨁_k M_k(Γ₀(3), ψ₃) = B^{odd} ⊕ B^{even} χ₁₄`, where `B^{even}`, `B^{odd}` are the parts of
even and odd total weight (so a monomial lies in `M_k(Γ₀(3))` or `M_k(Γ₀(3), ψ₃)` according
to the parity of the number of `ψ₃`-twisted factors, by 1.3's product law for characters). The
Hilbert series of both modules and the first dimensions (`dim M_k(Γ₀(3))` for `k = 0, …, 8` is
`1, 0, 1, 0, 4, 0, 7, 0, 10`, with `M_4(Γ₀(3))` spanned by `α₁⁴, α₁β₃, α₁δ₃, γ₄`;
`dim M_k(Γ₀(3), ψ₃)` for `k = 1, 3, 5, 7` is `1, 3, 4, 9`; the first odd weight with
`M_k(Γ₀(3)) ≠ 0` is `15`, from `α₁χ₁₄`) are targets read off the structure. These are the LMFDB
families `Gamma0_3` and `Gamma0_3_psi_3`.

*Prerequisites:* 1.3, 3.5, 5.2, 5.3, 6.2.

### 6.7 Ibukiyama's ring for `Γ₀(2)`

Define, from the theta constants of 5.4 in the knowl's four-digit notation `θ_{ε'₁ε'₂ε''₁ε''₂}`,
`X := (θ₀₀₀₀⁴ + θ₀₀₀₁⁴ + θ₀₀₁₀⁴ + θ₀₀₁₁⁴)/4 ∈ M_2(Γ₀(2))`,
`Y := (θ₀₀₀₀θ₀₀₀₁θ₀₀₁₀θ₀₀₁₁)² ∈ M_4(Γ₀(2))`,
`Z := ((θ₀₁₀₀⁴ − θ₀₁₁₀⁴)²)/16384 ∈ M_4(Γ₀(2))`,
`K := (θ₀₁₀₀θ₀₁₁₀θ₁₀₀₀θ₁₀₀₁θ₁₁₀₀θ₁₁₁₁)²/4096 ∈ M_6(Γ₀(2))`, `T := (θ₀₁₀₀θ₀₁₁₀)⁴/256`,
`θ' := (θ₁₀₀₀¹² + θ₁₀₀₁¹² + θ₁₁₀₀¹² + θ₁₁₁₁¹²)/1536`, and the cusp form
`χ₁₉ := χ₅ θ' (8YZ − X²T + YT + 1024ZT + 96T² − 8XK)/32 ∈ S_{19}(Γ₀(2))`, prove the stated
weights and groups (each is a polynomial in the `x_i` and `θ_ε` invariant under `Γ₀(2)` up to
the automorphy factor, by 5.4's permutation action), and state **Ibukiyama's theorem**
(Ibukiyama 1991): `X, Y, Z, K` are algebraically independent and
`M_*(Γ₀(2)) = ℂ[X, Y, Z, K] ⊕ χ₁₉ ℂ[X, Y, Z, K]`, with Hilbert series
`(1 + t¹⁹)/((1 − t²)(1 − t⁴)²(1 − t⁶))`, `dim M_k(Γ₀(2))` for `k = 0, 2, 4, 6, 8` equal to
`1, 1, 3, 4, 7`, and `M_k(Γ₀(2)) = 0` for odd `k < 19`. The vector-valued tables `M_{k,j}(Γ₀(2))`
of the LMFDB family `Gamma0_2` are the `Γ₀(2)/Γ₂(2)`-invariants of 6.5.

*Prerequisites:* 1.3, 3.5, 5.4, 6.5.

### 6.8 The rings for `Γ₀(4)` and the character `ψ₄`

Define `ψ₄ : Γ₀^{(2)}(4) →* {±1}`, `ψ₄(γ) := (−4 / det D)` (the Kronecker character of
discriminant `−4`, the discriminant character of the lattice `√2 ℤ²`, 5.2; `det D` is odd on
`Γ₀(4)`), the doubling operator `(F(2Ω))(τ) := F(2τ)` (which maps `M_k(Γ₀(2))` to
`M_k(Γ₀(4))`, by conjugating with `diag(1, 1, 2, 2) ∈ GSp⁺₄(ℚ)`), and the forms of the knowls
`mf.siegel.family.gamma0_4` and `mf.siegel.family.gamma0_4_psi_4`: `X`, `X(2Ω)`, `f₂(2Ω)` with `f₂ := θ₀₀₀₀⁴`,
`K(2Ω)`, `Y(2Ω)`, `f₁₁(2Ω)` with `f₁₁ := f₆ χ₅`,
`f₆ := (θ₀₀₀₁⁴ − θ₀₀₁₀⁴)(θ₀₀₀₁⁴ − θ₀₀₁₁⁴)(θ₀₀₁₀⁴ − θ₀₀₁₁⁴)`, `f₁ := θ₀₀₀₀²`,
`f₃ := (θ₀₀₀₀θ₀₀₀₁θ₀₀₁₁)²`. State the theorems of **Aoki–Ibukiyama** (2005) and
**Hayashida–Ibukiyama** (2005): with `B := ℂ[X, X(2Ω), f₂(2Ω), K(2Ω)]` (algebraically
independent, weights `2, 2, 2, 6`: `f₂ = θ₀₀₀₀⁴` has weight `2`, each theta constant having
weight `1/2`, and the knowl's "weight 4" for `f₂(2Ω)` is a misprint that the LMFDB's dimension
code does not share), `M_*(Γ₀(4)) = B ⊕ Y(2Ω) B ⊕ f₁₁(2Ω) (B ⊕ Y(2Ω) B)` and
`⨁_k M_{2k}(Γ₀(4), ψ₄) = f₁₁(2Ω) f₁(2Ω) B ⊕ f₁₁(2Ω) f₃(2Ω) B` (free over `B` on generators of
weights `12` and `14`), with `dim M_k(Γ₀(4))` for `k = 0, 2, 4, 6, 8` equal to `1, 3, 7, 14, 24`
(`M_2(Γ₀(4))` is spanned by `X`, `X(2Ω)`, `f₂(2Ω)`), `dim M_{11}(Γ₀(4)) = 1`,
`dim M_{2k}(Γ₀(4), ψ₄) = 0` for `2k ≤ 10`, `1` for `2k = 12` and `4` for `2k = 14`, and the
Hilbert series `(1 + t⁴)(1 + t¹¹)/((1 − t²)³(1 − t⁶))` for `M_*(Γ₀(4))` and
`(t¹² + t¹⁴)/((1 − t²)³(1 − t⁶))` for the even-weight `ψ₄`-module, the two rational functions of
`lmfdb/siegel_modular_forms/dimensions.py`. ⚠ The knowl for `Γ₀(4)` with `ψ₄` lists a third summand
`Y(2Ω) B`; `Y(2Ω)` lies in `M_4(Γ₀(4))` with trivial character (it is a summand of `M_*(Γ₀(4))`
above), so it cannot generate part of the `ψ₄`-module, and the LMFDB's dimension code omits it.
The odd-weight part of `⨁_k M_k(Γ₀(4), ψ₄)` is not recorded by the LMFDB and is not a target
here. The LMFDB's half-integral weight family on `Γ₀(4)` (weight `k − 1/2`) is the
sibling `HalfIntegralWeightModularForms`'.

*Prerequisites:* 0.2, 1.2, 1.3, 3.5, 5.4, 6.7.

### 6.9 Degrees three and four, stated

State **Tsuyumine's theorem** (Tsuyumine 1986): `M_*(Γ₃)` is generated by 34 explicit forms
(theta constants and theta series with pluriharmonic coefficients), with the Hilbert series
`∑ dim M_k(Γ₃) t^k = N(t)/((1 − t⁴)(1 − t¹²)²(1 − t¹⁴)(1 − t¹⁸)(1 − t²⁰)(1 − t³⁰))` for the
palindromic numerator
`N(t) = 1 + t⁶ + t¹⁰ + t¹² + 3t¹⁶ + 2t¹⁸ + 2t²⁰ + 5t²² + 4t²⁴ + 5t²⁶ + 7t²⁸ + 6t³⁰ + 9t³² + 10t³⁴ + 10t³⁶ + 12t³⁸ + 14t⁴⁰ + 15t⁴² + 16t⁴⁴ + 18t⁴⁶ + 18t⁴⁸ + 19t⁵⁰ + 21t⁵² + 19t⁵⁴ + 21t⁵⁶ + 21t⁵⁸ + 19t⁶⁰ + 21t⁶² + 19t⁶⁴ + 18t⁶⁶ + 18t⁶⁸ + 16t⁷⁰ + 15t⁷² + 14t⁷⁴ + 12t⁷⁶ + 10t⁷⁸ + 10t⁸⁰ + 9t⁸² + 6t⁸⁴ + 7t⁸⁶ + 5t⁸⁸ + 4t⁹⁰ + 5t⁹² + 2t⁹⁴ + 2t⁹⁶ + 3t⁹⁸ + t¹⁰² + t¹⁰⁴ + t¹⁰⁸ + t¹¹⁴` (the LMFDB's `Sp6Z` dimension code), `M_k(Γ₃) = 0` for odd `k` (the parity lemma: `kg`
odd), and `dim M_k(Γ₃)` for `k = 4, 6, 8, 10, 12, 14, 16, 18, 20` equal to
`1, 1, 1, 2, 4, 3, 7, 8, 11`, with non-cusp part `dim M_k(Γ₂)` (4.3: `Φ` is onto for even
`k > 6`), so `S_k(Γ₃) = 0` for `k ≤ 10`, `dim S_{12}(Γ₃) = 1` (Miyawaki's form, the type I
lift of 9.8), `dim S_{14}(Γ₃) = 1` (the conjectural type II lift of `Δ` and the weight-26
eigenform), `dim S_{16}(Γ₃) = 3`, `dim S_{18}(Γ₃) = 4`, `dim S_{20}(Γ₃) = 6`. State **Poor–Yuen's
theorem** (Poor–Yuen 2007): `dim S_k(Γ₄)` for
`k = 8, 10, 12, 14, 16` is `1, 1, 2, 3, 7`, zero for the other `k ≤ 16`, with the Schottky form
`J = θ_{E₈⊕E₈}^{(4)} − θ_{D₁₆⁺}^{(4)}` spanning `S_8(Γ₄)` (the Ikeda lift of `Δ`, 9.7) and
vanishing exactly on the Jacobian locus. Both are classifications stated by citation; the
degree-two instances `dim S_8(Γ₂) = 0` and `θ_{E₈⊕E₈}^{(2)} = θ_{D₁₆⁺}^{(2)} = ψ₄²`
(`dim M_8(Γ₂) = 1`)
are proved from 6.3 and 5.2.

*Prerequisites:* 3.1, 4.3, 5.2, 5.4, 6.3.

## Layer 7: Hecke operators and Satake parameters

### 7.1 The Hecke pair `(Γ_g, GSp⁺_{2g}(ℚ))`

Prove that `Γ_g` and `GSp⁺_{2g}(ℚ)` form a Hecke pair in Mathlib's sense
(`IsHeckeTriple`/`HeckeRing` of `Mathlib/NumberTheory/HeckeRing/Defs.lean`: `Γ_g` is
commensurable with each conjugate `γ Γ_g γ⁻¹`, `γ ∈ GSp⁺_{2g}(ℚ)`), so that
`H(Γ_g, GSp⁺_{2g}(ℚ))` is Mathlib's Hecke ring with its convolution product (the knowl
`mf.siegel.hecke_operator`, and Tau Ceti's `TauCeti.NumberTheory.HeckeRing.*` for `g = 1`).
Prove: `O_g(m)` (0.2) is a finite union of right cosets `Γ_g γ_i` with representatives
`[[A, B], [0, D]]`, `AᵀD = m·1`, `A` upper triangular, `B` reduced modulo `D` (van der Geer,
Lemma 16.1); the elementary-divisor theorem: every double coset `Γ_g γ Γ_g` with `γ`
integral has a unique representative `diag(a₁, …, a_g, d₁, …, d_g)` with `a_i d_i = μ(γ)`,
`a_i ∣ a_{i+1}`, `a_g ∣ d_g` (Proposition 16.2); the anti-involution `γ ↦ γ^∨` fixes every
double coset, so the Hecke ring is **commutative**; the local algebras `H_p` and the
decomposition `H = ⨂_p H_p`; and the generation of the integral local algebra `H_p⁰` by
`T(p)` and `T_i(p²)`, `1 ≤ i ≤ g` (Theorem 16.3). Define `T(m) := ∑` of the double cosets in
`O_g(m)` (Definition 16.4), so `T(p)` is one double coset and `T(p²) = ∑_{i=0}^{g} T_i(p²)`,
and prove the degree-two coset counts (right cosets of `Γ₂` in the double coset, equivalently
sublattices `ℤ⁴γ` of index `μ²` on which the form is divisible by `μ`, by elementary-divisor
type): `#Γ₂\T(p) = (p+1)(p²+1)`, `#Γ₂\T₀(p²) = p³(p+1)(p²+1)`, `#Γ₂\T₁(p²) = p(p+1)(p²+1)`,
`#Γ₂\T₂(p²) = 1`, so `#Γ₂\O₂(p²) = (p+1)(p²+1)(p³+p) + 1`; acceptance values `15, 120, 30, 1`
(total `151`) for `p = 2` and `40, 1080, 120, 1` (total `1201`) for `p = 3`.

*Prerequisites:* 0.2, 0.6; Mathlib `IsHeckeTriple`, `HeckeRing`, `Subgroup.Commensurable`.

### 7.2 The action on `M_ρ(Γ_g)`

For `M ⊆ GSp⁺_{2g}(ℚ)` with `M = ⊔_{i=1}^{h} Γ_g γ_i` and `M Γ_g ⊆ M` define
`T_M f := ∑_i f ∣_{ρ, e(ρ)} γ_i` (in Lean the exponent is an explicit argument, `heckeT ρ e m`,
with `scalarExponent g k` and `vectorExponent k j` its two values) and prove independence of the
representatives, `T_M f ∈ M_ρ(Γ_g)`, linearity, that `T_M` preserves `S_ρ(Γ_g)` (the `Φ` of each
slash is a slash of
`Φ f`), the ring homomorphism `H(Γ_g, GSp⁺_{2g}(ℚ)) → End(M_ρ(Γ_g))` (compatibility with the
convolution product), the adjointness `⟨T f, g⟩ = ⟨f, T^∨ g⟩` for the Petersson product (3.4) and
hence **self-adjointness** (`T^∨ = T` in the Hecke ring, 7.1), the existence of a basis of
`S_ρ(Γ_g)` of simultaneous eigenforms (a commuting family of self-adjoint operators on a
finite-dimensional inner product space), and that the eigenvalues are real. Define
`IsHeckeEigenform f := ∀ T, ∃ λ, T f = λ f` with the eigenvalue character `λ_f : H → ℂ`
(the knowl's **Hecke eigenform**). For `g = 1` and `ρ = det^k` the operator `T(p)` is Tau Ceti's
`Tₙ` of `TauCeti.NumberTheory.ModularForms.HeckeSlash.*` at `n = p` under 1.3 (the
normalization of the conventions table makes the eigenvalue `a_p`), the bridge check.

*Prerequisites:* 1.2, 1.3, 3.2, 3.4, 3.5, 7.1; Tau Ceti `HeckeSlash`.

### 7.3 Hecke operators for congruence and paramodular groups

For `Γ ∈ {Γ₀^{(g)}(N), Γ₁^{(g)}(N), Γ_g(N), K(N)}` and a prime `p ∤ N` define `T(p)` and
`T_i(p²)` on `M_ρ(Γ)` and `M_ρ(Γ, ψ)` by the double cosets `Γ diag(1_g, p1_g) Γ`,
`Γ diag(1_{g−i}, p1_i, p²1_{g−i}, p1_i) Γ` (the knowl's `T_{(1,1,p,p)}` and `T_{(1,p,p,p²)}` for
`g = 2`), prove they are finite unions of right cosets with the same representatives as 7.1
reduced modulo `Γ`, that they commute with each other for all `p ∤ N`, preserve cusp forms, are
self-adjoint for the Petersson product on `S_ρ(Γ)`, and commute with the Fricke involution
`μ_N` on `M_ρ(K(N))` (0.7). For `K(N)` and `p ∣ N` define the two paramodular operators at `p`
of Roberts–Schmidt (the double cosets `K(N) diag(1, 1, p, p) K(N)` and
`K(N) diag(1, p, p², p) K(N)`,
which exist for every `p` but are not self-adjoint when `p ∣ N`), and the involution `μ_N`; their
eigenvalues on newforms are the data 10.4 names. The nebentypus action: for `ψ : Γ₀(N) →* ℂˣ`
trivial on `Γ₁(N)`, `T(p)` on `M_ρ(Γ₀(N), ψ)` carries the extra factor `ψ(D)` of the
representatives, as in the degree-one convention of the [modular-forms
roadmap](../ModularForms/README.md)
*Layer 2*.

*Prerequisites:* 0.6, 0.7, 1.3, 3.4, 7.1, 7.2.

The operators of this milestone are specified in this README only.

**Checks.**

- For `N = 1`, `K(1) = Γ₂` and `T(p)` is the operator of 7.2, with `(p + 1)(p² + 1)` right cosets
  (`15` at `p = 2`); for `p ∤ N` the coset count on `K(N)` is the same.
- `f₂₇₇` (10.5) is an eigenform of `T(2)` with eigenvalue `λ(2) = −2`, and `2 ∤ 277`.
- At `p ∣ N` the two paramodular operators exist but are not self-adjoint; no Check may assert
  self-adjointness there.

### 7.4 The Satake isomorphism and Satake parameters

State the **Satake isomorphism** (van der Geer, Theorem 17.1): `H_p ⊗ ℚ ≅ ℚ[Y]^{W}` for the
cocharacter lattice `Y ≅ ℤ^{g+1}` of the diagonal torus of `GSp_{2g}` and `W = S_g ⋉ (ℤ/2)^g`,
with `S_{G,M}` and `S_{M,T}` through the Levi `GL_g × G_m` (Proposition 18.1:
`S_{G,M}(T(p)) = ∑_{i=0}^{g} φ_i`, `S_{M,T}(φ_i) = (v₁⋯v_g) σ_i(u₁/v₁, …, u_g/v_g)`). Deduce,
as a proved consequence for the eigenforms of 7.2: `Hom_ℂ(H_p, ℂ) ≅ (ℂˣ)^{g+1}/W`, so a Hecke
eigenform `F ∈ M_ρ(Γ_g)` with eigenvalue character `λ_F` determines its **Satake parameters**
`(α₀, α₁, …, α_g) ∈ (ℂˣ)^{g+1}` modulo `W` at each `p` (`τ_i : α₀ ↦ α₀α_i, α_i ↦ α_i⁻¹`,
`S_g` permuting `α₁, …, α_g`), with `λ_F(T(p)) = α₀ (1 + σ₁ + … + σ_g)` for the elementary
symmetric functions `σ_i` of `α₁, …, α_g`, the formula of Proposition 18.1 for
`λ_F(T_i(p²))`, and the relation `α₀² α₁ ⋯ α_g = p^{∑λ_i − g(g+1)/2}` (van der Geer §19:
`T_g(p²) = Γ_g (p·1) Γ_g` acts on `M_ρ(Γ_g)` by the scalar `p^{2e(ρ)} ρ(p·1)⁻¹ = p^{∑λ_i − g(g+1)}`,
and its normalized Satake transform is `p^{−g(g+1)/2} α₀² α₁ ⋯ α_g`; the two exponents differ by
the `g(g+1)/2` of the normalization, so in degree two `λ(T₂(p²)) = p^{2k−6}` on `M_k(Γ₂)` while
`α₀² α₁ α₂ = p^{2k−3}`).
Prove for `g = 2` the relations `T(p)² = T₀(p²) + (p+1) T₁(p²) + (p³+p²+p+1) T₂(p²)` and that
`H_p` is generated by `T(p)` and `T(p²)` (equivalently `T(p)` and `T₁(p²)`), and for `g = 1`
the comparison with Tau Ceti's `satakeParameters`: `(α₀, α₁) = (β, β̄/β)` where
`1 − a_p X + p^{k−1}X² = (1 − βX)(1 − β̄X)`. Prove the Eisenstein values: for
`F = E_k^{(g)}`, `α₀ = 1`, `α_i = p^{k−i}`, hence `λ(T(p)) = ∏_{i=1}^{g} (1 + p^{k−i})`
(`45 = 5 · 9` for `ψ₄` at `p = 2`, `280` at `p = 3`; `561 = 33 · 17` for `ψ₆` at `p = 2`).

*Prerequisites:* 7.1, 7.2; Tau Ceti `satakeParameters`; Mathlib `MvPolynomial.esymm`.

The Satake parameters are specified in this README only.

**Checks.**

- `ψ₄` at `p = 2`: `(α₀, α₁, α₂) = (1, 2³, 2²)`, `λ(T(2)) = (1 + 8)(1 + 4) = 45`, and
  `α₀² α₁ α₂ = 2⁵ = 2^{2k−3}` at `k = 4`.
- `χ₁₀` at `p = 2`: `(α₀, α₁, α₂) = (2⁸, β 2⁻⁸, β̄ 2⁻⁸)` with `β + β̄ = −528`, `ββ̄ = 2¹⁷`
  (`f₁₈`), so `λ(T(2)) = 2⁸ − 528 + 2⁹ = 240` (9.5).
- `W`-invariance: `(8, 1/8, 4)`, the image of `(1, 8, 4)` under `τ₁`, gives the same
  `λ(T(2)) = 8 (1 + 1/8)(1 + 4) = 45`; a definition must not distinguish the two tuples.
- For `g = 1`, `(α₀, α₁) = (β, β̄/β)` against Tau Ceti's `satakeParameters`; for `Δ` at `p = 2`,
  `β + β̄ = −24`, `ββ̄ = 2¹¹`.

### 7.5 The degree-two coefficient formula

Prove, for `F ∈ M_{k,j}(Γ₂)` with coefficients `a(T) ∈ V_j = homogeneousSubmodule (Fin 2) ℂ j`
and the representatives `R_p = {[[1,0],[0,p]]} ∪ {[[p, u],[0, 1]] : 0 ≤ u < p}` of the
conventions table:
`a(T(p)F; T) = a(pT) + p^{2k+j−2} ∑_{U ∈ R_p} ρ_{k,j}(Uᵀ)⁻¹ a(p⁻¹ UᵀTU) + p^{2k+j−3} a(T/p)`,
where `a(T') := 0` unless `T'` is half-integral, and in scalar weight (`j = 0`)
`a(T(p)F; T) = a(pT) + p^{k−2} ∑_{U ∈ R_p} a(p⁻¹UᵀTU) + p^{2k−3} a(T/p)` (Andrianov 1974, §1;
the three terms are the cosets with `(A, D) = (p·1, 1)`, `(pU^{−ᵀ}, Uᵀ)`-type with `p` values of
`B` each, and `(1, p·1)` with `p³` values of `B`). Deduce `λ(p) a(T) = ` the right-hand side for
an eigenform, and in particular `λ_F(p) = a(F; (p, p, p)) + p^{k−2} ∑_U a(F; p⁻¹Uᵀ(1,1,1)U) + 0`
whenever `a(F; (1,1,1)) = 1` — the formula by which the LMFDB's Hecke eigenvalues are
computed from the stored coefficients. Acceptance (all with `a(1,1,1) = 1`): `λ_{χ₁₀}(2) = 240`,
`λ_{χ₁₀}(3) = 21960`, `λ_{χ₁₀}(5) = 1317900`; `λ_{χ₁₂}(2) = 2784`, `λ_{χ₁₂}(3) = 107352`,
`λ_{χ₁₂}(5) = 80234700`; and the rejection: with the lower-triangular family `[[p, 0],[u, 1]]`
in place of `R_p` the right-hand side divided by `a(T)` is `240` at `T = (1,1,1)` but `−16` at
`T = (1,0,1)` for `χ₁₀`, so that family does not define an operator commuting with the
`Γ₂`-action. Also prove the formula for `T(m)` with `m` squarefree by composition, and the
**multiplicativity** `λ(mn) = λ(m)λ(n)` for `(m, n) = 1` (from `H = ⨂ H_p`).

*Prerequisites:* 2.2, 7.1, 7.2.

### 7.6 Eigenforms: existence, fields, and examples

Prove: `M_ρ(Γ_g) = N_ρ ⊕ S_ρ` (3.4) is Hecke-stable, and `N_k(Γ_g)` for even `k > 2g` has the
Hecke-stable decomposition of 4.3 into Klingen summands, with `E_{g,r,k}(f)` an eigenform when
`f` is and the Satake parameters of `E_{g,r,k}(f)` being those of `f` extended by the Eisenstein
ones `p^{k−r−1}, …, p^{k−g}`: for `g = 2`, `r = 1` and `f ∈ S_k(SL₂(ℤ))` with `a_p(f) = β + β̄`,
`ββ̄ = p^{k−1}`, the tuple is `(α₀, α₁, α₂) = (β, β̄/β, p^{k−2})`, so
`Q_p(E_{2,1,k}(f), X) = (1 − βX)(1 − β̄X)(1 − p^{k−2}βX)(1 − p^{k−2}β̄X)`,
`L(s, E_{2,1,k}(f), spin) = L(s, f) L(s − k + 2, f)` and
`λ(T(p)) = α₀(1 + α₁ + α₂ + α₁α₂) = a_p(f)(1 + p^{k−2})`. Prove
in degree two that `χ₁₀`, `χ₁₂` and `χ₃₅` are eigenforms (one-dimensional spaces `S_{10}`,
`S_{12}`, `S_{35}`) and that `ψ₄, ψ₆, ψ₁₀, ψ₁₂` are eigenforms with the Eisenstein parameters.
State that an eigenform's eigenvalues generate a number field (11.2 supplies the rational
structure) and define, as targets, the eigenvalue lists `λ_F(T(l))` for `l` prime and
`l = p²` that the LMFDB displays ("eigenvalues `λ(l)` of `T(l)`").

*Prerequisites:* 3.4, 4.3, 6.3, 7.2, 7.4, 7.5.

## Layer 8: spinor and standard `L`-functions

### 8.1 Euler factors

For a Hecke eigenform `F ∈ M_ρ(Γ_g)` with Satake parameters `(α₀, …, α_g)` at `p` define the
**spinor Euler factor** `Q_p(F, X) := (1 − α₀X) ∏_{∅ ≠ I ⊆ {1..g}} (1 − α₀ α_I X)`,
`α_I = ∏_{i∈I} α_i`
(degree `2^g`), and the **standard Euler factor**
`D_p(F, X) := (1 − X) ∏_{i=1}^{g} (1 − α_iX)(1 − α_i⁻¹X)`
(degree `2g + 1`), prove both are `W`-invariant (hence well defined on the `W`-orbit) and have
coefficients in `ℚ(λ_F(T) : T ∈ H_p)`, and prove the degree-two identity
`Q_p(F, X) = 1 − λ(p)X + (λ(p)² − λ(p²) − p^{2k+j−4})X² − λ(p)p^{2k+j−3}X³ + p^{4k+2j−6}X⁴`
for `F ∈ M_{k,j}(Γ₂)` (van der Geer §18; `T₂(p²)` acts by `p^{2k+j−6}`) together with
Andrianov's generating identity `∑_{i ≥ 0} λ(p^i) z^i = (1 − p^{2k+j−4} z²) / Q_p(F, z)`
in `ℂ[[z]]` (the local form of 8.2's `L(s, F, spin) = ζ(2s − 2k − j + 4) ∑_m λ(m) m^{−s}`; the
`z²`-coefficient is the `X²`-coefficient identity above read backwards). Degree one:
`Q_p(f, X) = 1 − a_pX + p^{k−1}X²` is the Euler factor of the
[modular-forms roadmap](../ModularForms/README.md) *Layer 7*;
`D_p(f, X) = (1 − X)(1 − (a_p²/p^{k−1} − 2)X + X²)`
(the knowl `mf.siegel.lift.miyawaki`). Eisenstein:
`Q_p(E_k^{(g)}, X) = ∏_{I} (1 − p^{∑_{i∈I}(k−i)} X)`
and `D_p(E_k^{(g)}, X) = (1 − X)∏_{i=1}^{g}(1 − p^{k−i}X)(1 − p^{i−k}X)`.

*Prerequisites:* 7.4, 7.5; Mathlib `Polynomial`.

### 8.2 The `L`-functions as Euler products

Define `L(s, F, spin) := ∏_p Q_p(F, p^{−s})⁻¹` and `L(s, F, st) := ∏_p D_p(F, p^{−s})⁻¹` as
Euler products (Mathlib's `EulerProduct` API) with their Dirichlet-series coefficients
`b_F(n)`, and prove absolute convergence of both for `Re s > k + j/2 + 1` in degree two, from
the eigenvalue bound `|λ_F(p)| ≤ C p^{k + j/2}` and `|λ_F(p²)| ≤ C p^{2k + j}` that the cusp-form
coefficient bound of 3.2 gives through 7.5 (so every `|α₀ α_I| ≤ C' p^{k + j/2}`). The
**Ramanujan–Petersson bound** `|α₀ α_I| = p^{(2k+j−3)/2}` for every `I` (Weissauer 2009, for
`F ∈ S_{k,j}(Γ₂)` not in the Maass space) is stated, not proved; under it the half-plane is
`Re s > k + j/2 − 1/2`, and every use of it below is an implication. Prove in degree two the
identity of Dirichlet series
`L(s, F, spin) = ζ(2s − 2k − j + 4) ∑_{m ≥ 1} λ_F(m) m^{−s}` (van der Geer §20, from 8.1's
generating identity and the multiplicativity of 7.5) — the shape in which Andrianov's theorem is
stated — and for `g = 1` the comparison `L(s, f, spin) = L(s, f)` of the modular-forms roadmap.
The **Saito–Kurokawa factorization** `L(s, χ₁₀, spin) = ζ(s − 9) ζ(s − 8) L(s, f₁₈)` is the
acceptance value of 9.5; its `p = 2` factor is `(1 − 2⁸X)(1 − 2⁹X)(1 + 528X + 2¹⁷X²)`.

*Prerequisites:* 2.5, 3.2, 7.5, 8.1; Mathlib `LSeries`, `EulerProduct`.

The two `L`-functions are specified in this README only, since they are built from the Satake
parameters of 7.4.

**Checks.**

- `χ₁₀` at `p = 2`: `Q₂ = (1 − 2⁸X)(1 − 2⁹X)(1 + 528X + 2¹⁷X²)`, and
  `L(s, χ₁₀, spin) = ζ(s − 9) ζ(s − 8) L(s, f₁₈)`.
- `ψ_k` in degree two: `Q_p = (1 − X)(1 − p^{k−1}X)(1 − p^{k−2}X)(1 − p^{2k−3}X)`, the case
  `g = 2` of 8.1's Eisenstein factor.
- For `g = 1`, `L(s, f, spin) = L(s, f)` of the modular-forms roadmap *Layer 7*.
- The `X`-coefficient of `Q₂(χ₁₀, X)` is `−2⁸ − 2⁹ + 528 = −240 = −λ(2)`, as 8.1's degree-two
  identity requires.

### 8.3 Analytic continuation and functional equations, stated

State **Andrianov's theorem** (Andrianov 1974, Theorem 3.1.1; Arakawa 1983 for `j > 0`): for a
Hecke eigenform `F ∈ S_{k,j}(Γ₂)`, `Λ(s, F, spin) := Γ_ℂ(s) Γ_ℂ(s − k + 2) · L(s, F, spin)` with
`Γ_ℂ(s) = 2(2π)^{−s}Γ(s)` — the shift `k − 2` does not move with `j`: the
Hodge types of weight `(k, j)` are `(0, w), (k − 2, k + j − 1), (k + j − 1, k − 2), (w, 0)` with
`w = 2k + j − 3`, so the two gamma factors are `Γ_ℂ(s)` and `Γ_ℂ(s − k + 2)` for every `j`; in
scalar weight this is `Γ(s)Γ(s − k + 2)(2π)^{−2s}` up to constants — continues meromorphically to
`ℂ` with finitely many poles and satisfies
`Λ(2k + j − 2 − s, F, spin) = (−1)^k Λ(s, F, spin)`; it is entire when `F` is orthogonal to
the Maass space (9.4), and for `F = SK(f)` in the Maass space (9.5)
`L(s, F, spin) = ζ(s − k + 1) ζ(s − k + 2) L(s, f)` has exactly one pole, simple, at `s = k`: the
pole of
`ζ(s − k + 2)` at `s = k − 1` is cancelled by the zero of `L(s, f)` at its center `k − 1`,
forced by the root number `(−1)^{k−1} = −1` of `f ∈ S_{2k−2}(SL₂(ℤ))` for even `k`, while
`L(k, f) ≠ 0` since `k` lies in the half-plane of absolute convergence of `L(s, f)`; the
completed `Λ(s, F, spin)` then has poles at `s = k` and at its mirror `s = k − 2` (there the
factor `Γ_ℂ(s − k + 2)` has its pole). State **Böcherer's and Andrianov–Kalinin's theorem**
(Böcherer 1985;
Andrianov–Kalinin 1978; Piatetski-Shapiro–Rallis 1987) for the standard `L`-function of a
scalar eigenform `F ∈ M_k(Γ_g)`:
`Δ(s, F) := (2π)^{−gs} π^{−s/2} Γ((s + ε)/2) ∏_{j=1}^{g} Γ(s + k − j) L(s, F, st)`,
`ε ∈ {0, 1}` with `ε ≡ g mod 2`, continues meromorphically with `Δ(s, F) = Δ(1 − s, F)`, and
for a cusp form with `k ≥ g` is holomorphic except for simple poles at `s = 0, 1`, holomorphic
when `F` is orthogonal to the theta series of even unimodular lattices of rank `2g` (5.2). For
`g = 1` the spinor statement is the modular-forms roadmap's *Layer 7* functional equation,
consumed as the bridge check; nothing of degree `≥ 2` is proved here, and every use below of a
value of `L(s, F, spin)` outside the half-plane of 8.2 is an implication from this milestone.

*Prerequisites:* 3.4, 8.2.

### 8.4 The root number, the motivic weight and the degree-one comparison

Record the invariants that `LFunctions` needs: for `L(s, F, spin)`, `F ∈ S_{k,j}(Γ₂)`: degree
`4`, conductor `1`, motivic weight `w = 2k + j − 3`, gamma factor `Γ_ℂ(s) Γ_ℂ(s − k + 2)` in the
arithmetic normalization (two complex gamma factors with shifts `0` and `k − 2`, 8.3; in the
analytic normalization `Γ_ℂ(s + (j+1)/2) Γ_ℂ(s + (2k+j−3)/2)`), root
number `(−1)^k`, polar divisor of `L(s, F, spin)` empty for `F ⊥` Maass space and `{k}` for a
Saito–Kurokawa lift (8.3; the completed function adds the mirror pole `k − 2`); for
`L(s, F, st)`, `F ∈ S_k(Γ_g)`: degree `2g + 1`, conductor `1`, weight `0`, root number `1`.
Prove the consistency check `w + 1 − s` symmetric about `k + j/2 − 1` and the degree-one case
`w = k − 1`, root number `(−1)^{k/2}`, against Tau Ceti's `…ModularForms.LFunction.*`.

*Prerequisites:* 8.1, 8.3.

### 8.5 Export to the completed `L`-function data model

Fill `LFunctions`' *Layer 0* record `ArithmeticLFunctionData` for `L(s, F, spin)` and
`L(s, F, st)` of a level-one eigenform: coefficients `b_F(n)` (8.2, with `b_F(0) = 0`),
conductor `1`, the gamma shifts and root number of 8.4, the completed function of 8.3, and the
polar divisor; prove the Dirichlet-agreement predicate on the half-plane of 8.2 unconditionally,
and the continuation and functional-equation predicates as implications from 8.3. Build the
`NormalizationTranslation` to the analytic card with weight `w` (center `1/2`), so that the
analytic Satake parameters `α_I p^{−w/2}` have absolute value `1` exactly when
Ramanujan–Petersson holds. No second `L`-function card is introduced: the LMFDB's `lfunction`
pages for Siegel forms read these two records. Paramodular newforms are exported in 10.5.

*Prerequisites:* 8.2, 8.3, 8.4; `LFunctions` *Layer 0*.

## Layer 9: Fourier–Jacobi expansions, the Maass lift, and the lifts

### 9.1 The Fourier–Jacobi expansion

For `f ∈ M_k(Γ₂)` write `τ = [[τ', z], [z, τ'']]` with `τ' ∈ ℍ`, `z ∈ ℂ`, `τ'' ∈ ℍ`, and prove the
expansion `f(τ) = ∑_{m ≥ 0} φ_m(τ', z) e(m τ'')` (grouping the Fourier series of 2.2 by the
`(2,2)`-entry; absolutely and locally uniformly convergent), where
`φ_m(τ', z) = ∑_{n, r : 4nm − r² ≥ 0} a((n, r, m)) e(n τ' + r z)` is holomorphic on `ℍ × ℂ` and
satisfies the two **Jacobi transformation laws of weight `k` and index `m`**:
`φ_m((aτ'+b)/(cτ'+d), z/(cτ'+d)) = (cτ'+d)^k e(m c z²/(cτ'+d)) φ_m(τ', z)` for
`[[a,b],[c,d]] ∈ SL₂(ℤ)` and `φ_m(τ', z + λτ' + μ) = e(−m(λ²τ' + 2λz)) φ_m(τ', z)` for
`λ, μ ∈ ℤ` (van der Geer §8, from the embedded `SL₂(ℤ)` and the Heisenberg elements of `Γ₂`),
with `φ_0(τ', z) = (Φf)(τ')` independent of `z`. For `f ∈ S_k(Γ₂)` each `φ_m` has
`a((n, r, m)) = 0` unless `4nm − r² > 0` (a Jacobi cusp form). The general-degree version
(`τ' ∈ ℍ[r]`, `z ∈ ℂ^{r × (g−r)}`, `τ'' ∈ ℍ[g−r]`, coefficients indexed by half-integral
`(g−r) × (g−r)` matrices) is stated with its laws (van der Geer §8, rules 1–3). The laws are
stated for functions; the spaces `J_{k,m}` for every `m ≥ 1` are `MetaplecticAutomorphicForms`
6.18's `jacobiSpace` in the classical form of the sibling `HalfIntegralWeightModularForms` 6.1, and
are not redefined here.

*Prerequisites:* 0.1, 1.3, 2.2, 3.1.

### 9.2 Index-one Jacobi forms: the consumed carrier, `E_{k,1}` and `V_l`

Consume the carrier `J_{k,1}`: `MetaplecticAutomorphicForms` 6.18's `jacobiSpace` at the Jacobi
lattice `SL₂(ℤ) ⋉ ℤ²`, index `1`, weight `k` and trivial multiplier, holomorphic with the cusp
condition, in the classical form of the sibling `HalfIntegralWeightModularForms` 6.1 — holomorphic
`φ : ℍ × ℂ → ℂ` satisfying the two laws of 9.1 with `m = 1` and having a Fourier expansion
`∑_{n, r : 4n − r² ≥ 0} c(n, r) e(nτ + rz)` — with the sibling's cusp subspace `J_{k,1}^{cusp}`
(`c(n, r) = 0` for `4n = r²`), the fact that `c(n, r)` depends only on `4n − r²` (Eichler–Zagier,
Theorem 2.2), so that `φ` is determined by `c(N) := c(n, r)` for `N = 4n − r² ≥ 0`,
`N ≡ 0, 3 mod 4`,
and `J_{k,1} = 0` for odd `k`. Consume the theta decomposition
`φ = h₀(τ) θ_{1,0}(τ, z) + h₁(τ) θ_{1,1}(τ, z)`: `MetaplecticAutomorphicForms` 6.20
(`jacobi_thetaDecomposition`) in the coordinates `θ_{1,μ}(τ, z) = ∑_{r ≡ μ (2)} e(r²τ/4 + rz)` of
`QSeriesPartitionsAndMockModularForms` §9.1 (Mathlib's `jacobiTheta₂` at rescaled arguments), with
the components `h_μ(τ) = ∑_{N ≡ −μ² (4)} c(N) e(Nτ/4)` of the sibling's 6.2 (Eichler–Zagier,
Theorem 5.1); and from the sibling's 6.3 the dimension count
`dim J_{k,1} = dim M_{2k−2}(SL₂(ℤ))` for even `k ≥ 4`, with the first values
`dim J_{4,1} = dim J_{6,1} = dim J_{8,1} = 1`,
`dim J_{10,1} = dim J_{12,1} = 2`, which the Maass lift needs. Nothing of this is redefined or
reproved here, and `Suggested.lean` declares no Jacobi carrier: its Maass-lift declarations take
the discriminant-indexed coefficient function `c : ℤ → ℂ` of a Jacobi form as input.

Owned here, stated on that carrier: the **Jacobi Eisenstein series** `E_{k,1} ∈ J_{k,1}` (even
`k ≥ 4`) with `c(N) = H(k−1, N)/ζ(3 − 2k)` for `N > 0` (Theorem 2.1, in Cohen's `H`) and `c(0) = 1`
(its coefficient function `c` is specified here, with Checks, and not declared in `Suggested.lean`,
since Cohen's `H` is not), and the Hecke-type
operators `V_l` on functions,
`(φ|V_l)(τ, z) := l^{k−1} ∑_{Γ₁\O(l)} (cτ+d)^{−k} e(−lcz²/(cτ+d)) φ((aτ+b)/(cτ+d), lz/(cτ+d))`, with
`V_l(J_{k,1}) ⊆ J_{k,l}` and the coefficient
formula `c(φ|V_l; n, r) = ∑_{a ∣ (n, r, l)} a^{k−1} c(nl/a², r/a)` (Eichler–Zagier §4, Theorem 4.2),
proved on `J_{k,1}`.

*Prerequisites:* 1.3, 4.2, 9.1; `MetaplecticAutomorphicForms` 6.18, 6.20;
`QSeriesPartitionsAndMockModularForms` §9.1; the sibling `HalfIntegralWeightModularForms` 6.1–6.3;
Mathlib `jacobiTheta₂`; Tau Ceti `mvPolynomialEquivModularForms` (for the dimension count).

**Checks.**

- `E_{4,1}`: `c(0) = 1`, `c(3) = 56`, `c(4) = 126`, that is `c(N) = H(3, N)/ζ(−5)` with the values
  of 4.2's Checks.
- `c(N) = 0` for `N < 0` and for `N ≡ 1, 2 mod 4`.
- Through 9.3, `240 · c(3) = 13440 = a(ψ₄; (1,1,1))` and `240 · c(4) = 30240 = a(ψ₄; (1,0,1))`.

### 9.3 The Maass lift

Define `V : J_{k,1} → (ℍ[2] → ℂ)`, `V(φ)(τ) := ∑_{m ≥ 0} (φ|V_m)(τ', z) e(mτ'')` with
`φ|V_0 := c(0) · (−B_k/(2k)) · E_k(τ')` (Eichler–Zagier §6: the `m = 0` term is
`c(0)(−B_k/(2k) + ∑_{n ≥ 1} σ_{k−1}(n) q^n)`, so that `a(V(φ); (n, 0, 0)) = c(0) σ_{k−1}(n)` fits
the coefficient formula below), and prove Maass's theorem
(Eichler–Zagier, Theorem 6.2; van der Geer §21): `V(φ) ∈ M_k(Γ₂)` with
`a(V(φ); (n, r, m)) = ∑_{d ∣ (n, r, m)} d^{k−1} c((4nm − r²)/d²)` for `(n, r, m) ≠ 0`, `V` is
injective, `V(J^{cusp}_{k,1}) ⊆ S_k(Γ₂)`, and the first Fourier–Jacobi coefficient of `V(φ)` is
`φ`. Prove `E_k^{(2)} = −(2k/B_k) · V(E_{k,1})` for even `k ≥ 4` (the constant terms are `1` and
`c(0) · (−B_k/(2k))`; at `k = 4` the factor is `240` and
`a(ψ₄; (1,1,1)) = 240 · c(3) = 240 · 56 = 13440`) — this is the Maass–Cohen formula 4.2, now
derived, its `2/ζ(1 − k)` being `−2k/B_k` —
and that `χ₁₀ = V(φ₁₀)`, `χ₁₂ = V(φ₁₂)` for the unique (up to scalar) cusp forms
`φ₁₀ ∈ J^{cusp}_{10,1}`, `φ₁₂ ∈ J^{cusp}_{12,1}` normalized by `c(3) = 1`, with the Maass relation
check `a(χ₁₀; (2,2,2)) = c(12) + 2⁹ c(3) = −272 + 512 = 240` and
`a(χ₁₂; (2,2,2)) = 736 + 2¹¹ = 2784`.

*Prerequisites:* 2.2, 4.1, 4.2, 6.1, 9.1, 9.2.

### 9.4 The Maass space

Define the **Maass space** `M_k^*(Γ₂) ⊆ M_k(Γ₂)` by the **Maass relation**
`a((n, r, m)) = ∑_{d ∣ (n, r, m)} d^{k−1} a((1, r/d, mn/d²))` for all `(n, r, m) ≠ 0` (the
knowl's "`a(N)` depends only on the discriminant and the content", van der Geer §21), and
`S_k^*(Γ₂) := M_k^* ∩ S_k`. Prove `M_k^*(Γ₂) = V(J_{k,1})` (9.3; the relation is exactly the
image description), `dim M_k^*(Γ₂) = dim M_{2k−2}(SL₂(ℤ))` and
`dim S_k^*(Γ₂) = dim S_{2k−2}(SL₂(ℤ))`
(9.2's count and the cusp condition), that `M_k^*(Γ₂)` is **Hecke-stable** (van der Geer,
Theorem 21.1, first part; Eichler–Zagier Theorem 6.3: `T(p)` on `V(φ)` corresponds to the
index-one Hecke operator `T_p` on `φ`), and that `ψ_k, χ₁₀, χ₁₂ ∈ M_k^*`. Define
`(S_k^*)^⊥ ⊆ S_k(Γ₂)` (the LMFDB's **Interesting**/non-lift cusp forms) and prove the
Hecke-stable decomposition `M_k(Γ₂) = ℂψ_k ⊕ E_{2,1,k}(S_k(Γ₁)) ⊕ S_k^*(Γ₂) ⊕ (S_k^*)^⊥` for even
`k ≥ 6`, with dimensions `1`, `dim S_k(Γ₁)`, `dim S_{2k−2}(Γ₁)`, and the remainder: for
`k = 20`, `5 = 1 + 1 + 2 + 1` (the first non-lift cusp form `Υ₂₀`), for `k = 24`,
`8 = 1 + 2 + 3 + 2`, for `k = 10, 12, 14, 16, 18` the remainder is `0`.

*Prerequisites:* 3.4, 4.3, 6.3, 7.2, 9.3.

### 9.5 The Saito–Kurokawa theorem

Prove (Maass, Andrianov, Zagier; van der Geer, Theorem 21.1; Eichler–Zagier Theorem 6.3 and
§5–6): for even `k`, the composite `S_{2k−2}(SL₂(ℤ)) ≅ J^{cusp}_{k,1} ≅ S_k^*(Γ₂)` — the first
isomorphism consumed from the sibling `HalfIntegralWeightModularForms` (Kohnen's
`S^+_{k−1/2}(Γ₀(4)) ≅ S_{2k−2}(SL₂(ℤ))` composed with Eichler–Zagier's theta decomposition
`J_{k,1} ≅ M^+_{k−1/2}(Γ₀(4))`, its 6.3), the second 9.3 — is Hecke-equivariant in the sense that
a normalized eigenform `f ∈ S_{2k−2}(SL₂(ℤ))` with `a_p(f) = β + β̄`, `ββ̄ = p^{2k−3}`
corresponds to an eigenform `F = SK(f) ∈ S_k^*(Γ₂)` with Satake parameters
`(α₀, α₁, α₂) = (p^{k−2}, β p^{2−k}, β̄ p^{2−k})` modulo `W` (check: `α₀²α₁α₂ = p^{2k−3}`) —
equivalently
`Q_p(F, X) = (1 − p^{k−1}X)(1 − p^{k−2}X)(1 − a_p(f)X + p^{2k−3}X²)`, so
`λ_F(T(p)) = a_p(f) + p^{k−1} + p^{k−2}` and
`L(s, F, spin) = ζ(s − k + 1) ζ(s − k + 2) L(s, f)`. ⚠ The sibling supplies the bijection of
eigen-systems between `J_{k,1}` and `S_{2k−2}`; the content owned here is `V`'s Hecke
equivariance (9.4) and the Satake computation. Acceptance: `χ₁₀ = SK(f₁₈)` with
`λ(2) = −528 + 512 + 256 = 240`, `λ(3) = −4284 + 19683 + 6561 = 21960`; `χ₁₂ = SK(f₂₂)` with
`λ(2) = −288 + 2048 + 1024 = 2784`; Saito–Kurokawa lifts violate Ramanujan–Petersson
(`|α₀| = p^{k−2} ≠ p^{(2k−3)/2}`), which is why 8.2 states that bound only off the Maass space.
The knowl `mf.siegel.lift.saito_kurokawa`'s "`f ∈ S_{2k}` with `k` odd lifts to weight `k + 1`"
is this theorem with `k + 1` in place of `k`.

*Prerequisites:* 7.4, 8.1, 8.2, 9.3, 9.4; the sibling `HalfIntegralWeightModularForms`
(Kohnen's isomorphism and the theta decomposition as a Hecke-module isomorphism).

### 9.6 The Gritsenko lift, stated

State (Gritsenko 1995): for `N ≥ 1` and a Jacobi cusp form `φ ∈ J^{cusp}_{k,N}` (the consumed
carrier of 9.2 at index `N` with the sibling's cusp subspace, by name), the function `Grit(φ)`
with Fourier coefficients `a(Grit(φ); (n, r, Nm)) = ∑_{d ∣ (n, r, m)} d^{k−1} c(φ; mn/d², r/d)`
lies in `S_k(K(N))`
(1.3 and 3.2 for the arithmetic group `K(N)`; coefficients indexed as in 2.2), `Grit` is
injective and Hecke-equivariant for `p ∤ N` with the spinor factor
`Q_p(Grit(φ), X) = (1 − p^{k−1}X)(1 − p^{k−2}X) Q_p(f, X)` when `φ` corresponds to the
newform `f ∈ S_{2k−2}(Γ₀(N))` under the sibling's Skoruppa–Zagier correspondence
(so `Grit(φ)` is a Saito–Kurokawa-type lift and is excluded by definition from the LMFDB's
**nonlift newforms** of 10.3), and `N = 1` recovers 9.3 on cusp forms (the knowl
`mf.siegel.lift.gritsenko`).
Define `IsGritsenkoLift F := ∃ φ, F = Grit(φ)` on `S_k(K(N))` (the LMFDB's lift/nonlift
distinction, 10.5). For `N = 277`, `k = 2`: `dim J^{cusp}_{2,277} = 10`, so the Gritsenko lifts
span a 10-dimensional subspace of `S_2(K(277))` (10.5).

*Prerequisites:* 0.7, 1.3, 2.2, 3.2, 7.3, 8.1; `MetaplecticAutomorphicForms` 6.18 (`J_{k,N}`); the
sibling `HalfIntegralWeightModularForms` 6.1, 6.4.

### 9.7 The Ikeda lift, stated

State **Ikeda's theorem** (Ikeda 2001): for `n ≥ 1`, `k` with `k ≡ n mod 2`, and a normalized
eigenform `f ∈ S_{2k}(SL₂(ℤ))` with
`1 − a_p(f)X + p^{2k−1}X² = (1 − α p^{k−1/2}X)(1 − α⁻¹ p^{k−1/2}X)`,
there is a Hecke eigenform `I(f) ∈ S_{k+n}(Γ_{2n})`, nonzero, with standard `L`-function
`L(s, I(f), st) = ζ(s) ∏_{i=1}^{2n} L(s + k + n − i, f)` and Satake parameters
`β₀ = p^{nk − n(n+1)/2}`, `β_i = α p^{i−1/2}`, `β_{n+i} = α⁻¹ p^{i−1/2}` (`1 ≤ i ≤ n`;
van der Geer §21), whose Fourier coefficients are given by Kohnen's formula
`a(T) = ∑_{a ∣ f_T} a^{k+n−1} φ(a, T) c(|D_T|/a²)` in terms of the half-integral-weight form
`∑ c(N) q^N ∈ S⁺_{k+1/2}` corresponding to `f` (consumed from the sibling; Kohnen 2002, whose
`a^{k−1}` has `k` the weight `k + n` of the lift: at `n = 1` the exponent is the Maass lift's
`d^{(k+1)−1}` of 9.3; here `D_T = (−1)^n det(2T) = D_{T,0} f_T²` with `D_{T,0}` fundamental, and
`φ(a, T)` is Kohnen's integer-valued function). For `n = 1` this is 9.5
(`I(f) = SK(f)` with `k + 1` for `k` odd), the degree-two acceptance. Define `IsIkedaLift` on
`S_{k+n}(Γ_{2n})`. Acceptance: `I(Δ) ∈ S_8(Γ₄)` spans `S_8(Γ₄)` (6.9) and is the Schottky form;
the LMFDB's `Sp8Z` table counts `1, 1, 1, 2, 2` Ikeda lifts in weights `8, 10, 12, 14, 16`
(`dim S_{2k}(SL₂(ℤ))` for `2k = 12, 16, 20, 24, 28` with `k ≡ 2 mod 2`: `1, 1, 1, 2, 2`).

*Prerequisites:* 3.2, 7.2, 7.4, 8.1; the sibling `HalfIntegralWeightModularForms`.

### 9.8 The Miyawaki lifts, stated

State **Ikeda's theorem on the Miyawaki lift of type I** (Ikeda 2006; the knowl
`mf.siegel.lift.miyawaki1`): for even `k`, normalized eigenforms `f ∈ S_{2k−4}(SL₂(ℤ))` and
`g ∈ S_k(SL₂(ℤ))`, there is `F = M_I(f, g) ∈ S_k(Γ₃)`, a Hecke eigenform **if nonzero**, with
`L(s, F, st) = L(s + k − 2, f) L(s + k − 3, f) L(s, g, st)` and
`L(s, F, spin) = L(s − k + 2, g) L(s − k + 3, g) L(s, f ⊗ g)` (Euler factors
`Q_p(g, p^{k−2}X) Q_p(g, p^{k−3}X) Q_p(f ⊗ g, X)` with the Rankin–Selberg factor
`Q_p(f ⊗ g, X) = 1 − a_p(f)a_p(g)X + (a_p(f)²p^{l−1} + a_p(g)²p^{k'−1} − 2p^{k'+l−2})X² − a_p(f)a_p(g)p^{k'+l−2}X³ + p^{2k'+2l−4}X⁴` for weights `k', l`), and the general statement
(van der Geer, Conjecture 21.3, proved by Ikeda 2006 under the nonvanishing hypothesis): for
`k ≡ n mod 2`, `f ∈ S_{2k}(SL₂(ℤ))` and an eigenform `g ∈ S_{k+n+r}(Γ_r)`, `n, r ≥ 1`, there is
`F_{f,g} ∈ S_{k+n+r}(Γ_{2n+r})` with
`L(s, F_{f,g}, st) = L(s, g, st) ∏_{j=1}^{2n} L(s + k + n − j, f)`
(degree three is `n = r = 1`, `k ↦ k − 2`).
Nonvanishing is a hypothesis of the eigenform statement, not a theorem here. State the
**Miyawaki conjecture of type II** as a named hypothesis `MiyawakiII k f g`: for even `k`,
`f ∈ S_{2k−2}(SL₂(ℤ))`, `g ∈ S_{k−2}(SL₂(ℤ))`, there is an eigenform `F ∈ S_k(Γ₃)` with
`L(s, F, st) = L(s + k − 1, f) L(s + k − 2, f) L(s, g, st)`; every LMFDB count labelled
"Miyawaki lifts II (conjectured)" is `dim S_{2k−2} · dim S_{k−2}` under this hypothesis, never
a theorem. Acceptance: `dim S_{12}(Γ₃) = 1 = dim S_{20}(Γ₁) · dim S_{12}(Γ₁)` (Miyawaki's
form `F₁₂ = M_I(φ₂₀, Δ)`, with `L(s, F₁₂, st) = L(s + 10, φ₂₀) L(s + 9, φ₂₀) L(s, Δ, st)`,
Miyawaki 1992), and `dim S_{14}(Γ₃) = 1 = dim S_{26} · dim S_{12}` is the type II count at
`k = 14`.

*Prerequisites:* 6.9, 7.2, 8.1, 9.7.

## Layer 10: paramodular forms, newforms and the paramodular conjecture

### 10.1 Paramodular forms

Specialize 1.3 to `Γ = K(N)` (0.7): `M_{k,j}(K(N)) := M_{ρ_{k,j}}(K(N))`, `S_{k,j}(K(N))`, with
the Fourier expansion `f = ∑ a(n, r, Nm) e(nτ' + rz + Nmτ'')` over `n, m ≥ 0`, `r ∈ ℤ`,
`4Nnm − r² ≥ 0` (2.2 and Koecher 2.4), the reflection law `a(n, −r, Nm) = (−1)^k a(n, r, Nm)`
in scalar weight `k` and `a(n, −r, Nm) = ρ_{k,j}(diag(1, −1)) a(n, r, Nm)` in weight `(k, j)`
(2.2 with `U = diag(1, −1)`, `m(U) ∈ K(N)`: symmetric in `r` for even `k`, antisymmetric for odd
`k`, as `χ₃₅ ∈ S_{35}(K(1))` with `a(2, −1, 3) = −a(2, 1, 3)` shows), and the finite
dimensionality (3.5). Prove that
the Fricke element `μ_N` (0.7) induces an involution `f ↦ f ∣_{ρ} μ_N` of `M_{k,j}(K(N))` and
`S_{k,j}(K(N))` commuting with the Hecke operators of 7.3, so `S_{k,j}(K(N)) = S^+ ⊕ S^−`
(Poor–Yuen's **plus and minus forms**), with the coefficient formula
`a(f ∣_k μ_N; (n, r, Nm)) = (−1)^k a(f; (m, r, Nn))` in scalar weight (from
`(f ∣_k μ_N)(τ', z, τ'') = det(A_Nᵀ)^{−k} f(Nτ'', z, τ'/N)`), and its `ρ_{k,j}(A_Nᵀ)⁻¹`-twisted
form for `j > 0`; a plus form of weight `k` even thus has `a(n, r, Nm) = a(m, r, Nn)`. Prove
`M_{k,j}(K(1)) = M_{k,j}(Γ₂)`
definitionally and the Fourier–Jacobi expansion of `f ∈ M_k(K(N))` in `τ''` with coefficients
`φ_{Nm}` of index `Nm` (9.1, the laws for `m(diag(1, …))` and the Heisenberg part of `K(N)`).
Dimension formulas: state **Ibukiyama's formula** for `dim S_k(K(p))`, `p` prime, `k ≥ 3`
(Ibukiyama 1985 for `k ≥ 5`, by the trace formula; Ibukiyama 2007 for `k = 3, 4`; Poor–Yuen
2015, Theorem 3.1 and Table 1, print the `k = 4` case, `dim S_4(K(p)) = 0, 0, 0, 1, 1, 2, 2` for
`p = 2, 3, 5, 7, 11, 13, 17`; together the source of the LMFDB's `Kp` dimensions) as an
explicit quasi-polynomial in `(k, p)`, and **Poor–Yuen's weight-two dimensions** (10.5), for
which no formula is known.

*Prerequisites:* 0.7, 1.2, 1.3, 2.2, 2.4, 3.5, 7.3, 9.1.

### 10.2 Hecke eigenforms on `K(N)` and their good Euler factors

For a simultaneous eigenform `F ∈ S_{k,j}(K(N))` of the `T(p)`, `T₁(p²)`, `p ∤ N` (7.3; they
commute and are self-adjoint, so such a basis exists), define the Satake parameters and the
Euler factors `Q_p(F, X)`, `D_p(F, X)` at `p ∤ N` by the formulas of 7.4 and 8.1 (the same
Satake isomorphism applies to the local algebra at `p ∤ N`, since `K(N) ⊗ ℤ_p = Sp₄(ℤ_p)`), and
the **good part** `L^{(N)}(s, F, spin) := ∏_{p ∤ N} Q_p(F, p^{−s})⁻¹`, convergent as in 8.2. Prove
that `F ∣ μ_N` has the same eigenvalues at `p ∤ N`, and that `Grit(φ)` (9.6) is an eigenform
whenever `φ` is, with the factorization of 9.6.

*Prerequisites:* 7.3, 7.4, 8.1, 8.2, 9.6, 10.1.

The Satake parameters, eigenvalues and good `L`-function of a paramodular eigenform are specified
in this README only.

**Checks.**

- `f₂₇₇`: `Q₂ = 1 + 2X + 4X² + 4X³ + 4X⁴`, `Q₃ = 1 + X + X² + 3X³ + 9X⁴`, and
  `λ(2) = −2`, `λ(3) = −1`, `λ(5) = −1`, `λ(7) = 1` (10.5).
- For `N = 1` the definitions are those of 7.4 and 8.1 (`χ₁₀` at `p = 2` as in 8.2's Checks).
- `p ∣ N` is excluded: `f₂₇₇` has no good factor at `p = 277`, and the product defining
  `L^{(N)}` omits it.

### 10.3 Oldforms, the newspace and nonlift newforms

Define the **oldspace**
`S^{old}_{k,j}(K(N)) := S_{k,j}(K(N)) ∩ span_ℂ{ f ∣_{ρ,e} δ : M ∣ N, M < N, f ∈ S_{k,j}(K(M)), δ ∈ GSp⁺₄(ℚ) }` (the forms of level `N` generated by forms of lower
paramodular level; for `g = 1` the same recipe gives the oldforms of the
[modular-forms roadmap](../ModularForms/README.md) *Layer 3*), the **newspace**
`S^{new}_{k,j}(K(N)) := (S^{old})^⊥` for the Petersson product (3.4), and prove: both are
Hecke-stable for `p ∤ N` and `μ_N`-stable, `S^{new}` has a basis of eigenforms for all `T(p)`,
`T₁(p²)` with `p ∤ N` (a **newform**, up to scalar; the knowl `mf.siegel.newform`), and
`S^{new}_{k,j}(K(1)) = S_{k,j}(Γ₂)`. State **Roberts–Schmidt's theorem on oldforms**
(Roberts–Schmidt 2006, Theorem 1.1): `S^{old}_k(K(N))` is spanned by the images of the three
level-raising operators `θ_p, θ'_p : S_k(K(M)) → S_k(K(Mp))` and `η_p : S_k(K(M)) → S_k(K(Mp²))`
(explicit finite sums of slashes, the knowl's `V^±_p`, `U_p`), for `Mp ∣ N` and `Mp² ∣ N`. Define
the
LMFDB's **nonlift newforms** `S^{new, nl}` as the newforms that are not Gritsenko lifts (9.6; the
knowl `mf.siegel.newform.paramodular`), define the **newform subspace** of a newform `F` as the
`ℂ`-span of its images under the Hecke algebra at `p ∤ N` (equivalently, by 11.2, of its Galois
conjugates), and its **dimension** as the dimension of that subspace (the knowl
`mf.siegel.newform_subspace`, `mf.siegel.dimension`).

*Prerequisites:* 3.4, 3.5, 7.3, 9.6, 10.1, 10.2.

The oldspace, newspace and newforms are specified in this README only, since the newspace is a
Petersson complement (3.4).

**Checks.**

- `S^{new}_{k,j}(K(1)) = S_{k,j}(Γ₂)`: `χ₁₀` is a newform of level `1`.
- `S_2(K(1)) = 0` (`dim M_2(Γ₂) = 0`), so `S^{old}_2(K(277)) = 0` and all of `S_2(K(277))`,
  of dimension `11`, is new; of it, the Gritsenko lifts span `10` dimensions and `f₂₇₇` spans
  the nonlift part (10.5).
- A Gritsenko lift is never in `S^{new, nl}` (rejection), and `S_2(K(p)) = 0` for
  `p = 2, 3, 5, 7, 11, 13`, so those levels have no newforms of weight two.

### 10.4 The Roberts–Schmidt local newform theorem, as consumed

State, by citation and as the interface this roadmap consumes (Roberts–Schmidt 2007, Theorems
7.5.1–7.5.9 and Table A.12; the adelic statement is not owned here): for a newform
`F ∈ S^{new}_{k,j}(K(N))` and `p ∣ N` there is a polynomial `L_p(F, X) ∈ ℂ[X]` of degree
`≤ 4`, determined by the eigenvalues of the two paramodular operators at `p` of 7.3 and by
`ε_p(F) ∈ {±1}`, such that the **completed spinor `L`-function**
`L(s, F, spin) := L^{(N)}(s, F, spin) ∏_{p ∣ N} L_p(F, p^{−s})⁻¹` has conductor `N`
(the paramodular level is the conductor of the associated representation), root number
`ε(F) = (−1)^k ∏_{p ∣ N} ε_p(F)`, and the functional equation and continuation of 8.3 with
`N` in the completed function (Andrianov's theorem for `K(N)`; Roberts–Schmidt 2007 for the
local factors). Record `deg L_p(F, X)` as the LMFDB's local-degree data and `N` as the **level**
of `F`. The predicate `IsParamodularPartner` of 10.6 is stated against the good factors only, so
nothing in 10.6 depends on the shape of `L_p`.

*Prerequisites:* 7.3, 8.3, 10.2, 10.3.

### 10.5 Weight two: Poor–Yuen's theorems and the export

State (Poor–Yuen 2015, Theorems 1.2, 1.3 and 7.1; the knowl `mf.siegel.family.kp`): for primes
`p < 600`, `S_2(K(p)) = Grit(J^{cusp}_{2,p})` (every weight-two paramodular cusp form of prime
level `p < 600` is a Gritsenko lift, so `dim S_2(K(p)) = dim J^{cusp}_{2,p}`) except possibly for
`p ∈ {277, 349, 353, 389, 461, 523, 587}` (Theorem 1.2), and
`dim S_2(K(277)) = 11 = dim J^{cusp}_{2,277} + 1` with a nonlift newform
`f₂₇₇ ∈ S^{new, nl}_2(K(277))`, unique up to
scalar, a rational Hecke eigenform (Theorems 1.3 and 7.1), with spinor factor
`Q_2(f₂₇₇, X) = 1 + 2X + 4X² + 4X³ + 4X⁴` (so `λ(2) = −2` and `λ(4) = λ(2)² − 4 − 1 = −1`),
`Q_3 = 1 + X + X² + 3X³ + 9X⁴`, `Q_5 = 1 + X − 2X² + 5X³ + 25X⁴`, and eigenvalues
`λ(2) = −2`, `λ(3) = −1`, `λ(5) = −1`, `λ(7) = 1`, `λ(11) = −2`, `λ(13) = 3` (Theorem 1.3 gives
the Euler factors at `2, 3, 5` and the linear coefficients at `7, 11, 13`); the further values
`λ(17) = −4`, `λ(19) = −1`, `λ(23) = 3`, `λ(29) = −1`, `λ(31) = −10` are the `a_p` of the
Jacobian of `277.a.277.1`, equal to the eigenvalues by the theorem of
Brumer–Pacetti–Poor–Tornaría–Voight–Yuen 2019 quoted in 10.6. The LMFDB's `Kp` family is this
list of samples; the nonlifts at the other six levels (Poor–Yuen's §7, Table 5) are the LMFDB's
"conjectured" nonlifts, recorded here as the implication "if `S_2(K(p)) ≠ Grit(J^{cusp}_{2,p})`
then …" and never as existence theorems. Fill `LFunctions`' `ArithmeticLFunctionData` for the
completed spinor `L`-function of a paramodular newform (10.4) exactly as in 8.5, with conductor
`N`, weight `w = 2k + j − 3` (`w = 1` for weight two: the `L`-function of an abelian surface),
root number `ε(F)`, and the local factors at `p ∣ N` from 10.4.

*Prerequisites:* 8.5, 9.6, 10.3, 10.4.

### 10.6 The paramodular conjecture, stated

Define, for `F ∈ S^{new, nl}_2(K(N))` with rational eigenvalues and a family of polynomials
`P = (P_p)_{p ∤ N}`, `P_p ∈ ℤ[X]`, the predicate
`IsParamodularPartner N F P := ∀ p ∤ N, Q_p(F, X) = P_p`, and state the **paramodular
conjecture** (Brumer–Kramer 2014, Conjecture 1.1, in the form corrected by Brumer–Kramer 2019
and Calegari–Chidambaram–Ghitza 2020; the knowl `g2c.paramodular_conjecture`) as the named
hypothesis `ParamodularConjecture N`: for every abelian surface `A/ℚ` of conductor `N` with
`End_ℚ(A) = ℤ` (endomorphisms defined over `ℚ`; a surface acquiring real multiplication over a
quadratic field is included, and `End_{ℚ̄}(A) = ℤ` is not required) there is a nonlift newform
`F ∈ S^{new, nl}_2(K(N))` with rational eigenvalues, unique up to scalar and depending only on
the isogeny class of `A`, such that `IsParamodularPartner N F (L_p(A, X))_{p ∤ N}` for the local
Euler factors `L_p(A, X) = 1 − a_p X + b_p X² − p a_p X³ + p² X⁴` of `A` (supplied by the
abelian-variety roadmaps; `a_p = p + 1 − #C(𝔽_p)` for a Jacobian); and conversely every such `F`
arises either from an isogeny class of such `A`, with `L(s, A) = L(s, F, spin)`, or from an
isogeny class of abelian fourfolds `B/ℚ` of conductor `N²` with `End_ℚ(B)` an order in a
nonsplit quaternion algebra over `ℚ`, with `L(s, B) = L(s, F, spin)²` (Brumer–Kramer 2019, after
Calegari's observation; the knowl's second paragraph, a bijection with surfaces alone for
squarefree `N`, is the uncorrected converse, and Calegari–Chidambaram–Ghitza 2020 is where the
quaternionic case is exhibited). ⚠ The two hypotheses differ on real data: `End_ℚ(A) = ℤ` with
`End_{ℚ̄}(A)` an order in a real quadratic field occurs among the LMFDB's `g2c` isogeny classes
and is covered by the conjecture; its `ρ_{A,ℓ}` is induced from the quadratic field, its
spinor `L`-function is that of a Hilbert newform of parallel weight two over that field, and
the paramodular form is of general type (G) (Johnson-Leung–Roberts). Prove
that `IsParamodularPartner` determines `F` up to scalar within `S^{new, nl}_2(K(N))` when the
newform basis is eigen-separated at `p ∤ N` (multiplicity one for the good Hecke eigenvalues is
the hypothesis `StrongMultiplicityOne N`, stated and consumed from the adelic theory, and an
explicit hypothesis of the uniqueness theorem). The nonlift condition in
`ParamodularConjecture N` consumes the sibling's `J_{2,N}` through 9.6, so the conjecture itself is
stated here in prose and `IsParamodularPartner` is the predicate a formalisation states; it rests
on the Satake parameters of 10.2 and is specified in this README only. Acceptance:
`f₂₇₇` and the Jacobian of the genus-two curve `277.a.277.1`,
`y² + (x³ + x² + x + 1) y = −x² − x` (conductor `277`, discriminant `277`, `End_{ℚ̄}(A) = ℤ`, so
in particular `End_ℚ(A) = ℤ`),
with `a_2 = −2`, `a_3 = −1`, `a_5 = −1`, `a_7 = 1`, `a_{11} = −2`, `a_{13} = 3`, `a_{17} = −4`,
`a_{19} = −1`, `a_{23} = 3`, `a_{29} = −1`, `a_{31} = −10` and
`L_2(A, X) = 1 + 2X + 4X² + 4X³ + 4X⁴` matching 10.5 (the theorem of
Brumer–Pacetti–Poor–Tornaría–Voight–Yuen 2019 that this `A` is paramodular is an instance of
the hypothesis, stated). The `g2c` pages serve this knowl; nothing else of `g2c` is owned here.

*Prerequisites:* 8.1, 10.2, 10.3, 10.5; the abelian-variety and `HyperellipticCurves` roadmaps
for `L_p(A, X)` and the conductor.

**Checks.**

- `f₂₇₇` with the family `L_p(A, X)` of the Jacobian of `277.a.277.1`: at `p = 2`,
  `a₂ = −2`, `b₂ = 4`, so `L₂ = 1 + 2X + 4X² + 4X³ + 4X⁴ = Q₂(f₂₇₇, X)` (10.5).
- The family with `L₂ = 1 − 2X + 4X² − 4X³ + 4X⁴` (the sign of `a₂` flipped) is rejected at
  `p = 2`.
- The predicate quantifies over `p ∤ N` only: the bad factor at `p = 277` never enters.

## Layer 11: the LMFDB invariants

### 11.1 Families, degree, level and the label prefix

Define the **families** of the LMFDB (the enumeration `Family` with the group and weight type of
each): `Sp4Z` (`Γ₂`, scalar `k`), `Sp4Z_2` (`Γ₂`, `(k, 2)`), `Sp4Z_j` (`Γ₂`, `(k, j)`),
`Gamma0_2`, `Gamma1_2`, `Gamma_2` (`Γ₀(2)`, `Γ₁(2)`, `Γ₂(2)`, `(k, j)`), `Gamma0_3`,
`Gamma0_3_psi_3`, `Gamma0_4`, `Gamma0_4_psi_4` (scalar, with the characters of 6.6, 6.8), `Kp`
(`K(p)`, `k = 2`), `Sp6Z` (`Γ₃`), `Sp8Z` (`Γ₄`); the **degree** `g`; the **level** of an
arithmetic `Γ ≤ Sp_{2g}(ℚ)` as the least `N` with `Γ_g(N) ≤ Γ` (the knowl `mf.siegel.level`:
`Γ_g`, `Γ₀(N)`, `Γ₁(N)`, `Γ_g(N)`, `K(N)` have levels `1, N, N, N, N`, proved from 0.6–0.7);
the **weight** `(k, j)` with the LMFDB's convention of 1.1 (highest weight `(k + j, k)`); and
the **label prefix** `g.F.N.k.j`, extended by the Dirichlet-character orbit label `N.a` of
`ψ₃`, `ψ₄` for the two character families (consumed from the character roadmaps by name). The
Galois-orbit letter and the sample names (`Sp4Z.10_Klingen`, `2_PY2_277_…`) are not targets.
Prove the family predicates are decidable on the groups of
Layer 0 and that each family's space is one of the spaces of 1.3.

*Prerequisites:* 0.6, 0.7, 1.1, 1.3, 6.6, 6.8.

### 11.2 Rational structures, coefficient fields and Galois orbits

Prove: `M_k(Γ₂)` has a basis of forms with **integral** Fourier coefficients (the monomials in
`ψ₄, ψ₆, χ₁₀, χ₁₂, χ₃₅` of 6.1–6.3 — `ψ_k` have rational coefficients with bounded denominators
by 4.2, and `χ₁₀, χ₁₂, χ₃₅` integral ones, as their first coefficients and 3.2's bound show;
state integrality of `ψ₄, ψ₆` and of the normalized `χ`'s as targets), hence the `ℚ`-structure
`M_k(Γ₂)_ℚ := {f : a(T) ∈ ℚ ∀T}` with `M_k(Γ₂) = M_k(Γ₂)_ℚ ⊗ ℂ`, and the same for `M_{k,j}(Γ₂)`
through Satoh's brackets (6.4) and for the rings of 6.5–6.8 through their theta generators
(5.4: theta constants have integral coefficients in `e(τ/8)`-expansions, and the named
generators' normalizing constants make the result integral). Prove that the Hecke operators of
7.2–7.3 preserve the `ℚ`-structure (7.5: the coefficient formula has integer coefficients), so
the eigenvalues of a Hecke eigenform are **algebraic integers** (characteristic polynomial of an
integral matrix), the **coefficient field** `ℚ(F) := ℚ(λ_F(T(p)), λ_F(T₁(p²)) : p)` is a number
field (the knowl `mf.siegel.coefficient_field`), equal to the field generated by the Fourier
coefficients of the normalization with `a(T₀) = 1` at the first reduced `T₀` with `a(T₀) ≠ 0`,
and that the `Gal(ℚ̄/ℚ)`-conjugates of an eigenform are eigenforms (the **Galois orbit**, the
knowl `mf.siegel.galois_orbit`) whose number is `[ℚ(F) : ℚ]` (the LMFDB's `fdeg`, with
`field_poly` a defining polynomial, `mf.siegel.defining_polynomial`). Define `is_integral F`
(all `a(T)` integral in the normalization above; the knowl `mf.siegel.integral_fc`) and the
**coefficient ring** `ℤ[λ_F]` (`mf.siegel.coefficient_ring`). Acceptance: `ψ₄, ψ₆, χ₁₀, χ₁₂, χ₃₅`
have `ℚ(F) = ℚ`, `fdeg = 1`, `is_integral`; `S_{20}(Γ₂)` has the three eigenforms
`SK(f₃₈^{(1)}), SK(f₃₈^{(2)})` with coefficient field `ℚ(√63737521)` (that of
`S_{38}(SL₂(ℤ))`, where `T₂` has characteristic polynomial `x² + 194400x − 137403408384` of
discriminant `2¹² · 63737521`; consumed from the modular-forms roadmap) and the rational
non-lift `Υ₂₀`.

*Prerequisites:* 2.2, 3.2, 4.2, 5.4, 6.3, 6.4, 6.5–6.8, 7.5, 7.6.

### 11.3 The type of a level-one eigenform

Define `Type` on Hecke eigenforms in `M_k(Γ₂)` for even `k`: **Eisenstein** (`F ∈ ℂψ_k`),
**Klingen** (`F ∈ E_{2,1,k}(S_k(Γ₁))`), **Maass** (`F ∈ S_k^*(Γ₂)`), **nonlift** (`F ∈ (S_k^*)^⊥`,
the LMFDB's "Interesting"/`Ups`), prove the four classes partition the eigenforms (9.4's
decomposition is Hecke-stable and its summands have no common eigen-systems: the Satake
parameters of 7.4, 7.6, 9.5 are distinct — the Eisenstein ones are `(1, p^{k−1}, p^{k−2})`, the
Klingen `(β, β̄/β, p^{k−2})`, the Maass `(p^{k−2}, βp^{2−k}, β̄p^{2−k})`, and the nonlift ones
satisfy Ramanujan–Petersson, stated), and compute the class sizes as the dimensions of 9.4 (the
LMFDB's `Sp4Z` dimension table columns Total/Eisenstein/Klingen/Maass/Interesting; for odd `k`
every eigenform is a nonlift, `S_k = M_k`). Record the correspondence with the automorphic-type
letters of the knowl `mf.siegel.automorphic_type` — (F) Eisenstein, (Q) Klingen, (P) Maass,
(G) nonlift of general type — as names only: the letters (B), (Y) and the classification of
Arthur parameters are the adelic theory's. Prove `is_eigenform` and `is_cusp_form` (3.2) are
decidable predicates on the stored data of 11.2 (finitely many coefficients determine a form, 3.5).

*Prerequisites:* 3.2, 3.5, 4.3, 7.4, 7.6, 9.4, 9.5.

### 11.4 Page coverage

Each invariant the `smf` pages display or search on, with its owner:

| Invariant (column / knowl) | Milestone |
|---|---|
| `degree` (`deg`), `weight` (`wt`, `k`, `j`), `collection`/family, `level` | 11.1 |
| `Fourier_coefficients` `c(F)` indexed by reduced `F` with `det(F)` | 2.1, 2.2 (indexing), 6.1–6.2, 6.4 (values) |
| `eigenvalues` `λ(l)` of `T(l)` | 7.2, 7.5, 7.6 |
| `is_eigenform`, `is_cusp_form`, `type` | 11.3, 3.2 |
| `is_integral`, `field_poly`, `fdeg`, coefficient field/ring, Galois orbit | 11.2 |
| `representation` (`Sp4Z_2`: values as polynomials in `x, y`) | 1.1 |
| `explicit_formula` (a polynomial in `A, B, C, D` and the generators of 6.5–6.8) | 6.1–6.8 |
| dimension tables: `Sp4Z` (Total/Eisenstein/Klingen/Maass/Interesting) | 6.3, 4.3, 9.4, 11.3 |
| dimension tables: `Sp4Z_2`, `Sp4Z_j` | 6.4 |
| dimension tables: `Gamma_2`, `Gamma1_2`, `Gamma0_2` (isotypic `[m, n, l]` by partition) | 6.5 |
| dimension tables: `Gamma0_3`, `Gamma0_3_psi_3`, `Gamma0_4`, `Gamma0_4_psi_4` | 6.6, 6.8 |
| dimension tables: `Sp6Z` (Total/Miyawaki I/Miyawaki II (conjectured)/Other), `Sp8Z` (Total/Ikeda/Miyawaki/Other) | 6.9, 9.7, 9.8 |
| `Kp`: `S_2(K(p))`, lifts and nonlifts, eigenvalues | 9.6, 10.3, 10.5 |
| `g2c.paramodular_conjecture` | 10.6 |
| half-integral weight on `Γ₀(4)` (`M_{k−1/2}(Γ₀(4))`) | sibling `HalfIntegralWeightModularForms` |
| sample names, orbit letters, completeness of a table | not a target (database convention) |

*Prerequisites:* 11.1–11.3.

## Explicit scope exclusions

- Half-integral weight Siegel modular forms, the theta multiplier on `Γ_g(4, 8)`, the Kohnen
  plus space, Shimura's correspondence, the classical form of the Jacobi forms `J_{k,m}` with
  their Hecke theory and the Skoruppa–Zagier lift, and the LMFDB's half-integral weight family on `Γ₀(4)`: the
  sibling `HalfIntegralWeightModularForms`; the Jacobi carrier `jacobiSpace` and its theta
  decomposition: `MetaplecticAutomorphicForms` 6.18, 6.20. Layer 9 states `E_{k,1}`, `V_l` and the
  Maass lift on that carrier, Layers 9 and 10 consume three named isomorphisms from the sibling,
  and 9.1 states Jacobi transformation laws for functions only.
- The metaplectic group, the Weil representation, theta kernels and theta correspondences,
  Siegel–Weil, genuine Eisenstein series and the Bump–Friedberg–Hoffstein Jacobi analysis:
  `MetaplecticAutomorphicForms`.
- Automorphic representations of `GSp₄`, Arthur's classification, the letters (B) and (Y), local
  newform theory as a statement about `GSp₄(ℚ_p)`, strong multiplicity one, and the bad Euler
  factors as definitions: consumed by citation in 10.4 and 10.6, owned by the adelic roadmaps.
- The moduli interpretation `Γ_g \ ℍ_g = A_g(ℂ)`, compactifications, the `q`-expansion principle,
  geometric Siegel modular forms, the Igusa quartic as a variety, cohomology of local systems on
  `A₂` and the Faber–van der Geer point counts, Harder's congruence conjecture: `PELModuli`,
  `ShimuraCompactifications`, `AutomorphicBundles`, and no roadmap for Harder.
- Proofs of the Ramanujan–Petersson bound (Weissauer), of the functional equations of 8.3, of
  Ikeda's and Miyawaki's lifts, of Tsushima's and Ibukiyama's dimension formulas, of Tsuyumine's
  and Poor–Yuen's classifications, and of Roberts–Schmidt's theorems: all are **stated** targets
  whose proofs are not milestones here; their statements are precise and their degree-two
  instances needed by the LMFDB tables are proved where a proof is listed.
- Borcherds products, Gritsenko–Nikulin reflective forms, Hermitian and quaternionic modular
  forms, Hilbert–Siegel forms, Siegel modular forms over totally real fields, `p`-adic and
  mod-`p` Siegel modular forms, Galois representations attached to Siegel modular forms, Yoshida
  lifts as constructions (only the type letter is named), Böcherer's conjecture, and the
  Kudla–Millson theory.
- Vector-valued forms of degree `g ≥ 3`, the ring structure of `M_*(Γ₃)` beyond 6.9's
  statement, and anything about `Sp_{2g}` for `g ≥ 5`.
- Abelian surfaces, their conductors, endomorphism algebras, Sato–Tate groups and `L`-functions:
  `HyperellipticCurves`, the abelian-variety roadmaps, `SatoTateGroups`; 10.6 consumes
  `L_p(A, X)` as a family of polynomials.

## Worked examples (acceptance criteria)

Every number below was computed (Sage: the Maass–Cohen formula of 4.2 for `ψ_k`, the
coefficient formula of 7.5, the Wronskian of 6.2, the theta products of 5.4, the Hilbert series
of 6.3–6.9, the coset counts of 7.1, point counts of the curve of 10.6) or read from the cited
theorem.

1. **Groups and the half-space (Layer 0).** `|Sp₄(𝔽₂)| = 2⁴(2² − 1)(2⁴ − 1) = 720 = |S₆|`,
   `|Sp₄(𝔽₃)| = 51840`; `[Γ₂ : Γ₀(2)] = 15`, `[Γ₂ : Γ₀(3)] = 40`, `[Γ₂ : K(2) ∩ Γ₂] = 15`,
   `[Γ₂ : K(3) ∩ Γ₂] = 40`. `L_{K(N)} = {[[a, b],[b, c/N]]}`, so `n(diag(0, 1/N)) ∈ K(N) ∖ Γ₂`
   for `N > 1`. Rejections: `diag(1, 1, −1, −1)` satisfies `MJMᵀ = −J` and is not in
   `GSp⁺₄(ℝ)` (0.2); `[[i, 1],[0, i]]` is not symmetric and `1₂` has `Im = 0`, neither in `ℍ[2]`
   (0.3); `diag(i, 2i) ∈ ℍ[2]`, `J • diag(i, 2i) = diag(i, i/2)` (0.4).
2. **Weights (Layer 1).** `ρ_{k,j}` has dimension `j + 1`, highest weight `(k + j, k)`,
   `e(ρ_{k,j}) = 2k + j − 3`; `ρ_{k,j}(−1) = (−1)^j`, so `M_{k,j}(Γ₂) = 0` for odd `j` (1.3);
   `M_k(Γ₂) = 0` for odd `k < 35`. For `g = 1`, `f ∣_{k, k−1} γ = f ∣[k] γ` (1.2).
3. **Half-integral matrices (Layer 2).** `(1, 1, 1)` is reduced with `det(F) = 3`; `(1, −1, 1)`
   is not reduced; `(1, 0, 1)` is reduced with `det(F) = 4`; `(2, 1, 1)` is not reduced
   (`n > m`), its reduced form is `(1, 1, 2)`, `det(F) = 7`; `(1, 1, 0)` has `4nm − r² = −1`, so
   `a((1, 1, 0)) = 0` for every form on `Γ₂` (Koecher, 2.4); `j(τ)` on `ℍ` with `a(−1) = 1` is the
   `g = 1` counterexample to Koecher (2.4).
4. **Eisenstein series (Layer 4).** `ψ₄`: `a(0) = 1`, `a(1,0,0) = 240`, `a(1,1,1) = 13440`,
   `a(1,0,1) = 30240`, `a(1,2,1) = 240`, `a(2,1,1) = 138240`, `a(1,0,2) = 181440`; `ψ₆`:
   `a(1,1,1) = 44352`, `a(1,0,1) = 166320`, `a(1,2,1) = −504`, `a(2,1,1) = 2128896`. Diagonal
   restriction: `30240 + 2·13440 + 2·240 = 57600 = 240²` (6.1). `ψ₄ = θ_{E₈}^{(2)}` (5.2).
   Eigenvalues: `λ_{ψ₄}(2) = 45`, `λ_{ψ₄}(3) = 280`, `λ_{ψ₆}(2) = 561` (7.4).
5. **`χ₁₀` (Layers 5, 6, 7, 9).** With `a(1,1,1) = 1`: `a(1,0,1) = −2`, `a(2,1,1) = −16`,
   `a(1,0,2) = 36`, `a(3,1,1) = 99`, `a(1,0,3) = −272`, `a(2,2,2) = 240`, `a(2,1,2) = −240`,
   `a(2,0,2) = 32`, `a(3,1,2) = 2736`, `a(3,0,3) = −43920`; Igusa's `χ₁₀` is `−¼` of this and
   equals `−2^{−14} χ₅²`, so `a(χ₅²; (1,1,1)) = 4096`, `a(χ₅²; (1,0,1)) = −8192` (5.4, 6.5).
   Maass relation: `a(2,2,2) = a(1,0,3) + 2⁹ a(1,1,1) = −272 + 512 = 240` (9.4).
   `λ(2) = 240 = −528 + 2⁹ + 2⁸`, `λ(3) = 21960`, `λ(5) = 1317900` (7.5, 9.5);
   `Q₂(χ₁₀, X) = (1 − 2⁸X)(1 − 2⁹X)(1 + 528X + 2¹⁷X²)`, `L(s, χ₁₀, spin) = ζ(s−9)ζ(s−8)L(s, f₁₈)`
   (8.2, 9.5), with functional equation center `s = 9`.
6. **`χ₁₂` (Layers 6, 7, 9).** With `a(1,1,1) = 1`: `a(1,0,1) = 10`, `a(2,1,1) = −88`,
   `a(1,0,2) = −132`, `a(3,1,1) = 1275`, `a(1,0,3) = 736`, `a(2,2,2) = 2784 = 736 + 2¹¹`,
   `a(2,0,2) = 17600`; `χ₁₂ ∘ δ = 12 Δ ⊗ Δ` (6.1); `λ(2) = 2784 = −288 + 2¹¹ + 2¹⁰`,
   `λ(3) = 107352`, `λ(5) = 80234700` (7.5, 9.5: `χ₁₂ = SK(f₂₂)`).
7. **`χ₃₅` (Layer 6).** `a(2,1,3) = 1`, `a(2,−1,3) = −1`, `a(3,1,2) = −1`, `a(3,−1,2) = 1`,
   `a(2,3,4) = −1`, `a(2,1,4) = −69`, `a(4,1,2) = 69`; `a(n, r, m) = 0` whenever `r = 0` or
   `n = m`; the Wronskian's own first coefficient is `a(W; (2,1,3)) = 41472`. `M_{35} = ℂχ₃₅`,
   `M_{37} = 0`, `dim M_{39} = 1`.
8. **Dimensions (Layers 3, 4, 6, 9).** `dim M_k(Γ₂)` for `k = 0, 2, 4, …, 24`:
   `1, 0, 1, 1, 1, 2, 3, 2, 4, 4, 5, 6, 8`; `dim S_k(Γ₂)`: `0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 3, 4, 5`
   (`M_0 = ℂ`
   and `Φ` is the identity on constants, so `S_0 = 0`). The `Sp4Z` table at `k = 20`:
   Total `5` = Eisenstein `1` + Klingen `1` + Maass `2` + Interesting `1`; at `k = 24`:
   `8 = 1 + 2 + 3 + 2`. `dim M_{k,2}(Γ₂)` for `k = 10, …, 22` even: `1, 0, 2, 3, 3, 4, 7`;
   `dim S_{k,2}`: `0, 0, 1, 2, 2, 3, 5`; `dim S_{8,6}(Γ₂) = dim S_{10,4}(Γ₂) = 1`. Odd weight:
   `dim M_{35+4a+6b+10c+12d}(Γ₂)` is the number of such representations, `dim M_{39} = 1`.
   `dim M_k(Γ₀(2))` for `k = 0, 2, 4, 6, 8`: `1, 1, 3, 4, 7`; `dim M_k(Γ₀(3))` for
`k = 0, 2, 4, 6, 8`: `1, 1, 4, 7, 10`; `dim M_k(Γ₀(3), ψ₃)` for `k = 1, 3, 5, 7`: `1, 3, 4, 9`;
   `dim M_k(Γ₀(4))` for `k = 0, 2, 4, 6, 8`: `1, 3, 7, 14, 24`; `dim M_{2k}(Γ₀(4), ψ₄)` for
   `2k = 10, 12, 14`: `0, 1, 4` (6.6–6.8; each is read off the stated ring, so each is a check of
   the statement, not of a proof).
   Degree three: `dim M_k(Γ₃)` for `k = 4, …, 20` even: `1, 1, 1, 2, 4, 3, 7, 8, 11`;
   `dim S_{12}(Γ₃) = dim S_{14}(Γ₃) = 1`. Degree four: `dim S_k(Γ₄)` for `k = 8, 10, 12, 14, 16`:
   `1, 1, 2, 3, 7`, with `1, 1, 1, 2, 2` Ikeda lifts.
9. **Hecke cosets (Layer 7).** `#Γ₂\T(2) = 15`, `#Γ₂\T₀(4) = 120`, `#Γ₂\T₁(4) = 30`,
   `#Γ₂\T₂(4) = 1`; for `p = 3`: `40, 1080, 120, 1`. Rejection: the lower-triangular family
   `{[[1,0],[0,2]], [[2,0],[0,1]], [[2,0],[1,1]]}` in 7.5 gives `a(T(2)χ₁₀; T)/a(T) = 240` at
   `T = (1,1,1)` but `−16` at `(1,0,1)` and `496` at `(2,1,2)`; the pinned `R_p` gives `240` at
   all three.
10. **Paramodular level 277 (Layers 9, 10).** `dim J^{cusp}_{2,277} = 10`, `dim S_2(K(277)) = 11`;
    `f₂₇₇` has `λ(2) = −2`, `λ(3) = −1`, `λ(5) = −1`, `λ(7) = 1`, `λ(11) = −2`, `λ(13) = 3`,
    `λ(31) = −10`, `Q₂ = 1 + 2X + 4X² + 4X³ + 4X⁴`; the curve `277.a.277.1`,
    `y² + (x³ + x² + x + 1)y = −x² − x`, has `disc(4f + h²) = 2¹² · 277`, minimal discriminant
    `277`, and `a_p = p + 1 − #C(𝔽_p)` equal to the same list. For `p = 2, 3, 5, 7, 11, 13`
    with `p ≠ 277`, `S_2(K(p)) = 0` (Poor–Yuen; `dim J^{cusp}_{2,p} = 0` for these `p`).
11. **Lifts (Layer 9).** Ikeda: `I(Δ) ∈ S_8(Γ₄)` spans it; `I(f₁₆) ∈ S_{10}(Γ₄)`. Miyawaki I:
    `M_I(φ₂₀, Δ)` spans `S_{12}(Γ₃)`, with `L(s, F, st) = L(s + 10, φ₂₀) L(s + 9, φ₂₀) L(s, Δ, st)`.
    Saito–Kurokawa in weight `20`: `S^*_{20}(Γ₂)` is two-dimensional (`dim S_{38}(SL₂(ℤ)) = 2`)
    with coefficient field `ℚ(√63737521)` (`ℚ(√18295489)` is the field of `S_{32}(SL₂(ℤ))`,
    the Saito–Kurokawa space of weight `17`, which is empty: `17` is odd).

## Ordering

- **Layer 0** (groups, half-space, action, automorphy factor, arithmetic and paramodular
  groups) rests on Mathlib, Tau Ceti's `GLSymplectic`/`SymplecticMultiplier` and
  `ClassicalGroupsPartII` CG.0.1 only.
- **Layer 1** (weights, slash operators, bundled forms) → Layer 0.
- **Layer 2** (half-integral matrices, Fourier expansion, Koecher, bounds, singular forms) →
  Layers 0–1; the integral quadratic forms and lattices roadmap *Layer 2* for 2.1's reduction.
  2.1 is independent of Layers 0–1 and can be built first.
- **Layer 3** (`Φ`, cusp forms, fundamental domain, Petersson, finite dimensionality) → Layers
  1–2; 3.3 also needs the integral quadratic forms and lattices roadmap *Layer 2*.
- **Layer 4** (Eisenstein series) → Layers 2–3 (4.2 needs 9.3's route only as a proof, not as
  a prerequisite: it is proved directly from the Jacobi Eisenstein series once 9.2 exists, so
  4.2's proof is scheduled with 9.3 while its statement anchors Layer 6).
- **Layer 5** (theta series, theta constants) → Layers 1–3 and the theta-series roadmap
  *Layers 1–3, 5–7*; independent of Layer 4 and can proceed beside it.
- **Layer 6** (degree-two rings) → Layers 4–5; 6.9 also needs 9.7–9.8 only for the names of the
  lift columns, not for its statements.
- **Layer 7** (Hecke operators, Satake) → Layers 1–3 and Mathlib's `HeckeRing`; Tau Ceti's
  degree-one Hecke theory for the comparisons; 7.6 → Layers 4, 6. Layers 5–6 and 7 are
  independent of each other.
- **Layer 8** (`L`-functions) → Layer 7; `LFunctions` *Layer 0* for 8.5.
- **Layer 9** (Fourier–Jacobi, Maass lift, Saito–Kurokawa, lifts) → Layers 4, 6, 7, 8;
  `MetaplecticAutomorphicForms` 6.18, 6.20 and `QSeriesPartitionsAndMockModularForms` §9.1 for
  9.2–9.6; the sibling `HalfIntegralWeightModularForms` for 9.2–9.7.
- **Layer 10** (paramodular) → Layers 7–9.
- **Layer 11** (LMFDB invariants) → everything above.
- Parallel tracks after Layer 3: {4, 6} ∥ {5} ∥ {7, 8}; Layer 9 joins them; Layers 10 and 11
  close.

## References

- G. van der Geer, *Siegel modular forms and their applications*, in *The 1-2-3 of Modular
  Forms*, Universitext, Springer (2008), 181–245; arXiv:math/0605346 (local copy in
  `references/`). The primary source: §2 (symplectic group, `ℍ_g`, fundamental domain), §3
  (Definition 3.1–3.2, Petersson product), §4 (Definition 4.1, Corollary 4.2, Theorems 4.3–4.4,
  Corollary 4.5, Proposition 4.6), §5 (Definitions 5.1–5.2, Theorem 5.4, Corollary 5.5), §6
  (Definition 6.1, Theorems 6.2–6.3), §7 (theta constants and theta series), §8
  (Fourier–Jacobi expansion, Witt's restriction), §9 (Theorem 9.1, Igusa), §16 (Lemma 16.1,
  Proposition 16.2, Theorem 16.3, Definitions 16.4–16.5), §17 (Theorem 17.1), §18 (Proposition
  18.1, the degree-two relations), §19–20 (Satake parameters, `L`-functions), §21 (Theorem 21.1,
  Conjecture 21.3, Ikeda and Miyawaki lifts), §25 (vector-valued forms, Satoh's bracket, the
  dimension table).
- E. Freitag, *Siegelsche Modulfunktionen*, Grundlehren 254, Springer (1983). Convergence of
  Eisenstein series, Koecher's principle, theta series with pluriharmonic coefficients,
  singular forms.
- H. Klingen, *Introductory Lectures on Siegel Modular Forms*, Cambridge Studies 20 (1990).
  Chapters 2–5 (half-space, modular forms, Φ, Eisenstein series), 6 (Hecke operators).
- A. N. Andrianov, *Euler products corresponding to Siegel modular forms of genus 2*, Russian
  Math. Surveys 29 (1974), 45–116. §1 (the coefficient formula of 7.5), Theorem 3.1.1
  (meromorphic continuation and functional equation of the spinor `L`-function), the
  generating identity of 8.1.
- A. N. Andrianov, V. L. Kalinin, *On the analytic properties of standard zeta functions of
  Siegel modular forms*, Math. USSR Sb. 35 (1979), 1–17; S. Böcherer, *Über die
  Funktionalgleichung automorpher L-Funktionen zur Siegelschen Modulgruppe*, J. reine angew.
  Math. 362 (1985), 146–168; I. Piatetski-Shapiro, S. Rallis, *L-functions for the classical
  groups*, LNM 1254 (1987): the standard `L`-function of 8.3.
- T. Arakawa, *Vector valued Siegel's modular forms of degree two and the associated Andrianov
  L-functions*, Manuscripta Math. 44 (1983), 155–185: the Klingen section of 4.3 and the
  vector-valued functional equation of 8.3.
- M. Eichler, D. Zagier, *The Theory of Jacobi Forms*, Progress in Math. 55, Birkhäuser (1985).
  Theorem 2.1 (Jacobi Eisenstein coefficients, Cohen's `H`), Theorem 2.2 (`c(n, r)` depends on
  `4n − r²` in index 1), Theorem 4.2 (`V_l` on coefficients), Theorem 5.1 (theta decomposition),
  Theorem 5.4 (`J_{k,1} ≅ M⁺_{k−1/2}`), Theorems 6.2–6.3 (the Maass lift and its Hecke
  compatibility).
- H. Maass, *Über eine Spezialschar von Modulformen zweiten Grades I–III*, Invent. Math. 52
  (1979), 95–104; 53 (1979), 249–253, 255–265: the Maass space and lift (9.3–9.4).
- H. Cohen, *Sums involving the values at negative integers of L-functions of quadratic
  characters*, Math. Ann. 217 (1975), 271–285: `H(r, N)` of 4.2.
- J.-I. Igusa, *On Siegel modular forms of genus two*, Amer. J. Math. 84 (1962), 175–200, and
  *II*, Amer. J. Math. 86 (1964), 392–412 (`χ₃₅` and the structure of the odd part); *Modular
  forms and projective invariants*, Amer. J. Math. 89 (1967), 817–855 (p. 849: the explicit
  relation `χ₃₅² = R` of 6.2, van der Geer's [52]); *On the graded ring of theta-constants*,
  Amer. J. Math. 86 (1964), 219–246 (the `Γ₂(2)` ring and the Igusa quartic, 6.5).
- T. Satoh, *On certain vector valued Siegel modular forms of degree two*, Math. Ann. 274 (1986),
  335–352: 6.4.
- R. Tsushima, *An explicit dimension formula for the spaces of generalized automorphic forms
  with respect to Sp(2, Z)*, Proc. Japan Acad. 59 (1983), 139–142: Tsushima's formula of 6.4.
- T. Ibukiyama, *On Siegel modular varieties of level 3*, Internat. J. Math. 2 (1991), 17–35
  (the `Γ₀(2)` and `Γ₀(3)` rings of 6.6–6.7; MR1082834); *Vector valued Siegel modular forms
  of symmetric tensor weight of small degrees*, Comment. Math. Univ. St. Pauli 61 (2012),
  51–75 (6.4, `j = 4, 6`); *On relations of dimensions of automorphic forms of Sp(2, ℝ) and
  its compact twist Sp(2) (I)*, Adv. Stud. Pure Math. 7 (1985), 7–29 (`dim S_k(K(p))` for
  `k ≥ 5`, 10.1); *Dimension formulas of Siegel modular forms of weight 3 and supersingular
  abelian surfaces*, in *Siegel Modular Forms and Abelian Varieties*, Ryushido (2007), 39–60
  (`k = 3, 4`, 10.1).
- H. Aoki, T. Ibukiyama, *Simple graded rings of Siegel modular forms, differential operators
  and Borcherds products*, Internat. J. Math. 16 (2005), 249–279 (Theorem 4.1: the Wronskian of
  6.2; the `Γ₀(4)` ring of 6.8); S. Hayashida, T. Ibukiyama, *Siegel modular forms of half
  integral weight and a lifting conjecture*, J. Math. Kyoto Univ. 45 (2005), 489–530 (6.8).
- S. Tsuyumine, *On Siegel modular forms of degree three*, Amer. J. Math. 108 (1986), 755–862
  and 1001–1003: 6.9.
- C. Poor, D. S. Yuen, *Computations of spaces of Siegel modular cusp forms*, J. Math. Soc.
  Japan 59 (2007), 185–222 (degree four, 6.9); *Paramodular cusp forms*, Math. Comp. 84
  (2015), 1401–1438 (Theorem 1.2: the primes `p < 600`; Theorems 1.3 and 7.1: level `277`;
  §7, Table 5: the conjectural nonlifts; Theorem 3.1 and Table 1: Ibukiyama's weight-four
  dimensions: 10.1, 10.5).
- A. N. Andrianov, V. G. Zhuravlev, *Modular Forms and Hecke Operators*, Transl. Math. Monogr.
  145, AMS (1995): the Hecke algebra of 7.1 (Chapter 3) and the coefficient formulas.
- V. Gritsenko, *Arithmetical lifting and its applications*, in *Number Theory (Paris 1992–93)*,
  LMS Lecture Notes 215 (1995), 103–126: the Gritsenko lift of 9.6.
- T. Ikeda, *On the lifting of elliptic cusp forms to Siegel cusp forms of degree 2n*, Ann. of
  Math. 154 (2001), 641–681 (9.7); *Pullback of the lifting of elliptic cusp forms and
  Miyawaki's conjecture*, Duke Math. J. 131 (2006), 469–497 (9.8); W. Kohnen, *Lifting modular
  forms of half-integral weight to Siegel modular forms of even genus*, Math. Ann. 322 (2002),
  787–809 (the coefficient formula of 9.7); I. Miyawaki, *Numerical examples of Siegel cusp
  forms of degree 3 and their zeta-functions*, Mem. Fac. Sci. Kyushu Univ. 46 (1992), 307–339.
- B. Roberts, R. Schmidt, *Local Newforms for GSp(4)*, LNM 1918, Springer (2007) (Theorems
  7.5.1–7.5.9, Table A.12: 10.4); *On modular forms for the paramodular groups*, in
  *Automorphic Forms and Zeta Functions*, World Scientific (2006), 334–364 (Theorem 1.1, the
  oldforms theorem of 10.3).
- A. Brumer, K. Kramer, *Paramodular abelian varieties of odd conductor*, Trans. AMS 366 (2014),
  2463–2516 (Conjecture 1.1), and the correction in Trans. AMS 372 (2019), 2251–2254; F.
  Calegari, S. Chidambaram, A. Ghitza, *Some modular abelian surfaces*, Math. Comp. 89 (2020),
  387–394; A. Brumer, A. Pacetti, C. Poor, G. Tornaría, J. Voight, D. S. Yuen, *On the
  paramodularity of typical abelian surfaces*, Algebra Number Theory 13 (2019), 1145–1195
  (the `277` instance of 10.6).
- R. Weissauer, *Endoscopy for GSp(4) and the Cohomology of Siegel Modular Threefolds*, LNM
  1968, Springer (2009): the Ramanujan–Petersson bound stated in 8.2.
- A. N. Andrianov, G. N. Maloletkin, *Behavior of theta series of degree N under modular
  substitutions*, Math. USSR Izv. 9 (1975), 227–241: the transformation law of 5.2.
- J. Bergström, C. Faber, G. van der Geer, *Siegel modular forms of genus 2 and level 2:
  cohomological computations and conjectures*, IMRN 2008; F. Cléry, G. van der Geer, S.
  Grushevsky, *Siegel modular forms of genus 2 and level 2*, Internat. J. Math. 26 (2015): the
  isotypic generating functions of 6.5.
- The LMFDB knowls `mf.siegel.*`, `group.paramodular`, `paramodulargroup.sp2gr`,
  `g2c.paramodular_conjecture`, and `lmfdb/siegel_modular_forms/dimensions.py` (the Hilbert
  series of 6.3, 6.9 and the `Sp8Z` table), read as the specification of the demand side.
