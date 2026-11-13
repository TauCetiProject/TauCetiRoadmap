# Roadmap: level-one automorphic forms for classical groups

**Summary.** Build, on top of the adelic, spectral, L-function, Arthur-classification and theta
roadmaps, the level-one theory of Chenevier and Taïbi. Starting from the unitary algebraic
level-one cuspidal spectrum `Π_alg` of the groups `PGL_m` over `ℚ`, this roadmap develops the
real Weil representation ring and its classical-group weight dictionary (Layer 1); the
Rankin–Selberg form of Weil's explicit formula and the resulting Stark–Odlyzko cone inequality,
with its finite-dimensional exclusion method, Miller's vanishing theorem and the repeated-weight
`PGL₄` vanishing (Layer 2); the level-one Arthur parameters of `Sp_{2g}` and `SO_n`, their
component groups and explicit holomorphic packet characters, and the triangular relation between
Euler–Poincaré characteristics and self-dual cuspidal counts (Layer 3); the masses of torsion
conjugacy classes in the geometric side of Arthur's `L²`-Lefschetz trace formula, the spinor
obstruction on their characteristic polynomials and their exact recovery for `SO_d` (`d ≤ 17`)
and `Sp_{2n}` (`n ≤ 8`) (Layer 4); and the complete classifications of level-one algebraic
cuspidal representations in motivic weight at most 22, of the top-simple ones in weight 23 and of
the regular self-dual ones in weight 24 (Layer 5). The second half turns to Siegel modular forms
for `Γ_g = Sp_{2g}(ℤ)`: the genus-`g` and harmonic lattice theta maps, first occurrence and the
Rallis relation (Layer 6); the dimension of `S_k(Γ_g)` for every regular weight in genus at most
eight, the twenty-nine nonscalar spaces and all scalar spaces in weight at most 13, and the four
weight-13 cusp forms of genera 8, 12, 16 and 24 (Layer 7); and their realization as harmonic theta
series of the Leech lattice, the Eichler basis theorem in weights 4, 8 and 12, and the stable
range `g ≥ 2k` (Layer 8). The end theorems are Chenevier–Taïbi's Theorems 1–7, Corollary 1 and
§§5.4–5.5, and Theorems 1–2 of their weight-13 Leech paper.

## Scope and ownership

This roadmap owns the level-one specialization and everything that is specific to the
Chenevier–Taïbi method: the set `Π_alg` and its counting functions; the archimedean ring `K∞` with
its parity-truncated weight filtrations; the Rankin–Selberg explicit-formula bilinear forms, the
Stark–Odlyzko cone inequality for pairs of level-one representations and the finite-dimensional
quadratic minimization built on it, including the Rayleigh least-eigenvalue refinement (the
Odlyzko kernel and test function are imported); Miller's vanishing theorem in its form on
archimedean parameters; level-one Arthur parameters, their packet characters in the holomorphic cases and the
triangular Euler–Poincaré relation; the masses of torsion classes, the spinor obstruction on
their characteristic polynomials, resting on the imported Zassenhaus spinor-norm formula; Taïbi's
explicit evaluation of the geometric side of the level-one `L²`-Lefschetz formula; the
low-weight classifications; the genus-`g` unweighted theta map on even unimodular lattices, the
harmonic theta map, first occurrence and the Rallis parameter relation at level one; the
Siegel-modular-form inputs needed at level one (the Siegel operator and its standard-`L`-function
relation, the vanishing and spanning theorems of the singular range, odd-weight boundary
vanishing); the classification of Siegel eigenforms in low weight; the invariant alternating forms
of Niemeier lattices, the Mathieu orbit-sum forms on the Leech lattice, the sublattices `Q_g` and
the harmonic Leech theta series; and the stable range.

It leaves to named roadmaps, by section:

- The adelic group, cuspidal and automorphic representations, restricted tensor products, the real
  Weil group and the local Langlands correspondence for `GL_n(ℝ)`, Clozel purity, holomorphic
  discrete series, the `GL₂` adelization and algebraic modular forms for groups compact at
  infinity: AutomorphicFormsOnReductiveGroups §§2.2, 2.4, 2.5, 3.2, 3.4, 3.5, 4.2, 5.1, 5.5, 6.7,
  6.8, 7.2, 7.2a, 7.4 and 7.5.
- Archimedean gamma and epsilon factors, Rankin–Selberg `L`-functions, their poles and functional
  equations, and strong multiplicity one for isobaric sums: AutomorphicLFunctionsAndLocalFactors,
  Conventions, §§AL.1.4, AL.3.6, AL.3.7 and AL.3.9.
- Weil's explicit formula in Mestre's formalism, for an arbitrary pair of completed functions with
  products of gamma factors: AnalyticNumberTheoryPartI §§1.3 and 1.8.
- The Odlyzko kernel `g = 2(u ∗ u)`, the test functions `g(x/b)/cosh(x/2)` and the nonnegativity of
  the real part of their transform in the strip `0 ≤ Re s ≤ 1`:
  SmallRamificationAndAbelianVarietyBaseCases §§1.5–1.7.
- The Zassenhaus spinor-norm formula for an isometry of a nondegenerate quadratic space over a
  field of characteristic different from `2`: SymplecticReidemeisterTorsionModSquares §4.1.
- Conway's group `Co₀ = O(Leech)` as the isometry group of the Leech lattice, its Conway
  generators and order, and the simplicity of `Co₁ = Co₀/{±1}`: CFSGBasicProperties P2-L; the
  average characteristic polynomial of `Co₀` on `Leech ⊗ ℚ` is requested from the same section
  (Exact supplier contracts).
- Finite multiplicities of the discrete spectrum, the residual spectrum, Wallach's tempered
  cuspidality criterion, Euler–Poincaré functions and Arthur's `L²`-Lefschetz trace formula:
  AutomorphicSpectralTheory §§4.4, 4.5, 4.10, 6.9, 6.17, 6.19 and 6.20.
- Global Arthur parameters, component groups, the epsilon character, local Arthur packets, the
  multiplicity formula, Adams–Johnson packets and the Mœglin–Renard description of packets with a
  scalar unitary lowest-weight module, together with the standing premises under which they are
  stated: ModularityAndLanglandsExtensions, Exact supplier contracts, and §§3.4, 3.8, 3.15, 3.17,
  3.20, 3.21 and 3.22.
- Classical automorphic forms on Shimura varieties, their cusp forms, Hecke operators and
  Fourier–Jacobi expansions: AutomorphicBundles §§11.1, 11.2, 11.9, 11.16, 12.10, 12.11, 12.13 and
  12.15.
- Oscillator representations, dual pairs, local theta correspondence, the theta kernel and the
  Rallis unramified computation: MetaplecticAutomorphicForms §§0.15, 2.4c, 3.1, 3.4, 3.5, 3.7,
  3.10, 3.21, 5.1, 5.6 and 6.14.
- Classes of even unimodular lattices of ranks 16 and 24, the uniqueness of the rootless rank-24
  class, the mass of even unimodular lattices and automorphism orders: OrthogonalTamagawaAndLatticeMass
  §§3.1, 4.1 and 4.2. Genus theory and integral spinor norms: GeometryOfNumbersAndQuadraticArithmetic
  §2.4.
- Exact interval arithmetic, the closed formulas and rational enclosures of the eight explicit-formula
  scalars, rational Gram witnesses, the multiplicity lift and ellipsoid covers:
  ComputationalNumberTheory §§4.1–4.7, 4.17, 4.17a, 4.18, 4.26 and 4.29–4.34, and §5.1 for the
  interpretation of finite families.
- The integral lattice carrier, isometries and discriminant forms: Completed/IntegralLattices,
  Layer 1, with their Tau Ceti declarations; the `p`-neighbour relation of integral lattices:
  IntegralLattices §4G. The construction of the Leech lattice: Rank24LatticeConstructions,
  Layer 6. Genus-one theta series and `Θ_{E₈} = E₄`: ThetaSeries, Layers 5 and 8. The extended
  binary Golay code: AlgebraicCodingTheory, Layer 5. The order of the Mathieu group `M₂₄`:
  SporadicOrders, Layer 1. The field spinor norm: OrthogonalSpinGroups, Layer 1, which is Tau
  Ceti's `CliffordAlgebra.orthogonalSpinorNorm` at the pin.
- Weyl's character and dimension formulas and the highest-weight theory of the classical groups:
  RepresentationTheory/LieHighestWeight Layer 6 and RepresentationTheory/ClassicalGroups Layers
  3–5. Split Chevalley–Demazure group schemes over `ℤ`: ReductiveGroups Layer 9.
- The criterion that, for `k_g > g`, the holomorphic module `ρ_k` lies in the real Arthur packet of a
  parameter with infinitesimal weights `0, ±(k_i − i)` exactly when the odd block has length one:
  ModularityAndLanglandsExtensions §3.21. Section 3.5 here owns only its level-one consequences and
  the explicit packet character.

Already in the pinned libraries and consumed as is: the smooth split symplectic group scheme over
`ℤ` and its matrix points (`TauCeti.Symplectic.groupScheme`, `TauCeti.Symplectic.pointsMulEquiv`,
`TauCeti.Symplectic.instSmoothCoordinateHopfAlgebra`); the Leech lattice with its evenness,
unimodularity, positivity and absence of roots (`TauCeti.leechLattice`,
`TauCeti.vectorsOfNorm_two_leechLattice`); the eigenvector property of a local
extremum of a Rayleigh quotient (`IsSelfAdjoint.hasEigenvector_of_isLocalExtrOn`); the level-one
dimension formula and division by the discriminant (`ModularForm.dimension_level_one`,
`CuspForm.discriminantEquiv`); level-one elliptic newforms, their basis of the new subspace and the
fact that every level-one cusp form is new (`HeckeRing.GL2.Newform`, `HeckeRing.GL2.Newform.basis`,
`TauCeti.cuspFormsNew_one`, `TauCeti.Gamma1_one_map_eq_SL`), with the simultaneous Petersson-orthonormal
Hecke eigenbasis (`HeckeRing.GL2.exists_peterssonOrthonormalBasis_eigenformAwayFromLevel`); the binary
Golay code and its Construction A lattice (`TauCeti.BinaryGolay.code`,
`TauCeti.BinaryGolay.constructionALattice`); the integral lattice carrier `TauCeti.IntegralLattice`
with `IsEven`, `IsUnimodular`, `IsPosDef`, `norm`, `vectorsOfNorm` and the isometries
`TauCeti.IntegralLattice.Isometry`. None of these is planned again here.

SiegelModularForms consumes this roadmap rather than supplying it: it imports the genus-`g` and
harmonic lattice theta maps of §§6.4 and 6.7 and extends them to general lattices, reads the
level-one Siegel operator and singular-range statements of §§6.1–6.2 on its analytic carrier, and
checks its dimension formulas against §§7.3 and 7.9. The Siegel operator, the cusp-form kernel
theorem and the singular-range statements of §§6.1–6.2 are stated here at level one, on
AutomorphicBundles' classical forms, because this roadmap needs them; their versions for every
arithmetic subgroup and holomorphic weight are SiegelModularForms'.

## Conventions

**Groups and weights.** `Γ_g = Sp_{2g}(ℤ)`. For a dominant integral `k = (k₁ ≥ ⋯ ≥ k_g)` write
`M_k(Γ_g)` and `S_k(Γ_g)` for the level-one Siegel modular and cusp forms with values in the
irreducible polynomial representation of `GL_g(ℂ)` of highest weight `k`; a scalar `k` means
`(k, …, k)`; genus zero means the one-dimensional constant space. For a classical group `G`
distinguish `d_G = dim Std(G)`, the degree of a characteristic polynomial of `G`, from
`m_G = dim Std(Ĝ)`: `(d_G, m_G) = (2n, 2n+1)` for `Sp_{2n}`, `(2n+1, 2n)` for `SO_{2n+1}` and
`(2n, 2n)` for `SO_{2n}`. The permitted groups of the mass computation are those whose real
points have discrete series: `Sp_{2n}`, `SO_{2n+1}` and `SO_{4n}`. Level one means the integral
model's `G(Ẑ)`, including at `p = 2`; maximal compact subgroups are those of the full real group.

**The real Weil representation ring.** `W_ℝ = ℂ^× ⊔ jℂ^×` with `j² = −1`. `K∞` is the Grothendieck
ring of finite-dimensional semisimple continuous representations of `W_ℝ` trivial on `ℝ_{>0}`. Its
additive basis is `1`, the sign character `e = ε_{ℂ/ℝ}`, and `I_w = Ind_{ℂ^×}^{W_ℝ}(z ↦ (z/|z|)^w)`
for integers `w > 0`; `I₀` abbreviates `1 + e` and is not a basis element. A cuspidal representation
of motivic weight `w` from an elliptic eigenform of weight `w + 1` is written `Δ_w`; its
archimedean parameter is `I_w` and its unitary weights are `±w/2`. `Δ_{w,v}` is the self-dual
`PGL₄` class with weights `±w/2, ±v/2`, `Sym²Δ₁₁` the `PGL₃` class with weights `−11, 0, 11`, and
`O^odd(24,16,8)`, `O^even(24,18,10,4)`, `O^even(24,20,14,2)` the three regular self-dual
weight-24 classes, listed by their positive doubled weights. The two classes from `S₂₄(SL₂(ℤ))`,
which share the parameter `I₂₃`, are `Δ₂₃^a` and `Δ₂₃^b` when their identity matters. An Arthur
block `π[d]` has standard dimension `rank(π)·d`; `[d]` is the trivial rank-one class with
`d` copies.

**Doubled weights.** Half-integral weights are recorded by their doubles, so that a weight
vector of `π ∈ Π_alg` is a decreasing symmetric integral vector all of whose coordinates have the
parity of the motivic weight.

**Analytic normalizations.** `Γ_ℝ(s) = π^{−s/2} Γ(s/2)` and `Γ_ℂ(s) = 2(2π)^{−s} Γ(s)`. The
archimedean epsilon factor is multiplicative on `K∞` with `ε(1) = 1`, `ε(e) = i` and
`ε(I_w) = i^{w+1}`; finite epsilon factors at level one are `1`. The Fourier transform of a test
function is `F̂(ξ) = ∫_ℝ F(x) exp(−2πixξ) dx`, extended to complex `ξ`; set `A_F = F̂(i/(4π))` and
`B_F = F̂(0)`. A zero `ρ` of a completed function is placed at `ξ = (1 − 2ρ)/(4πi)`. Completed
`L`-functions are in the unitary normalization with centre `s = 1/2`.

**Standing premises.** The global Arthur classification is imported from
ModularityAndLanglandsExtensions together with its stated premises (its twisted weighted
fundamental lemma and trace inputs). Every theorem below whose route uses the multiplicity
formula, the local packets, the Adams–Johnson and Mœglin–Renard descriptions, or Arthur's
description of the type and of same-type root numbers of self-dual cuspidal representations carries
those premises as hypotheses, exactly as the supplier states them; this applies to the type and
same-type root-number assertions of §1.8, to §§3.2–3.16, to §4.11 and after, to all of Layer 5 from
§5.3 on except the explicit-formula exclusions themselves, to §§6.8–6.12, and to Layers 7–8 except
§§8.3–8.6. The explicit-formula statements of Layer 2 and the level-one root-number formula of §1.8
are unconditional. The generalized Riemann hypothesis, where used, is the explicit hypothesis that
every zero of every completed Rankin–Selberg function `Λ(s, π × π′)` with `π, π′ ∈ Π_alg` has real
part `1/2`; it appears in the statement of each theorem that uses it.

**Coefficients and universes.** Lattices are `TauCeti.IntegralLattice` objects in finite-dimensional
`ℚ`-vector spaces; alternating forms are `ℚ`-valued. Automorphic spaces are complex. All finite
sets of classes are counted as natural numbers only after their finiteness is proved.

## Exact supplier contracts

### From Mathlib

- `ModularForm.dimension_level_one` (`Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean`):
  for even `k`, the rank of level-one modular forms of weight `k` is `k/12` when `k ≡ 2 mod 12`
  and `k/12 + 1` otherwise. `CuspForm.discriminantEquiv` (same file): the linear equivalence
  from cusp forms of weight `k` to modular forms of weight `k − 12`, dividing by `Δ`. Together they
  give `dim S_{w+1}(SL₂(ℤ))` in §§2.20–2.21; odd weight gives zero.
- `IsSelfAdjoint.hasEigenvector_of_isLocalExtrOn` (`Mathlib/Analysis/InnerProductSpace/Rayleigh.lean`):
  a nonzero local extremum of the Rayleigh quotient of a self-adjoint operator on its sphere is an
  eigenvector. It does not say which eigenvalue; §2.10 adds minimality.
- `Matrix.toQuadraticForm'` (the quadratic form `x ↦ xᵀ M x` of a matrix), `Matrix.charpoly`,
  `PadicInt`, `Padic`, `Polynomial.cyclotomic`, `AlternatingMap`, `finsum`, `Module.finrank`,
  `Matrix.rank`, `riemannZeta`, `Complex.Gamma`, Fourier integrals and `HasCompactSupport`. The
  digamma function enters only through the closed formulas of ComputationalNumberTheory §4.17.

### From Tau Ceti

- `TauCeti.IntegralLattice` with its fields `carrier` and `form`, the predicates
  `TauCeti.IntegralLattice.IsEven`, `TauCeti.IntegralLattice.IsUnimodular`,
  `TauCeti.IntegralLattice.IsPosDef`, the quadratic form `TauCeti.IntegralLattice.norm`
  (`norm x = form x x`, so a root has norm 2), the sets `TauCeti.IntegralLattice.vectorsOfNorm`,
  and the self-isometries `TauCeti.IntegralLattice.Isometry L L` with their group structure. The
  carrier is a full `ℤ`-lattice with an integral symmetric form; positivity, evenness and
  unimodularity are separate predicates, and nondegeneracy is not part of the structure.
- `TauCeti.Symplectic.groupScheme`, `TauCeti.Symplectic.pointsMulEquiv` and the smoothness instance
  `TauCeti.Symplectic.instSmoothCoordinateHopfAlgebra`: the split symplectic group over `ℤ`, its
  points over every commutative ring as the matrix symplectic group, and smoothness. They are the
  integral model of `Sp_{2n}` in §1.3.
- `TauCeti.BinaryGolay.code` with `finrank_code`, `isTypeII_code`, `hammingMinDist_code` and
  `weightEnumerator_code` (rank 12, doubly even, minimum distance 8, weight enumerator
  `1 + 759y⁸ + 2576y¹² + 759y¹⁶ + y²⁴`), and `TauCeti.BinaryGolay.constructionALattice`, an even
  unimodular positive definite lattice of rank 24 with roots, used as a rooted control in §8.5.
- `TauCeti.leechLattice` (`TauCeti/LinearAlgebra/IntegralLattice/Rank24/Leech/Basic.lean`): the Leech
  lattice in `Fin 24 → ℚ` with the form `(Σ xᵢyᵢ)/2`, as Construction B of `TauCeti.BinaryGolay.code`
  glued with the odd shift `(−3/2, 1/2, …, 1/2)`, with `TauCeti.isEven_leechLattice`,
  `TauCeti.isUnimodular_leechLattice`, `TauCeti.isPosDef_leechLattice`, `TauCeti.finrank_leechLattice`
  and, in `Rank24/Leech/Minimum.lean`, `TauCeti.minimum_leechLattice` (minimum `4`) and
  `TauCeti.vectorsOfNorm_two_leechLattice` (no roots). It satisfies every hypothesis of the Leech
  statements of §§8.5–8.6, so those statements are not vacuous at the pin. Its coordinates are
  Conway's up to the scaling of the form, so the coordinate permutations of `M₂₄` and the sign changes
  along Golay codewords act on it as in §8.4.
- `CliffordAlgebra.orthogonalSpinorNorm` (`TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean`):
  the spinor norm `O(Q) → Kˣ/Kˣ²` of a nondegenerate quadratic form over a field, the Clifford
  norm of a Lipschitz lift taken modulo squares; a reflection in `v` has spinor norm the class of
  `Q(v)`. It is the spinor norm of §4.6 and the one in which the imported Zassenhaus formula is
  stated.
- Elliptic newforms (`TauCeti/NumberTheory/ModularForms/Newforms/`): the structure
  `HeckeRing.GL2.Newform N k` of normalized good Hecke eigenforms (`a₁ = 1`) in the new subspace of
  `S_k(Γ₁(N))`, the basis `HeckeRing.GL2.Newform.basis N k` of that new subspace indexed by the
  newforms, `TauCeti.cuspFormsNew_one` (at level one the new subspace is all of `S_k`), and
  `TauCeti.Gamma1_one_map_eq_SL` (the image of `Γ₁(1)` is `SL₂(ℤ)`). Together they say that the
  normalized level-one eigenforms of weight `k` form a basis of `S_k(SL₂(ℤ))`, so their number is
  `dim S_k(SL₂(ℤ))`; this is the count used in §§2.20–2.21. The simultaneous Petersson-orthonormal
  Hecke eigenbasis is `HeckeRing.GL2.exists_peterssonOrthonormalBasis_eigenformAwayFromLevel`
  (`Petersson/Eigenbasis.lean`). Eigenvalues are stored only at indices prime to the level, which at
  level one is every index.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

- §2.5: the Weil groups `W_ℝ` and `W_ℂ` and the bijection `recGL` between irreducible
  Harish-Chandra modules of `GL_n(ℝ)` and `n`-dimensional semisimple representations of `W_ℝ`.
  §2.2: Harish-Chandra finiteness. §2.4: discrete series of real reductive groups.
- §§3.2, 3.4, 3.5 and 4.2: automorphic representations, restricted tensor products, Flath
  factorization with spherical local components, and cuspidal occurrences; specialized here to
  `PGL_m` over `ℚ` with every finite component spherical.
- §5.1: the algebraicity conventions, including Chenevier–Taïbi's `IsAlgebraicCT`; §5.5: Clozel
  purity for algebraic cuspidal representations of `GL_n`.
- §§6.7 and 6.8: holomorphic discrete series and coherent packets of `GSp_{2g}`, and the scalar
  holomorphic discrete series of `Sp_{2n}(ℝ)`.
- What AutomorphicFormsOnReductiveGroups must provide (gap:sp2g-lowest-weight-modules): for every
  dominant `k = (k₁ ≥ ⋯ ≥ k_g ≥ 0)` the irreducible unitary lowest-weight module `ρ_k` of
  `Sp_{2g}(ℝ)` with lowest `K`-type of highest weight `k`, the Enright–Howe–Wallach criterion that
  it exists exactly when `k_g ≥ g − u − v/2` (with `u = #{i : k_i = k_g}`, `v = #{i : k_i = k_g + 1}`),
  its infinitesimal character `0, ±(k_i − i)`, and its identification with the holomorphic discrete
  series when `k_g > g`.
- §§7.2 and 7.2a: the `GL₂` adelization of elliptic newforms and the shared adelic-lift predicate.
- What AutomorphicFormsOnReductiveGroups must provide (gap:siegel-adelic-lift): the `Sp_{2g}`
  analogue of §7.2a at level one, identifying square-integrable vector-valued Siegel modular forms of
  weight `k` for `Sp_{2g}(ℤ)` with `(𝔤, K)`-homomorphisms from `ρ_k` into the square-integrable
  automorphic forms of `Sp_{2g}` fixed by `Sp_{2g}(Ẑ)`, compatibly with Hecke operators and with
  cusp forms going to cuspidal automorphic forms.
- §§7.4–7.5: algebraic modular forms for groups compact at infinity with their coefficient
  action, Hecke operators, finite stabilizers and automorphic realization.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

- Conventions and §AL.1.4: the factors `Γ_ℝ` and `Γ_ℂ` with the normalization above, and the
  archimedean standard epsilon factor with `ε(1) = 1`, `ε(sgn) = i` and `ε(I_w) = i^{w+1}`
  (§AL.1.4.3).
- §AL.3.6: continuation of `Λ(s, π × π′)`, simple poles exactly at `s = 0, 1` when `π′ ≅ π^∨` up to
  a unitary norm twist (§AL.3.6.1), the functional equation (§AL.3.6.2) and boundary nonvanishing
  (§AL.3.6.3); §AL.3.9.2: boundedness in vertical strips; §AL.3.7: strong multiplicity one for
  cuspidal representations and for isobaric sums.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §1.3: the admissible test-function class `weil_test_function(c, F)`; §1.8: Weil's explicit
  formula in Mestre's formalism for two completed functions with finitely many poles, finite-order
  growth in strips, gamma factors `∏ Γ(a_i s + b_i)` and Euler products with
  `|α_i(p)| ≤ p^c`, with zeros summed by symmetric heights. The Rankin–Selberg application in
  §2.6 is a specialization of that statement with `c = 0`.

### From TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases

- §1.5: the kernel `odlyzkoKernel`, `g(x) = (1 − |x|) cos(πx) + sin(π|x|)/π` on `[−1, 1]` and `0`
  outside, as the convolution square `2(u ∗ u)` of `u = cos(πx)·1_{[−1/2, 1/2]}`: even, `g(0) = 1`,
  nonnegative, positive definite, of class `C¹`, with integral `4/π²` over the positive half-line.
- §1.6: for an even continuous compactly supported nonnegative positive definite `f` and
  `F(x) = f(x)/cosh(x/2)`, the transform `Φ(s) = ∫ F(x) e^{(s − 1/2)x} dx` has nonnegative real part
  for `0 ≤ Re s ≤ 1`.
- §1.7: `poitouTestFunction b x = g(x/b)/cosh(x/2)`, even, equal to `1` at `0`, vanishing for
  `|x| ≥ b`, nonnegative and continuously differentiable. With `b = ℓ` this is the function `F_ℓ` of
  §2.2, and §§1.5–1.6 give (POS) for it.

### From TauCetiRoadmap.AutomorphicSpectralTheory

- §§4.4–4.5: the residual and discrete spectrum and finite multiplicities at fixed level, finite
  `K`-types and fixed infinitesimal character. §4.10: Wallach's criterion that discrete
  automorphic representations tempered at infinity are cuspidal.
- §§6.9, 6.17, 6.19 and 6.20: invariant orbital integrals, the trace formula for compact
  quotients with centralizer volumes, Euler–Poincaré test functions and Arthur's `L²`-Lefschetz
  formula for Hecke operators, with residual spectrum included.
- What AutomorphicSpectralTheory must provide (gap:gross-volume-rationality): for the centralizer
  `H` of a semisimple element of finite order in a split classical group over `ℚ`, with Euler–Poincaré
  measure at infinity and the measures giving `H(ℤ_p)`-type maximal compact subgroups volume one at
  finite places, the rationality of the global volume of `H(ℚ)\H(𝔸)` through Gross's motive of `H`
  and the values of its Artin `L`-functions at non-positive critical integers.

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

- Exact supplier contracts: the standing premises (the twisted weighted fundamental lemma and the
  trace inputs) under which its Layer 3 is stated; this roadmap carries them as hypotheses.
- §3.4: the symplectic or orthogonal type of a self-dual cuspidal representation.
- What ModularityAndLanglandsExtensions must provide (gap:same-type-pair-root-number): for unitary
  self-dual cuspidal representations `π` of `GL_n(𝔸_ℚ)` and `π′` of `GL_m(𝔸_ℚ)` of the same type
  (both orthogonal or both symplectic), the global root number `ε(1/2, π × π′)` equals `1` (Arthur,
  Theorem 1.5.3(b)).
- §3.8: discrete global Arthur parameters `ψ = ⊞ π_i[d_i]` of `Sp_{2n}`, `SO_{2n+1}` and `SO_{2n}`,
  their component groups `S_ψ` and the epsilon character `ε_ψ`. §3.15: local Arthur packets with
  their pairings, under a fixed Whittaker datum. §3.17: Arthur's multiplicity formula. §§3.20–3.21:
  Adams–Johnson parameters and the identification of real Arthur packets of cohomological
  parameters with Adams–Johnson packets. §3.22: the Mœglin–Renard criterion for a scalar unitary
  lowest-weight module of `Sp_{2g}(ℝ)` to lie in a real Arthur packet, with multiplicity one.

### From TauCetiRoadmap.AutomorphicBundles

- §§11.1–11.2: classical automorphic forms and cusp forms as sections over toroidal models, with
  cusp forms the kernel of restriction to the boundary; §11.9: the comparison of geometric and
  analytic classical forms; §11.16: the Siegel coefficient `S_a(ω) ⊗ det(ω)^{λ_g}` attached to a
  dominant weight. At level `Sp_{2g}(ℤ)` these give `M_k(Γ_g)` and `S_k(Γ_g)`.
- §§12.10, 12.11, 12.13 and 12.15: cuspidality through boundary restrictions, geometric Hecke
  operators including at non-neat level, and Fourier–Jacobi expansions with vector coefficients.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

- §§0.15 and 2.4c: the Schrödinger model and the Weil representation; §3.1: the
  orthogonal–symplectic dual pair; §§3.4–3.5: big and small theta modules; §3.7: Howe duality;
  §3.10: first occurrence in a Witt tower; §3.21: Rallis's unramified computation of the Satake
  parameters of a theta lift; §5.1: the theta kernel; §5.6: the global theta lift.
- §6.14: the global theta nonvanishing criterion.
- What MetaplecticAutomorphicForms must provide (gap:boecherer-theta-image): Böcherer's criterion
  (Böcherer 1989, Theorem 5) that a Siegel cusp eigenform `F` of weight `k = n/2 + ν` for
  `Sp_{2g}(ℤ)` lies in the image of the theta map with pluriharmonic coefficients of determinant
  weight `ν` from the even unimodular lattices of rank `n` exactly when
  `γ_g^k(s) C_g(n/2 + s, ν) L(n/2 − g + 2s, F, St) / ω_g(n/2 + 2s)` has a finite nonzero value at
  `s = 0`, in the normalization of §6.12.

### From TauCetiRoadmap.SymplecticReidemeisterTorsionModSquares

- §4.1: the Zassenhaus formula `zassenhaus_primary_formula`. For a finite-dimensional
  nondegenerate quadratic form `q` over a field `K` in which `2` is invertible and every isometry
  `γ ∈ O(q)`, with `N = dim V`, `V₋ = ker(γ + 1)^N` and `U = im(γ + 1)^N`, the spinor norm
  `CliffordAlgebra.orthogonalSpinorNorm` of `γ` is the class of `disc(V₋) · det((1 + γ)/2 | U)`, where
  `disc(V₋)` is the Gram determinant of a basis of `V₋` for the associated bilinear form
  `B(x, x) = q(x)`; no determinant-one or even-dimension hypothesis is made. §4.6 translates it into
  the characteristic-polynomial form of Chenevier–Taïbi.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

- §2.4: integral genus, proper spinor genus and spinor-norm images of unimodular stabilizers.
  §2.4.2: for a nondyadic nonarchimedean local field with valuation ring `R` and a nondegenerate
  unimodular lattice of rank at least two, the spinor-norm image of the proper stabilizer is
  `R^× K^{×2}`. For `p` odd a regular quadratic form on `ℤ_pⁿ` is unimodular for its polar form
  (`det(c + cᵀ) = ±1` or `±2`, a unit), and in rank one `SO(q)` is trivial, so §2.4.2 supplies the
  odd primes of §4.7.
- What GeometryOfNumbersAndQuadraticArithmetic must provide (gap:integral-spinor-norm-units): for
  `p = 2` and every regular quadratic form `q` on `ℤ₂ⁿ` (nondegenerate, or of odd rank with unit
  half-discriminant), the spinor norm of every element of `SO(q)(ℤ₂)` lies in the image of `ℤ₂^×`
  in `ℚ₂^×/ℚ₂^{×2}`, proved by lifting to `GSpin(q)(ℤ₂)`.

### From TauCetiRoadmap.OrthogonalTamagawaAndLatticeMass

- §3.1: the mass of even unimodular lattices of rank `n ≡ 0 mod 8`. §4.1: the two classes in rank 16
  and their automorphism orders. §4.2: the twenty-four classes in rank 24, which are Tau Ceti's
  twenty-three rooted table lattices and `TauCeti.leechLattice`, so that the rootless class is
  unique, with `|O(Leech)| = 8315553613086720000` taken there from CFSGBasicProperties P2-L.

### From TauCetiRoadmap.ComputationalNumberTheory

- §§4.1–4.7: rational interval and complex-box arithmetic. §§4.17, 4.17a and 4.18: the closed
  formulas, digamma and trigamma remainders and rational enclosures of the eight scalars
  `F̂(0)`, `F̂(i/(4π))`, `J_F(I_w)`, `J_F(1 − e)`, `Ĝ(0)`, `Ĝ(i/(4π))`, `J_G(I_w)`, `J_G(1 − e)` for the
  Odlyzko functions. §§4.26 and 4.31: integral-coordinate comparison for ellipsoids and the
  effective vectors of an exact ellipsoid cover. §§4.29–4.34: rational Gram witnesses, negativity
  of every enclosed Gram matrix, validity of a witness and of a finite family, and the
  multiplicity lift `x_{i,r} = t_i/m_i`. §5.1: interpretation of finite families. This roadmap
  proves that the scalars computed there are the intrinsic quantities of §2.3.

### From TauCetiRoadmap.IntegralLattices, Rank24LatticeConstructions, ThetaSeries, AlgebraicCodingTheory, SporadicOrders and OrthogonalSpinGroups

- Completed/IntegralLattices Layer 1: the lattice carrier, Gram matrices, isometries and their Tau
  Ceti declarations listed above.
- IntegralLattices §4G: integral lattices `L`, `M` on the same rational space are `p`-neighbours when
  `[L : L ∩ M] = [M : L ∩ M] = p`; the relation is symmetric, neighbours have equal determinants and
  the same genus when `p ∤ 2 det L`, and a neighbour is constructed from an isotropic vector mod `p`.
  No enumeration and no connectivity of the neighbour graph is supplied; §6.3 uses only the
  relation.
- Rank24LatticeConstructions Layer 6: the Leech lattice by Construction B and an odd shift, and its
  absence of roots. At the pin this is Tau Ceti's `TauCeti.leechLattice` on `Fin 24 → ℚ` with the
  halved dot product, listed under From Tau Ceti.
- ThetaSeries Layer 1 (Poisson summation for a lattice), Layer 5 (genus-one theta series of an
  even unimodular lattice is a level-one modular form) and Layer 8 (`Θ_{E₈} = E₄`,
  `Θ_{Leech} = E₄³ − 720Δ`).
- AlgebraicCodingTheory Layer 5: the extended binary Golay code `G₂₄`.
- SporadicOrders Layer 1: the permutation model and order `244823040` of `M₂₄`.
- OrthogonalSpinGroups Layer 1: the spinor norm `θ : SO(Q)(K) → K^×/K^{×2}` of a nondegenerate
  quadratic space over a field, which at the pin is Tau Ceti's `CliffordAlgebra.orthogonalSpinorNorm`
  listed above.

### From TauCetiRoadmap.CFSGBasicProperties

- P2-L: Conway's group `Co₀ = O(Leech)`, the isometry group of the Leech lattice of
  Rank24LatticeConstructions Layer 6, its Conway generators and the proof that they generate it, its
  order, and the simplicity of `Co₁ = Co₀/{±1}`.
- What CFSGBasicProperties must provide (gap:conway-group-average-charpoly): the average
  characteristic polynomial of Conway's group on `Leech ⊗ ℚ`,
  `(1/|O(Leech)|) Σ_{γ ∈ O(Leech)} det(t − γ) = t²⁴ + t¹⁶ + t¹² + t⁸ + 1`, from the conjugacy classes
  of `O(Leech)` and the character of its 24-dimensional representation.

### From TauCetiRoadmap.RepresentationTheory and ReductiveGroups

- LieHighestWeight Layer 6: the Weyl character formula, Weyl dimension formula and Kostant
  multiplicity formula. ClassicalGroups Layers 3–5: highest weights of `SO_n`, `O_n` and `Sp_{2n}`,
  their characters and dimension formulas.
- ReductiveGroups Layer 9: pinned Chevalley–Demazure group schemes over `ℤ`.
- What ReductiveGroups must provide (gap:split-orthogonal-regular-form): the identification of the
  pinned Chevalley–Demazure groups of types `B_n` and `D_n` over `ℤ` with the special orthogonal
  group schemes of the regular forms `x₁x_{2n+1} + ⋯ + x_nx_{n+2} + x_{n+1}²` (odd rank `2n + 1`) and
  `x₁x_{2n} + ⋯ + x_nx_{n+1}` (even rank `2n`) respectively, compatible with points over `ℤ_2`.

## How to read the build

Layer 1 fixes the objects: the level-one algebraic cuspidal spectrum, its archimedean parameters
and the weight dictionary between highest weights of classical groups and infinitesimal
characters. Layer 2 proves the Rankin–Selberg explicit formula for that spectrum and its
positivity on the nonnegative cone, and turns it into finite quadratic-form criteria that exclude
hypothetical representations; it ends with Miller's theorem and the repeated-weight `PGL₄`
vanishing. Layer 3 specializes Arthur's classification at level one: parameters, component
groups, the holomorphic packet characters and the relation `EP = κ·N⊥ + R` between Euler–Poincaré
characteristics and self-dual cuspidal counts. Layer 4 evaluates the geometric side of the trace
formula: masses of torsion classes, the spinor obstruction, exact characters, and the recovery of
all masses through `SO₁₇` and `Sp₁₆` in the order coarse tables, then the 27 known classes, then
refined tables. Layer 5 classifies cuspidal representations of motivic weight at most 24 by
combining Layers 2 and 4. Layer 6 provides the Siegel side: the Siegel operator, the theta maps
attached to even unimodular lattices, first occurrence and the Rallis relation, from earlier
lattice results that do not depend on Layer 7. Layer 7 counts Siegel eigenforms through their
standard parameters, and Layer 8 realizes them by theta series and proves the stable statements.

## Layer 1: level-one cuspidal forms and classical infinitesimal characters

### 1.1 The level-one algebraic cuspidal spectrum

Define `Π_alg` as the disjoint union over `m ≥ 1` of the isomorphism classes of irreducible
unitary cuspidal automorphic representations `π` of `PGL_m(𝔸_ℚ)` that are unramified at every
prime (each `π_p` has a nonzero `PGL_m(ℤ_p)`-fixed vector) and algebraic in Chenevier–Taïbi's sense:
the Weil parameter `L(π∞)` is a direct sum of characters `z ↦ z^p z̄^q` of `ℂ^×` with `p, q ∈ ½ℤ`
and `p − q ∈ ℤ`, trivial on `ℝ_{>0}`, on which `−1 ∈ ℝ^×` acts by a scalar (CT20 §1.2 and §2.1). The
trivial representation of `PGL₁` belongs to `Π_alg`. Write `rank(π) = m`, `π^∨` for the
contragredient, and `c_p(π)` for the Satake conjugacy class in `GL_m(ℂ)`. This is a predicate on the
cuspidal spectrum of AutomorphicFormsOnReductiveGroups, not a second notion of automorphic
representation.

- The rank is the common dimension of the Weil parameter `L(π∞)` and of the Satake classes.
- The contragredient preserves `Π_alg`, the rank and the level, and is an involution on classes.
- For every prime `p`, `π_p` is spherical, and `c_p(π)` is an unordered multiset of `m` nonzero complex
  numbers of absolute value one by purity (§1.5), without a chosen order.
- The adelic description and the description by level-one cuspidal functions on
  `PGL_m(ℤ)\PGL_m(ℝ)` give the same set.

*Needs:* AutomorphicFormsOnReductiveGroups §§2.5, 3.5, 4.2 and 5.1.

**Checks.**

- The trivial representation of `PGL₁` belongs to `Π_alg`, has rank one and is self-dual.
- The representation attached to `Δ ∈ S₁₂(SL₂(ℤ))` has `L(π∞) = I₁₁` and unitary weights `±11/2`;
  the unnormalized weights `0` and `11` belong to the twist by `|·|^{11/2}`, which is not unitary
  and is not in `Π_alg`.
- A cuspidal representation with a ramified prime is excluded even when its archimedean component
  is algebraic: the representation attached to a newform of level 11 and weight 2 is not in `Π_alg`.

### 1.2 The real Weil representation ring

Define `K∞` as in the Conventions, with additive basis `1, e, I_w` (`w ≥ 1`). Prove the
multiplication rules `e² = 1`, `e I_a = I_a` and `I_a I_b = I_{a+b} + I_{|a−b|}` for `a, b ≥ 1`, with
`I₀ = 1 + e` (CT20 §2.1). The effective cone consists of the elements with nonnegative integral
coefficients. For `w ≥ 0` let `K∞^{≤w}` be the subgroup spanned by the `I_v` with `0 < v ≤ w` and
`v ≡ w mod 2`, together with `1` and `e` when `w` is even. It is a subgroup, not a subring, and
`K∞^{≤w} ⊂ K∞^{≤w+2}`.

- Two elements of `K∞` are equal exactly when their coefficients on `1, e, I_w` agree.
- `I_a I_b = I_{a+b} + I_{|a−b|}` for all `a, b ≥ 1`, with the convention `I₀ = 1 + e` when `a = b`.
- An element is effective exactly when every basis coefficient is a nonnegative integer.
- `K∞^{≤w}` contains exactly the `I_v` with `0 < v ≤ w`, `v ≡ w mod 2`, and contains `1` and `e`
  exactly when `w` is even.
- `K∞` is identified with the Grothendieck ring of the semisimple representations of `W_ℝ` of
  AutomorphicFormsOnReductiveGroups §2.5 that are trivial on `ℝ_{>0}`.

*Needs:* AutomorphicFormsOnReductiveGroups §2.5.

**Checks.**

- `I₁² = I₂ + 1 + e`, of dimension four; replacing `I₀` by `1` would give dimension three.
- `e² = 1` and `e I₇ = I₇`, while `e ≠ 1`.
- `I₂₃² ∋ I₄₆`, so `K∞^{≤23}` is not closed under multiplication.
- `I₁ ∈ K∞^{≤23}`, while `I₂ ∉ K∞^{≤23}` and `1 ∉ K∞^{≤23}`; `I₂₂` and `e` lie in `K∞^{≤22}`.

### 1.3 Integral classical groups and their normalizations

The integral model of `Sp_{2n}` is `TauCeti.Symplectic.groupScheme` with its matrix points. The
integral models of `SO_{2n+1}` and `SO_{2n}` are the special orthogonal groups of the regular
forms `x₁x_{2n+1} + ⋯ + x_nx_{n+2} + x_{n+1}²` and `x₁x_{2n} + ⋯ + x_nx_{n+1}`, compared with the
Chevalley–Demazure groups of types `B_n` and `D_n` (CT20 §1.4 and §3.1). Level one means `G(Ẑ)` for
these models, including `p = 2`.

- The permitted groups for the mass computation are `Sp_{2n}`, `SO_{2n+1}` and `SO_{4n}`; `SO_{4n+2}`
  has no discrete series and is excluded.
- For `R = ℤ_p`, the `R`-points of the special orthogonal model are the matrices of determinant one
  preserving the quadratic form; this is the set `specialOrthogonalPoints c R` of §4.7 for the integer
  matrix `c` with `xᵀcx` equal to the model form.

*Needs:* `TauCeti.Symplectic.groupScheme`, `TauCeti.Symplectic.pointsMulEquiv`,
`TauCeti.Symplectic.instSmoothCoordinateHopfAlgebra`; ReductiveGroups Layer 9 with the
identification requested there.

**Checks.**

- `Sp₂ = SL₂` is permitted and `SO₆` is not.
- The odd-rank form `x₁x₃ + x₂²` has polar Gram determinant `−2`: it is regular (unit
  half-discriminant) although its polar form is not a perfect pairing over `ℤ₂`. Defining
  regularity by a perfect polar pairing would wrongly exclude every odd-rank model.
- `SO(x₁x₂)(ℤ_p)` is `{diag(t, t⁻¹) : t ∈ ℤ_p^×}`, while its `ℚ_p`-points allow `t ∈ ℚ_p^×`: the
  rational element `diag(p, p⁻¹)` is not of level one, so level one is not a rational notion.

### 1.4 Dimension, determinant, gamma and epsilon on K∞

On `K∞` use the additive dimension (`dim 1 = dim e = 1`, `dim I_w = 2`), the multiplicative
determinant (`det I_w = e^{w+1}`), and the additive weights (`0` for `1` and `e`, `±w/2` for `I_w`).
Extend `Γ(s, −)` multiplicatively from `Γ(s, 1) = Γ_ℝ(s)`, `Γ(s, e) = Γ_ℝ(s + 1)` and
`Γ(s, I_w) = Γ_ℂ(s + w/2)`, and `ε(−)` multiplicatively from `ε(1) = 1`, `ε(e) = i`,
`ε(I_w) = i^{w+1}` (CT20 §2.1). The epsilon factor is complex-valued.

- `dim(UV) = dim U · dim V`, and `dim` is additive.
- `Γ(s, U + V) = Γ(s, U) Γ(s, V)` on the common domain, and likewise for `ε`.
- These agree with the archimedean factors of AutomorphicLFunctionsAndLocalFactors §AL.1.4 under
  `recGL`, including the factor `2` in `Γ_ℂ`.

*Needs:* §1.2; AutomorphicLFunctionsAndLocalFactors Conventions and §AL.1.4.

**Checks.**

- `Γ(s, I₀) = Γ_ℝ(s) Γ_ℝ(s + 1)` and `ε(I₀) = i`; by the duplication formula this equals
  `Γ_ℂ(s)`, consistent with `I₀ = Ind(trivial)`.
- `I₁₁` has dimension 2, determinant `e¹² = 1` and epsilon `i¹² = 1`.
- `ε(1·e) = i` is not real; a real Gram matrix cannot accept the pair `(1, e)` with both
  self-duality flags active without the guard of §2.9.

### 1.5 Purity, symmetric weights and duality

Prove: for `π ∈ Π_alg`, `ℝ_{>0}` acts trivially on `L(π∞)`, `−1` acts by a scalar, and all weights lie
either in `ℤ` or in `½ + ℤ`; the weight multiset is stable under negation, and `π^∨` has the same
archimedean parameter. The motivic weight `w(π)`, twice the largest weight, is a nonnegative
integer (CT20 §1.2 and §2.1). These are statements about infinity types; they do not imply
`π ≅ π^∨`.

*Needs:* §§1.1 and 1.4; AutomorphicFormsOnReductiveGroups §5.5.

**Checks.**

- `w(Δ₁₁) = 11` and `w(Sym²Δ₁₁) = 22`.
- A non-self-dual class and its contragredient are two distinct points of the same infinity-type
  fibre; the statement does not identify them.
- The trivial representation has motivic weight `0`.

### 1.6 Symmetric weight vectors and regularity

Define `W_m` as the set of decreasing vectors `w ∈ (½ℤ)^m` with `w_i − w_j ∈ ℤ` and
`w_i = −w_{m+1−i}`, recorded by doubled integral coordinates. It is regular when, for every `i < j`,
either `w_i ≠ w_j`, or `m ≡ 0 mod 4`, `(i, j) = (m/2, m/2 + 1)` and `w_i = w_j = 0` (CT20 §1.2 with the
ordered quantifier, and §2.2). Prove that an effective `U ∈ K∞` of dimension `m`, determinant `1`
and with the scalar action of `−1` is determined by its weight vector when that vector is regular.

- `W_m` is in bijection with decreasing symmetric integral vectors whose coordinates share one
  parity.
- The only repeated coordinates of a regular vector are the central double zero in dimension
  divisible by four.
- Regular effective parameters of determinant one with the scalar action of `−1` and the same
  weights are equal.

*Needs:* §§1.4–1.5.

**Checks.**

- `(1, 0, 0, −1)` is regular in `W₄`; an unordered reading of the exception would reject it.
- `(1, 1, −1, −1)` is not regular.
- `(1/2, 0, −1/2)` is symmetric but fails the integral-difference condition.
- The distinct parameters `3·1` and `1 + 2e` have determinant one and the same three zero weights;
  both are nonregular, so a reconstruction statement without regularity is false.

### 1.7 Counts at a fixed infinity type

For `w ∈ W_m` define `N(w)` as the number of `π ∈ Π_alg` of rank `m` with weight vector `w`, and
`N⊥(w)` as the number of self-dual ones; for `U ∈ K∞` define `N(U)` by fixing the whole parameter.
Prove that these sets are finite (CT20 Problem 1 and §2.4.2), that `N⊥ ≤ N`, and that `π ↦ π^∨` acts
on each fibre with fixed points exactly the self-dual classes, so `N − N⊥` is even.

- Each fibre at fixed rank and weight vector is finite.
- `N⊥(w) ≤ N(w)` and `N(w) − N⊥(w)` is even.
- On the regular determinant-one stratum `N(w) = N(U)` for the parameter `U` of §1.6; at nonregular
  weights the zero-character split of `U` is retained.

*Needs:* §§1.1 and 1.6; AutomorphicSpectralTheory §4.5.

**Checks.**

- `N((0)) = N⊥((0)) = 1` in rank one.
- The two eigenforms in `S₂₄(SL₂(ℤ))` give `N((23/2, −23/2)) = 2`, not `1`.
- Two mutually dual non-self-dual classes contribute `2` to `N` and `0` to `N⊥`.

### 1.8 Self-dual type and pair root numbers

Prove, unconditionally, that at level one the global root number of a pair `π, π′ ∈ Π_alg` is
`ε(L(π∞) L(π′∞))`, the finite epsilon factors being `1` (CT20 §2.2 and §5.1). Prove, under the
standing premises, that a regular self-dual `π ∈ Π_alg` is symplectic when `w(π)` is odd and
orthogonal when `w(π)` is even, and that `ε(π × π′) = 1` for self-dual `π, π′` of the same type
(CT20 §2.2 and footnote 7, where both are derived from Arthur's classification). For opposite types
the sign is computed by the first formula, and may be `−1`.

*Needs:* §§1.1, 1.4 and 1.6; AutomorphicLFunctionsAndLocalFactors §§AL.1.4 and AL.3.6.2 for the
root-number formula; ModularityAndLanglandsExtensions §3.4 and the root-number statement requested
there for the two premised assertions.

**Checks.**

- `ε(Δ₁₁ × Δ₁₅) = ε(I₁₁ I₁₅) = ε(I₂₆ + I₄) = i²⁷ · i⁵ = 1`, as two symplectic classes require.
- `ε(Δ₁₇ × 1) = ε(I₁₇) = i¹⁸ = −1`, an opposite-type pair with sign `−1`.
- Regularity is needed: the parity of the motivic weight alone does not decide the type of a
  nonregular class, and no type is asserted for it here.

### 1.9 Highest weights of classical groups and dual infinitesimal weights

For dominant integral `λ` of a permitted `G` define `w(λ) ∈ W_{m_G}` with positive coordinates
`λ_i + n + 1 − i` (and an extra `0`) for `Sp_{2n}`, `λ_i + n + 1/2 − i` for `SO_{2n+1}`, and
`|λ_i| + n − i` for `SO_{2n}` (only `λ_n` may be negative there), completed by their negatives (CT20
§1.4). Prove that `w(λ)` is regular, and that the map has an inverse exactly on three images: integral
vectors of odd length `m ≥ 3` (from `Sp_{m−1}`), non-integral vectors of even length (from `SO_{m+1}`),
and integral vectors of length divisible by four (from `SO_m`, normalizing `λ_n ≥ 0`); rank one is
treated separately.

- `w(λ)` is regular.
- On each of the three images the inverse is explicit; in type `D` it is defined on outer orbits.
- `(d_G, m_G)` takes the three values of the Conventions.

*Needs:* §§1.3 and 1.6; LieHighestWeight Layer 6; ClassicalGroups Layer 3.

**Checks.**

- For `Sp₂` and `λ = k`, `w = (k + 1, 0, −k − 1)` and `d_G = 2`.
- For `SO₃` and `λ = k`, `w = (k + 1/2, −k − 1/2)`.
- `(1, −1) ∈ W₂` has no inverse; the `SO₄` weights `(1, 1)` and `(1, −1)` have the same image.

### Examples

At `w = 11` the weight space contains `(11/2, −11/2)`, regular, with `N = N⊥ = 1` realized by `Δ₁₁`;
at `w = 23` the same vector shape has `N = 2`. For `Sp₂` and `λ = 10`, `w(λ) = (11, 0, −11)` and the
self-dual simple parameter with these weights would be a rank-3 orthogonal class of motivic
weight 22, which is `Sym²Δ₁₁`.

### Dependencies

AutomorphicFormsOnReductiveGroups §§2.5, 3.5, 4.2, 5.1, 5.5; AutomorphicLFunctionsAndLocalFactors
§§AL.1.4, AL.3.6; AutomorphicSpectralTheory §4.5; ModularityAndLanglandsExtensions §3.4;
ReductiveGroups Layer 9; LieHighestWeight Layer 6; ClassicalGroups Layer 3; Tau Ceti's symplectic
group scheme.

## Layer 2: Rankin–Selberg positivity and exclusions

This layer owns the level-one Stark–Odlyzko method. The starting point is an intrinsic bilinear
explicit formula for the completed Rankin–Selberg functions of pairs in `Π_alg`. Its finite part is
positive semidefinite, while the zero contribution is nonnegative only on the cone of nonnegative
coefficient vectors; the resulting inequality is turned into finite minimization problems on
nonnegative unit spheres, whose negative values exclude hypothetical classes.

### 2.1 Even test functions and the positivity condition

Work with even real functions `F : ℝ → ℝ` of class `C²` with compact support, which lie in the
admissible class `weil_test_function(0, F)` of AnalyticNumberTheoryPartI §1.3. Define
`F̂(ξ) = ∫ F(x) exp(−2πixξ) dx` for `ξ ∈ ℂ`; it is entire. Say that `F` satisfies (POS) when
`F(x) ≥ 0` for real `x` and `Re F̂(ξ) ≥ 0` whenever `|Im ξ| ≤ 1/(4π)` (CT20 §2.3).

- `F̂(−ξ) = F̂(ξ)` and `F̂(ξ̄) = overline(F̂(ξ))`; in particular `F̂` is real on `ℝ` and on `iℝ`.
- `A_F = F̂(i/(4π)) = ∫ F(x) cosh(x/2) dx` and `B_F = F̂(0) = ∫ F(x) dx` are real.
- (POS) consists of two separate conditions, pointwise nonnegativity and real-part nonnegativity
  on the closed strip.

*Needs:* AnalyticNumberTheoryPartI §1.3; Mathlib Fourier integrals.

**Checks.**

- A zero `ρ` with `0 ≤ Re ρ ≤ 1` sits at `ξ = (1 − 2ρ)/(4πi)`, whose imaginary part
  `−(1 − 2 Re ρ)/(4π)` lies in `[−1/(4π), 1/(4π)]`.
- The conjugation identities hold for every even real integrable function: for the triangle
  function `1_{[−1,1]} ∗ 1_{[−1,1]}` (continuous but not `C²`, so outside the class) the transform
  `sin²(2πξ)/(πξ)²` is real on `ℝ` and equals `sinh²(2πy)/(πy)² > 0` at `ξ = iy`.
- A function whose transform is nonnegative only on `ℝ`, such as `G_ℓ` of §2.2, does not satisfy
  (POS) by definition: `Ĝ_ℓ(ξ)` for `ξ` near `i/(4π)` is not controlled by its real-axis values.

### 2.2 The Odlyzko functions

The kernel `g` is `odlyzkoKernel` of SmallRamificationAndAbelianVarietyBaseCases §1.5: with
`u(x) = cos(πx)` for `|x| ≤ 1/2` and `0` otherwise, `g = 2(u ∗ u)`, so that
`g(x) = (1 − |x|) cos(πx) + sin(π|x|)/π` for `|x| ≤ 1` and `0` otherwise; it is even, nonnegative,
positive definite, of class `C¹`, supported in `[−1, 1]`, with `g(0) = 1` and `∫_0^∞ g = 4/π²`. For
`ℓ > 0` the test function `F_ℓ(x) = g(x/ℓ)/cosh(x/2)` is `poitouTestFunction ℓ` of that roadmap's
§1.7, and (POS) for `F_ℓ` is its §1.6 together with the nonnegativity of §1.7: under
`ξ = i(s − 1/2)/(2π)` the transform `Φ(s) = ∫ F_ℓ(x) e^{(s − 1/2)x} dx` is `F̂_ℓ(ξ)`, and the strip
`0 ≤ Re s ≤ 1` is `|Im ξ| ≤ 1/(4π)`. Define here `G_ℓ(x) = g(x/ℓ)` (CL14 IX §3.16, Lemme 3.15 and
Proposition 3.17; CT20 §2.4.3 and §4.3). Prove what the supplier does not state:

- `g` is of class `C²`, with `g″(±1) = 0`: on `[0, 1]`, `g″(x) = π sin(πx) − π²(1 − x) cos(πx)`, which
  vanishes at `1` and equals `−π²` at `0`; so `F_ℓ` and `G_ℓ` lie in the class of §2.1.
- `F̂_ℓ(i/(4π)) = ∫ g(x/ℓ) dx = 8ℓ/π²`, from the half-line integral `4/π²`.
- `G_ℓ ≥ 0` and `Ĝ_ℓ ≥ 0` on `ℝ`; `Ĝ_ℓ(0) = 8ℓ/π²` and `Ĝ_ℓ(i/(4π)) = 4π²ℓ(1 + cosh(ℓ/2))/(ℓ²/4 + π²)²`.

*Needs:* §2.1; SmallRamificationAndAbelianVarietyBaseCases §§1.5–1.7.

**Checks.**

- `g(0) = F_ℓ(0) = G_ℓ(0) = 1`; dropping the factor `2` in `g = 2(u ∗ u)` would give `1/2`.
- `F_ℓ` and `G_ℓ` vanish for `|x| ≥ ℓ`, and `g` and `g′` vanish at `±1` while `g″(±1) = 0` as well,
  so both are `C²` across the boundary of the support.
- For `0 < |x| < ℓ`, `F_ℓ(x) < G_ℓ(x)` because `cosh(x/2) > 1`; exchanging the two families'
  scalar values gives wrong constants, for example `Ĝ_ℓ(i/(4π)) > 8ℓ/π² = F̂_ℓ(i/(4π))`.
- The point `ξ = i/(4π)` corresponds to `s = 1`, where `Φ(1) = ∫ F_ℓ(x) e^{x/2} dx = ∫ F_ℓ(x) cosh(x/2) dx`
  by evenness, the value `A_{F_ℓ}` of §2.1; reading the supplier's strip as `|Im ξ| ≤ 1/(2π)` would
  claim positivity at `ξ = i/(2π)`, that is at `s = 3/2`, which the supplier does not give.

### 2.3 The archimedean functional

For `U ∈ K∞` set `J_F(U) = −∫_ℝ (Γ′/Γ)(1/2 + 2πit, U) F̂(t) dt`, where `(Γ′/Γ)(s, U)` is the
logarithmic derivative of `Γ(s, U)` of §1.4, and extend `ℝ`-linearly to `K∞ ⊗ ℝ`. Define the
symmetric bilinear form `B∞^F(U, V) = J_F(UV)` (CT20 (2.3.4)).

- The integral converges for every test function of §2.1 and is real.
- `J_F(U + V) = J_F(U) + J_F(V)`, and `B∞^F` is symmetric because `K∞` is commutative.
- `J_F(I₀) = J_F(1) + J_F(e)`; `J_F(1 − e)` is the integral of the difference of the two
  logarithmic derivatives `Γ_ℝ′/Γ_ℝ(s) − Γ_ℝ′/Γ_ℝ(s + 1)`.

*Needs:* §§1.4, 2.1.

**Checks.**

- `B∞^F(I₁, I₁) = J_F(I₂) + J_F(1) + J_F(e)`, by `I₁² = I₂ + I₀`.
- `J_F(1 − e)` differs from `J_F(I₀)`; using `1 + e` in place of `1 − e` changes the sign of the
  `e`-term.
- The bilinear form uses the product `UV`: `B∞^F(1, 1) = J_F(1)`, whereas the incorrect
  `J_F(U + V)` would give `J_F(2·1) = 2J_F(1)`.

### 2.4 The eight scalars

For `ℓ > 0` and an integer `w ≥ 0` prove that the eight quantities `F̂_ℓ(0)`, `F̂_ℓ(i/(4π))`,
`J_{F_ℓ}(I_w)`, `J_{F_ℓ}(1 − e)`, `Ĝ_ℓ(0)`, `Ĝ_ℓ(i/(4π))`, `J_{G_ℓ}(I_w)`, `J_{G_ℓ}(1 − e)` are given by the
closed digamma formulas of CL14 IX Proposition 3.17 (for `F_ℓ`) and CT20 Proposition 4.4 (for `G_ℓ`),
which are the formulas recorded in ComputationalNumberTheory §4.17. For `w = 0`, `I₀ = 1 + e`, so the
`w = 0` value together with `J(1 − e)` gives `J(1)` and `J(e)`. The proof expresses `J` through the
compact-support Laplace transform `Φ_F(s) = ∫ F(x) exp((s − 1/2)x) dx`, with `Φ_F(1/2) = F̂(0)` and
`Φ_F(0) = F̂(i/(4π))`, integrates the closed expression of `g` against the digamma series, and justifies
the exchanges by the tail bounds of ComputationalNumberTheory §4.17a.

*Needs:* §§2.2–2.3; ComputationalNumberTheory §§4.17 and 4.17a.

**Checks.**

- The second and fifth scalars coincide: `F̂_ℓ(i/(4π)) = Ĝ_ℓ(0) = 8ℓ/π²`.
- At `ℓ → 0⁺` both pole values tend to `0`, and `F̂_ℓ(0) ≤ F̂_ℓ(i/(4π))` because `cosh ≥ 1`.
- The comparison is between the intrinsic integral of §2.3 and the closed formula; a value
  computed by a numerical quadrature is not a substitute, and the two `G`-scalars `Ĝ_ℓ(0)` and
  `Ĝ_ℓ(i/(4π))` differ as soon as `ℓ > 0`.

### 2.5 The explicit-formula bilinear forms

On the real vector space `ℝ[Π_alg]` with basis `Π_alg` define symmetric bilinear forms by their values
on basis pairs (CT20 (2.3.1)–(2.3.7)):

- `B_f^F(π, π′) = Re Σ_{p, k ≥ 1} F(k log p)(log p) p^{−k/2} tr(c_p(π)^k) overline(tr(c_p(π′)^k))`, a
  finite sum by compact support;
- `B∞^F(π, π′) = J_F(L(π∞) L(π′∞))`;
- `δ(π, π′) = 1` if `π ≅ π′` and `0` otherwise;
- `Z^F(π, π′)`, the symmetric-height limit of `Σ_ρ Re F̂((1 − 2ρ)/(4πi))` over the zeros `ρ` of
  `Λ(s, π^∨ × π′)`, with multiplicity;
- `e⊥(π, π′) = 1` if both are self-dual and `ε(π × π′) = −1`, and `0` otherwise;
- `C^F = A_F δ − B∞^F − (B_F/2) e⊥`.

The forms on basis pairs extend uniquely to bilinear forms on `ℝ[Π_alg]`; `e⊥` is symmetric with zero
diagonal; and `C^F(π, π′) = A_F δ(π, π′) − J_F(L(π∞)L(π′∞)) − (B_F/2) e⊥(π, π′)`.

*Needs:* §§1.1, 1.8, 2.3; AutomorphicLFunctionsAndLocalFactors §§AL.3.6.1–AL.3.6.2.

**Checks.**

- For `x = Σ a_π π`, `B_f^F(x, x) = Σ_{p,k} F(k log p)(log p) p^{−k/2} |Σ a_π tr(c_p(π)^k)|²`; there is no
  extra factor `2`.
- `δ(Δ₂₃^a, Δ₂₃^b) = 0` although `L(Δ₂₃^a,∞) = L(Δ₂₃^b,∞)`: poles are indexed by isomorphism, not by
  infinity type.
- `e⊥(Δ₁₇, 1) = 1`, since `ε(I₁₇) = −1`, and then `Λ(s, Δ₁₇)` vanishes at `s = 1/2`.

### 2.6 The Rankin–Selberg explicit formula

Prove that for every test function of §2.1, `B_f^F + B∞^F + (1/2) Z^F = A_F δ` as bilinear forms on
`ℝ[Π_alg]` (CT20 (2.3.5)). Apply AnalyticNumberTheoryPartI §1.8 to `Λ₁(s) = Λ(s, π^∨ × π′)` and
`Λ₂(s) = Λ(s, π × π′^∨)` with `c = 0`; the poles of `Λ(s, π^∨ × π′)` contribute exactly `δ(π, π′)` at
`s = 0` and `s = 1`, the norm twists allowed by the pole theorem being excluded by the fixed unitary
algebraic infinity types; then extend bilinearly.

*Needs:* §2.5; AnalyticNumberTheoryPartI §1.8; AutomorphicLFunctionsAndLocalFactors §§AL.3.6 and
AL.3.9.2.

**Checks.**

- For `π = π′ = 1` the identity is Weil's explicit formula for the completed Riemann zeta function,
  with the pole term `A_F` from `s = 0, 1`; there is no hidden restriction to rank at least two.
- The factor `1/2` on `Z^F` is forced: in §1.8 the prime-power and gamma terms occur twice (once for
  `Λ₁`, once for `Λ₂`, complex conjugate to each other for even `F`), and the poles at `s = 0, 1`
  contribute `Φ_F(0) + Φ_F(1) = 2A_F δ`, while the zeros of `Λ₁` are counted once.
- `F = 0` makes every term vanish.

### 2.7 The Stark–Odlyzko cone inequality

Prove: if `F` satisfies (POS), then `C^F(x, x) ≥ 0` for every finite combination `x = Σ a_π π` with all
`a_π ≥ 0` (CT20 Proposition 2.2). Indeed `B_f^F` is positive semidefinite on all of `ℝ[Π_alg]`; for each
basis pair, (POS) and the forced central zero give `Z^F(π, π′) ≥ B_F e⊥(π, π′)`; and these pairwise
inequalities add up on the nonnegative cone. The statement does not assert that `C^F` is positive
semidefinite on signed vectors. Prove also the conditional variant: under the explicit generalized
Riemann hypothesis of the Conventions, the same conclusion holds for every test function of §2.1
with `F(x) ≥ 0` and `F̂(ξ) ≥ 0` for real `x` and `ξ`, a condition weaker than (POS), because every
zero `ρ` then has `Re ρ = 1/2` and sits at a real `ξ` (CT20 §4.3).

*Needs:* §§1.8, 2.6.

**Checks.**

- The step that needs `a_π ≥ 0` is the summation of the pairwise inequalities for `Z^F − B_F e⊥`; for
  `x = Δ₁₇ − 1` the cross term enters with coefficient `−2`, the pairwise bounds can no longer be
  added, and the argument gives nothing.
- At `x = 1` the inequality reads `A_F − J_F(1) ≥ 0`, Odlyzko's inequality for the trivial
  representation.
- With `G_ℓ` in place of `F_ℓ` the inequality needs the explicit generalized Riemann hypothesis of the
  Conventions: then every `ρ` has `Re ρ = 1/2` and `ξ` is real, where `Ĝ_ℓ ≥ 0`.

### 2.8 The multiplicity bound

Prove: if `F` satisfies (POS) and `π₁, …, π_m ∈ Π_alg` are distinct with common archimedean parameter
`U`, then `J_F(U²) ≤ A_F/m`; in particular `J_F(U²) ≤ A_F` for every represented `U` (CT20 Corollary
2.3, (2.4.1)–(2.4.2)). Apply §2.7 to `x = m⁻¹ Σ π_i`; the `e⊥` contribution is nonpositive. If `B∞^F` is
positive definite on a finite-dimensional effective subgroup of `K∞`, the effective integral
parameters satisfying the bound form a finite set.

*Needs:* §§1.7, 2.7.

**Checks.**

- With `m = 2` the bound is `A_F/2`; this is what distinguishes the fibre of `I₂₃`, which contains
  the two classes `Δ₂₃^a`, `Δ₂₃^b`.
- `m` counts classes, including distinct classes with identical weights, not distinct weight vectors.
- Finiteness of the candidate set needs a proved positive-definite lower bound for `B∞^F`, not an
  approximate eigenvalue.

### 2.9 Admissible quadruples and their Gram matrices

An admissible quadruple `Q = (r, U, δ, m)` consists of `r ≥ 1`, `U_i ∈ K∞`, `δ_i ∈ {0, 1}` and integers
`m_i > 0`, such that `ε(U_iU_j) ∈ {±1}` whenever `δ_iδ_j = 1`. For real `A_F, B_F` define the real
symmetric matrix `β_ij = (A_F/m_i) δ_ij − J_F(U_iU_j) − (B_F/4) δ_iδ_j (1 − ε(U_iU_j))`, let
`D_r = {t ∈ ℝ^r : t_i ≥ 0, Σ t_i² = 1}` and `μ_F(Q) = min_{t ∈ D_r} tᵀβt` (CT20 (2.4.3)–(2.4.5)).

- The diagonal entry is `A_F/m_i − J_F(U_i²)`, with the factor `1/m_i` and the root coefficient `1/4`.
- The minimum is attained, since `D_r` is compact and nonempty.
- `μ_F(Q) < 0` exactly when `tᵀβt < 0` for some nonzero `t ≥ 0`.

*Needs:* §§1.4, 2.1, 2.3.

**Checks.**

- For `r = 1`, `m₁ = 2`, `δ₁ = 0`: `β₁₁ = A_F/2 − J_F(U₁²)`.
- `U₁ = 1`, `U₂ = e` with `δ₁ = δ₂ = 1` is not admissible, because `ε(e) = i`.
- Vectors on a coordinate face such as `(1, 0)` belong to `D₂`; strict positivity of the coordinates
  is not required.

### 2.10 A local Rayleigh minimum is a least eigenvector

Prove: for a self-adjoint operator `T` on a nonzero finite-dimensional real inner product space, every
local minimum of `v ↦ ⟨Tv, v⟩` on the unit sphere is an eigenvector for the least eigenvalue of `T`
(CT20 Lemma 2.6). The pinned `IsSelfAdjoint.hasEigenvector_of_isLocalExtrOn` gives `Tx = λx`; if
`Ty = νy` with `ν < λ`, choose `y ⊥ x` and compare `cos θ · x + sin θ · y` for small `θ`.

*Needs:* `IsSelfAdjoint.hasEigenvector_of_isLocalExtrOn`.

**Checks.**

- In dimension one both points of the sphere are local minima and eigenvectors of the unique
  eigenvalue.
- For `T = diag(1, 2)`, the point `(0, 1)` is a local maximum with eigenvalue `2`; it is an
  eigenvector but not a local minimum, and the statement does not apply to it.
- The library theorem alone does not give minimality: `(0, 1)` above satisfies its conclusion.

### 2.11 The principal-face spectral criterion

Prove: for an admissible `Q`, `μ_F(Q)` is the minimum, over the nonempty `I ⊂ {1, …, r}` for which the
least eigenvalue `λ_I` of the principal submatrix `β_I` has an eigenvector with all `I`-coordinates
strictly positive, of `λ_I`; every global minimizer on `D_r` has a support `I` of this form (CT20
Proposition 2.5). A minimizer with support `I` is an interior local minimum on the face sphere, so
§2.10 applies.

*Needs:* §§2.9, 2.10.

**Checks.**

- For `β = diag(1, −1)` the minimum `−1` is attained on the face `I = {2}`.
- For `β = [[1, 2], [2, 1]]` the least eigenvector `(1, −1)` has mixed signs, so `I = {1, 2}` is not
  eligible, and `μ = 1` is attained on a single coordinate.
- Enumerating all nonempty supports is part of the statement; omitting `I = {1}` in the previous
  example would give no candidate at all.

### 2.12 The two-coordinate criterion

Prove: for `β = [[a, b], [b, c]]` with `a, c ≥ 0`, there is a nonzero `t ≥ 0` with `tᵀβt < 0` exactly when
`b < 0` and `b² > ac` (CT20 Example 2.7). If a diagonal entry is negative the corresponding coordinate
vector already gives a negative value.

*Needs:* §2.11.

**Checks.**

- `a = c = 1`, `b = −2`: the value at `(1, 1)` is `−2`.
- `a = c = 1`, `b = 2` has the same determinant `−3` but is nonnegative on the cone.
- `b² = ac` with `b ≤ 0` gives minimum `0`, not a negative value.

### 2.13 Equal block coordinates

Prove: if `A_F > 0`, `μ_F(Q) < 0` and `(U_i, δ_i, m_i) = (U_j, δ_j, m_j)`, then every minimizer `t ∈ D_r`
has `t_i = t_j` (CT20 Lemma 2.8). Equalizing the pair at fixed `t_i + t_j` strictly lowers the positive
diagonal contribution, so a negative minimum would be beaten after renormalization.

*Needs:* §2.9.

**Checks.**

- The hypothesis is equality of triples, not of `U` alone: two blocks with the same `U` and different
  `m` need not have equal coordinates.
- Without `μ_F(Q) < 0` the conclusion fails: for `β = diag(1, 1)` every unit vector is a minimizer.
- With `A_F = 0` the diagonal term no longer separates `t_i` from `t_j`.

### 2.14 Monotonicity in forced self-duality

Prove: for admissible `Q = (r, U, δ, m)` and `Q′ = (r, U, δ′, m)` with `δ′ ≥ δ` and `B_F ≥ 0`,
`β_{Q′}(x, y) ≤ β_Q(x, y)` for all `x, y ≥ 0`, hence `μ_F(Q′) ≤ μ_F(Q)` (CT20 Remark 2.10). The new terms
have coefficient `−B_F(1 − ε)/4 ≤ 0`.

*Needs:* §2.9.

**Checks.**

- The comparison is only on the nonnegative cone; for `x = (1, −1)` the inequality can reverse.
- `δ′` must itself be admissible: activating a pair with `ε = i` is not allowed even if `δ` was.
- For `ε = 1` on the newly active pair the entry is unchanged.

### 2.15 Multiplicity compression

For a quadruple with repeated identical blocks, compare the expanded quadruple (all `m = 1`) with the
compressed one (diagonal `A_F/m_i`, same kernel `J_F(U_iU_j) + (B_F/4)δ_iδ_j(1 − ε(U_iU_j))`). The
multiplicity lift `x_{i,r} = t_i/m_i` of ComputationalNumberTheory §4.34 gives
`q_expanded(x) = q_compressed(t)`. Prove that, when `A_F > 0`, `μ_expanded < 0` exactly when
`μ_compressed < 0` (CT20 Corollary 2.9), using §2.13 for the converse.

*Needs:* §2.13; ComputationalNumberTheory §4.34.

**Checks.**

- With `A_F = 1`, kernel `1` and one block of size two, the expanded minimum is `−1` and the
  compressed minimum is `−1/2`: negativity agrees, the minima do not.
- The lift uses `t_i/m_i`; the square-root normalization `t_i/√m_i` gives a different quadratic form.
- A single block of size one is unchanged by compression.

### 2.16 Negativity from enclosed scalars

Prove: let `Q` be admissible, `ℓ > 0` rational, and `t ≥ 0` a nonzero rational vector; if rational
intervals containing the eight scalars of §2.4 at `ℓ` give an upper bound for `tᵀβ_{F_ℓ}t` that is
strictly negative, then `μ_{F_ℓ}(Q) < 0` (CT20 §2.4.4). The proof combines §2.4 with the validity of
rational Gram witnesses in ComputationalNumberTheory §§4.29–4.33.

*Needs:* §§2.4, 2.9; ComputationalNumberTheory §§4.29–4.33.

**Checks.**

- For the exact matrix `[[1, −2], [−2, 1]]` the vector `(1, 1)` gives `−2 < 0`.
- An enclosure `[−1/100, 1/100]` for the quadratic value does not give negativity.
- A vector with a negative coordinate is not a witness, even if its value is negative.

### 2.17 Excluding further classes

Prove (CT20 §2.4.5): let `F` be a test function of §2.1 satisfying (POS), and write `β_Q^F` for the
matrix of §2.9 built from `A_F`, `B_F` and `J_F`. Let `S ⊂ Π_alg` be a finite set of distinct classes,
grouped by their pairs `(U, sd)` with multiplicities. Suppose `m ≥ 1` further distinct classes of
parameter `U` exist outside `S`, each self-dual when `δ = 1`. Form `Q` from the candidate block
`(U, δ, m)` and blocks of `S`. If `β_Q^F(t, t) < 0` for some nonzero `t ≥ 0`, this is impossible: for
`x = (t_cand/m) Σ π_new + Σ_i (t_i/m_i) Σ π_known,i`, §§2.14–2.15 give `C^F(x, x) ≤ β_Q^F(t, t) < 0`,
against §2.7. Under the explicit generalized Riemann hypothesis of the Conventions the same holds for
every test function `F` of §2.1 with `F ≥ 0` and `F̂ ≥ 0` on the real axis, in particular for `G_ℓ`
with `ℓ > 0`, by the conditional variant of §2.7 (CT20 §4.3).

*Needs:* §§2.7, 2.14, 2.15, 2.16.

**Checks.**

- The positivity hypothesis cannot be dropped: for `F = −F₁`, `S = ∅`, `U = 1`, `δ = 0`, `m = 1` and
  `t = 1`, the entry is `β = −(A_{F₁} − J_{F₁}(1))`, which is negative because the trivial class
  makes `A_{F₁} − J_{F₁}(1)` positive (its prime term at `p = 2`, `F₁(log 2) log 2/√2 > 0`, is strictly
  positive and the other terms are nonnegative); yet the trivial class exists. `−F₁` violates (POS)
  at `x = 0`, where it equals `−1`.
- The candidate classes must be disjoint from `S`; equality of infinity types with a member of `S` is
  allowed.
- For a hypothetical non-self-dual class outside a duality-stable `S`, use `m = 2`, `δ = 0` on its dual
  pair.
- With `S = ∅`, `r = 1` and `m = 1` the statement is the bound of §2.8 with `m = 1`, sharpened by the
  root term `−(B_F/4)(1 − ε(U²))` when `δ = 1`.

### 2.18 Positive definite covers

Prove: on `K∞^{≤w}`, let `B` be a rational positive definite matrix with `B ≤ (J_{F_ℓ}(UV))` entrywise on
the effective cone. Then every represented `U` with `J_{F_ℓ}(U²) ≤ c` lies in the finite set of
effective integral vectors with `xᵀBx ≤ c`, and an exact ellipsoid cover of that set (ComputationalNumberTheory
§§4.26 and 4.31) contains every such `U` (CT20 Remark 2.11 and §4.1). The bound `c = A_F/m` is replaced
by a rational upper bound for it, and the cover is then a cover at that enlarged bound.

*Needs:* §2.8; ComputationalNumberTheory §§4.26 and 4.31.

**Checks.**

- Entrywise `B ≤ A` gives `xᵀBx ≤ xᵀAx` only for `x ≥ 0`; on signed vectors it fails.
- Replacing `c` by `1.001 c` gives a cover, whose cardinality is not the number of candidates at `c`.
- Without positive definiteness the set of effective vectors with `xᵀBx ≤ c` can be infinite: for
  `B = 0` every effective vector qualifies.

### 2.19 Miller's theorem

Prove: for `0 ≤ n ≤ 12` no nontrivial `π ∈ Π_alg` has `L(π∞) = I₁ + I₃ + ⋯ + I_{2n+1}`, and none has
`L(π∞) = e^n + I₂ + I₄ + ⋯ + I_{2n}` (CT20 §2.4.1; Mil02 Theorem 1.6, constant-coefficient cuspidal
cohomology of `SL_N(ℤ)` vanishes for `1 < N < 27`). For each of these parameters evaluate §2.8 with
`F_ℓ` at a suitable rational `ℓ` and conclude by §2.16 that `J_{F_ℓ}(U²) > A_{F_ℓ}`.

*Needs:* §§2.2, 2.4, 2.8, 2.16.

**Checks.**

- For `n = 0` the second parameter is `1`, the trivial representation, which is excluded from the
  statement and is not ruled out.
- The parameters have ranks `2n + 2` and `2n + 1`, so the theorem covers `GL_N` for `2 ≤ N ≤ 26`,
  agreeing with Mil02's range `1 < N < 27`.
- `e^n + I₂ + ⋯ + I_{2n}` has determinant `e^n · e^n = 1`, as level one requires.

### 2.20 Level-one elliptic dimensions from the bound

Prove: for odd `w`, if `S` is the set of classes attached to the normalized eigenforms of
`S_{w+1}(SL₂(ℤ))` and §2.17 applies with `U = I_w`, `δ = 1`, `m = 1`, then `N(I_w) = dim S_{w+1}(SL₂(ℤ))`
(CT20 §1.4 and §2.4.5). The classical dimension is the pinned `ModularForm.dimension_level_one` with
`CuspForm.discriminantEquiv`, and the dictionary between normalized eigenforms and classes of
parameter `I_w` is AutomorphicFormsOnReductiveGroups §7.2. That the normalized eigenforms of
`S_{w+1}(SL₂(ℤ))` are `dim S_{w+1}(SL₂(ℤ))` in number is the pinned newform basis
`HeckeRing.GL2.Newform.basis` at level one, where `TauCeti.cuspFormsNew_one` makes the new subspace
everything.

*Needs:* §2.17; `ModularForm.dimension_level_one`, `CuspForm.discriminantEquiv`,
`HeckeRing.GL2.Newform.basis`, `TauCeti.cuspFormsNew_one`, `TauCeti.Gamma1_one_map_eq_SL`;
AutomorphicFormsOnReductiveGroups §7.2.

**Checks.**

- `w = 23`: `dim S₂₄ = 2`, while `S₂₃ = 0`; the motivic weight `w` and the classical weight `w + 1`
  must not be confused.
- `w = 11`: `dim S₁₂ = 1`.
- For even `w` the parameter `I_w` is not that of a level-one class from an eigenform, since
  `S_{w+1} = 0` in odd weight.
- Taking `δ = 1` loses nothing in rank two: a cuspidal representation of `PGL₂` is self-dual, so no
  non-self-dual extra class has parameter `I_w`.

### 2.21 Repeated-weight self-dual PGL₄ vanishing

Prove: for every odd `w` with `1 ≤ w ≤ 53`, no self-dual `π ∈ Π_alg` of rank four has
`L(π∞) = 2I_w` (CT20 §2.4.7). Apply §2.17 with `U = 2I_w`, `δ = 1`, `m = 1`, `ℓ = 5`, and the known
set of all classes from the eigenforms of `S_{w+1}(SL₂(ℤ))`, whose number is `dim S_{w+1}(SL₂(ℤ))`.

*Needs:* §§2.17, 2.20.

**Checks.**

- At `w = 23` the known set has two classes, and at `w = 53` four, since
  `dim S₅₄ = dim M₄₂ = 4`; a known set of size at most one is wrong for these `w`.
- There are `27` odd values of `w` in `[1, 53]`.
- A negative value for `U = I_w` is not one for `U = 2I_w`: the Gram matrices differ.

### Examples

For `π = 1` and `F = F_ℓ`, §2.8 reads `J_{F_ℓ}(1) ≤ 8ℓ/π²`. The pair `(Δ₁₇, 1)` has `e⊥ = 1`, so the
corresponding entry of `β` with `δ = (1, 1)` is `−J_F(I₁₇) − B_F/2`. The compression example of §2.15
is the smallest case where the normalized minima differ.

### Dependencies

AnalyticNumberTheoryPartI §§1.3, 1.8; SmallRamificationAndAbelianVarietyBaseCases §§1.5–1.7;
AutomorphicLFunctionsAndLocalFactors §§AL.1.4, AL.3.6, AL.3.9.2; AutomorphicFormsOnReductiveGroups
§7.2; ComputationalNumberTheory §§4.17, 4.17a, 4.26, 4.29–4.34; Mathlib's
Rayleigh quotient and level-one dimension formula; Tau Ceti's level-one newform basis; Layer 1.

## Layer 3: Arthur parameters, packet characters and triangular counts

This layer specializes the classification of ModularityAndLanglandsExtensions Layer 3 to level one
and computes, in the holomorphic cases, the finite sign tests that decide multiplicities. Every
statement from §3.3 on carries the supplier's standing premises as hypotheses.

### 3.1 Level-one Arthur parameters

For `Sp_{2g}` define `Ψ₁(Sp_{2g})` as the set of formal sums `ψ = ⊕_{i ∈ I} π_i[d_i]` with `d_i ≥ 1`,
`π_i ∈ Π_alg` self-dual, the pairs `(π_i, d_i)` distinct, `Σ rank(π_i) d_i = 2g + 1`, and `π_i`
orthogonal when `d_i` is odd and symplectic when `d_i` is even; algebraicity means integral weights.
For `SO_n` use the corresponding parity and determinant rules of ModularityAndLanglandsExtensions
§3.8. Put `ψ_ℝ = ⊕ L(π_i,∞) ⊗ Sym^{d_i − 1}(ℂ²)`; its infinitesimal weights are the
`w + (d_i − 1)/2 − r`, for `w` a weight of `π_i` and `0 ≤ r < d_i` (CT20 §5.1, (5.1.1); Tai17 §4.1.2).
The standard `L`-function of `ψ` is `L(s, ψ) = ∏_i ∏_{r=0}^{d_i − 1} L(s + (d_i − 1)/2 − r, π_i)`, and its
completion uses the gamma factor of `ψ_ℝ`.

- `Σ rank(π_i) d_i = m_G`, the dimension of the dual standard representation.
- `ψ_ℝ` is a representation of `W_ℝ × SL₂(ℂ)` whose standard representation is
  `⊕ U_i ⊗ Sym^{d_i − 1}`.
- The infinitesimal character of `ψ` is the displayed multiset of shifted weights, with
  multiplicity.
- `ψ` is an element of ModularityAndLanglandsExtensions §3.8's `Ψ₂(G)` whose constituents are
  level one, and conversely every such element is of this form.

*Needs:* §§1.1, 1.3, 1.8; ModularityAndLanglandsExtensions §3.8.

**Checks.**

- `Δ₁₇[8] ⊕ [9] ⊕ [7] ⊕ [1]` contains the trivial class with `d = 9, 7, 1`; it is valid, while repeating
  an identical pair `(π, d)` is not. Its dimension is `16 + 9 + 7 + 1 = 33 = 2·16 + 1`.
- `Δ₁₁[12] ⊕ [25]` has dimension `24 + 25 = 49`, so it is a parameter for `Sp₄₈`.
- `Δ₁₁[1]` is not allowed in a parameter of a symplectic group (symplectic class with odd `d`), while
  `Δ₁₁[2]` is.

### 3.2 The component group and the epsilon character

For `ψ ∈ Ψ₁(Sp_{2g})` with `n_i = rank(π_i)`, let `I_even = {i : n_id_i even}` and
`I_odd = {i : n_id_i odd}`. Define `C_ψ` as the subgroup of `{±1}^I` of elements `(s_i)` with
`∏ s_i^{n_id_i} = 1`; it is generated by the `s_i` (`i ∈ I_even`) and the `s_is_j` (`i, j ∈ I_odd`), and has
order `2^{|I| − 1}`. Put `E_i = ∏_{j ≠ i} ε(π_i × π_j)^{min(d_i, d_j)}` and define `ε_ψ(s_i) = E_i`,
`ε_ψ(s_is_j) = E_iE_j` (CT20 §5.1, (5.1.2)–(5.1.4)). Prove that this is the component group and epsilon
character of ModularityAndLanglandsExtensions §3.8.

- `C_ψ` is the group of signs with `∏ s_i^{n_id_i} = 1`, independent of the choice of a distinguished
  odd index.
- `ε_ψ` is a character of `C_ψ` determined by its values on the generators.
- Only pairs of opposite type can contribute a sign `−1` to `E_i`, by §1.8.

*Needs:* §§1.8, 3.1; ModularityAndLanglandsExtensions §3.8.

**Checks.**

- For `ψ = [2g + 1]`, `C_ψ` is trivial.
- For three odd-dimensional blocks, `C_ψ` has four elements and `(s₁s₂)(s₂s₃) = s₁s₃`.
- For `ψ = Δ_w[2] ⊕ [1]` in `Sp₄`, `ε_ψ(s₁) = ε(Δ_w) = i^{w+1}`: dropping the even generator would lose
  this sign.

### 3.3 The multiplicity test at level one

Prove: for `ψ ∈ Ψ₁(Sp_{2g})` and an irreducible unitary `(𝔤, K)`-module `ρ` occurring with
multiplicity one in the real Arthur packet of `ψ` (fixed Whittaker datum), the multiplicity in the
level-one discrete spectrum of the representation `ρ ⊗ (spherical finite part)` is `1` if
`χ_ρ|_{C_ψ} = ε_ψ` and `0` otherwise (CT20 §5.1, (5.1.4); Tai17 §4.1.2). The finite input is that at
each prime `p` the local packet of `ψ_p`, for a Whittaker datum compatible with the hyperspecial
subgroup `Sp_{2g}(ℤ_p)`, contains exactly one member with a nonzero `Sp_{2g}(ℤ_p)`-fixed vector, and
that member has trivial packet character (Tai17 Lemma 4.1.1, p. 305); the whole local packet need not
be a singleton. Local multiplicity one is used only in the holomorphic cases of §§3.5 and 3.8.

*Needs:* §3.2; ModularityAndLanglandsExtensions §§3.15 and 3.17 with its standing premises.

**Checks.**

- The spherical member and the whole packet differ: for `Sp₂ = SL₂` and the unramified tempered
  parameter sending Frobenius to `diag(−1, −1, 1) ∈ SO₃`, the centralizer is `S(O₂ × O₁) ≅ O₂` with
  component group `ℤ/2`, so the `p`-adic packet has two members, of which exactly one is
  `SL₂(ℤ_p)`-spherical; the other is spherical for the other conjugacy class of hyperspecial
  subgroups. A test that required the whole packet to be a singleton would misread this parameter.
- For trivial `C_ψ` the test is automatic.
- For `ψ = Δ_w[2] ⊕ [1]` in `Sp₄` and `ρ` the holomorphic module of weight `k = (w + 3)/2`, the test
  reads `−1 = (−1)^{k−1}` and holds exactly for even `k`: the level-one Saito–Kurokawa lifts.
- Changing the Whittaker datum changes the packet pairing by a character trivial on `C_ψ`, so the
  test is unchanged.

### 3.4 Holomorphic lowest-weight modules

For dominant `k = (k₁ ≥ ⋯ ≥ k_g ≥ 0)` let `ρ_k` be the unitary lowest-weight module of `Sp_{2g}(ℝ)` of
AutomorphicFormsOnReductiveGroups (with the extension requested there): it exists exactly when
`k_g ≥ g − u − v/2`, where `u = #{i : k_i = k_g}` and `v = #{i : k_i = k_g + 1}`; it is unique; its
infinitesimal character has eigenvalues `0, ±(k_i − i)`. With `a_i = k_i − i`, prove that this
character is regular exactly when `a_i ≠ 0` for all `i` and `a_i + a_j ≠ 0` for `i < j`; the
holomorphic discrete series range is the separate condition `k_g > g` (CT20 §5.2 and footnote 15).

- Existence is decided by the displayed inequality before the symbol `ρ_k` is used.
- Regularity of the infinitesimal character is the stated condition on the `a_i`.
- For `k_g > g`, `ρ_k` is a holomorphic discrete series and the infinitesimal character is regular.

*Needs:* AutomorphicFormsOnReductiveGroups §§6.7–6.8 with the extension requested there;
ModularityAndLanglandsExtensions §3.22.

**Checks.**

- `g = 1`, `k = 0`: the eigenvalues `0, ±1` are distinct, so the character is regular, yet `k > g`
  fails and `ρ₀` is the trivial representation, not a discrete series.
- `g = 2`, `k = (1, 1)`: `u = 2`, `v = 0`, and `1 ≥ 2 − 2` holds, so `ρ_{(1,1)}` exists; its
  eigenvalues `0, ±0, ±(−1)` are not regular.
- Dominance alone does not give unitarity: for `g = 3` and `k = (1, 0, 0)`, `u = 2`, `v = 1`, and
  `0 ≥ 3 − 2 − 1/2` fails, so `ρ_{(1,0,0)}` does not exist.

### 3.5 The regular holomorphic packet

Let `k_g > g` and let `ψ ∈ Ψ₁(Sp_{2g})` have infinitesimal weights `0, ±(k_i − i)`. The criterion that
`ρ_k` lies in the real packet of `ψ` exactly when `d_{i₀} = 1`, with multiplicity one, is
ModularityAndLanglandsExtensions §3.21 (its form of CT20 (5.2.1)), read on level-one parameters.
Prove its level-one consequences: every `π_i` is regular, `I_odd = {i₀}`, and every `i ∈ I_even` has
`n_id_i ≡ 0 mod 4`; and compute the packet character explicitly as `χ(s_i) = (−1)^{n_id_i/4}` for
even `d_i` and `χ(s_i) = (−1)^{e_i}` for odd `d_i`, where `e_i` counts the odd `j ∈ {1, …, g}` with `k_j − j`
a weight of `π_i` (CT20 §5.2.1, (5.2.1)).

*Needs:* §§3.2, 3.4; ModularityAndLanglandsExtensions §3.21.

**Checks.**

- `ψ = Δ_w[2] ⊕ [1]`, `g = 2`: `I_odd` is the `[1]` block with `d = 1`, and `χ(s₁) = (−1)^{4/4} = −1`.
- The equivalence with `d_{i₀} = 1` is two-sided: a regular parameter with `d_{i₀} = 3` does not contain
  `ρ_k`.
- Counting the even positions `j` instead of the odd ones gives the same parity: for odd `d_i`,
  `n_id_i ≡ 0 mod 4` forces `n_i ≡ 0 mod 4`, so `π_i` has an even number `n_i/2` of positive weights,
  each equal to exactly one `k_j − j`.

### 3.6 The bounded scalar constituent condition

For `k ≥ 1` and `π ∈ Π_alg` say that `π` satisfies `(R_k)` when every weight is at most `k − 1`, every
nonzero weight has multiplicity one, the multiplicity `r(π)` of the weight `0` is at most three, and
each of `1` and `e` occurs at most twice in `L(π∞)` (CT20 §5.2, condition (R)).

- `r(π)` is the sum of the coefficients of `1` and `e` in `L(π∞)`, and is at most `3`.
- Each coefficient of an `I_w` is `0` or `1`.
- `(R_k)` implies `(R_{k+1})`.

*Needs:* §§1.2, 1.6.

**Checks.**

- `U = 1 + e + I₂` has simple nonzero weights and a double zero, and satisfies `(R_k)` for `k ≥ 2`.
- `U = 3·1` has `r = 3` but violates the bound on the multiplicity of `1`.
- `2I₁` violates `(R_k)` for every `k`.

### 3.7 The scalar cases I, H1 and H2

Let `g ≥ k ≥ 1` and let `ψ` have infinitesimal weights `0, ±(k − i)`, `1 ≤ i ≤ g`. Let
`I₀ = {i : 0 is a weight of π_i}`, `r_i` the multiplicity of `0` in `π_i`, and `d_max = max_{I₀} d_i`.
Define (CT20 §5.2.2): case (I) when `I₀ = {i₀}`, `r_{i₀} = d_{i₀} = 1`, `k − 1 > g − k`, and the shifted
positive weights fill `[k − g, k − 1]` exactly once; case (H1) when some `i₀ ∈ I₀` has
`d_{i₀} = d_max = 2(g − k) + 1` and `L(π_{i₀},∞)` contains `e^k`; case (H2) when some `i₀ ∈ I₀` has
`d_{i₀} = d_max = 2(g − k) + 3` and `L(π_{i₀},∞)` contains `e^{k−1}`. Put `k′ = k` in (H1) and `k′ = k − 1` in
(H2). These are predicates on an Arthur parameter, with `i₀` a witness.

- In case (I) the unique zero-weight block has `r = d = 1`.
- In case (H), `ψ_ℝ` contains `e^{k′}[2(g − k′) + 1]`.
- Case (H2) implies `k′ ≥ 2`, `g ≤ 2k′` and `i₀ ∈ I_odd`.

*Needs:* §§3.1, 3.6.

**Checks.**

- A trivial block `[2(g − k) + 1]` satisfies the (H1) condition `e^k ⊂ L(1∞) = 1` exactly when `k` is even.
- A trivial long block satisfies the (H2) condition `e^{k−1} ⊂ 1` exactly when `k` is odd.
- Using the length `2(g − k) + 1` for an (H2) long block misses the defining length by two.

### 3.8 Scalar packet membership

Prove: for `g ≥ k ≥ 1` and `ψ ∈ Ψ₁(Sp_{2g})` with the scalar infinitesimal character of §3.7, the module
`ρ_k^{(g)}` lies in the real packet of `ψ` exactly when case (I) or case (H) holds, and then with
multiplicity one; in case (I) every `π_i` is regular and `I₀ = I_odd = {i₀}` (CT20 §5.2.2, from the
Mœglin–Renard theorem). This is the specialization of ModularityAndLanglandsExtensions §3.22 to
level-one parameters.

*Needs:* §§3.4, 3.7; ModularityAndLanglandsExtensions §3.22.

**Checks.**

- `g = k = 12`, `ψ = Δ₁₁[12] ⊕ [1]`: the shifted weights of `Δ₁₁[12]` are `11, 10, …, 0` and
  `0, −1, …, −11`, which with the `[1]` block give `0, ±(12 − i)`; `I₀` is the `[1]` block with
  `r = d = 1`, `k − 1 = 11 > 0 = g − k`, and `11, …, 0` fill `[0, 11]` once, so case (I) holds and
  `ρ₁₂^{(12)}` lies in the packet.
- Necessity, sufficiency and multiplicity one are proved together; no general multiplicity-one
  statement for Arthur packets is used.
- Infinitesimal character alone does not decide membership: ModularityAndLanglandsExtensions §3.22's third Check gives a parameter
  with the infinitesimal character of `ρ₁^{(2)}` whose packet does not contain it.

### 3.9 The packet character in case (I)

Prove: in case (I), for `i ∈ I_even` and a sign `s`, let `e_s(π_i)` be the number of `1 ≤ j ≤ k − 1` with
`(−1)^j = s` and `k − j` a weight of `π_i`. For either `δ = ±1`, `χ(s_i) = (−1)^{n_id_i/4}` when `d_i` is even
and `(−1)^{e_δ(π_i)}` when `d_i` is odd; the value does not depend on `δ` because
`e₁ + e_{−1} = n_i/2` is even for odd `d_i` (CT20 §5.2.2, (5.2.2)–(5.2.3)). The proof uses the sign
identity `(−1)^{⌊εa/2⌋} = ∏_{j=1}^{a} (−1)^{j−1}ε` for `ε = ±1` and `a ≥ 1`.

*Needs:* §§3.2, 3.8.

**Checks.**

- The sign identity at `ε = −1`, `a = 1`: `(−1)^{⌊−1/2⌋} = (−1)^{−1} = −1 = (−1)^0 · (−1)`.
- At `ε = 1`, `a = 3`: `(−1)^{⌊3/2⌋} = −1` and `(+1)(−1)(+1) = −1`.
- For odd `d_i` and `n_i = 2`, `e₁ + e_{−1} = 1` would be odd; it does not occur because then `π_i` has
  `n_id_i ≡ 2 mod 4`, which case (I) excludes for `i ≠ i₀`.

### 3.10 The compact remainder in case (H)

Prove: in case (H), removing `e^{k′}[2(g − k′) + 1]` from `ψ_ℝ` leaves `ψ′` of dimension `2k′` and
determinant `e^{k′}`, an Adams–Johnson parameter for the compact group `SO(2k′)`; every `π_i` satisfies
`(R_k)`, every `π_i` with `i ≠ i₀` is regular, and the only nonregular possibilities are (H1) with
`n_{i₀} ≡ 2 mod 4`, a double zero and `e^k` twice, or (H1) with `n_{i₀}` odd, `d_{i₀} = 1`, `g = k`, a triple
zero and zero characters `2e^k + e^{k−1}`. In (H2), `π_{i₀}` is regular with a simple zero (CT20 §5.2.2 and
Remark 5.3).

*Needs:* §§3.6, 3.8; ModularityAndLanglandsExtensions §3.20.

**Checks.**

- The triple-zero exception needs `g = k` and `d_{i₀} = 1`; for `g > k` it does not occur.
- In (H1) one cannot replace `(R_k)` by full regularity: the double-zero branch is nonregular.
- `ψ′` is multiplicity free, which is what bounds every nonzero weight multiplicity by one.

### 3.11 The even generators in case (H)

Define `e_s(π)` in (H1) by positions in the list `(k − 1, k − 2, …, 1)`, and in (H2) by positions in the
same list with `g − k + 1` omitted, renumbered `1, …, k′ − 1`. Prove `r(π) + 2e₁(π) + 2e_{−1}(π) = n_π`, and
(CT20 §5.2.2, (5.2.5)–(5.2.8)): for `i ∈ I_even \ I₀`, `χ(s_i) = (−1)^{n_id_i/4}` for even `d_i` and
`(−1)^{e_δ(π_i)}` for odd `d_i`; for `i ∈ I₀ ∩ I_even`, `i ≠ i₀`, necessarily `d_i = 1`, `r_i = 2` and
`χ(s_i) = (−1)^{e_δ(π_i)} δ(−1)^{k′−1}`; if `i₀ ∈ I_even` then (H1) holds and `χ(s_{i₀}) = (−1)^{e_δ(π_{i₀})}`
times `δ(−1)^{k−1}` when `n_{i₀} ≡ 0 mod 4`, and times `1` otherwise.

*Needs:* §§3.2, 3.10.

**Checks.**

- In (H2) the parity is that of the position in the shortened list, not of the omitted weight itself.
- `r + 2e₁ + 2e_{−1} = n` holds for `π = 1` in (H1) with `k` even: `r = 1`, `e₁ = e_{−1} = 0`, `n = 1`.
- Every exponent is an integer in its branch: `n_id_i/4` appears only when `n_id_i ≡ 0 mod 4`.

### 3.12 The odd generators in case (H)

Prove (CT20 §5.2.2, (5.2.9)–(5.2.12)): if `I_odd` is a singleton there are no odd-pair generators;
otherwise `I_odd = {i₀, i₁, i₂}` with `d_{i₁} = 1` and `d_{i₂} = 2a − 1`, `a ≥ 1`. Let `P` be the condition
that `L(π_{i₀},∞) + L(π_{i₂},∞)` contains both `1` and `e`. Then
`χ(s_{i₁}s_{i₂}) = (−1)^{e_δ(π_{i₁}) + e_δ(π_{i₂}) + ⌊δ(−1)^{k′−a}a/2⌋}`, and `χ(s_{i₀}s_{i₂})` is
`(−1)^{e_δ(π_{i₀}) + e_δ(π_{i₂})}` times `δ(−1)^{k−1}` if `P` holds and times `(−1)^{k−k′}` otherwise.

*Needs:* §§3.2, 3.11.

**Checks.**

- The relation `(s_{i₀}s_{i₁}) = (s_{i₀}s_{i₂})(s_{i₁}s_{i₂})` determines the third generator's value.
- `P` concerns zero characters `1` and `e`, not the multiplicity of the zero weight: `U = 2·1` has a
  double zero and does not contain `e`.
- At `a = 1`, `⌊δ(−1)^{k′−1}/2⌋` is `0` for `δ(−1)^{k′−1} = 1` and `−1` otherwise.

### 3.13 Independence of choices

Prove: the formulas of §§3.9, 3.11 and 3.12 define the same character of `C_ψ` for `δ = 1` and `δ = −1`;
in (H) they do not depend on the admissible `i₀` or on the labelling of the other odd blocks; and at
`k = g`, where (I) and (H1) may both hold, they agree (CT20 §5.2.2 and Remark 5.4). Hence `χ = ε_ψ` is a
well-defined finite test.

*Needs:* §§3.9, 3.11, 3.12.

**Checks.**

- The nonregular (H1) even-block branch and the three-odd-block branch are both covered.
- At `k = g = 12`, `ψ = Δ₁₁[12] ⊕ [1]` satisfies both (I) and (H1) (`d_{i₀} = 1 = 2(g − k) + 1` and
  `e^{12} = 1` lies in `L(1∞)`); both formulas give `χ(s) = (−1)^{2·12/4} = 1` on the generator of the
  `Δ₁₁[12]` block, and `ε_ψ(s) = ε(Δ₁₁) = i¹² = 1`.
- Swapping `i₁` and `i₂` when both have `d = 1` leaves the value of `χ(s_{i₁}s_{i₂})` unchanged.

### 3.14 The level-one Euler–Poincaré characteristic

For a permitted `G` and dominant `λ`, let `A²` be the `K`-finite square-integrable automorphic forms on
`G(ℚ)\G(𝔸)` fixed by `G(Ẑ)`, with `K` the full maximal compact subgroup of `G(ℝ)`, and define
`EP(G; λ) = Σ_q (−1)^q dim H^q(𝔤, K; A² ⊗ V_λ^∨)` (CT20 §1.4, (1.4.1)). The space `A²` includes the
residual spectrum.

- `EP(G; λ) = Σ_π m_disc(π) EP(π∞ ⊗ V_λ^∨)`, a finite sum.
- In `SO_{4n}`, outer-conjugate `λ` have the same `EP`.
- If `λ` has nontrivial central character on `Z(G)(ℚ)`, `EP(G; λ) = 0`.

*Needs:* §1.3; AutomorphicSpectralTheory §§4.4–4.5 and 6.19; AutomorphicFormsOnReductiveGroups §2.2.

**Checks.**

- `EP(SO₃; 0) = 1`: there is no level-one class with parameter `I₁` (§5.3), and the trivial
  representation contributes `1`.
- `EP(SO₃; k) = −dim S_{2k+2}(SL₂(ℤ)) + δ_{k,0}`.
- Dropping the residual spectrum gives `EP(SO₃; 0) = 0`, which is wrong.

### 3.15 The packet contribution to the Euler–Poincaré characteristic

For algebraic `ψ` with infinitesimal character `λ + ρ` define
`EP_ψ(G; λ) = Σ_ρ m_disc(ψ, ρ) EP(ρ ⊗ V_λ^∨)` over the real packet, with the outer-orbit convention of
ModularityAndLanglandsExtensions in even `SO`. Prove that it equals
`|S_ψ|⁻¹ Σ_{s ∈ S_ψ} ε_ψ(s) Σ_ρ ⟨s, ρ⟩ EP(ρ ⊗ V_λ^∨)`, and evaluate the inner sum by the compact-torus
character identity with sign `(−1)^{q(G) − q(L₀)}` (Tai17 §4.1.2 and §4.2.2, Theorem 4.2.3 and Corollary
4.2.4). Nontempered parameters are included.

- Averaging against `ε_ψ` selects the packet members whose character equals `ε_ψ`.
- In `SO_{4n}` the contribution does not depend on the representative of an outer orbit.
- The value is an integer computed from finitely many signs, Weyl-group sums and cohomological
  degrees.

*Needs:* §3.3; ModularityAndLanglandsExtensions §§3.17, 3.20–3.21; AutomorphicSpectralTheory §6.19.

**Checks.**

- For trivial `S_ψ` the formula is the total packet Euler–Poincaré characteristic.
- A packet member whose character differs from `ε_ψ` contributes `0`, not `1/2`.
- In the `SO₃` base case the simple cuspidal contribution is `−N`.

### 3.16 Triangular recovery of self-dual cuspidal counts

Prove: for a permitted `G`, dominant `λ` and `w = w(λ)`, `EP(G; λ) = κ(G, λ) N⊥(w) + R(G, λ)`, where
`κ(G, λ) ≠ 0` is the signed cardinality of the real packet of a simple parameter `π[1]`, with Tai17's
outer convention in even `SO`, and `R(G, λ)` is the sum of the contributions of all nonsimple
parameters; `R(G, λ)` is determined by the `N⊥(v)` with `rank(v) < m_G` and largest weight at most `w₁`
(Tai17 §4.1.2; CT20 Key fact 2). A simple parameter has trivial component group and all its real
packet members are discrete series with Euler–Poincaré characteristic `(−1)^{q(G)}`; every block of a
nonsimple parameter has smaller rank, and the same class may occur with several `d`.

*Needs:* §§1.9, 3.14, 3.15.

**Checks.**

- `SO₃`: `κ = −1` and `R(SO₃; k) = δ_{k,0}`.
- The induction is on `m_G`, the dual standard dimension, not on the motivic weight.
- The nonsimple parameter `Δ₁₇[2] ⊕ Δ₁₇[4] ⊕ [1]` of `Sp₁₂` (dimension `4 + 8 + 1 = 13`) uses one
  class at two lengths; it is enumerated once with that class, not as two independent classes.

### Examples

For `Sp₄` and scalar weight `k ≥ 3`, the regular holomorphic parameters are `Δ_w[2] ⊕ [1]` with
`w = 2k − 3` and the parameters `Δ_{w₁,w₂} ⊕ [1]` with `w₁ = 2k − 2`, `w₂ = 2k − 4`; the first contributes
exactly when `k` is even. For `g = 1` a holomorphic parameter of weight `k` is a simple parameter of rank
three with weights `0, ±(k − 1)`, the adjoint `Sym²Δ_{k−1}` of an elliptic eigenform of weight `k`; at
`k = 12` it is `Sym²Δ₁₁`, the genus-one row of §7.9.

### Dependencies

ModularityAndLanglandsExtensions §§3.4, 3.8, 3.15, 3.17, 3.20–3.22 with its standing premises;
AutomorphicFormsOnReductiveGroups §§2.2, 6.7–6.8; AutomorphicSpectralTheory §§4.4–4.5, 6.19;
Layer 1.

## Layer 4: geometric torsion classes and exact mass recovery

Masses are defined from the normalized geometric side of the trace formula before any table of
values appears. They are signed rational coefficients of torsion conjugacy classes; characteristic
polynomials index them, the spinor obstruction removes impossible orthogonal indices, exact torsion
characters turn vanishings from Layer 2 into rational linear systems, and `SO₃` fixes the signs.
Coarse tables use no known cusp forms; they produce the 27 known classes, which in turn give the
refined `Sp₁₄`, `SO₁₆` and `SO₁₇` tables; `Sp₁₆` combines direct orbital integrals with a smaller linear
system. The order prevents any classification of Layer 5 from entering its own input.

### 4.1 Geometric torsion classes and masses

For a permitted `G` let `C(G)` be the finite set of `G(ℚ̄)`-conjugacy classes meeting the elements of
finite order of `G(ℚ)`. For `c ∈ C(G)` define the mass `m_c` by grouping the elliptic terms of the
`L²`-Lefschetz formula of AutomorphicSpectralTheory §6.20 whose rational classes lie in `c`: the
signed Euler–Poincaré centralizer volume times the finite adelic orbital integral of the
characteristic function of `G(Ẑ)`, with `vol(G(ℤ_p)) = 1` and the Euler–Poincaré measure at infinity
(CT20 §1.4, (1.4.3)–(1.4.5), and Remark 1.1). Then `T_ell(G; λ) = Σ_{c ∈ C(G)} m_c tr(c | V_λ)`.

- The grouped elliptic term equals `Σ_c m_c tr(c | V_λ)` for every dominant `λ`.
- `m_c` does not depend on the representative of `c`.
- If no element of `c` is conjugate under `G(𝔸_f)` into `G(Ẑ)`, or its real centralizer has no discrete
  series, then `m_c = 0`.
- `C(G)` is finite: characteristic polynomials of finite-order elements are products of cyclotomic
  polynomials of bounded degree.

*Needs:* §3.14; AutomorphicSpectralTheory §§6.9, 6.17 and 6.20.

**Checks.**

- The identity class of `SO₃` has mass `−1/12`: masses are signed, not probabilities.
- Two rational classes in one geometric class contribute to a single coefficient, not to two.
- A geometric torsion class with no integral representative at some prime has mass `0` (§4.7 gives
  such classes in `SO₃`: orders `4` and `6`).

### 4.2 Rationality of the masses

Prove that every `m_c` is rational (CT20 §1.4 after (1.4.5); Tai17 §3.2). The centralizer volumes are
products of rational local factors and special values of Artin `L`-functions of the Gross motive of the
centralizer at non-positive critical integers, which are rational. No sign or positivity is asserted.

*Needs:* §4.1; AutomorphicSpectralTheory §6.17 with the rationality requested there.

**Checks.**

- The normalization reproduces `m = −1/12` for the identity of `SO₃`, which equals `ζ(−1)`.
- The special values used are at non-positive integers: `ζ(−1) = −1/12` is rational while `ζ(2) = π²/6`
  is not, so a statement at positive integers would be false.
- Rationality says nothing about nonvanishing: the masses of `SO₃` at orders `4` and `6` are `0`.

### 4.3 The trace formula and the proper Levi terms

Prove `EP(G; λ) = T_geom(G; λ)`, where the elliptic part of `T_geom` is `T_ell` of §4.1 and every term
for a proper Levi subgroup `GL₁^a × GL₂^b × G′` is an explicit rational combination of the `T_ell(G′; λ′)`
for smaller `G′` and, when `b > 0`, of `T_ell(SO₃; λ″)`; the coefficients, Weyl-length signs and weight
shuffles are those of Tai17 Theorems 3.3.3–3.3.5, and Levi factors `GL_d` with `d ≥ 3` contribute zero
(CT20 (1.4.1)–(1.4.2); Tai17 §3.3.4).

*Needs:* §4.1; AutomorphicSpectralTheory §§6.19–6.20.

**Checks.**

- For `SO₃` the only proper Levi term is `+1/2`, independent of `λ`: `T_geom(SO₃; k) = T_ell(SO₃; k) + 1/2`.
- The recursion terminates because `G′` is strictly smaller and the `GL₂` terms reduce to `SO₃`.
- Omitting the residual spectrum on the spectral side breaks the identity at `λ = 0` for `SO₃`.

### 4.4 The finite set of polynomial indices

Define `P(G)` as the set of products `P = ∏_m Φ_m^{a_m}` of cyclotomic polynomials of degree `d_G`, with
`a_m ≥ 0` and `a₂` even (CT20 Definition 3.1). For `Sp_{2n}` and `SO_{2n}`, let `∼` identify `P` with
`P^−(X) = (−1)^{d_G} P(−X)`; for `SO_{2n+1}`, `∼` is equality. On indices, negation exchanges `1` and `2`,
exchanges odd `m > 1` with `2m`, and fixes `m ≡ 0 mod 4`.

- `P ∈ P(G)` exactly when it has degree `d_G`, is a product of cyclotomic polynomials, and has an even
  exponent of `Φ₂`; the constant term is then `(−1)^{d_G}`.
- `P ↦ P^−` is an involution of `P(G)`.
- `P(G)` is finite, since `φ(m) ≤ d_G` bounds the indices.

*Needs:* §§1.3, 1.9.

**Checks.**

- `P(Sp₂)/∼` has three elements: `{Φ₁², Φ₂²}`, `{Φ₃, Φ₆}` and `{Φ₄}`.
- `P(SO₃)` has five elements `Φ₁³, Φ₁Φ₂², Φ₁Φ₃, Φ₁Φ₄, Φ₁Φ₆`, not three: `−I` is not in odd `SO`, so no
  quotient is taken.
- A polynomial of degree `17` is not an index for `Sp₁₆`, whose `d_G = 16`; `m_G = 17` is the dual
  dimension.

### 4.5 Polynomial fibres

Prove (CT20 Lemmas 3.2–3.3, (3.1.1)–(3.1.2)): the characteristic polynomial map `C(G) → P(G)` has
fibres of size at most one, except for `SO_{2n}` and `P(1)P(−1) ≠ 0`, where the fibre has size `0` or `2`
and its two classes are exchanged by the outer automorphism and have equal masses; and
`m_{−c} = m_c` for `Sp_{2n}` and `SO_{4n}`. With `m_P` the common mass, `tr(P; λ)` the sum of
`tr(c | V_λ)` over the fibre and `e_P ∈ {1, 2}` the size of the orbit of `P` under `∼`,
`T_ell(G; λ) = Σ_{P ∈ P(G)/∼} e_P m_P tr(P; λ)` for `λ` trivial on the centre.

*Needs:* §§4.1, 4.4.

**Checks.**

- A two-class fibre is not halved: `tr(P; λ)` sums both traces with one common mass.
- `e_P` comes from central negation and is different from the even-`SO` fibre size.
- For `λ` nontrivial on the centre, `T_ell = EP = 0`.

### 4.6 The Zassenhaus formula

Import the Zassenhaus formula `zassenhaus_primary_formula` of SymplecticReidemeisterTorsionModSquares
§4.1: for a nondegenerate quadratic form `q` on a finite-dimensional space `V` over a field `k` of
characteristic different from `2` and `γ ∈ O(q)`, with `V₋ = ker(γ + 1)^{dim V}` and
`U = im(γ + 1)^{dim V}`, the spinor norm of `γ` is the class of `disc(q|V₋) · det((1 + γ)/2 | U)` in
`k^×/k^{×2}`. Prove its characteristic-polynomial form (CT20 Theorem 3.5 and Corollary 3.6): let
`γ ∈ SO(q)` have `charpoly(γ) = (X − 1)^a (X + 1)^{2b} Q` with `Q(1)Q(−1) ≠ 0`. Then `V₋ = ker(γ + 1)^{2b}`,
`U = ker(γ − 1)^a ⊕ ker Q(γ)`, `(1 + γ)/2` is unipotent on `ker(γ − 1)^a`, and
`det((1 + γ)/2 | ker Q(γ)) = 2^{−deg Q} (−1)^{deg Q} Q(−1)`; `deg Q` is even because the roots of `Q` come
in pairs `t, t⁻¹` with `t ≠ ±1`, so the spinor norm of `γ` is the class of `disc(q|ker(γ + 1)^{2b}) · Q(−1)`.
If `a = b = 0`, `disc(q)` is the class of `Q(1)Q(−1)`: `disc(q)` is the spinor norm of `−1`, the product
of the spinor norms of `γ` and `−γ`, whose `Q`-polynomials are `Q(X)` and `Q(−X)` as `dim V = deg Q` is
even. The spinor norm is Tau Ceti's `CliffordAlgebra.orthogonalSpinorNorm`, in which the supplier states
its formula; on the even-dimensional `V₋` the discriminants of the polar form and of the associated form
`B(x, x) = q(x)` differ by the square `2^{dim V₋}`, so the class `disc(q|V₋)` is the same for both.

*Needs:* SymplecticReidemeisterTorsionModSquares §4.1; Tau Ceti `CliffordAlgebra.orthogonalSpinorNorm`.

**Checks.**

- `γ = −1` on a plane: `b = 1`, `Q = 1`, and the spinor norm is `disc(q)`, the classical value of `sn(−1)`
  in dimension two.
- A rotation of order three in the Euclidean plane: `Q = Φ₃`, `Q(−1) = 1`, so the spinor norm is trivial,
  as it must be over `ℝ` for an element of the connected group.
- For `a = b = 0` the corollary gives `disc(q) = Q(1)Q(−1)`; for `q = x² + y²` and a rotation of order
  four, `Q = Φ₄`, `Q(1)Q(−1) = 4`, a square, and `disc = 1`.
- The translation on the same rotation of order four: `V₋ = 0`, `U = V`, `(1 + γ)/2` has determinant
  `(1 + 1)/4 = 1/2`, whose class is that of `2 = Φ₄(−1) = Q(−1)`; the factor `2^{−deg Q} = 1/4` is a
  square and `(−1)^{deg Q} = 1`. Forgetting the `(−1)^{deg Q}` would be harmless here but wrong if
  `deg Q` could be odd, which it cannot.

### 4.7 The spinor obstruction

Define `IsRegularIntegralForm c` for an integer matrix `c` (the form `x ↦ xᵀcx` is regular: `c + cᵀ` has
determinant `±1` in even rank and `±2` in odd rank) and `specialOrthogonalPoints c R`, the matrices of
determinant one over `R` preserving `x ↦ xᵀcx`, built on `Matrix.toQuadraticForm'`. Prove
`spinor_charpoly_obstruction` (CT20 Proposition 3.7): if `c` is regular, `P = (X − 1)^a (X + 1)^{2b} Q` with
`Q(1)Q(−1) ≠ 0`, and for every prime `p` some element of `specialOrthogonalPoints c ℤ_[p]` has
characteristic polynomial `P`, then `|Q(−1)|` is the square of an integer when `b = 0`, and `|Q(1)|` is the
square of an integer when `a = 0`. The route lifts each `γ_p` to `GSpin(q)(ℤ_p)`, so its spinor norm is a
unit class; §4.6 then gives even valuations.

- `IsRegularIntegralForm c` depends only on `c + cᵀ`, the Gram matrix of the polar form.
- For `R` a domain with `2 ≠ 0`, such as `ℤ_[p]`, `specialOrthogonalPoints c R` is a subgroup of
  `GL_n(R)`.
- `spinor_charpoly_obstruction` uses all primes, `p = 2` included.

*Needs:* §4.6; GeometryOfNumbersAndQuadraticArithmetic §2.4.2 for `p` odd and the unit property
requested there (gap:integral-spinor-norm-units) for `p = 2`; Mathlib `Matrix.toQuadraticForm'`,
`Matrix.charpoly`, `PadicInt`.

**Checks.**

- `SO₃` with `P = Φ₁Φ₆`: `b = 0` and `Q(−1) = Φ₆(−1) = 3` is not a square, so no element of order six has
  local integral points everywhere; its mass is `0`, as the `SO₃` table of §4.12 confirms.
- `P = Φ₁Φ₃`: `a = 1`, `b = 0`, `Q(−1) = Φ₃(−1) = 1`, a square; the obstruction is silent.
- The hyperbolic plane `c = [[0, 1], [0, 0]]` is regular (`det(c + cᵀ) = −1`). For
  `γ = diag(t, t⁻¹)` with `t ∈ ℤ_p^×` the polynomial is `X² − (t + t⁻¹)X + 1`, and
  `Q(−1) = (1 + t)²/t` and `Q(1) = −(1 − t)²/t` have even `p`-adic valuation: this is the local
  content of the statement at `p`.
- The odd-rank form `x₁x₃ + x₂²` (`det(c + cᵀ) = −2`) satisfies `IsRegularIntegralForm`, while
  `x₁² + x₂²` (`det(c + cᵀ) = 4`) does not.

### 4.8 The spinor-filtered index set

For orthogonal `G` define `P₁(G) ⊂ P(G)` as the set of `P = (X − 1)^a (X + 1)^{2b} Q`, `Q` a product of
`Φ_m` with `m ≥ 3`, such that `b > 0` or `Q(−1)` is a square, and `a > 0` or `Q(1)` is a square; put
`P₁(Sp_{2n}) = P(Sp_{2n})` (CT20 Definition 3.8 and Corollary 3.9). The values `Q(±1)` are positive
integers.

- `m_P ≠ 0` implies `P ∈ P₁(G)`.
- `P₁(G)` is stable under `∼`.
- For symplectic `G`, `P₁(G) = P(G)`.

*Needs:* §§4.4, 4.7.

**Checks.**

- `Φ₁Φ₃ ∈ P₁(SO₃)` and `Φ₁Φ₆ ∉ P₁(SO₃)`; `Φ₁Φ₄ ∉ P₁(SO₃)` since `Φ₄(−1) = 2`.
- Membership is necessary, not sufficient: six indices of `P₁(SO₁₃)` have mass `0` (§4.18).
- `Φ₁Φ₅ ∈ P₁(SO₅)`: `a = 1`, and `Q(−1) = Φ₅(−1) = 1` is a square, although `Q(1) = Φ₅(1) = 5` is
  not; the condition on `Q(1)` applies only when `a = 0`.

### 4.9 The sizes of the index sets

Prove (CT20 Tables 2–3): `|P(Sp_{2n})/∼| = 3, 12, 32, 92, 219, 530, 1158, 2521` for `n = 1, …, 8`; for
`SO_d` with `d = 3, 4, 5, 7, 8, 9, 11, 12, 13, 15, 16, 17`, `|P(SO_d)/∼| = 5, 12, 19, 59, 92, 165, 419, 530,
1001, 2257, 2521, 4877` and `|P₁(SO_d)/∼| = 3, 6, 12, 34, 40, 99, 244, 211, 598, 1339, 992, 2948`. The
count for `Sp₁₄` is `1158`; the printed value `1157` is inconsistent with the definition.

*Needs:* §§4.4, 4.8.

**Checks.**

- `|P(SO₄)/∼| = |P(Sp₄)/∼| = 12`: both are the degree-4 products with even `a₂` modulo negation.
- `|P₁(SO₃)| = 3`, matching the three nonzero masses of §4.12.
- The `Sp₁₄` count is `1158`, one more than the printed table, by direct enumeration of exponent
  vectors of degree 14 modulo negation.

### 4.10 Exact torsion characters

For an integral polynomial `P` of degree `d_G` let `e_j` be its elementary symmetric functions of the
roots (`e₀ = 1`, `e_j = 0` outside `[0, d_G]`), and for a nonnegative highest weight `λ` let `λ′` be the
conjugate partition and `l = λ₁`. Prove that the symplectic character at an element with characteristic
polynomial `P` is `det(e_{λ′_i − i + j} − e_{λ′_i − i − j})_{1 ≤ i, j ≤ l}`, that the character of the full
orthogonal group is `1` for `l = 0` and `(1/2) det(e_{λ′_i − i + j} + e_{λ′_i − i − j + 2})` otherwise, and
that for `SO_{2n}` with `λ_n > 0` the orthogonal value is `χ_λ + χ_{λ^θ}`, `θ` the outer automorphism
(KT87, as used in CT20 §§1.4 and 3.1). Deduce `tr(P; λ)` of §4.5 exactly, including at singular elements,
from the Weyl character formula of LieHighestWeight Layer 6.

- `e_j = (−1)^j` times the coefficient of `X^{d_G − j}` in `P`.
- The empty partition gives the value `1`.
- In `SO_{2n}`, `tr(P; λ)` is the orthogonal value multiplied by the fibre size of `P` and divided by the
  size of the outer orbit of `λ`.

*Needs:* §4.5; LieHighestWeight Layer 6; ClassicalGroups Layers 4–5.

**Checks.**

- `λ = (1)` gives `e₁`, the trace of the standard representation, in both formulas.
- `Sp₂`, `λ = (2)`: the determinant is `e₁² − e₂`; with eigenvalues `x, x⁻¹` it is
  `x² + 1 + x⁻²`, the character of `Sym²`. `SO₃`, `λ = (2)`: the value `e₁² − e₂ − 1` equals
  `x² + x + 1 + x⁻¹ + x⁻²`, and is `5` at `P = Φ₁³`.
- In `SO_{2n}`, for `λ_n > 0` and a one-class fibre the orthogonal value must be halved, and for `λ_n = 0`
  and a two-class fibre the trace sum must be doubled; ignoring either factor of two gives wrong rows.

### 4.11 Mass recovery from vanishing rows

Prove (CT20 §1.4 Strategy and §3.3, (P1′)–(P2′)): let `Λ` be a finite set of dominant weights of `G`
trivial on the centre, with `λ_n ≥ 0` in `SO_{2n}`, such that `N⊥(w(λ)) = 0` for every `λ ∈ Λ`. Suppose the
masses of all permitted groups of smaller dual dimension are known, and the matrix
`(e_P tr(P; λ))_{λ ∈ Λ, P ∈ P₁(G)/∼}` has rank `|P₁(G)/∼|`. Then by §§3.16 and 4.3 the masses solve a
rational system `A m = b` with known right-hand side, and they are its unique solution.

*Needs:* §§3.16, 4.3, 4.8, 4.10; Mathlib `Matrix.rank`.

**Checks.**

- Full row rank does not suffice when `|Λ| > |P₁(G)/∼|`; full column rank is the condition.
- A rational vector solving the system without the vanishing of every row of `Λ` does not determine the
  masses.
- For `SO₃`, `Λ` with three weights and the three columns of `P₁(SO₃)` already suffices (CT20 Table 4).

### 4.12 The SO₃ calibration

Prove (CT20 §1.4): the torsion classes of `SO₃` have orders `1, 2, 3, 4, 6`; at highest weights
`k = 0, …, 4` their traces form the matrix with rows `(1, 1, 1, 1, 1)`, `(3, −1, 0, 1, 2)`,
`(5, 1, −1, −1, 1)`, `(7, −1, 1, −1, −1)`, `(9, 1, 0, 1, −2)`, of determinant `288`, using
`tr = 2k + 1` at the identity and `sin((2k + 1)π/i)/sin(π/i)` at order `i > 1`. With the right-hand side
`T_ell = EP − 1/2 = (1/2, −1/2, −1/2, −1/2, −1/2)`, the unique solution is
`m = (−1/12, 1/4, 1/3, 0, 0)`. The resulting formula for `EP(SO₃; k) = −dim S_{2k+2}(SL₂(ℤ)) + δ_{k,0}`
agrees with `ModularForm.dimension_level_one`.

*Needs:* §§3.14, 4.3, 4.11; `ModularForm.dimension_level_one`, `CuspForm.discriminantEquiv`.

**Checks.**

- At `k = 0` and order `4` the trivial character is `1`; the misprinted denominator `sin(2π/i)` gives
  `sin(π/4)/sin(π/2) ≈ 0.707`.
- At `k = 5`: `dim S₁₂ = (2·5 + 1)/12 − (−1)⁵/4 − (−1)/3 − 1/2 = 1`.
- The identity mass is negative and the masses at orders `4` and `6` vanish, as §4.7 predicts.

### 4.13 Coarse mass tables

Prove (CT20 §3.3 and Table 4): using only §2.8 with `m = 1`, that is
`J_{F_ℓ}(U(λ)²) > A_{F_ℓ}` at some `ℓ ∈ (1/4)ℤ ∩ [1/2, 20]`, one obtains sets `Λ` satisfying §4.11 for
`Sp₂, …, Sp₁₂` and `SO₃, SO₄, SO₅, SO₇, SO₈, SO₉, SO₁₁, SO₁₂, SO₁₃, SO₁₅`, so all their masses are
determined, in increasing dual dimension. Each vanishing row is a case of §2.16; the rank conditions are
statements about explicit rational matrices.

*Needs:* §§2.8, 2.16, 4.11, 4.12.

**Checks.**

- No classification of Layer 5 and no known cusp form is used.
- For `SO₁₅`, `|P₁/∼| = 1339` columns and `1924` rows at `w = 35`.
- For `Sp₁₄` the coarse method gives only `974` rows at `w = 90`, fewer than `1158` columns; it does not
  determine the `Sp₁₄` masses.

### 4.14 The twenty-seven known classes

Prove: the coarse masses and §3.16 give the existence, with exact multiplicities, of 27 regular
self-dual classes of motivic weight at most 24: the 11 of §5.3, the 13 top-simple classes of weight 23
of §5.6, and the 3 regular self-dual classes of weight 24 of §5.10 (CT20 §3.3 and footnote 13). Grouped
by parameter and self-duality they form 26 blocks, since `I₂₃` carries two classes. This is an
existence statement; exhaustion is Layer 5.

*Needs:* §§1.7, 3.16, 4.13; §2.20 for the `PGL₂` classes.

**Checks.**

- `27 = 11 + 13 + 3`, and the number of blocks is `26`.
- `dim S₂₄(SL₂(ℤ)) = 2` while `S₂₃ = 0`.
- Collapsing `Δ₂₃^a` and `Δ₂₃^b` into one class changes the diagonal of every Gram matrix that uses them.

### 4.15 Refined mass tables

Prove (CT20 §3.3 and Theorem 6): using §2.17 with `δ = m = 1` and the known set of the 27 classes, one
obtains sets `Λ` of sizes `1274` (weights with `2w(λ)₁ ≤ 36`) for `Sp₁₄`, `1810` (`≤ 28`) for `SO₁₆` and
`3477` (`≤ 63`) for `SO₁₇`, whose matrices have full column ranks `1158`, `992` and `2948`. Hence all masses
of `SO_d`, `d ≤ 17` with discrete series, and of `Sp_{2n}`, `n ≤ 7`, are determined.

*Needs:* §§2.17, 4.11, 4.14.

**Checks.**

- The `Sp₁₄` matrix has `1158` columns.
- For `SO₁₇`, restricting to `2w(λ)₁ ≤ 61` gives `3461` rows without full column rank; the bound `63` is
  needed.
- The input classes come from §4.14, which uses only coarse masses.

### 4.16 Easy and hard indices of Sp₁₆

For `P ∈ P(Sp₁₆)` and a prime `p`, write `P = ∏_m ∏_{k ∈ S(p,m)} Φ_{mp^k}^{d(p,m,k)}` over `m` prime to `p`.
Call `P` easy when for every `p` and `m`, `|S(p, m)| ≤ 2`, and when `|S(p, m)| = 2` then `0 ∈ S(p, m)` for
odd `p`, and `0 ∈ S(p, m)` or `1 ∈ S(p, m)` for `p = 2` (CT20 §3.3). The hard indices are the others.

- `S(p, m)` records exactly the exponents `k` with a positive multiplicity of `Φ_{mp^k}`.
- Easy membership is decided by the three conditions.
- Easy and hard indices partition `P(Sp₁₆)` and are stable under `∼`; `|P(Sp₁₆)_hard/∼| = 766`.

*Needs:* §4.4.

**Checks.**

- A set `S(p, m)` with at most one element always satisfies the condition.
- At odd `p`, `S = {1, 2}` is hard.
- At `p = 2`, `S = {1, 3}` passes and `S = {2, 3}` fails.

### 4.17 The masses of Sp₁₆

Prove (CT20 Theorem 7 and §3.3): the masses `m_P` for easy `P` are given by Taïbi's direct computation of
the orbital integrals (Tai17 §3.2) with the normalized local measures; after subtracting their
contribution, a set `Λ` of `1086` weights with `2w(λ)₁ ≤ 36` satisfying (P1′) gives a full-column-rank
system on the `766` hard orbits, which determines the remaining masses. All `2521` masses of `Sp₁₆` are
thus determined.

*Needs:* §§4.2, 4.15, 4.16; AutomorphicSpectralTheory §6.9.

**Checks.**

- The counts `766` and `2521` use the same negation convention.
- Without the easy masses, the method of §4.15 over the weights with `2w(λ)₁ ≤ 116` gives only `1427`
  rows satisfying (P1′) against `2521` columns (CT20 §3.3), so it cannot determine the masses alone.
- Easiness is a sufficient condition for the orbital integrals to need no bilinear algebra over finite
  fields (no enumeration of isotropic subspaces or Wall invariants); a hard index is one outside the
  condition, not one for which such algebra is shown to be necessary.

### 4.18 The values of the masses

Prove that the masses of §§4.12–4.17 are the rational numbers listed in the tables accompanying CT20
Theorems 6–7; this identifies each listed value with the intrinsic mass through §4.11. Prove further,
for the groups of CT20 Theorem 6 (`SO_n` with `n ≤ 17` and `Sp_{2n}` with `2n ≤ 14`), that `m_P ≠ 0` for
every `P ∈ P₁(G)` except six indices for `SO₁₃` and six for `SO₁₇` (CT20 Remark 3.10). No nonvanishing
statement is made for `Sp₁₆`, whose `2521` masses are the values of §4.17.

*Needs:* §§4.11, 4.15, 4.17.

**Checks.**

- The `SO₃` row of the tables is `(−1/12, 1/4, 1/3)` on `P₁(SO₃)` = `{Φ₁³, Φ₁Φ₂², Φ₁Φ₃}`.
- Within the groups of CT20 Theorem 6 the number of exceptional zero masses is twelve in total, so `P₁`
  is almost sharp but not sharp there.
- The nonvanishing clause has the range of Theorem 6: `Sp₁₄` satisfies `2n = 14 ≤ 14` and is covered,
  while `Sp₁₆` fails `16 ≤ 14` and is not; reading the clause for every group of §§4.12–4.17 would claim
  a fact about `Sp₁₆` that the cited remark does not contain.
- A value table without the rank and vanishing statements of §4.11 does not determine the masses.

### Examples

For `SO₃` the recovered masses give
`dim S_{2k+2}(SL₂(ℤ)) = (2k + 1)/12 − (−1)^k/4 − χ₃(k)/3 − 1/2 + δ_{k,0}`, where `χ₃(k)` is `1, 0, −1` for
`k ≡ 0, 1, 2 mod 3`; at `k = 5` this is `1`. For `Sp₂` the three orbits of §4.4 carry the classes of orders
`1` or `2` (the centre), `3` or `6`, and `4`.

### Dependencies

AutomorphicSpectralTheory §§6.9, 6.17, 6.19–6.20; SymplecticReidemeisterTorsionModSquares §4.1;
OrthogonalSpinGroups Layer 1 and Tau Ceti's `CliffordAlgebra.orthogonalSpinorNorm`;
GeometryOfNumbersAndQuadraticArithmetic §2.4; LieHighestWeight Layer 6; ClassicalGroups Layers 4–5;
Mathlib's level-one dimension formula, characteristic polynomials and `p`-adic integers; Layers 1–3.

## Layer 5: cuspidal classifications through motivic weight twenty-four

A finite classification needs two separate things: a cover containing every possible archimedean
parameter, and an exclusion for every excluded point. Existence comes from §4.14 and the elliptic
dictionary of §2.20; exhaustion from Layer 2.

### 5.1 Covers and exclusions

Prove the interpretation theorem used by every classification below: let `D` be a set of effective
parameters in `K∞^{≤w}` cut out by parity and determinant conditions, `C ⊂ D` a finite set containing
every represented parameter of `D` with `J_{F_ℓ}(U²) ≤ c` (§2.18), and for each `U ∈ C` outside a
residual list `R` let a triple `(ℓ, S′, t)` satisfy §2.16 for the quadruple of §2.17 attached to
`(U, δ, m)` and the known set `S′`. Then every `π ∈ Π_alg` with `L(π∞) ∈ D` and `π ∉ S` has `L(π∞) ∈ R`,
under the stated `(δ, m)` hypothesis (CT20 §§2.4.3–2.4.5 and §§4.1–4.3). The finite verification is
ComputationalNumberTheory §5.1.

- Every represented parameter in the range lies in `C`.
- Each excluded `U` excludes exactly the `(U, δ, m)` hypothesis of its triple, for classes outside `S`.
- The residual list is `C` minus the excluded parameters; known classes are subtracted only when they
  are proved distinct.

*Needs:* §§2.16–2.18; ComputationalNumberTheory §5.1.

**Checks.**

- A cover that omits a parameter of `D` satisfying the bound is not a cover, whatever its exclusions.
- Replacing the two `I₂₃` classes by one changes the diagonal `A_F/m` of the Gram matrices that use them,
  and invalidates the corresponding triples.
- A cover at an enlarged bound `1.001c` is a cover at `c`; its cardinality is not the number of
  parameters at `c`.

### 5.2 Finiteness in bounded motivic weight

Prove: for each integer `0 ≤ w ≤ 23` there is `ℓ > 0` such that `B∞^{F_ℓ}` is positive definite on
`K∞^{≤w}`, hence the parameters of all `π ∈ Π_alg` of motivic weight at most `w` lie in an explicit finite
set and each fibre has bounded cardinality; the set of such `π` is finite (CT20 Remark 2.11 and §1.3;
CL14 IX Lemme 3.36). Positive definiteness on `K∞^{≤22}` and on `K∞^{≤23}` covers the two parities, and
restricts to smaller weights of the same parity.

*Needs:* §§2.8, 2.18.

**Checks.**

- Positive definiteness, not entrywise bounds, gives coercivity.
- The statement does not assert that each listed parameter is represented.
- Nothing is asserted in weight `24` or above.

### 5.3 The eleven classes of motivic weight at most 22

Prove (CL14 Théorème F; CT20 §1.3 and §2.4.6): exactly eleven elements of `Π_alg` have motivic weight
at most 22: the trivial representation; `Δ₁₁, Δ₁₅, Δ₁₇, Δ₁₉, Δ₂₁`; `Δ₁₉,₇, Δ₂₁,₅, Δ₂₁,₉, Δ₂₁,₁₃`; and
`Sym²Δ₁₁`. Each label is one isomorphism class and they are pairwise distinct. Existence: §§2.20 and
4.14. Exhaustion: a cover of weight at most 22 (§5.2), exclusions of every unlisted parameter by §2.17,
and, at each listed parameter, an exclusion of a further class (with `m = 2`, `δ = 0` for a putative
non-self-dual pair).

*Needs:* §§2.17, 2.20, 4.14, 5.1, 5.2.

**Checks.**

- In motivic weight below 11 only the trivial representation remains; CL14 (Introduction, after
  Théorème F) reads the cases of motivic weight `0` and `1` as automorphic counterparts of Minkowski's
  theorem and of the Abrashkin–Fontaine theorem.
- `Δ₂₁,₁₃` has weights `±21/2, ±13/2` and rank four; `Sym²Δ₁₁` has rank three and weights `−11, 0, 11`.
- Every witness is read with the coefficients `1/m`, not `1/√m`.

### 5.4 The weight-23 cover and its residual parameters

Prove (CT20 §4.1): at `ℓ = 487/50` the form `B∞^{F_ℓ}` is positive definite on `K∞^{≤23}`. Let `U₂` be the
effective `U ∈ K∞^{≤23}` containing `I₂₃` with `J_{F_ℓ}(U²) ≤ A_{F_ℓ}/2`, and `U₁` those with
`J_{F_ℓ}(U²) ≤ A_{F_ℓ}`. For every `U ∈ U₂` other than `U_exc = I₁ + I₇ + I₁₃ + I₁₇ + I₂₁ + 2I₂₃`, §2.17 with
`δ = 0`, `m = 2` and the known classes excludes a pair of further classes. For every `U ∈ U₁` outside an
explicit set of 187 parameters, §2.17 with `δ = m = 1` excludes a further self-dual class outside the
27 known classes. Six of the 187 are multiplicity free:
`I₃ + I₁₁ + I₁₇ + I₂₁ + I₂₃`, `I₇ + I₁₅ + I₂₁ + I₂₃`, `I₃ + I₉ + I₁₅ + I₂₁ + I₂₃`,
`I₁ + I₉ + I₁₇ + I₂₁ + I₂₃`, `I₅ + I₁₃ + I₁₇ + I₂₁ + I₂₃`, `I₅ + I₁₃ + I₁₉ + I₂₃`; by §§3.16 and 4.13 (the dual groups
are `SO₉` and `SO₁₁`), `N⊥` is `1` at the first
(the known `PGL₁₀` class) and `0` at the other five. The remaining set `V` has 181 elements, each with
`I₂₃` of multiplicity at least two, of dimension between 14 and 42, and containing `I_w` with multiplicity
one for some `w ∈ {1, 3, 5}`. The parameter `U_exc` is not among the 187 and hence not in `V`: the
`δ = m = 1` exclusion succeeds at `U_exc`, so no self-dual class outside the known ones has
archimedean parameter `U_exc`.

*Needs:* §§3.16, 4.13, 5.1, 5.2.

**Checks.**

- The 187 residual parameters belong to the one-class list `U₁`, not to `U₂`.
- The first multiplicity-free residual is the parameter of the known class `Δ₂₃,₂₁,₁₇,₁₁,₃`: the
  exclusions are of classes outside the known set, not of every class.
- `U_exc ∉ V`, although it has `I₂₃` twice, dimension `14` and the simple summand `I₁`: membership in
  `V` is failure of the `δ = m = 1` exclusion, not the shape of the parameter. Its dimension `14` is the
  lower end of the range `14 ≤ dim U ≤ 42` that the statement gives for `V` (CT20 Proposition 4.1, after
  its statement); that range is a bound, and no element of `V` is claimed to have dimension `14`.

### 5.5 The exceptional two-class parameter

Prove (CT20 Proposition 4.1(1)): among weight-23 parameters with `I₂₃` repeated, a fibre with at least
two classes can occur only at `U_exc`, and then it is `{π, π^∨}` with `π` non-self-dual. At `U_exc`,
`J_{F_ℓ}(U_exc²) > A_{F_ℓ}/3` for `ℓ = 487/50` gives at most two classes (§2.8). Since `U_exc ∉ V` (§5.4),
the `δ = m = 1` exclusion of §2.17 holds at `U_exc`: no self-dual class outside the 27 known ones has
parameter `U_exc`, and no known class has it either, the known classes of motivic weight 23 having
`I₂₃` with multiplicity one. A singleton fibre would be self-dual by §1.7, so the fibre is empty or
consists of two non-self-dual classes, which by §1.7 are each other's duals.

*Needs:* §§1.7, 2.8, 2.16, 2.17, 5.4.

**Checks.**

- `U_exc ∉ V`: the `δ = m = 1` exclusion succeeds at `U_exc`, and that is what rules out a self-dual
  singleton there; had `U_exc` been in `V`, a singleton `{π}` with `π` self-dual would be allowed.
- A mixed fibre (one self-dual, one not) is impossible because duality acts on the fibre and a
  non-self-dual class brings its dual.
- The bound `A_{F_ℓ}/3` alone gives `|T| ≤ 2` and nothing about self-duality: the `δ = 0`, `m = 2`
  exclusion fails at `U_exc` (it is the one element of `U₂` where it does), so the non-self-duality
  comes from the `δ = m = 1` exclusion, not from a two-class triple.

### 5.6 The thirteen top-simple classes of motivic weight 23

Prove (CT20 Theorem 3): exactly thirteen elements of `Π_alg` have motivic weight 23 with the weight
`23/2` of multiplicity one: the two `PGL₂` classes `Δ₂₃^a`, `Δ₂₃^b` from `S₂₄(SL₂(ℤ))`; three `PGL₄`
classes with weights `±23/2, ±v/2`, `v ∈ {7, 9, 13}`; seven `PGL₆` classes with weights
`±23/2, ±v/2, ±u/2` for `(v, u) ∈ {(13, 5), (15, 3), (15, 7), (17, 5), (17, 9), (19, 3), (19, 11)}`; and one
`PGL₁₀` class with weights `±23/2, ±21/2, ±17/2, ±11/2, ±3/2`. All are symplectic. The `PGL₄`, `PGL₆` and
`PGL₁₀` classes are determined by their weights; the two `PGL₂` classes are not.

*Needs:* §§4.14, 5.4, 5.5.

**Checks.**

- `2 + 3 + 7 + 1 = 13`.
- `Δ₂₃^a ≠ Δ₂₃^b` although their parameters are equal; "determined by the weights" fails for them.
- Every extra top-simple candidate is excluded because the residual set `V` consists of parameters with
  `I₂₃` repeated.

### 5.7 The repeated-top alternatives in weight 23

Prove (CT20 Proposition 4.1): let `U ∈ K∞^{≤23}` be effective with `I₂₃` of multiplicity at least two and
`T = {π ∈ Π_alg : L(π∞) = U}`. If `|T| ≥ 2`, then `U = U_exc` and `T` is a dual pair of non-self-dual
classes. If `T = {π}`, then `U ∈ V` and `π` is symplectic. In particular there are at most 183 such
classes, one at each of the 181 elements of `V` and two at `U_exc`; no existence is asserted. The simple
odd summand `I_w`, `w ≤ 5`, forces the symplectic type of a self-dual `π`.

*Needs:* §§1.8, 5.4, 5.5.

**Checks.**

- `|V| = 181` and `U_exc ∉ V`: the `182` parameters of `V ∪ {U_exc}` carry at most `181 + 2 = 183`
  classes, the possible dual pair at `U_exc` counting as two. Counting `U_exc` inside `V` would give
  `182` and would contradict `|T| = 1 ⇒ U ∈ V` together with the absence of a self-dual class at `U_exc`.
- A singleton fibre is self-dual by §1.7.
- The statement is a list of necessary alternatives; it does not produce any class.

### 5.8 The conditional restriction under GRH

Prove (CT20 Theorem 4 and §4.3): assume the generalized Riemann hypothesis of the Conventions. If
`π ∈ Π_alg` has motivic weight 23 and the weight `23/2` with multiplicity greater than one, then
`L(π∞) = I₁ + I₇ + I₁₁ + I₁₅ + I₁₉ + I₂₁ + 2I₂₃`, `π` has rank 16, and it is the only element of `Π_alg` with
these weights. Use `G_ℓ` in place of `F_ℓ`: first exclude the dual pair at `U_exc` with `δ = 0`, `m = 2`,
then every element of `V` with `δ = m = 1`.

*Needs:* §§2.2, 2.4, 2.17, 5.1, 5.7.

**Checks.**

- The flag for a dual pair is `δ = 0` with `m = 2`; `δ` takes only the values `0` and `1`.
- The hypothesis is part of the statement; no existence follows.
- The surviving parameter has `8` summands of dimension two, so rank `16`.

### 5.9 The rank bound in weight 24

Prove (CT20 Lemma 4.3): a self-dual regular `π ∈ Π_alg` of motivic weight 24 and rank `n ≥ 13` has
parameter one of `1 + I₆ + I₈ + I₁₄ + I₂₀ + I₂₂ + I₂₄`, `1 + I₆ + I₁₀ + I₁₆ + I₂₀ + I₂₂ + I₂₄`,
`I₂ + I₄ + I₁₂ + I₁₄ + I₁₈ + I₂₀ + I₂₂ + I₂₄`, `I₂ + I₈ + I₁₂ + I₁₄ + I₁₈ + I₂₀ + I₂₂ + I₂₄`, of ranks 13, 13, 16, 16; in
particular `n ≤ 16`. The proof enumerates the `1260` effective multiplicity-free parameters of determinant
one and epsilon one with top `I₂₄` and rank above 12, and excludes `1256` of them by §2.17 with the 16 known
classes of rank at most four grouped into 15 blocks.

*Needs:* §§1.8, 4.14, 5.1.

**Checks.**

- The known set has 16 classes in 15 blocks, because `I₂₃` carries two classes.
- `ε(U) = 1` is forced by the orthogonal type of a regular self-dual class of even motivic weight.
- The four survivors are candidates only; §5.10 decides them by masses.

### 5.10 The three regular self-dual classes of motivic weight 24

Prove (CT20 Theorem 5 and §4.2): exactly three self-dual regular elements of `Π_alg` have motivic weight 24;
their weights are `{±12, ±8, ±4, 0}`, `{±12, ±9, ±5, ±2}` and `{±12, ±10, ±7, ±1}`, of ranks 7, 8, 8, and they
are orthogonal. By §5.9 the rank is at most 16; for every regular parameter of weight 24 and rank at most
16, `N⊥` is computed by §3.16 from the masses of `SO_d`, `d ≤ 16`, and `Sp_{2n}`, `n ≤ 7`.

*Needs:* §§3.16, 4.15, 5.9.

**Checks.**

- Odd ranks 11, 13, 15 require the dual groups `Sp₁₀`, `Sp₁₂`, `Sp₁₄`; masses only up to `Sp₈` do not
  suffice.
- The rank-7 class `O^odd(24,16,8)` has a zero weight; it corresponds to the group `Sp₆`.
- Nothing is asserted about non-self-dual or nonregular classes of weight 24.

### Examples

The list `L₂₄` of the 27 known classes (§4.14) is the full set of regular self-dual classes of motivic
weight at most 24 with top weight simple, by §§5.3, 5.6 and 5.10. In weight 23 the class
`Δ₂₃,₁₅,₇` has parameter `I₇ + I₁₅ + I₂₃`, and `Δ₂₃,₂₁,₁₇,₁₁,₃` has parameter `I₃ + I₁₁ + I₁₇ + I₂₁ + I₂₃`.

### Dependencies

Layers 2 and 4 (§§2.8, 2.16–2.18, 2.20, 3.16, 4.14–4.15); ComputationalNumberTheory §5.1;
ModularityAndLanglandsExtensions §3.4 through §1.8.

## Layer 6: Siegel forms at level one, lattice theta maps and first occurrence

The Siegel modular forms `M_k(Γ_g)` and `S_k(Γ_g)` are AutomorphicBundles' classical forms at level
`Sp_{2g}(ℤ)` with the Siegel coefficient of §11.16, compared with holomorphic functions on the Siegel
upper half-space through §11.9. This layer adds the level-one statements needed below and the theta
maps of even unimodular lattices. Every lattice statement here precedes, and is independent of, the
Siegel classification of Layer 7.

### 6.1 The Siegel operator and the standard L-function

Define `Φ_g : M_k(Γ_g) → M_{k′}(Γ_{g−1})`, `k′ = (k₁, …, k_{g−1})`, by `(Φ_g F)(τ′) = lim_{t → ∞} F(diag(τ′, it))`;
on Fourier expansions it keeps the coefficients at `diag(T′, 0)`. Prove: `Φ_g` is well defined and linear;
`ker Φ_g = S_k(Γ_g)` at level one; `Φ_g` commutes with the Hecke operators of AutomorphicBundles §12.11
through the Satake restriction; and if `F` is a scalar Hecke eigenform of weight `k` with `Φ_g F ≠ 0`,
then `Φ_g F` is an eigenform and `L(s, F, St) = L(s, Φ_g F, St) ζ(s − (g − k)) ζ(s + (g − k))` (the
Zharkovskaya relation, CT20 §5.3 footnote 17).

- On Fourier coefficients, `a(Φ_g F, T′) = a(F, diag(T′, 0))`.
- `ker Φ_g = S_k(Γ_g)`, and `Φ_g` of a cusp form is `0`.
- For an eigenform with `Φ_g F ≠ 0`, the standard `L`-function relation above holds.

*Needs:* AutomorphicBundles §§11.1–11.2, 11.9, 11.16, 12.10, 12.11 and 12.15.

**Checks.**

- `Φ₁ : M_k(SL₂(ℤ)) → M_k(Γ₀) = ℂ` is the constant term; its kernel is `S_k(SL₂(ℤ))`.
- At `g = k` the two zeta factors coincide: `L(s, F, St) = L(s, ΦF, St) ζ(s)²`.
- `Φ` of the genus-`g` Eisenstein series of weight `k` is the genus-`(g − 1)` one, and `Φ` of a constant
  of weight `0` is the same constant.

### 6.2 Boundary, vanishing and spanning theorems at level one

Prove the following statements, each attributed and located in CT20:

- Odd scalar weight: if `k` is odd and `g` is odd then `M_k(Γ_g) = 0`, since `−1 ∈ Γ_g` acts by `(−1)^{gk}`;
  if `k` is odd and `g` is even then `M_k(Γ_g) = S_k(Γ_g)`, since `Φ_g` lands in `M_k(Γ_{g−1}) = 0`.
- Negative scalar weight: `M_k(Γ_g) = 0` for `k < 0` and `g ≥ 1`.
- Wallach: if `k_g > g` every square-integrable form of weight `k` is cuspidal (AutomorphicSpectralTheory
  §4.10 through the adelic lift).
- Weissauer: if `g ≥ 2k ≥ 0`, every element of `M_k(Γ_g)` is square-integrable, `M_k(Γ_g) = L²_k(Γ_g)` (CT20
  §5.5, from Weissauer's Satz 3).
- Resnikoff and Freitag: `S_k(Γ_g) = 0` for `g > 2k` (CT20 (5.5.2)).
- Freitag: for `g > 2k`, `M_k(Γ_g)` is spanned by theta series of even unimodular lattices of rank `2k` when
  `k ≡ 0 mod 4`, and is `0` otherwise (CT20 (5.5.2)).

*Needs:* §6.1; AutomorphicSpectralTheory §4.10; AutomorphicFormsOnReductiveGroups §7.2a with the
extension requested there; §6.4 for the theta series in the last item.

**Checks.**

- `M₁₃(Γ₉) = 0` by odd genus and odd weight; `M₁₃(Γ₈) = S₁₃(Γ₈)`.
- `S₄(Γ₉) = 0` by Resnikoff–Freitag, while `M₄(Γ₉) ∋ θ₉[E₈] ≠ 0`.
- The strict inequality matters: `S₁₂(Γ₂₄)` need not vanish by this statement at `g = 2k = 24`; in fact
  §7.9 shows it is `0`, but `S₁₃(Γ₂₄) ≠ 0` with `g < 2k = 26`.

### 6.3 Lattice classes, algebraic modular forms and neighbours

For `n ≡ 0 mod 8` let `X_n` be the finite set of isometry classes of positive definite even unimodular
lattices of rank `n`, realized as `TauCeti.IntegralLattice` objects, and `ℂ[X_n]` the vector space with the
unweighted basis `[L]`. Identify the dual of `ℂ[X_n]` with level-one algebraic modular forms of the
orthogonal group of an even unimodular lattice of rank `n` with trivial coefficients, through
AutomorphicFormsOnReductiveGroups §§7.4–7.5, and define the Kneser `p`-neighbour operator
`T_p[L] = Σ [L′]` over the even unimodular `L′` that are `p`-neighbours of `L` in the sense of
IntegralLattices §4G (`[L : L ∩ L′] = [L′ : L ∩ L′] = p`), identified with the Hecke operator of the
characteristic function of the corresponding double coset (CL14 III and V §1). Import
`|X₈| = 1`, `|X₁₆| = 2` and `|X₂₄| = 24` from OrthogonalTamagawaAndLatticeMass §§4.1–4.2.

- `ℂ[X_n]` is dual to the level-one algebraic modular forms with trivial coefficients, and the basis is
  unweighted; the mass-weighted pairing is used only for the duality.
- `T_p` commutes with `T_q` and is self-adjoint for the mass-weighted inner product.
- `|X₈| = 1`, `|X₁₆| = 2`, `|X₂₄| = 24`.

*Needs:* AutomorphicFormsOnReductiveGroups §§7.4–7.5; OrthogonalTamagawaAndLatticeMass §§3.1, 4.1–4.2;
Completed/IntegralLattices Layer 1; IntegralLattices §4G.

**Checks.**

- On `ℂ[X₈]`, `T_p[E₈]` is the number of `p`-neighbours of `E₈` times `[E₈]`, the number of isotropic
  lines of the quadratic space `E₈/pE₈`; for `p = 2` it is `(2⁴ − 1)(2³ + 1) = 135`.
- The mass-weighted pairing on `ℂ[X₁₆]` has weights `1/|O(E₈ ⊕ E₈)|` and `1/|O(D₁₆⁺)|`, whose sum is the
  rank-16 mass of OrthogonalTamagawaAndLatticeMass §3.1.
- Dividing `[L]` by `|O(L)|` changes the basis but not the space; the theta map of §6.4 is defined on the
  unweighted basis.

### 6.4 The genus-g theta map

For a positive definite even unimodular `L` of rank `n = 2k` and `τ` in the Siegel upper half-space of genus
`g`, set `θ_g[L](τ) = Σ_{x ∈ L^g} exp(πi tr(Gram(x) τ))`, `Gram(x) = (x_i · x_j)`, and extend linearly to
`θ_g : ℂ[X_n] → M_k(Γ_g)`; `θ₀` sends every basis vector to `1` (CT20 (5.3.1); CL14 V §1). Prove convergence
and holomorphy, the transformation law under `Γ_g` (from Poisson summation on `L^g`, ThetaSeries Layer 1,
or from the theta kernel of MetaplecticAutomorphicForms §5.1), invariance under isometries, the relation
`Φ_g ∘ θ_g = θ_{g−1}`, and the Eichler commutation relations: `θ_g` intertwines `T_p` on `ℂ[X_n]` with an
explicit element of the spherical Hecke algebra of `Sp_{2g}`, and on unramified Satake parameters this is
MetaplecticAutomorphicForms §3.21 (CT20 §5.3.2; CL14 V and VII §1).

- `θ_g[L]` has Fourier coefficient at `T` equal to the number of `x ∈ L^g` with `Gram(x) = 2T`; its constant
  coefficient is `1`.
- `Φ_g θ_g = θ_{g−1}` for every `g ≥ 1`.
- `θ_g` maps simultaneous eigenvectors of the `T_p` to Hecke eigenforms or to `0`.
- `θ₁` agrees with the genus-one theta series of ThetaSeries Layer 5 through the rational-to-real lattice
  bridge.

*Needs:* §§6.1, 6.3; ThetaSeries Layers 1 and 5; MetaplecticAutomorphicForms §§3.21 and 5.1.

**Checks.**

- Every `θ_g[L]` has constant coefficient `1`.
- `θ₁[E₈] = E₄` (ThetaSeries Layer 8).
- Replacing `[L]` by `[L]/|O(L)|` gives constant coefficient `1/|O(L)|` and breaks `Φ θ_g = θ_{g−1}` on the
  unweighted basis.

### 6.5 First occurrence

For a nonzero simultaneous eigenvector `v ∈ ℂ[X_n]` define its degree `g₀(v)` as the least `g ≥ 0` with
`θ_g(v) ≠ 0` (CT20 §5.3.2; CL14 V §§1–2). Prove that `θ_n` is injective on `ℂ[X_n]`, so the degree exists;
that `θ_g(v) ≠ 0` for every `g ≥ g₀(v)`; and that `θ_{g₀}(v)` is a cusp form when `g₀ ≥ 1`.

- `θ_g(v) = 0` for `g < g₀` and `θ_{g₀}(v) ≠ 0`.
- `θ_g(v) ≠ 0` for all `g ≥ g₀`.
- If `g₀ ≥ 1`, `θ_{g₀}(v)` lies in `ker Φ_{g₀} = S_k(Γ_{g₀})`.

*Needs:* §§6.1, 6.4.

**Checks.**

- The eigenvector `[E₈]` has degree `0`, since `θ₀[E₈] = 1`.
- On `ℂ[X₁₆]`, `[E₈ ⊕ E₈] − [D₁₆⁺]` has degree `4`: their theta series agree in genus at most three and
  differ in genus four.
- Lifting `[E₈]` to genus eight does not change its degree.

### 6.6 Pluriharmonic coefficients

For `ν ≥ 0` let `H_{ν,g,n}` be the complex polynomials `p` on `n × g` matrices with `p(XA) = det(A)^ν p(X)` for
`A ∈ GL_g(ℂ)` and `Σ_r ∂²p/∂x_{ri}∂x_{rj} = 0` for all `i, j` (CT20 §5.4; CL14 V §4.1). Let `O_n` act by
`p ↦ p(a⁻¹X)`.

- Right multiplication by `A` acts through `det(A)^ν`, and `p` is homogeneous of degree `gν`.
- All mixed Laplacians vanish, not only the total Laplacian.
- `H_{1,g,n}` is `O_n`-isomorphic to the alternating `g`-forms on `ℂ^n`, and is `0` for `g > n`.

*Needs:* MetaplecticAutomorphicForms §3.1; LieHighestWeight Layer 6.

**Checks.**

- `H_{1,1,n}` is the space of linear forms, of dimension `n`.
- `H_{1,g,n} = 0` for `g > n`.
- For `p ≠ 0`, `p(tX) = t^{gν} p(X)`; the exponent `ν` alone is wrong for `g > 1`.

### 6.7 The harmonic theta map

Let `M_H(O_n)` be the level-one algebraic modular forms with coefficients `H = H_{ν,g,n}`, the
`O_n(ℝ)`-equivariant assignments `L ↦ p_L` on embedded even unimodular lattices; it is
`⊕_{[L] ∈ X_n} H^{O(L)}`. Define `θ_{ν,g,n}(p) = Σ_{[L]} |O(L)|⁻¹ Σ_{x ∈ L^g} p_L(x) exp(πi tr(Gram(x) τ))`, which on
the generator `[L, P]` supported at `L` with value `|O(L)|P` is the plain lattice sum (CT20 §5.4, (5.4.1);
CL14 V §4.1). Prove that for `ν ≥ 1` it lands in `S_{n/2+ν}(Γ_g)` and sends Hecke eigenvectors to eigenforms or
to `0`.

- `M_H(O_n) ≅ ⊕_{[L]} H^{O(L)}`.
- For `ν ≥ 1`, the image is cuspidal of weight `n/2 + ν`.
- A one-dimensional joint eigenspace maps to an eigenline or to `0`.

*Needs:* §§6.3, 6.4, 6.6; AutomorphicFormsOnReductiveGroups §7.4.

**Checks.**

- `n = 24`, `ν = 1` gives weight `13` in every genus.
- For `ν = 1` the coefficient vanishes on tuples of rank below `g`, which kills the boundary Fourier
  coefficients and gives cuspidality.
- `ν = 0` gives the plain theta map of §6.4, which is not cuspidal: `θ_g[E₈]` has constant term `1`.

### 6.8 The small-rank lattice eigenparameters and the low-genus Eichler basis

Prove (CL14 Théorème E, Table I.2 and Table C.5; CT20 §5.3.2): the `T_p` act on `ℂ[X₈]`, `ℂ[X₁₆]`, `ℂ[X₂₄]`
with `1`, `2`, `24` distinct joint eigenlines. Their standard parameters are `[7] ⊕ [1]` (degree `0`) in
rank 8; `[15] ⊕ [1]` (degree `0`) and `Δ₁₁[4] ⊕ [7] ⊕ [1]` (degree `4`) in rank 16; and in rank 24 the 24
parameters of the table below, with the stated degrees. The degree of an eigenvector with parameter `ψ′` is
the least `g₀` such that `[2k − 1 − 2g₀]` is a summand of `ψ′`, except `ψ′ = Δ₁₁[12]` with `g₀ = 12`. Prove
also the low-genus Eichler basis theorem: `θ_g : ℂ[X_{2k}] → M_k(Γ_g)` is surjective for `k = 4, 8, 12` and
`g ≤ k` (CL14 Introduction §3 and Théorème D, which covers `k = 12`, `g ≤ 23`).

| Degree `g₀` | Standard parameter in rank 24 |
|---:|---|
| 0 | `[23] ⊕ [1]` |
| 1 | `Sym²Δ₁₁ ⊕ [21]` |
| 2 | `Δ₂₁[2] ⊕ [1] ⊕ [19]` |
| 3 | `Δ₁₉[2] ⊕ Sym²Δ₁₁ ⊕ [17]` |
| 4 | `Δ₁₇[2] ⊕ Δ₂₁[2] ⊕ [1] ⊕ [15]`, `Δ₁₉[4] ⊕ [1] ⊕ [15]` |
| 5 | `Δ₁₅[2] ⊕ Δ₁₉[2] ⊕ Sym²Δ₁₁ ⊕ [13]`, `Δ₁₇[4] ⊕ Sym²Δ₁₁ ⊕ [13]` |
| 6 | `Δ₁₅[4] ⊕ Δ₂₁[2] ⊕ [1] ⊕ [11]`, `Δ₁₇[2] ⊕ Δ₂₁,₁₃[2] ⊕ [1] ⊕ [11]`, `Δ₁₇[6] ⊕ [1] ⊕ [11]` |
| 7 | `Δ₁₁[2] ⊕ Δ₁₅[2] ⊕ Δ₁₉[2] ⊕ Sym²Δ₁₁ ⊕ [9]`, `Δ₁₁[2] ⊕ Δ₁₇[4] ⊕ Sym²Δ₁₁ ⊕ [9]`, `Δ₁₅[6] ⊕ Sym²Δ₁₁ ⊕ [9]` |
| 8 | `Δ₁₁[4] ⊕ Δ₁₇[2] ⊕ Δ₂₁[2] ⊕ [1] ⊕ [7]`, `Δ₁₁[4] ⊕ Δ₁₉[4] ⊕ [1] ⊕ [7]`, `Δ₁₅[4] ⊕ Δ₂₁,₉[2] ⊕ [1] ⊕ [7]`, `Δ₁₅[8] ⊕ [1] ⊕ [7]` |
| 9 | `Δ₁₁[2] ⊕ Δ₁₅[2] ⊕ Δ₁₉,₇[2] ⊕ Sym²Δ₁₁ ⊕ [5]`, `Δ₁₁[6] ⊕ Δ₁₉[2] ⊕ Sym²Δ₁₁ ⊕ [5]` |
| 10 | `Δ₁₁[4] ⊕ Δ₁₇[2] ⊕ Δ₂₁,₅[2] ⊕ [1] ⊕ [3]`, `Δ₁₁[8] ⊕ Δ₂₁[2] ⊕ [1] ⊕ [3]` |
| 11 | `Δ₁₁[10] ⊕ Sym²Δ₁₁ ⊕ [1]` |
| 12 | `Δ₁₁[12]` |

- Each eigenspace is one-dimensional and each parameter has dimension equal to the rank.
- The degrees in rank 24 are distributed `(1, 1, 1, 1, 2, 2, 3, 3, 4, 2, 2, 1, 1)` over `g₀ = 0, …, 12`.
- The surjectivity holds in genus `g ≤ k` for `k = 4, 8, 12`.

*Needs:* §§5.3, 6.3–6.5; MetaplecticAutomorphicForms §3.21; AutomorphicFormsOnReductiveGroups §7.4;
ModularityAndLanglandsExtensions §3.8.

**Checks.**

- `Δ₁₁[4] ⊕ [7] ⊕ [1]` has dimension `8 + 7 + 1 = 16`; `Δ₁₁[4]` alone has dimension `8` and is not a
  rank-16 parameter.
- In rank 24 the degree rule gives `g₀ = 4` for `Δ₁₉[4] ⊕ [1] ⊕ [15]`, since `2k − 1 − 2g₀ = 23 − 8 = 15`
  (the summand `[1]` would give the larger `g₀ = 11`); the exception `Δ₁₁[12]` has no trivial summand.
- The cumulative counts `1, 2, 3, 4, 6, 8, 11, 14, 18, 20, 22, 23, 24` sum the distribution and reach `|X₂₄|`.

### 6.9 The Rallis relation

Prove: let `v ∈ ℂ[X_n]` be an eigenvector with standard parameter `ψ_G` and let `F = θ_g(v)` be nonzero and
square-integrable with parameter `ψ_F`. If `n > 2g + 1` then `ψ_G = ψ_F ⊕ [n − 2g − 1]`; if `n < 2g + 1` then
`ψ_F = ψ_G ⊕ [2g + 1 − n]`; for `n ≡ 0 mod 8` the case `n = 2g + 1` does not occur (CT20 §5.3.2 after (5.3.1),
with the actual genus `g` in place of the degree). The route matches unramified parameters through
MetaplecticAutomorphicForms §3.21 and identifies the parameter by strong multiplicity one for isobaric sums.
Since only unramified local components enter, the same relation holds for a nonzero square-integrable image
`θ_{ν,g,n}(v)` of an eigenvector under the harmonic theta map of §6.7 (CL14 VII §1).

*Needs:* §§3.1, 6.4, 6.5; MetaplecticAutomorphicForms §3.21; AutomorphicLFunctionsAndLocalFactors §AL.3.7.

**Checks.**

- `n = 8`, `v = [E₈]`, `g₀ = 0`, `g = 8`: `ψ_F = [7] ⊕ [1] ⊕ [9]` has dimension `17 = 2·8 + 1`; using `g₀` in
  place of `g` gives a block of negative length.
- Dimensions: `ψ_G` has dimension `n` and `ψ_F` dimension `2g + 1`.
- For `n = 24`, `g = 12` (`n < 2g + 1 = 25`) and `v` of parameter `Δ₁₁[12]`, `ψ_F = Δ₁₁[12] ⊕ [1]`.

### 6.10 Square-integrable lifts in higher genus

Prove (CT20 Lemma 5.7, from Rallis and Mœglin–Waldspurger): if `v` has degree `g₀`, `g > g₀` and
`g > n − 1 − g₀`, then `θ_g(v)` is square-integrable and `ψ_F = ψ_G ⊕ [2g − n + 1]`; it is not cuspidal, since
`g > g₀` gives `Φ θ_g(v) = θ_{g−1}(v) ≠ 0`.

*Needs:* §§6.1, 6.5, 6.9; MetaplecticAutomorphicForms §§3.10 and 6.14.

**Checks.**

- Both strict inequalities are needed; the added block uses `g`, not `g₀`.
- `v = [E₈]`, `g = 8`: `g > 0` and `g > 7`, so `θ₈[E₈]` is square-integrable with parameter
  `[7] ⊕ [1] ⊕ [9]`.
- `2g + 1 > g + g₀ + 1 > n` follows from the hypotheses, so the second branch of §6.9 applies.

### 6.11 Central values of two PGL₄ classes

Prove: the completed standard `L`-functions of `Δ₁₉,₇` and `Δ₂₁,₁₃` do not vanish at `s = 1/2` (CL14 IX
Proposition 3.38: for self-dual `π` of motivic weight at most 22, the order at `1/2` is `0` when `ε(π) = 1`
and `1` otherwise, and `ε(π) = −1` exactly for `Δ₁₇` and `Δ₂₁`).

*Needs:* §§2.6, 5.3.

**Checks.**

- `ε(Δ₁₉,₇) = ε(I₁₉)ε(I₇) = i²⁰ · i⁸ = 1` and `ε(Δ₂₁,₁₃) = i²² · i¹⁴ = 1`.
- `ε(Δ₁₇) = i¹⁸ = −1`, so `Λ(1/2, Δ₁₇) = 0`.
- The statement concerns the completed function; the Euler product does not converge at `s = 1/2`.

### 6.12 Böcherer's criterion in five cases

For a weight-13 cusp eigenform `F_g` of genus `g` with parameter as in §7.10, and
`(g, n, ν) ∈ {(8, 16, 5), (8, 24, 1), (12, 24, 1), (16, 24, 1), (24, 24, 1)}`, put
`Γ_g(s) = ∏_{i=0}^{g−1} Γ(s − i/2)`, `γ_g^k(s) = 4^{−gs} Γ_g(k + s − (g + 1)/2)/Γ_g(k + s)`,
`ω_g(s) = ζ(s) ∏_{i=1}^{g} ζ(2s − 2i)`, `C_g(s) = ∏_{i=0}^{g−1} (s + i/2)` and `C_g(s, ν) = ∏_{i=0}^{ν−1} C_g(−s − i)`,
each up to a nonzero constant. Then `F_g` lies in the image of `θ_{ν,g,n}` exactly when
`R(s) = γ_g^k(s) C_g(n/2 + s, ν) L(n/2 − g + 2s, F_g, St)/ω_g(n/2 + 2s)` has a finite nonzero value at `s = 0`
(BoechererNote p. 1; CT20 Proposition 5.12). This is the specialization of the criterion requested from
MetaplecticAutomorphicForms; the five cases are the ones used in §8.8.

*Needs:* §6.7; MetaplecticAutomorphicForms §6.14 with the criterion requested there.

**Checks.**

- The `L`-value is evaluated at `n/2 − g + 2s`: `0` for `(8, 16)`, `4` for `(8, 24)`, `0` for `(12, 24)`, `−4` for
  `(16, 24)` and `−12` for `(24, 24)`.
- `ω_g` is in the denominator: its zeros at `ζ(−2), ζ(−4), …` raise the order of `R`.
- Böcherer's gamma factor `γ_g^k` is not the archimedean factor of the standard `L`-function; the two must not
  be identified.

### Examples

`θ_g[E₈]` spans `M₄(Γ_g)` for every `g` (§8.1); it is cuspidal for no `g ≥ 1`. In rank 16 the difference
`θ_4[E₈ ⊕ E₈] − θ_4[D₁₆⁺]` spans `S₈(Γ₄)` and has parameter `Δ₁₁[4] ⊕ [1]` by §6.9 with `n = 16`, `g = 4`.

### Dependencies

AutomorphicBundles §§11.1–11.2, 11.9, 11.16, 12.10–12.11, 12.15; AutomorphicSpectralTheory §4.10;
AutomorphicFormsOnReductiveGroups §§7.2a, 7.4–7.5; MetaplecticAutomorphicForms §§3.1, 3.10, 3.21, 5.1, 6.14;
OrthogonalTamagawaAndLatticeMass §§3.1, 4.1–4.2; ThetaSeries Layers 1, 5, 8; Completed/IntegralLattices
Layer 1; IntegralLattices §4G; AutomorphicLFunctionsAndLocalFactors §AL.3.7; Layers 3 and 5.

## Layer 7: Siegel cusp dimensions and the four weight-thirteen forms

Siegel eigenforms are counted through their standard parameters: each realized parameter contributes
one eigenline, decided by the sign test of §3.3 with the characters of §§3.5 and 3.9–3.13. In the
regular range the count is a finite computation from the self-dual counts of Layer 4; in low weight it
uses the classification of Layer 5; in the singular scalar range it uses the lattice results of Layer 6,
which do not depend on this layer.

### 7.1 Siegel eigenlines and the discrete spectrum

Prove: for dominant `k` with `ρ_k` existing (§3.4), `dim L²_k(Γ_g)` equals the number of discrete automorphic
representations of `Sp_{2g}` unramified at every prime with archimedean component `ρ_k`, counted with
multiplicity, and `dim S_k(Γ_g)` the number of cuspidal ones (AutomorphicFormsOnReductiveGroups §7.2a with
the extension requested there). In the range `k_g > g` and in the scalar case, every realized level-one
parameter contributes exactly one eigenline, by §§3.3, 3.5 and 3.8, and Hecke eigenforms with the same
eigenvalues are proportional. For `k_g > g`, `L²_k = S_k` (§6.2, Wallach); for odd scalar `k`,
`M_k = S_k` (§6.2) (CT20 §5.2 and §5.3).

- `dim S_k(Γ_g) = Σ_ψ m(ψ)` over level-one parameters whose packet contains `ρ_k` and whose
  representation is cuspidal, with `m(ψ) ∈ {0, 1}` given by §3.3.
- Equal standard parameters imply proportional eigenforms.
- For `k_g > g` no residual eigenline has to be subtracted.

*Needs:* §§3.3–3.5, 3.8, 6.1–6.2; AutomorphicFormsOnReductiveGroups §7.2a.

**Checks.**

- `g = 1`: the formula is the level-one dimension formula of Mathlib, through the parameters `Sym²Δ_{k−1}`
  of the Layer 3 Examples.
- For scalar `k ≤ g` a realized parameter can be residual: `ψ = [2(g − k) + 1] ⊕ ψ′` with a trivial long
  block, as in §7.6.
- The two classes `Δ₂₃^a`, `Δ₂₃^b` give two different parameters wherever they occur, and contribute
  separately.

### 7.2 The regular dimension formula

Prove: for `g ≥ 1` and dominant `k` with `k_g > g`, `dim S_k(Γ_g)` equals the number of `ψ ∈ Ψ₁(Sp_{2g})` with
infinitesimal weights `0, ±(k_i − i)`, `d_{i₀} = 1` for the odd block, and `χ_{ρ_k} = ε_ψ` on `C_ψ` (§3.5),
where the blocks run over self-dual regular classes of rank at most `2g + 1` and largest weight at most
`k₁ − 1`, counted with their numbers `N⊥` of §1.7 and with the equality pattern of classes across
different `d` (CT20 Key fact 1 and §5.2.1). Root numbers at level one depend only on infinity types, so
the multiplicity factor of each assignment is exact.

- Every parameter for the weight `k` belongs to the finite list of block assignments with these bounds.
- A candidate contributes `1` exactly when the packet contains `ρ_k` and `χ = ε_ψ`.
- The resulting finite sum equals `dim S_k(Γ_g)`.

*Needs:* §§1.7, 3.5, 3.16, 7.1.

**Checks.**

- At `g = 1` the formula counts the classes `π` of rank three with weights `0, ±(k − 1)`, recovering
  `dim S_k(SL₂(ℤ))`.
- At `g = 2` and scalar `k = 10`, the parameter `Δ₁₇[2] ⊕ [1]` passes (`k` even) and contributes the
  Saito–Kurokawa line; at `k = 11` no parameter passes and `S₁₁(Γ₂) = 0`.
- Treating `Δ₂₃^a` and `Δ₂₃^b` as one class undercounts the candidates, even where both are then rejected.

### 7.3 Dimensions in genus at most eight

Prove (CT20 Theorem 1, with Theorems 6–7): for every `1 ≤ g ≤ 8` and every dominant `k` with `k_g > g`,
`dim S_k(Γ_g)` is given by §7.2 with all `N⊥` computed by §3.16 from the masses of `SO_d`, `d ≤ 17`, and
`Sp_{2n}`, `n ≤ 8`. The rank recursion needs only groups of dual dimension at most `2g + 1 ≤ 17`, all of whose
masses are known by §§4.13–4.17; there is no bound on `k₁`.

*Needs:* §§3.16, 4.13–4.17, 7.2.

**Checks.**

- `g = 8` needs the `Sp₁₆` masses of §4.17 in the recursion.
- The statement is for every `k₁`, not for a finite sample of weights.
- `g = 9` is not covered: the recursion would need masses of groups of dual dimension `19`, such as
  `Sp₁₈`, which §4 does not determine.

### 7.4 The regular enumeration in weight at most 13

Prove (CT20 §5.3.1): for `13 ≥ k₁ ≥ ⋯ ≥ k_g > g ≥ 1`, every block of a contributing parameter lies in `L₂₄`,
the 27 classes of the Layer 5 Examples; counting the two `Δ₂₃` classes separately there are `223` candidate
parameters in positive genus, of which `58` pass §3.3; identifying the two `Δ₂₃` classes there are `198`
shapes with the same `58` passing, and with genus zero `199` shapes and `59` passing. Of the `58`
eigenparameters, `29` have nonscalar weight and `29` scalar weight.

*Needs:* §§5.3, 5.6, 5.10, 7.2.

**Checks.**

- The `25` extra candidates obtained by distinguishing `Δ₂₃^a` from `Δ₂₃^b` all fail the sign test.
- The weight `k_i` is recovered as `a_i + i` from the ordered positive infinitesimal weights `a_i`.
- `29 + 29 = 58`.

### 7.5 Scalar case (I) in low weight

Prove (CT20 §5.3.2, case (I)): for scalar `1 ≤ k ≤ 13` and `g ≥ k`, a realized case-(I) parameter has
`g = k = 12` and `ψ = Δ₁₁[12] ⊕ [1]`, which passes the sign test and gives one cuspidal eigenline in
`S₁₂(Γ₁₂)`. A block crossing zero must be `Δ₁₁[12]`, which forces the distinguished block to be trivial;
the eigenline is cuspidal because a nonzero `Φ` would introduce the zeta factors of §6.1, which this
parameter does not have.

*Needs:* §§3.9, 5.3, 5.6, 5.10, 6.1, 7.1.

**Checks.**

- The sign test reads `χ(s) = (−1)^{2·12/4} = 1 = ε(Δ₁₁) = ε_ψ(s)`.
- `ψ` has dimension `24 + 1 = 25 = 2·12 + 1`.
- Square-integrability alone does not give cuspidality in singular weight; the argument through §6.1 is
  needed.

### 7.6 Scalar case (H1) in low weight

Prove (CT20 §5.3.2, case (H1), Lemmas 5.5–5.7): for `1 ≤ k ≤ 13`, `g ≥ k` and a realized case-(H1)
parameter, every block lies in `L₂₄` and `π_{i₀} = 1`; the alternative `π_{i₀} = Sym²Δ₁₁` forces
`(g, k) = (14, 13)` and `ψ = Sym²Δ₁₁[3] ⊕ Δ₁₁[8] ⊕ [3] ⊕ [1]`, which fails the sign test at the `Δ₁₁[8]`
generator. Then `k ≡ 0 mod 4`, the remainder `ψ′` is one of the `1`, `2`, `24` lattice parameters of §6.8
for `k = 4, 8, 12`, and by §6.10 every realized lift is noncuspidal except `g = k = 12`,
`ψ = Δ₁₁[12] ⊕ [1]`, the form of §7.5.

*Needs:* §§3.10–3.12, 6.8, 6.10, 7.5.

**Checks.**

- At `(g, k) = (14, 13)`: `ε_ψ(s) = ε(Δ₁₁ × Sym²Δ₁₁) = −1` while `χ(s) = 1`.
- For `k = 2, 6, 10` the remainders fail the odd-pair test; for `k = 2, 6`, `ψ′ = [2k − 1] ⊕ [1]` and
  `(−1)^{a/2}` with `a = k ≡ 2 mod 4` is `−1` against `ε = 1`.
- The degree of the genus-12 form is exactly `12`; this uses §6.8, not the table of §7.9.

### 7.7 Scalar case (H2) in low weight

Prove (CT20 §5.3.2, case (H2), Lemmas 5.8–5.9): for `1 ≤ k ≤ 13` and `g ≥ k`, a realized case-(H2) parameter
has `π_{i₀} = 1`, `k` odd and `g` even; if another zero-weight block is nontrivial it is `Sym²Δ₁₁` with
`d = 1`, `k = 13`, `g = 24` and a third trivial block of length at least five. The sign test at the
odd-pair generator forces a summand among `Δ₁₇[4]`, `Δ₁₇[8]`, `Δ₂₁[4]`, and exactly two parameters remain:
`(g, k) = (16, 13)` with `ψ = Δ₁₇[8] ⊕ [9] ⊕ [7] ⊕ [1]`, and `(g, k) = (24, 13)` with `ψ = Δ₁₁[12] ⊕ [25]`.
Both pass, with multiplicity one, and are cuspidal by odd weight.

*Needs:* §§3.10–3.12, 5.3, 5.6, 5.10, 6.2, 7.1.

**Checks.**

- The genus-16 parameter uses the trivial class at `d = 9, 7, 1`; forbidding a repeated class would lose it.
- The rejected shapes `Δ₂₁[4] ⊕ Δ₁₁[6] ⊕ [5] ⊕ [3] ⊕ [1]` and `Δ₂₃,₇[2] ⊕ Δ₁₇[4] ⊕ Δ₁₁[2] ⊕ [5] ⊕ [3] ⊕ [1]`
  fail at the `Δ₁₁` generator: `χ = (−1)^{d/2} = −1` against `ε_ψ = 1`.
- In (H2) the weight `g − k + 1` is omitted from the remainder; for `(16, 13)` it is `4`, and the
  remainder `Δ₁₇[8] ⊕ [7] ⊕ [1]` has weights `±12, …, ±5, ±3, ±2, ±1, 0, 0` without `±4`.

### 7.8 The twenty-nine nonscalar spaces

Prove (CT20 Theorem 2 and Table 6): for nonscalar dominant `k` with `13 ≥ k₁ ≥ ⋯ ≥ k_g > g ≥ 1`,
`dim S_k(Γ_g)` is `1` at the 29 weights below, with the stated standard parameter, and `0` at every other
such weight.

| Genus | Weight `k` | Standard parameter |
|---:|---|---|
| 3 | `(12, 8, 8)` | `Δ₁₁[2] ⊕ Sym²Δ₁₁` |
| 3 | `(12, 10, 10)` | `Δ₁₅[2] ⊕ Sym²Δ₁₁` |
| 3 | `(13, 10, 7)` | `O^odd(24,16,8)` |
| 4 | `(11, 11, 7, 7)` | `Δ₁₉,₇[2] ⊕ [1]` |
| 4 | `(12, 12, 6, 6)` | `Δ₂₁,₅[2] ⊕ [1]` |
| 4 | `(12, 12, 8, 8)` | `Δ₂₁,₉[2] ⊕ [1]` |
| 4 | `(12, 12, 10, 10)` | `Δ₂₁,₁₃[2] ⊕ [1]` |
| 4 | `(13, 11, 8, 6)` | `[1] ⊕ O^even(24,18,10,4)` |
| 4 | `(13, 12, 10, 5)` | `[1] ⊕ O^even(24,20,14,2)` |
| 4 | `(13, 13, 7, 7)` | `Δ₂₃,₇[2] ⊕ [1]` |
| 5 | `(12, 10, 10, 10, 10)` | `Δ₁₁[2] ⊕ Δ₁₅[2] ⊕ Sym²Δ₁₁` |
| 5 | `(12, 12, 12, 8, 8)` | `Δ₁₉,₇[2] ⊕ Sym²Δ₁₁` |
| 5 | `(12, 12, 12, 10, 10)` | `Δ₁₁[2] ⊕ Δ₁₉[2] ⊕ Sym²Δ₁₁` |
| 5 | `(13, 12, 12, 12, 9)` | `Δ₁₉[2] ⊕ O^odd(24,16,8)` |
| 6 | `(12, 12, 10, 10, 10, 10)` | `Δ₁₁[4] ⊕ Δ₂₁[2] ⊕ [1]` |
| 6 | `(12, 12, 12, 12, 8, 8)` | `Δ₁₇[2] ⊕ Δ₂₁,₅[2] ⊕ [1]` |
| 6 | `(12, 12, 12, 12, 10, 10)` | `Δ₁₇[2] ⊕ Δ₂₁,₉[2] ⊕ [1]` |
| 6 | `(13, 12, 12, 12, 12, 7)` | `Δ₁₇[2] ⊕ [1] ⊕ O^even(24,20,14,2)` |
| 6 | `(13, 13, 12, 12, 9, 9)` | `Δ₁₇[2] ⊕ Δ₂₃,₇[2] ⊕ [1]` |
| 7 | `(12, 10, 10, 10, 10, 10, 10)` | `Δ₁₁[6] ⊕ Sym²Δ₁₁` |
| 7 | `(12, 12, 12, 10, 10, 10, 10)` | `Δ₁₁[2] ⊕ Δ₁₉,₇[2] ⊕ Sym²Δ₁₁` |
| 7 | `(12, 12, 12, 12, 12, 10, 10)` | `Δ₁₅[2] ⊕ Δ₁₉,₇[2] ⊕ Sym²Δ₁₁` |
| 7 | `(13, 13, 13, 12, 9, 9, 9)` | `Δ₂₁,₅[2] ⊕ O^odd(24,16,8)` |
| 8 | `(12, 12, 10, 10, 10, 10, 10, 10)` | `Δ₁₁[4] ⊕ Δ₂₁,₅[2] ⊕ [1]` |
| 8 | `(12, 12, 12, 12, 10, 10, 10, 10)` | `Δ₁₉,₇[4] ⊕ [1]` |
| 8 | `(12, 12, 12, 12, 12, 12, 10, 10)` | `Δ₁₅[4] ⊕ Δ₂₁,₅[2] ⊕ [1]` |
| 8 | `(13, 13, 12, 12, 12, 12, 11, 11)` | `Δ₁₅[4] ⊕ Δ₂₃,₇[2] ⊕ [1]` |
| 8 | `(13, 13, 13, 13, 9, 9, 9, 9)` | `Δ₂₁,₅[4] ⊕ [1]` |
| 8 | `(13, 13, 13, 13, 11, 11, 11, 11)` | `Δ₂₁,₉[4] ⊕ [1]` |

*Needs:* §7.4.

**Checks.**

- `(13, 10, 7)`: `k_i − i = 12, 8, 4`, the positive weights of `O^odd(24,16,8)`, of rank `7 = 2·3 + 1`.
- `(11, 11, 7, 7)`: `k_i − i = 10, 9, 4, 3`, the shifted weights `19/2 ± 1/2` and `7/2 ± 1/2` of `Δ₁₉,₇[2]`.
- No statement is made outside `k_g > g`, and the 29 weights are pairwise distinct.

### 7.9 All scalar cusp dimensions through weight thirteen

Prove (CT20 Theorem 2 and Table 5): for every `g ≥ 1` and integer `0 ≤ k ≤ 13`, `dim S_k(Γ_g)` is the number of
rows of the table below with that `(g, k)`, and `0` when there is none. The rows are the 29 regular scalar
eigenparameters of §7.4 and the three singular ones of §§7.5 and 7.7. For `k < 0` there are no forms (§6.2).

| Genus | Weight | Standard parameter |
|---:|---:|---|
| 1 | 12 | `Sym²Δ₁₁` |
| 2 | 10 | `Δ₁₇[2] ⊕ [1]` |
| 2 | 12 | `Δ₂₁[2] ⊕ [1]` |
| 3 | 12 | `Δ₁₉[2] ⊕ Sym²Δ₁₁` |
| 4 | 8 | `Δ₁₁[4] ⊕ [1]` |
| 4 | 10 | `Δ₁₅[4] ⊕ [1]` |
| 4 | 12 | `Δ₁₇[2] ⊕ Δ₂₁[2] ⊕ [1]` |
| 4 | 12 | `Δ₁₉[4] ⊕ [1]` |
| 5 | 12 | `Δ₁₅[2] ⊕ Δ₁₉[2] ⊕ Sym²Δ₁₁` |
| 5 | 12 | `Δ₁₇[4] ⊕ Sym²Δ₁₁` |
| 6 | 10 | `Δ₁₁[4] ⊕ Δ₁₇[2] ⊕ [1]` |
| 6 | 12 | `Δ₁₅[4] ⊕ Δ₂₁[2] ⊕ [1]` |
| 6 | 12 | `Δ₁₇[2] ⊕ Δ₂₁,₁₃[2] ⊕ [1]` |
| 6 | 12 | `Δ₁₇[6] ⊕ [1]` |
| 7 | 12 | `Δ₁₁[2] ⊕ Δ₁₅[2] ⊕ Δ₁₉[2] ⊕ Sym²Δ₁₁` |
| 7 | 12 | `Δ₁₁[2] ⊕ Δ₁₇[4] ⊕ Sym²Δ₁₁` |
| 7 | 12 | `Δ₁₅[6] ⊕ Sym²Δ₁₁` |
| 8 | 10 | `Δ₁₁[8] ⊕ [1]` |
| 8 | 12 | `Δ₁₁[4] ⊕ Δ₁₇[2] ⊕ Δ₂₁[2] ⊕ [1]` |
| 8 | 12 | `Δ₁₁[4] ⊕ Δ₁₉[4] ⊕ [1]` |
| 8 | 12 | `Δ₁₅[4] ⊕ Δ₂₁,₉[2] ⊕ [1]` |
| 8 | 12 | `Δ₁₅[8] ⊕ [1]` |
| 8 | 13 | `Δ₂₁,₁₃[4] ⊕ [1]` |
| 9 | 12 | `Δ₁₁[2] ⊕ Δ₁₅[2] ⊕ Δ₁₉,₇[2] ⊕ Sym²Δ₁₁` |
| 9 | 12 | `Δ₁₁[6] ⊕ Δ₁₉[2] ⊕ Sym²Δ₁₁` |
| 10 | 12 | `Δ₁₁[4] ⊕ Δ₁₇[2] ⊕ Δ₂₁,₅[2] ⊕ [1]` |
| 10 | 12 | `Δ₁₁[8] ⊕ Δ₂₁[2] ⊕ [1]` |
| 11 | 12 | `Δ₁₁[10] ⊕ Sym²Δ₁₁` |
| 12 | 12 | `Δ₁₁[12] ⊕ [1]` |
| 12 | 13 | `Δ₁₉,₇[6] ⊕ [1]` |
| 16 | 13 | `Δ₁₇[8] ⊕ [9] ⊕ [7] ⊕ [1]` |
| 24 | 13 | `Δ₁₁[12] ⊕ [25]` |

*Needs:* §§6.2, 7.4–7.7.

**Checks.**

- `dim S₁₂(Γ₄) = 2`: two rows; the table is not a list of one-dimensional spaces.
- The weight-12 dimensions for `g = 1, …, 12` are `1, 1, 1, 2, 2, 3, 3, 4, 2, 2, 1, 1`, agreeing with CL14
  Théorème D, an independent theta-series computation.
- `S₈(Γ_g)` is nonzero only for `g = 4`, and `S₄(Γ_g) = S₆(Γ_g) = 0` for all `g ≥ 1`.

### 7.10 The four weight-thirteen cusp forms

Prove (CT20 Corollary 1): for every `g ≥ 1`, `M₁₃(Γ_g) = S₁₃(Γ_g)` has dimension one for `g = 8, 12, 16, 24` and is
`0` otherwise. Call `F_g` a generator; its standard parameter is `Δ₂₁,₁₃[4] ⊕ [1]`, `Δ₁₉,₇[6] ⊕ [1]`,
`Δ₁₇[8] ⊕ [9] ⊕ [7] ⊕ [1]` and `Δ₁₁[12] ⊕ [25]` respectively, with infinitesimal weights `0, ±(13 − i)`,
`1 ≤ i ≤ g`.

*Needs:* §§6.2, 7.9.

**Checks.**

- For `g = 8`: `Δ₂₁,₁₃[4]` has shifted weights `21/2 + 3/2 − r` and `13/2 + 3/2 − r`, `r = 0, …, 3`, that is
  `12, 11, 10, 9` and `8, 7, 6, 5`, which with `0` are the weights `0, ±(13 − i)`.
- For `g = 24` the weights `0, ±(13 − i)` contain `±12` once, `±1, …, ±11` twice and `0` three times; so does
  `Δ₁₁[12] ⊕ [25]`.
- For every odd `g`, `M₁₃(Γ_g) = 0` by §6.2; for `g > 26`, `S₁₃(Γ_g) = 0` by Resnikoff–Freitag.

### Examples

`S₁₀(Γ₂)` is spanned by the Saito–Kurokawa lift of the weight-18 eigenform, parameter `Δ₁₇[2] ⊕ [1]`;
`S₁₂(Γ₁₂)` by the form of parameter `Δ₁₁[12] ⊕ [1]`, which is the genus-12 Ikeda lift of `Δ`; and
`S₁₃(Γ₂₄)` by the form of parameter `Δ₁₁[12] ⊕ [25]`, constructed by Freitag as a theta series of the Leech
lattice (§8.6).

### Dependencies

Layers 3–6 (§§3.3–3.16, 4.13–4.17, 5.3–5.10, 6.1–6.2, 6.8, 6.10); AutomorphicFormsOnReductiveGroups §7.2a.

## Layer 8: harmonic theta realizations and the stable range

The cusp classification gives theta spanning in weights 4, 8 and 12 by induction along the Siegel
operator. In weight 13, Böcherer's criterion and a direct computation of Fourier coefficients on the
Leech lattice realize the four forms of §7.10 as harmonic theta series; the invariant alternating forms
of Niemeier lattices make the harmonic theta map an isomorphism; the Leech statements of §§8.5–8.6 rest on
the Mathieu combinatorics of §8.4 and on the Conway-group input imported from CFSGBasicProperties, not
on Layer 7, and are unconditional. In the stable range `g ≥ 2k` the
parameters and signs are independent of `g`, which gives the stable dimensions, bijectivity of `Φ` at
the boundary `g = 2k`, and the theta isomorphism there.

### 8.1 The Eichler basis theorem in weights four, eight and twelve

Prove (CT20 Corollary 5.10): for `k ∈ {4, 8, 12}` and every `g ≥ 0`, `θ_g : ℂ[X_{2k}] → M_k(Γ_g)` is surjective,
and `Φ_g` is surjective for `g ≥ 1`. For `g ≤ k` this is §6.8; for `g > k`, `S_k(Γ_g) = 0` by §7.9, so `Φ_g`
is injective, and for `F ∈ M_k(Γ_g)` a theta preimage `v` of `Φ_g F` gives `Φ_g(θ_g(v) − F) = 0`, hence
`θ_g(v) = F`.

*Needs:* §§6.1, 6.4, 6.8, 7.9.

**Checks.**

- The induction needs no prior surjectivity of `Φ_g`: it follows from `Φ_g θ_g = θ_{g−1}`.
- In weight 16 the analogous statement fails: `θ_{14} : ℂ[X₃₂] → M₁₆(Γ₁₄)` is not surjective (CL14 VII,
  Corollaire 3.5, cited by CT20 §5.4); the theorem is about three weights only.
- `g = 0`: `θ₀` maps onto the constants.

### 8.2 Dimensions in weights four, eight and twelve

Prove (CT20 Remark 5.11): for `k = 4, 8, 12` and every `g`, `dim M_k(Γ_g) = Σ_{h=0}^{g} dim S_k(Γ_h)` with
`S_k(Γ₀)` the constants; in particular `dim M_k(Γ_g) = |X_{2k}|` for `k = 4`, `g ≥ 1`; `k = 8`, `g ≥ 4`; and
`k = 12`, `g ≥ 12`. For `k = 12` the dimensions in genus `0, …, 12` are
`1, 2, 3, 4, 6, 8, 11, 14, 18, 20, 22, 23, 24`.

*Needs:* §§8.1, 6.8, 7.9.

**Checks.**

- The thresholds `1, 4, 12` are not the general stable bound `g ≥ 2k`.
- The genus-zero constant accounts for the initial `1`.
- The weight-12 sequence equals the cumulative degree distribution of §6.8, as it must since `θ_g` is
  surjective and the eigenvectors of degree at most `g` map injectively.

### 8.3 An orbit basis of exterior invariants

Prove (CT19a Fact 1.2): let a finite group `H` act on a finite set `Ω`, and call a subset `S` orientable when its
stabilizer acts on `S` by even permutations. For each orbit of orientable `g`-subsets choose a representative
`S` with an orientation `s`, and put `σ_S = Σ_{γ ∈ H/H_S} γ(s(1) ∧ ⋯ ∧ s(g))`. These `σ_S` form a basis of the
`H`-invariants of `⋀^g ℚ^Ω`; a non-orientable orbit contributes nothing.

*Needs:* Mathlib exterior powers.

**Checks.**

- `g = 0`: the empty set is orientable and `σ_∅ = 1`.
- `H = S₃` on `Ω = {1, 2, 3}`: the 3-subset has stabilizer `S₃`, containing odd permutations, so
  `(⋀³ℚ³)^{S₃} = 0`; for `H = A₃` it is one-dimensional.
- The dimension counts orientable orbits, not all orbits: for `H = S₃` and `g = 2` there is one orbit of
  2-subsets, not orientable (the transposition in the stabilizer swaps the two points), and
  `(⋀²ℚ³)^{S₃} = 0`.

### 8.4 The Mathieu forms on the Leech lattice

Let `Ω` be a 24-element set and `G₂₄` the extended binary Golay code on `Ω` (AlgebraicCodingTheory Layer 5,
`TauCeti.BinaryGolay.code`); define `M₂₄` as the group of permutations of `Ω` preserving `G₂₄`. Prove: its
order is `244823040`, matching SporadicOrders Layer 1; `(1/|M₂₄|) Σ_{γ ∈ M₂₄} det(t − γ)` is
`t²⁴ − t²³ − t¹⁷ + 2t¹⁶ − t¹⁵ − t¹³ + 2t¹² − t¹¹ − t⁹ + 2t⁸ − t⁷ − t + 1` (CT19a Fact 1.1); a subset of `Ω` is
`M₂₄`-orientable exactly when it is `C + P` with `C ∈ G₂₄` and `|P| ≤ 1`, or `|P| = 2` and `|P ∩ C| = 1` (CT19a
Lemma 1.3). In the coordinates of `TauCeti.leechLattice` (Rank24LatticeConstructions Layer 6), which
are Conway's up to scaling, the permutations in `M₂₄` and the sign changes along codewords of `G₂₄`
generate a subgroup `N = 2¹²M₂₄` of `O(Leech)`. For `C ∈ G₂₄` with
`|C| = g ∈ {0, 8, 12, 16, 24}` define `ω_g` as the alternating form corresponding to `σ_C` under the inner
product (CT19a Definition 1.5).

- `ω_g` is defined up to sign, nonzero, and invariant under `N`.
- Reversing the orientation replaces `ω_g` by `−ω_g`; `ω₀ = 1` and `±ω₂₄` is the determinant in a `ℤ`-basis of the
  Leech lattice.
- The `N`-invariants of `⋀^g ℚ^Ω` are `ℚσ_C` for `g ∈ {0, 8, 12, 16, 24}` and `0` otherwise (CT19a
  Proposition 1.4, proof).

*Needs:* §8.3; AlgebraicCodingTheory Layer 5; SporadicOrders Layer 1; Rank24LatticeConstructions Layer 6;
`TauCeti.BinaryGolay.code`, `TauCeti.BinaryGolay.weightEnumerator_code`, `TauCeti.leechLattice`.

**Checks.**

- The average characteristic polynomial has coefficient `2` at `t¹⁶`, `t¹²` and `t⁸`: the `M₂₄`-invariants of
  `⋀^g` have dimension two for `g = 8, 12, 16`, one of which is not `N`-invariant.
- An element `S ∈ G₂₄` acts on `σ_T` by `(−1)^{|S ∩ T|}`; since codewords meet in an even number of points,
  `σ_C` is `N`-invariant, while `C + {p}` with `p ∉ C` is negated by the complement of `C`.
- A non-orientable subset gives `σ = 0`: its stabilizer contains an odd permutation of it.

### 8.5 Invariant alternating forms of Niemeier lattices

Define `invariantAlternatingForms L g`, for `L : TauCeti.IntegralLattice V`, as the subspace of alternating
`g`-forms `ω : Vᵍ → ℚ` with `ω(e v₁, …, e v_g) = ω(v₁, …, v_g)` for every `e : TauCeti.IntegralLattice.Isometry L L`.
Prove:

- `invariantAlternatingForms_eq_bot_of_roots_span` (CT19a Proposition 4.1): if the vectors of norm `2` of an
  integral lattice span `V`, then `invariantAlternatingForms L g = ⊥` for every `g ≥ 1`. A reflection `s` in a
  root `x` is an isometry of `L` with `s(x) = −x` and `s(y) ∈ y + ℤx`, so an invariant `ω` vanishes on any tuple
  containing a root.
- `finrank_invariantAlternatingForms_of_rootless` (CT19a formula (1) and Proposition 1.4): for a positive
  definite even unimodular lattice of rank 24 without roots, the dimension of
  `invariantAlternatingForms L g` is `1` for `g ∈ {0, 8, 12, 16, 24}` and `0` otherwise. The dimension is
  the multiplicity of the trivial representation of `O(Leech)` in `⋀^g(Leech ⊗ ℚ)`, which is `(−1)^g`
  times the coefficient of `t^{24−g}` in the average characteristic polynomial
  `(1/|O(Leech)|) Σ_{γ ∈ O(Leech)} det(t − γ)`; that average is `t²⁴ + t¹⁶ + t¹² + t⁸ + 1` (CT19a formula
  (1)), imported from CFSGBasicProperties P2-L (gap:conway-group-average-charpoly). The `N`-invariants
  of §8.4 bound the dimension above by `1` for `g ∈ {0, 8, 12, 16, 24}` and by `0` otherwise, so the
  `O(Leech)`-invariants are `ℚω_g` in those degrees: `ω_g` is `O(Leech)`-invariant, and for `g = 24`
  every element of `O(Leech)` has determinant `1`, which also follows from the simplicity of
  `Co₁ = O(Leech)/{±1}` (CFSGBasicProperties P2-L), as the determinant factors through it. Under the
  premises of Layer 7, §8.8's first route gives a second proof of the lower bound in genera `8, 12, 16`
  and `24`. The uniqueness of the rootless class (OrthogonalTamagawaAndLatticeMass §4.2) transports the
  result from Conway's model to every such `L`.
- Consequently (CT19a Proposition 4.2) the harmonic source `M_{H_{1,g,24}}(O₂₄)` of §6.7 has dimension `1` for
  `g ∈ {8, 12, 16, 24}` and `0` for every other `g ≥ 1`, and the forms supported on rooted classes vanish.

The definition is a submodule: invariance is preserved by sums and scalar multiples, and `0` is invariant.

- `invariantAlternatingForms L 0` is all of the constants, of dimension one.
- The invariant forms for `L` and for an isometric lattice correspond under the isometry.
- Every element of `O(Leech)` has determinant `1`, the case `g = 24`.

*Needs:* §§6.6–6.7, 8.4; CFSGBasicProperties P2-L (gap:conway-group-average-charpoly);
OrthogonalTamagawaAndLatticeMass §4.2; Rank24LatticeConstructions Layer 6; `TauCeti.IntegralLattice`,
`TauCeti.IntegralLattice.Isometry`, `TauCeti.IntegralLattice.vectorsOfNorm`, `TauCeti.leechLattice`;
Mathlib `AlternatingMap`.

**Checks.**

- `TauCeti.BinaryGolay.constructionALattice` is even unimodular of rank 24 with the roots `2e_i` (norm `2`
  for the halved dot product), which span: its invariant alternating `g`-forms vanish for `g ≥ 1`, while the
  Leech lattice has a nonzero one in degree `8`.
- In rank one, `ℤx` with `x · x = 2` is spanned by a root and `invariantAlternatingForms` vanishes in degree
  `1`: the reflection `x ↦ −x` negates every linear form.
- `t²⁴ + t¹⁶ + t¹² + t⁸ + 1` has five nonzero coefficients, all equal to `1`, at `g = 0, 8, 12, 16, 24`; the
  statement for `g > 24` is `0` since `⋀^g` of a 24-dimensional space vanishes.
- The sign in the reading of the average: for the trivial group acting on `ℚ²⁴` the average is
  `(t − 1)²⁴`, whose `t²³` coefficient is `−24 = (−1)¹ dim ⋀¹`; for `{±1}` it is `((t − 1)²⁴ + (t + 1)²⁴)/2`,
  with the odd-degree coefficients `0`, as the invariants of `⋀^g` under `−1` vanish for odd `g`.

### 8.6 The Leech theta coefficients

Define `thetaCoefficient L ω T`, for an alternating `g`-form `ω` and a `g × g` rational matrix `T`, as the sum of
`ω(x)` over the `x ∈ Lᵍ` with `Gram(x) = T`; it is the Fourier coefficient at `T/2` of the theta series
`Σ_{x ∈ Lᵍ} ω(x) exp(πi tr(Gram(x)τ))`, a finite sum when `L` is positive definite. Prove
`exists_thetaCoefficient_ne_zero_of_rootless` (CT19a Theorem 2): for the Leech lattice, `g ∈ {8, 12, 16, 24}`
and a nonzero invariant `ω`, some coefficient is nonzero. More precisely, there are oriented even rootless
sublattices `Q_g` of rank `g`, unique in their `O(Leech)`-orbit of embeddings (CT19a Proposition 3.13), with
`Q₂₄ = Leech`, `Q₁₂` the Coxeter–Todd lattice (discriminant group `(ℤ/3)⁶`) and `Q₈`, `Q₁₆` with
discriminant group `(ℤ/5)⁴` (CT19a Lemma 2.1 and Proposition 2.2), and for `ω = ω_g` of §8.4 and `T` the Gram
matrix of a basis of `Q_g`, `thetaCoefficient = ±n_g e_g` with `(e₈, e₁₂, e₁₆, e₂₄) = (5, 18, 5, 1)` and
`n_g = |O(Leech)|/κ_{24−g}` the number of isometric embeddings `Q_g → Leech`, where `κ_h = 1` for `h < 12`,
`κ₁₂ = 3` and `κ₁₆ = 10` (CT19a Lemma 2.4).

- `thetaCoefficient` is additive in `ω`.
- For `T` the Gram matrix of a basis, the summation set is the set of bases of embedded copies, of
  cardinality `n_g`.
- For `g = 24` and `T` the Gram matrix of a `ℤ`-basis `u` of Leech, every `x` with `Gram(x) = T` is `γu` with
  `γ ∈ O(Leech)`, and `ω₂₄(γu) = ω₂₄(u)`, so the coefficient is `±|O(Leech)|`.

*Needs:* §§8.4, 8.5; OrthogonalTamagawaAndLatticeMass §4.2; Rank24LatticeConstructions Layer 6;
AlgebraicCodingTheory Layer 5; `TauCeti.leechLattice`.

**Checks.**

- `n₂₄ = |O(Leech)| = 8315553613086720000` since `κ₀ = 1`; `n₁₂ = |O(Leech)|/3`, `n₈ = |O(Leech)|/10`.
- `e₈ = 5` is the number of octads containing a fixed tetrad (CT19a Lemma 2.3); dividing by the stabilizer
  `|O(Q_g)|` instead would count sublattices, not embeddings.
- A non-orientable lattice of rank `g` has coefficient `0` for every invariant `ω`: an isometry of
  determinant `−1` negates the summand. `Q₆` is not orientable (CT19a Proposition 3.7).

### 8.7 The five order computations

Prove (BoechererNote pp. 2–3): in the five cases of §6.12 the function `R(s)` has order `0` at `s = 0` with a
nonzero leading coefficient. Writing `Λ_A = L(s, F_g, St) Γ_A(s)` with `Γ_A` the archimedean factor of the
Arthur parameter (a product of `Γ_ℝ` and `Γ_ℂ`, distinct from Böcherer's `γ_g^k`), the orders at `s = 0` of
`(C, 1/ω, γ, Λ_A, 1/Γ_A)` are `(0, 0, 0, −1, 1)` for `(g, n, ν) = (8, 16, 5)`, and `(0, 0, 0, 0, 0)`,
`(0, 0, 0, −1, 1)`, `(0, −4, −4, −1, 9)`, `(0, −12, −12, −1, 25)` for `n = 24`, `ν = 1` and `g = 8, 12, 16, 24`.
The nonvanishing at the two central points uses §6.11.

*Needs:* §§3.1, 6.11, 6.12, 7.10; AutomorphicLFunctionsAndLocalFactors §AL.1.4.

**Checks.**

- Every row sums to `0`.
- For `g = 24` the order of `ω₂₄(12 + 2s)` at `0` is the number of `i ≤ 24` with `24 − 2i < 0`, that is `12`, and
  `Γ_A` has order `−13 − 12 = −25` at `s = −12`.
- For `g = 16`, `γ` has order `−4`: the odd `i < 16` with `i ≥ 2k − g − 1 = 9` are `9, 11, 13, 15`.

### 8.8 Harmonic theta realization of the four forms

Prove (CT20 Proposition 5.12): `F_g` lies in the image of `θ_{1,g,24}` for `g = 8, 12, 16, 24`, and `F₈` lies in the
image of `θ_{5,8,16}`. Apply §6.12 with §8.7, and use that each `S₁₃(Γ_g)` is a line. Independently, §8.6 shows
that the image of `θ_{1,g,24}` is nonzero, hence equal to `ℂF_g` by §7.10.

*Needs:* §§6.7, 6.12, 7.10, 8.7; §8.6 for the second route.

**Checks.**

- `n/2 + ν = 13` in both families: `24/2 + 1 = 16/2 + 5`.
- The rank-16 statement is for `g = 8` and `ν = 5` only.
- The two routes are independent: the first uses `L`-function orders under the premises of Layer 7, the
  second the lattice count of §8.6, which rests on the Conway-group input of §8.5 and not on Layer 7.

### 8.9 The rank-sixteen harmonic source

Prove (CT20 §5.4, after Corollary 5.13): `M_{H_{5,8,16}}(O₁₆)` has dimension two, spanned by two Hecke eigenvectors
with standard parameters `Δ₂₁,₁₃[4]` and `Δ₁₇[8]`, and `θ_{5,8,16}` maps it onto `ℂF₈`. Compute the invariants of
`H_{5,8,16}` under `O(E₈ ⊕ E₈)` and `O(D₁₆⁺)`, decompose under the neighbour operators, and identify the
parameters through §6.9.

*Needs:* §§6.3, 6.7, 6.9, 8.8; OrthogonalTamagawaAndLatticeMass §4.1.

**Checks.**

- Both parameters have dimension `16`: `4·4` and `2·8`.
- A one-dimensional target does not force a one-dimensional source: the source is two-dimensional and the
  eigenvector `Δ₁₇[8]` maps to `0`.
- By the harmonic form of §6.9 with `n = 16 < 2g + 1 = 17`, a nonzero image of the eigenvector `Δ₂₁,₁₃[4]` has
  parameter `Δ₂₁,₁₃[4] ⊕ [1]`, that of `F₈`; a nonzero image of `Δ₁₇[8]` would have parameter `Δ₁₇[8] ⊕ [1]`,
  which is not in the table of §7.9.

### 8.10 The alternating theta isomorphism

Prove (CT20 Corollary 5.13; CT19a Corollary 4.3 and Theorem 4.4): for every `g ≥ 1`,
`θ_{1,g,24} : M_{H_{1,g,24}}(O₂₄) → S₁₃(Γ_g)` is an isomorphism. Both sides vanish outside `g ∈ {8, 12, 16, 24}`
(§§8.5 and 7.10); in those genera the source is the Leech line, whose image is nonzero by §8.6.

*Needs:* §§6.7, 7.10, 8.5, 8.6.

**Checks.**

- For `g > 24` both sides are `0`.
- For `g = 9` the source is `0` by §8.5 and the target is `0` by odd genus.
- The image eigenform has the parameter of §7.10, by §6.9 for `n = 24`.

### 8.11 Stable parameters

Prove (CT20 Proposition 5.14, proof): for `k ≥ 1` and `g ≥ 2k`, every eigenform in `M_k(Γ_g) = L²_k(Γ_g)` (§6.2) has
parameter `ψ = ψ′ ⊕ [2(g − k) + 1]` in case (H1) with trivial distinguished block, `k` even, and `ψ′_ℝ` an
Adams–Johnson parameter of the compact group `SO(2k)`. The component groups for two genera `g, g′ ≥ 2k` are
identified through the blocks; for a symplectic block `d_i ≤ k < 2(g′ − k) + 1` with `d_i` even, so
`ε(π_i)^{min(d_i, 2(g′−k)+1)} = 1`; the characters do not depend on `g`. At the product of the even generators
(with the odd-pair generator when present) the local sign is `(−1)^{k/2}` and the global sign `1`, so `4 | k`.

*Needs:* §§3.10–3.12, 6.2, 7.1.

**Checks.**

- For `g ≥ 2k`, case (H2) is impossible because it forces `g ≤ 2k − 2` (§3.7), and case (I) because it
  needs `k − 1 > g − k ≥ k`.
- `k = 2`: the sign `(−1)^{k/2} = −1 ≠ 1`, so `M₂(Γ_g) = 0` for `g ≥ 4`.
- `k = 0` is excluded here and treated in §8.12.

### 8.12 Stable dimensions

Prove (CT20 Proposition 5.14): for all integers `k, g ≥ 0` with `g ≥ 2k`, `dim M_k(Γ_g) = dim M_k(Γ_{2k})`, and this
dimension is `0` unless `4 | k`. For `k = 0` it is `1`; for `k > 0` the map `ψ′ ⊕ [2(g − k) + 1] ↦ ψ′ ⊕ [2(g′ − k) + 1]`
preserves occurrence and multiplicity by §8.11.

*Needs:* §8.11.

**Checks.**

- `k = 1, 2, 3`: `M_k(Γ_g) = 0` for `g ≥ 2k`.
- `k = 0`: the constants, of dimension `1` in every genus, including `g = 0`.
- `k = 4`: `dim M₄(Γ_g) = 1 = |X₈|` for `g ≥ 8`, consistent with §8.2.

### 8.13 The stable Siegel operator

Prove (CT20 Corollary 5.15(1)): for `k, g ≥ 0` with `g ≥ 2k`, `Φ_{g+1} : M_k(Γ_{g+1}) → M_k(Γ_g)` is bijective.
It is injective because `S_k(Γ_{g+1}) = 0` for `g + 1 > 2k` (§6.2), and the dimensions agree by §8.12.

*Needs:* §§6.1–6.2, 8.12.

**Checks.**

- The boundary case `g = 2k` uses only the strict vanishing at `g + 1 = 2k + 1`.
- `k = 0`: `Φ` is the identity on constants.
- At `g = 2k − 1` the statement is not claimed: injectivity of `Φ_{2k}` would need `S_k(Γ_{2k}) = 0`, which
  §6.2 gives only in genus above `2k`.

### 8.14 The stable theta isomorphism

Prove (CT20 Corollary 5.15(2)): for `4 | k` and `g ≥ 2k`, `θ_g : ℂ[X_{2k}] → M_k(Γ_g)` is an isomorphism. Injectivity at
`g = 2k` holds because the Fourier coefficient at the full Gram matrix of a basis of `L` distinguishes isometry
classes, and propagates by `Φ θ_{g+1} = θ_g`; surjectivity for `g > 2k` is Freitag's theorem of §6.2, and at
`g = 2k` it follows from the surjectivity of `θ_{2k+1}` and of `Φ_{2k+1}` (§8.13). For `k = 0`, the rank-zero
lattice maps to `1`.

*Needs:* §§6.2, 6.4, 8.13.

**Checks.**

- `k = 4`, `g = 8`: `ℂ[X₈] ≅ M₄(Γ₈)`, both one-dimensional.
- `k = 8`, `g = 16`: `dim M₈(Γ₁₆) = |X₁₆| = 2`.
- The basis of `ℂ[X_{2k}]` is unweighted; a full-rank Gram coefficient of `θ_{2k}[L]` counts the bases of `L`
  with that Gram matrix, which is `|O(L)| ≠ 0`.

### Examples

`θ_g[E₈]` spans `M₄(Γ_g)` for every `g`. The difference `θ₄[E₈ ⊕ E₈] − θ₄[D₁₆⁺]` spans `S₈(Γ₄)`. In weight 13 and
genus 24 the coefficient of `θ_{ω₂₄}` at the Gram matrix of a basis of Leech is `±|O(Leech)|`; in genus 8 the
form `F₈` is realized both on the Leech lattice (`ν = 1`) and on the rank-16 lattices (`ν = 5`).

### Dependencies

Layers 6–7 (§§6.1–6.12, 7.9–7.10); CFSGBasicProperties P2-L; OrthogonalTamagawaAndLatticeMass §§4.1–4.2;
Rank24LatticeConstructions Layer 6; AlgebraicCodingTheory Layer 5; SporadicOrders Layer 1;
AutomorphicLFunctionsAndLocalFactors §AL.1.4; Tau Ceti's lattice carrier and Golay code.

## Downstream consumers

- SiegelModularForms consumes the genus-`g` theta map of §6.4 and the harmonic theta map of §6.7 (which
  it extends to general lattices), the level-one statements of §§6.1–6.2, and the dimensions of §§7.3
  and 7.9, against which it checks its own dimension formulas.
- Miller's theorem in its form on the archimedean parameters of `Π_alg` (§2.19) and the Stark–Odlyzko
  cone inequality with its exclusion method (§§2.7–2.18) are owned here; a roadmap that needs them
  imports these sections.

## Worked examples

- `SO₃` (§4.12): five torsion classes, determinant `288`, masses `(−1/12, 1/4, 1/3, 0, 0)`, the last two killed by the
  spinor obstruction (§4.7), recovering the level-one dimension formula.
- The compression example (§2.15): minima `−1` and `−1/2`, both negative.
- The Ikeda-type parameter `Δ₁₁[12] ⊕ [1]` (§§3.8, 3.13, 7.5): simultaneously in cases (I) and (H1), with sign
  test `1 = 1`.
- The genus-24 form (§§7.7, 8.6): parameter `Δ₁₁[12] ⊕ [25]`, theta coefficient `±|O(Leech)|`.

## References

- [CT20] G. Chenevier, O. Taïbi, *Discrete series multiplicities for classical groups over ℤ and level 1
  algebraic cusp forms*, Publ. Math. IHÉS 131 (2020), 261–323; cited in the HAL version hal-02265675v1, whose
  section, equation and statement numbering is used throughout.
- [Tai17] O. Taïbi, *Dimensions of spaces of level one automorphic forms for split classical groups using the
  trace formula*, Ann. Sci. ÉNS 50 (2017), 269–344.
- [CL14] G. Chenevier, J. Lannes, *Formes automorphes et voisins de Kneser des réseaux de Niemeier*,
  arXiv:1409.7616v2.
- [CT19a] G. Chenevier, O. Taïbi, *Siegel modular forms of weight 13 and the Leech lattice*, arXiv:1907.08781v1.
- [BoechererNote] G. Chenevier, O. Taïbi, *Verification of Böcherer's criterion for the weight 13 forms*,
  companion note to [CT20], 2019.
- [Mil02] S. D. Miller, *The highest lowest zero and other applications of positivity*,
  arXiv:math/0112196v1.
- [KT87] K. Koike, I. Terada, *Young-diagrammatic methods for the representation theory of the classical groups
  of type B, C, D*, J. Algebra 107 (1987), 466–511.

