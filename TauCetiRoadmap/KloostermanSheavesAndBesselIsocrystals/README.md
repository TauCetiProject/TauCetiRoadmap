# Roadmap: Kloosterman sheaves and Bessel F-isocrystals for reductive groups

**Summary.** For a split reductive group `G` over `𝔽_q(x)` with Langlands dual `H`, Heinloth, Ngô and
Yun attach to a generic character of the root-depth Iwahori quotient at `∞` a rigid Hecke
eigensheaf on `Bun_G` with Iwahori level at `0`; its Hecke eigenvalue is the `H`-valued Kloosterman
sheaf `Kl_H`. Frenkel and Gross attach to the same group an explicit irregular `H`-connection
`∇ = d + (N + λ^h x E) dx/x` on `𝔾_m`. This roadmap builds the Heinloth–Ngô–Yun eigenobject in three
coefficient theories (`ℓ`-adic sheaves, algebraic `D`-modules in characteristic zero and arithmetic
`D`-modules with Frobenius, after proving the geometric Satake equivalence for the last two),
identifies the de Rham eigenvalue with the Frenkel–Gross connection through critical-level
localization, and proves a relative de Rham–rigid comparison over a mixed-characteristic discrete
valuation ring. Transporting Frobenius along these comparisons equips the Frenkel–Gross connection
with an `H`-valued Frobenius structure, the Bessel F-isocrystal `Be_H†`, which is the `p`-adic
companion of `Kl_H`. Its explicit shape then determines the geometric and arithmetic monodromy of
`Be_H†` and `Kl_H` (including the exceptional groups `SO_{2n+1}` and `G₂` in characteristic two), the
functoriality of Kloosterman sheaves conjectured by Heinloth–Ngô–Yun, the simple-wild local
parameter at `∞` and adjoint rigidity, generic ordinarity of Frobenius Newton points for every `H`
and everywhere ordinarity for the classical groups and `G₂`. A separate 2-adic branch, built on a
signed refinement of Dwork's congruences and the minimal-slope theorem, proves
`Be_{2n+1}† ≅ Be†_{SO_{2n+1},Std}` at `p = 2`. The end theorems on native carriers are exponential-sum
identities in every characteristic, such as `U_n(a) − q = R_{2n+1}(a)` in characteristic two for the even
orthogonal sum `U_n` and the raw Kloosterman sum `R_{2n+1}` of the trace character (Carlitz's identity at `n = 1`),
the signed 2-adic Dwork congruences, and the ordinarity of the Frobenius eigenvalues of the orthogonal sums.

## Scope and ownership

This roadmap owns:

- the normalized coefficient datum (Dwork parameter, chosen square root of `p`, half twists, closed
  point degrees);
- the root-depth quotient `I(1)/I(2)` of the Iwahori subgroup at `∞`, generic linear functionals on
  it, and the two-point level models `Bun_G(0,2)` and `Bun_G(1,2)` with their big cells;
- holonomic coefficients on the level stacks in the de Rham and arithmetic realizations, universal
  local acyclicity and hyperbolic localization for arithmetic `D`-modules, and the geometric Satake
  equivalence for arithmetic `D`-modules (with and without Frobenius) and for holonomic `D`-modules
  over a characteristic-zero field;
- the clean automorphic datum, the normalized Hecke action and the Kloosterman eigenobjects
  `Kl_H^ét`, `Kl_H^dR` and `Kl_H^rig`, with the tame-character variant and the closed-point
  comparison of their traces;
- the Frenkel–Gross connection, the dual invariant parameter, the Bessel oper slice, critical-level
  localization at the two-point level, central descent from the adjoint group, Zhu's comparison
  `Kl_H^dR ≅ Be_H` and the Frenkel–Gross differential Galois groups;
- the relative specialization of the bounded Hecke family over a mixed-characteristic discrete
  valuation ring, the quasi-minuscule middle-image theorem and the tensor de Rham–rigid comparison;
- the Bessel F-isocrystal, its nilpotent logarithmic extension, its Frobenius at zero, its
  horizontal Frobenius matrix and the dictionary between the column convention and the gauge
  equation printed by Xu–Zhu;
- the Bessel Newton class, the cuspidal Newton bound for Bessel eigenvalues and generic ordinarity;
- the Bessel monodromy groups, wild nontriviality, exclusion of the principal `PGL₂`, the monodromy
  classification, the simple-wild Weil parameters of Gross–Reeder and adjoint rigidity;
- the central torsor of Frobenius structures, pinned symmetries, the exact radius of adjoint
  solutions, integral and Heinloth–Ngô–Yun functoriality, and the companion monodromy comparison;
- the classical realizations: orthogonal Bessel matrices, the invariant-line decomposition, the
  quadric Landau–Ginzburg chart and its boundary count, the even orthogonal toric trace;
- hypergeometric arithmetic `D`-modules with rational nonresonant parameters (Miyatani), their Bessel
  normalization, the odd orthogonal comparison and the normalized convolution;
- Dwork congruence data, the signed 2-adic Dwork congruences, Dwork unit-root lines, the two Bessel
  solution series, the maximal-slope bridge and the characteristic-two comparison;
- the exponential-sum identities, the toric hypergeometric slopes, everywhere ordinarity, the
  even-`A` monodromy at `p = 2` and the all-prime corollaries.

It leaves to other roadmaps, by section:

- raw hyper-Kloosterman sums over every finite field, the `ℓ`-adic Artin–Schreier sheaf and the
  `ℓ`-adic Kloosterman sheaf of every rank: **CongruenceSpectralGap** §4.2a and §4.2b
  (`hyperKloosterman`); the local definition `kloostermanSum` of `Suggested.lean` is the same sum,
  restated only because a roadmap module cannot be imported there;
- the Hasse–Davenport lifting relation for Gauss sums under finite extension of the base field
  (Davenport–Hasse 1935): **CharacterSumsOverFiniteFields** §3.3; Layer 9 applies it to the
  `K`-valued characters of §0.1 by transport of the character values;
- finite hypergeometric sums with equally many upper and lower characters (Katz's exponential sum
  `katzExpSum`, `S_q` and `H_q`): **HypergeometricMotives** §§4.2–4.3. The trace sums of §9.1 are Katz's
  exponential sum with `n` upper and `m` lower characters; for `n = m` they are that roadmap's sum, and the
  unequal lengths `n > m` used in §§9.2–11.2 (the Kloosterman and Bessel types) are owned here. The local
  definition `quadraticHypergeometricSum` of `Suggested.lean` is the case of `N` trivial upper characters and
  one quadratic lower character;
- the normalized scalar Kloosterman sheaf, Katz's scalar monodromy groups, the scalar Kloosterman
  connections, the Bessel dictionary and the scalar differential Galois groups:
  **KloostermanMomentsAndPotentialAutomorphy** §§1.1, 1.3, 2.1, 2.5–2.6; scalar ordinarity at every prime and
  rank is a supplier gap there;
- `Bun_𝒢` for a smooth affine model, the Beilinson–Drinfeld Grassmannian, Schubert bounds, `ℓ`-adic
  sheaves on the stacks involved, fusion and the `ℓ`-adic geometric Satake equivalence over finite
  fields: **GlobalShtukasAndFunctionFieldLanglands** Layers 0–1; the relative geometry over a
  mixed-characteristic base and V. Lafforgue's `p`-adic estimate are supplier gaps there;
- Bruhat–Tits and parahoric group schemes, Moy–Prasad filtrations and the Iwahori–Weyl group:
  **ReductiveGroupsPartII** RG2.3.3, RG2.3.6, RG2.4.1;
- pinned Chevalley–Demazure groups, representations, structure theory and highest weights:
  **ReductiveGroups** Layers 1, 7, 9, 10; the principal-`SL₂` subgroup classification is a supplier
  gap there; orthogonal and spin groups: **OrthogonalSpinGroups** Layers 0–1;
- `p`-adic differential equations, overconvergent and convergent F-isocrystals, the Dwork and Kummer
  F-isocrystals and their sign conventions, the Taylor isomorphism between Frobenius lifts, local
  monodromy, logarithmic extensions, full faithfulness, specialization maps, finiteness and
  duality, the Grothendieck–Ogg–Shafarevich formula, Tannakian generation, weights and the scalar
  Kloosterman F-isocrystal at every prime and every rank: **PadicDifferentialEquationsAndRigidCohomology**
  Layers RD.0–RD.6;
  arithmetic `D`-module operations, Baldassarri's slope comparison, D'Addezio's monodromy
  comparison, the Adolphson–Sperber degree and Hodge bound and Wan's facial and diagonal ordinarity
  criteria for exponential sums of nondegenerate Laurent polynomials are supplier gaps there; the minimal-slope reconstruction on curves:
  **PadicDifferentialEquationsAndRigidCohomologyPartII** §MS.4.6;
- Newton orbit spaces and rational dominance: **BunGAndNewtonStrata** §§1.5, 1.22;
- neutral Tannakian reconstruction: **MotivesAndAlgebraicCycles** Layer 6;
- connections on torsors, opers and the Drinfeld–Sokolov–Kostant slice: **FormalConnectionsOpers**
  F2, F4, F6; the critical-level center: **AffineLieAlgebras** A7–A8, with rational coefficient forms requested by gap:critical-center-rational-forms; algebraic differential
  operators and holonomic `D`-modules: **SpringerResolutionAndCharacteristicCycles** Layers 8 and 9;
- `ℓ`-adic weights, the six operations on mixed complexes and Deligne semisimplicity:
  **DeligneWeightsAndPurity** DWP.8; étale foundations: **EtaleCohomologyFoundations**.

The rank-one sign dictionary for the Dwork and Kummer F-isocrystals is
PadicDifferentialEquationsAndRigidCohomology §RD.6.48; this roadmap records its specialization in
the conventions. The generated Tannakian category of an overconvergent isocrystal is
§RD.6.65; Layer 6 specializes it to the image of `Rep(H)`. The logarithmic extension of an
isocrystal with unipotent monodromy is §RD.5.103; Layer 4 specializes it to the Bessel residue.
The rational Newton orbit construction is BunGAndNewtonStrata §1.5; Layer 5 specializes it to
Frobenius classes at closed points.

## Conventions

**Standing datum.** `p` is a prime, `q = p^s` with `s ≥ 1`, `k = 𝔽_q` and `X = 𝔾_{m,k} = ℙ¹ − {0, ∞}`.
`G` is a split connected reductive group over `k` with a pinning `(B, T, {x_α})`, and `H` is its
Langlands dual group over a field of characteristic zero, with dual pinning `(B̌, Ť, N)`; `N` is the
sum of the simple root vectors of `Lie H`. For almost-simple `H`, `h` is its Coxeter number, `r` its
rank and `E` a nonzero lowest-root vector. Group-valued monodromy statements assume `H` almost simple
unless a product or a torus is named.

**Coefficients.** `R` is a complete discrete valuation ring of mixed characteristic `(0, p)` whose
residue field is a finite extension of `k`, with fraction field `K`, enlarged finitely when needed so that `K`
contains a Dwork parameter `π` with `π^{p−1} = −p` and a chosen square root `c_p` of `p`; put `c_q = c_p^s`.
The residue field cannot always be `k` itself: `(π^{(p−1)/2}/c_p)² = −1`, and for `p ≡ 3` modulo `4` this square
root of `−1` generates the unramified quadratic extension of `ℚ_p`. The nontrivial
additive character `ψ : 𝔽_p → K^×` is the one attached to `π` (PadicDifferentialEquationsAndRigidCohomology
§RD.6.46), and over `k_d = 𝔽_{q^d}` the character is `ψ ∘ Tr_{k_d/𝔽_p}`. The tame torus character is
trivial except in §1.7.

**Connections and Frobenius.** A connection on a free module is written in the column convention
`∇ = d + A(x) dx/x`. A Frobenius structure is a horizontal isomorphism `C : F^*M → M` from the
pullback to the module (§RD.6.48), with `F` the `q`-power lift `x ↦ x^q` fixing coefficients. With
`δ = x d/dx`, horizontality reads `δC + A C = q C A(x^q)`. At a closed point of degree `d` the
linear `q^d`-Frobenius is the ordered product `C(ã) C(ã^q) ⋯ C(ã^{q^{d−1}})` at the Teichmüller lift
`ã`, and slopes are normalized by `v(q^d) = 1`.

**Rank-one dictionary** (§RD.6.48 with `ε = −1`). The connection `d − π dt` carries the multiplier
`exp(π(t − t^q))` and has trace function `ψ ∘ Tr`; in the notation `E_λ = (O, d + λ dt)` this is
`E_{−π}`, and the scalar connection dictionary of KloostermanMomentsAndPotentialAutomorphy §2.6 uses `λ = −π`.
The Kummer connection `d − a dx/x` with `(q − 1)a ∈ ℤ` carries `x^{−(q−1)a}` and has trace the inverse
of the Teichmüller character `x ↦ x̃^{(q−1)a}`; a nontrivial tame character needs a rational exponent
modulo `ℤ`. Witness: differentiating `exp(π(t − t^p))` gives the logarithmic derivative
`π(1 − p t^{p−1})`, which is the horizontality equation for `d − π dt` with `q = p`; for `d + π dt` the
same multiplier fails by the constant term `2π`. The scalar Kloosterman F-isocrystal of
PadicDifferentialEquationsAndRigidCohomology §RD.6.95 is built from `L_π` (`ε = +1`) and therefore has the trace
function of `ψ^{−1}`. For odd `p`, comparisons with it replace `π` by `−π`, which is again a Dwork parameter, with
`ψ_{−π} = ψ^{−1}` (§RD.6.46). For `p = 2` the only Dwork parameter is `π = −2`, since `−π = 2` does not satisfy
`π^{p−1} = −p`, and `ψ = ψ^{−1}`; there the comparison keeps `π` and the trace functions already agree.

**Half twists and normalized traces.** The half Tate twist `(1/2)` multiplies the `q^d`-Frobenius by
`c_q^{−d}`. The raw rank-`r` Kloosterman sum is `R_r(a) = Σ_{x₁⋯x_r = a} ψ(Tr(x₁ + ⋯ + x_r))` with no
prefactor, and the normalized rank-`r` trace at a point of degree `d` is
`(−1)^{r−1} c_q^{−d(r−1)} R_r(a)`. Witness: at `r = 2`, `d = 1`, `q = 3`, `a = 1`, `R₂(1) = −1` and the
normalized trace is `1/√3`, which lies outside `ℚ₃(μ₃)`; the datum must contain `√3`.

**Principal grading and Newton dominance.** `ρ` is half the sum of the positive coroots of `H`
(equivalently of the positive roots of `G`); it is a rational cocharacter of `Ť`, and `2ρ` is
integral. The class at zero is written `(2ρ)(c_q)`. Dominance `μ ≤ λ` means `λ − μ` is a nonnegative
real combination of positive coroots of `H` (BunGAndNewtonStrata §1.5); on `GL_r` it means the
polygon of `μ` lies on or above that of `λ` with the same endpoints. The order on `B(H)`, which also
fixes the Kottwitz class, is not used.

**The orthogonal sums.** For `n ≥ 1` and `a ∈ 𝔽_Q^×`, `U_n(a) = Σ_{x₁, …, x_{2n} ∈ 𝔽_Q^×} ψ(Tr(x₁ + ⋯ + x_{2n} + a (x₁ + x₂)/(x₁ ⋯ x_{2n})))`; for `p` odd, `ρ_Q` is the quadratic character of `𝔽_Q^×`,
`g_Q = Σ_y ρ_Q(y) ψ(−Tr y)` and `H_N(b) = Σ_{x₁⋯x_N = b y} ψ(Tr(x₁ + ⋯ + x_N − y)) ρ_Q(y)`.

**Matrices.** Matrix units `E_{ij}` are one-based. Universes: all schemes, stacks and coefficient
categories live in one fixed universe; `Suggested.lean` places the extension fields `L` of
`orthogonalSum_ordinary` in `Type`.

## Exact supplier contracts

### From Mathlib

- `AddChar`, `AddChar.compAddMonoidHom`, `AddChar.mulShift`, the inverse character `ψ⁻¹ = ψ ∘ neg`,
  `AddChar.sum_eq_ite` and `AddChar.sum_eq_zero_of_ne_one`: additive characters of finite rings and
  their orthogonality. The trivial character is the constant `1`; nontriviality is a hypothesis.
- `Algebra.trace`, `FiniteField.algebraMap_trace_eq_sum_pow` and
  `FiniteField.trace_to_zmod_nondegenerate`: the field trace to `ZMod p` as a sum of Frobenius
  conjugates and its nondegeneracy. `ZMod.algebra` supplies the `ZMod p`-algebra structure of a ring
  of characteristic `p`; any two such structures agree.
- `gaussSum`, `gaussSum_mul_gaussSum_eq_card`, `quadraticChar` and `MulChar.ringHomComp`: Gauss sums
  over finite fields, `g(χ, ψ) g(χ⁻¹, ψ⁻¹) = |F|` for nontrivial `χ` and primitive `ψ`, and the
  quadratic character with values in `ℤ` transported to a field. Mathlib has no Hasse–Davenport
  relation; CharacterSumsOverFiniteFields §3.3 supplies it.
- `PadicComplex` (`ℂ_[p]`): the completion of an algebraic closure of `ℚ_p`, with its norm.
- `PowerSeries.mk`, `PowerSeries.coeff` and `PowerSeries.expand`: power series by coefficients and
  the substitution `x ↦ x^p`. `IsDiscreteValuationRing`, `IsAdicComplete` and `IsFractionRing`: the
  coefficient ring `R` of §0.1 and of Layer 10.
- `Matrix.trace`, `LieAlgebra` and `Module.finrank`: traces of Frobenius matrices and extension
  degrees.

### From Tau Ceti

- `TauCeti.FGComoduleCat` and `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`: finite comodules
  over a commutative Hopf algebra and the reconstruction of an affine group from its tensor
  automorphisms; consumed through PadicDifferentialEquationsAndRigidCohomology §RD.2.52. Tau Ceti has no
  Kloosterman sum, F-isocrystal on a curve, Bessel F-isocrystal or Hecke eigensheaf at the pin; its Bessel
  declarations (`TauCeti/Analysis/SpecialFunctions/BesselI.lean`) are the analytic Bessel functions, and Mathlib's
  isocrystals (`Mathlib/RingTheory/WittVector/Isocrystal.lean`) are Frobenius-semilinear vector spaces over the
  fraction field of the Witt vectors of a perfect field, with no connection and no base curve.
- `TauCeti.LocalFieldsRamification.map_restrictNormalHom_lowerRamificationGroupReal` (Herbrand's theorem: for a
  finite normal extension `M/K` of nonarchimedean local fields and a normal subextension `L`, the image of the
  lower ramification group `G_u` in `Gal(L/K)` is the lower group at `φ_{M/L}(u)`) and
  `TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup` (for a Galois tower, the upper
  filtration maps onto the upper filtration of the quotient): the change of lower numbering under a central lift
  in §6.5.

### From TauCetiRoadmap.CongruenceSpectralGap

- §4.2a: `hyperKloosterman F k ψ r`, the raw product-fibre sum over unit tuples, with its
  positive-rank eliminated-variable presentation and the change-of-character rule `ψ(a·) ↦ a^k r`. Assumed in every
  characteristic and every rank, with no normalizing factor.
- §4.2b: the `ℓ`-adic Artin–Schreier sheaf `L_ψ` (geometric Frobenius trace `ψ(Tr x)`) and the
  Kloosterman sheaf `Kl_k`, lisse of rank `k` on `𝔾_m`, tame at `0`, Swan one at `∞`, pure of weight
  `k − 1`, with trace `(−1)^{k−1}` times the raw sum. Consumed as the `ℓ`-adic side of §8.1.

### From TauCetiRoadmap.CharacterSumsOverFiniteFields

- §3.3: the Hasse–Davenport lifting relation `hasseDavenport_lift`: for a finite field `F`, a
  multiplicative character `χ` and an additive character `ψ` of `F` with values in `ℂ`, not both
  trivial, and the extension `E/F` of degree `d`, `−g(χ ∘ N_{E/F}, ψ ∘ Tr_{E/F}) = (−g(χ, ψ))^d`, with
  `g` Mathlib's `gaussSum`; equivalently `g(χ ∘ N, ψ ∘ Tr) = (−1)^{d−1} g(χ, ψ)^d`. It is stated for
  `ℂ`-valued characters; this roadmap applies it to the `K`-valued characters of §0.1 through a field
  embedding into `ℂ` of the subfield of `K` generated by the values of `χ` and `ψ`, which carries `χ`,
  `ψ`, their norm and trace lifts and both Gauss sums to their `ℂ`-valued counterparts. The case used
  here has `ψ` nontrivial, so every `χ`, trivial or not, is covered.

### From TauCetiRoadmap.HypergeometricMotives

- §4.2: `katzExpSum ω ψ a b t`, the sum over `t ∏ x_i = ∏ y_j` of `ψ(Σ x_i − Σ y_j) ∏ ω^{a_i}(x_i) ∏ ω^{−b_j}(y_j)`
  over a finite field, for complex-valued characters and equally many upper and lower parameters. Consumed only
  as the identification of the equal-length trace sums of §9.1, transported to `K`-valued characters through a
  field embedding into `ℂ` of the subfield generated by the character values, as for the Hasse–Davenport relation.

### From TauCetiRoadmap.KloostermanMomentsAndPotentialAutomorphy

- §1.1 (normalized sheaf): the weight-zero normalization `Kl_r^0`, trace
  `(−1)^{r−1} c^{−m(r−1)} R_r(a; p^m)` with one square root `c` of `p` fixed at `p`.
- §1.3 (monodromy): for `r ≥ 2`, the geometric and arithmetic monodromy of `Kl_r^0` is `Sp_r` for `r`
  even, `SL_r` for `p, r` odd, `SO_r` for `p = 2`, `r` odd, `r ≠ 7`, and `G₂` for `p = 2`, `r = 7`. Used as
  an independent check in §6.4 and §11.4.
- §§2.1, 2.6, 2.5 (connection, Bessel dictionary, differential Galois group): the rank-`r` Kloosterman connection,
  its cyclic presentation, the identification of the Bessel connection with its pullback along
  `z = λ^r x` with the transpose and sign rule for horizontal solutions, and the differential Galois
  groups `SL_r` (`r` odd) and `Sp_r` (`r` even).
- What KloostermanMomentsAndPotentialAutomorphy must provide (gap:scalar-kloosterman-ordinarity):
  for every prime `p`, every rank `r ≥ 2` and every closed point `a` of `𝔾_m` over `𝔽_q`, the Frobenius
  eigenvalues of the weight-zero Kloosterman sheaf at `a` (equivalently of its `p`-adic companion), with
  `v(q^{deg a}) = 1`, have valuations `−(r−1)/2, −(r−3)/2, …, (r−1)/2`, each once, with no condition
  relating `p` and `r` (Sperber 1980, Theorem (2.35), for `p > r + 2`; Wan 1993, by the boundary decomposition, in general).

### From TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglands

- §0.1: `Bun_𝒢` for a smooth affine model `𝒢` with connected fibres of a reductive group over a
  smooth projective curve over `𝔽_q`, an Artin stack locally of finite type with affine diagonal.
- §0.14: cuspidal functions on `Bun_𝒢(𝔽_q)` and their relation to bundle functions.
- §1.1–§1.2: the Beilinson–Drinfeld Grassmannian, its factorization and Schubert bounds; §1.4:
  `ℓ`-adic sheaves on the stacks of finite type used here; §1.5: fusion; §1.6: minuscule Hecke
  geometry at Iwahori level; §1.9 and §1.12: the `ℓ`-adic geometric Satake equivalence over finite
  fields, with Tate normalization by one fixed square root of `q` (§1.8).
- What GlobalShtukasAndFunctionFieldLanglands must provide (gap:relative-level-geometry): `Bun_𝒢`
  with its full level structures, the Beilinson–Drinfeld Grassmannian, its Schubert bounds and the
  bounded Hecke stacks of §§0.1, 0.3, 1.1–1.3 for a smooth affine model with connected fibres of a split group over `ℙ¹_S`, for a noetherian base `S` (in particular
  the spectrum of a complete mixed-characteristic discrete valuation ring and its fraction field),
  compatibly with base change to every fibre and to finite residue-field extensions.
- What GlobalShtukasAndFunctionFieldLanglands must provide (gap:cuspidal-newton-bound):
  V. Lafforgue's estimate that for a split reductive group over a global function field and a
  nonzero cuspidal Hecke eigenform with coefficients in `ℚ̄_p` and finite-order central character, the Newton point of the Satake parameter at
  every unramified place `v`, normalized by `v(q_v) = 1`, is dominated by half the sum of the
  positive coroots of the dual group (V. Lafforgue 2011, Proposition 2.1).

### From TauCetiRoadmap.ReductiveGroupsPartII

- RG2.3.3 (Bruhat–Tits and parahoric group schemes), RG2.3.6 (Moy–Prasad filtrations, including the
  torus filtration `T(K)_r` and the affine-root generators with their rounding) and RG2.4.1 (the
  Iwahori–Weyl group and its length-zero subgroup `Ω`), over the equal-characteristic local fields
  `k((x))` and `k((1/x))`.

### From TauCetiRoadmap.ReductiveGroups and TauCetiRoadmap.OrthogonalSpinGroups

- ReductiveGroups Layer 1 (representations as comodules, tensor products, duals, faithful
  representations), Layer 7 (structure theory, Chevalley restriction, pinned automorphisms),
  Layer 9 (pinned Chevalley–Demazure group schemes over `ℤ`, root subgroups and central isogenies) and
  Layer 10 (highest weights).
- What ReductiveGroups must provide (gap:principal-sl2-subgroups): for a connected almost-simple
  group over an algebraically closed field of characteristic zero, Kostant's decomposition of the
  adjoint representation restricted to a principal `SL₂` as `⊕ Sym^{2e_i}` over the exponents `e_i`;
  the classification of connected reductive subgroups containing a principal `SL₂`; their
  centralizers; and the theorem that an automorphism preserving every semisimple conjugacy class is
  inner.
- OrthogonalSpinGroups Layers 0–1: the orthogonal and special orthogonal groups of a nondegenerate
  quadratic form over a field, Mathlib's spin group, the spinor norm and the image of `Spin` in `SO` on
  points. The split group schemes `SO_N`, `Sp_{2n}` and `G₂` are the pinned Chevalley–Demazure groups of
  ReductiveGroups Layer 9; classical group carriers are not redefined here.

### From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

- Analytic foundations: dagger algebras (§RD.3.8), rational integration in dagger intervals (§RD.0.44) and the
  Taylor comparison of two Frobenius lifts (§RD.0.37, §RD.1.44).
- RD.1: generic radii and subsidiary radii (§§RD.1.11–RD.1.13), solvability and breaks
  (§§RD.1.14–RD.1.19), Frobenius slopes (§RD.1.35), Frobenius structures force generic radius one
  (§RD.1.45), Dwork's exponential (§RD.1.46).
- RD.2: unipotent modules and nilpotent residues (§§RD.2.13–RD.2.16), the logarithmic local monodromy
  theorem (§RD.2.33), André's Tannakian local monodromy (§RD.2.51).
- RD.3: overconvergent and convergent F-isocrystals (§§RD.3.25, RD.3.33–RD.3.37), Newton
  semicontinuity (§RD.3.43), common Newton vertices and the dense-open slope filtration
  (§§RD.3.44–RD.3.45), unit-root F-isocrystals, all of whose pointwise Frobenius slopes are zero
  (§RD.3.47), Kummer isocrystals (§RD.3.51).
- RD.4: specialization and cospecialization of de Rham cohomology (§RD.4.58) and the specialization
  and forget-supports square (§RD.4.59); these are maps under their smooth proper compactification
  hypotheses, not comparison isomorphisms.
- RD.5: Kedlaya's full faithfulness (§RD.5.8), finiteness and Poincaré duality with coefficients
  (§§RD.5.76, RD.5.89), convergent log-isocrystals on a smooth pair with a strict normal crossings
  divisor, with their residues along its components (§RD.5.101), logarithmic extension under
  unipotent monodromy (§RD.5.103) and full faithfulness of restriction to a dense open, including
  underlying overconvergent isocrystals (§RD.5.102(a), §RD.5.112(ii)).
- RD.6: the linear Frobenius at a closed point and its behaviour under residue extension (§RD.6.2),
  Tate twists (§RD.6.3), the `L`-function of an overconvergent F-isocrystal on a separated scheme of
  finite type over `𝔽_q` and its rationality as the alternating product of the characteristic
  polynomials of Frobenius on compactly supported rigid cohomology (§§RD.6.4, RD.6.25), traces and
  the Lefschetz trace formula (§RD.6.23), pointwise weights (§RD.6.28), the Fourier transform
  (§§RD.6.41–RD.6.44), the Dwork and Kummer F-isocrystals and their sign dictionary
  (§§RD.6.42, RD.6.46–RD.6.48), local monodromy representations, irregularity
  and Swan conductors (§§RD.6.51–RD.6.52), the Grothendieck–Ogg–Shafarevich formula (§RD.6.55), neutral
  Tannakian recognition and generation (§RD.2.52, §RD.6.65), normalization to weight zero (§RD.6.82)
  and the scalar Kloosterman F-isocrystal `Kl_{n+1}` at every prime `p` and every rank `n + 1 ≥ 1`, with its
  trace function, local monodromy and purity (§§RD.6.94–RD.6.95, RD.6.97).
- What PadicDifferentialEquationsAndRigidCohomology must provide (gap:arithmetic-d-module-operations):
  holonomic arithmetic `D`-modules with and without Frobenius structure on realizable separated
  `k`-schemes of finite type and on quotient stacks by smooth descent, with the six operations and
  duality, the holonomic t-structure, the Abe–Caro weight theory, Abe's nearby and vanishing cycles,
  the trace formula, and the equality of trace functions with `ℓ`-adic sheaves built by the same
  operations from compatible inputs (Gabber–Fujiwara independence), overconvergent F-isocrystals
  being the smooth objects.
- What PadicDifferentialEquationsAndRigidCohomology must provide (gap:dense-convergence-detection):
  for a smooth curve with smooth formal lift, a finite locally free module with integrable
  connection on its tube is convergent if its restriction over a Zariski dense open of the
  special fibre is convergent; this criterion does not assume Frobenius (the precise input used
  in Xu–Zhu §4.2.7, p. 45, and Miyatani proof of Theorem 4.1.3, p. 30).
- What PadicDifferentialEquationsAndRigidCohomology must provide (gap:formal-slope-comparison):
  Baldassarri's comparison: for an algebraic connection on a punctured disc over a `p`-adic field
  whose analytification is solvable at the boundary, every `p`-adic break at the puncture is at most
  the largest formal (characteristic-zero) slope of the algebraic connection.
- What PadicDifferentialEquationsAndRigidCohomology must provide (gap:companion-monodromy):
  D'Addezio's theorem that for an `E`-compatible system of semisimple coefficient objects on a smooth
  connected variety over a finite field, after a finite extension of `E` there is one connected
  split reductive group `G₀` over `E` with a faithful representation `ρ₀` such that each member's
  neutral monodromy component, with its tautological representation, is `G₀ ⊗ E_λ` with `ρ₀ ⊗ E_λ`,
  together with the equality of the component groups (D'Addezio, Theorem 1.2.1 and §4.3).
- What PadicDifferentialEquationsAndRigidCohomology must provide (gap:toric-exponential-sum-hodge-bound):
  the Adolphson–Sperber theorem. Let `𝔽_q` have characteristic `p`, let `ψ` be a nontrivial additive character
  of `𝔽_p` with values in a `p`-adic field, and let `f ∈ 𝔽_q[x₁^{±1}, …, x_N^{±1}]` have Newton polyhedron `Δ(f)`, the
  convex hull of the origin and the exponents of `f`, of dimension `N`. Suppose `f` nondegenerate: for every face
  `σ` of `Δ(f)` not containing the origin, the logarithmic derivatives `x_i ∂f_σ/∂x_i` of the restriction `f_σ` have
  no common zero on `(𝔽̄_q^×)^N`. Then, with `S*_m(f) = Σ_{x ∈ (𝔽_{q^m}^×)^N} ψ(Tr f(x))`, the function
  `exp(Σ_m S*_m(f) T^m/m)^{(−1)^{N−1}}` is a polynomial of degree `N! · Vol(Δ(f))` whose Newton polygon, for
  `v(q) = 1`, lies on or above the Hodge polygon `HP(Δ(f))`, for every `p`. Here the weight `w(u)` of a lattice point
  `u` of the cone over `Δ(f)` is the least `c ≥ 0` with `u ∈ cΔ(f)`, `D` is the least positive integer with
  `D w(u) ∈ ℤ` for all such `u`, `W(k)` is the number of such `u` with `w(u) = k/D`, and `HP(Δ(f))` has slope `k/D` with
  multiplicity `Σ_{i=0}^{N} (−1)^i C(N, i) W(k − iD)` (Adolphson–Sperber, Corollary 3.11, by the concentration of the
  Dwork complex of `f` in top degree).
- What PadicDifferentialEquationsAndRigidCohomology must provide (gap:toric-exponential-sum-ordinarity):
  Wan's ordinarity criteria for `f` as in gap:toric-exponential-sum-hodge-bound, ordinary meaning that its
  Newton polygon equals `HP(Δ(f))`. (a) Facial decomposition: `f` is ordinary if and only if, for every
  codimension-one face `δ` of `Δ(f)` not containing the origin, the restriction `f^δ` is ordinary with respect to the
  convex hull of the origin and `δ`. (b) Diagonal criterion: if `f` is diagonal, that is, has exactly `N` monomials,
  all with nonzero coefficients and with linearly independent exponent vectors `V₁, …, V_N`, then `f` is
  nondegenerate exactly when `p ∤ det(V₁, …, V_N)`; the group `S(Δ) = {r ∈ (ℚ ∩ [0, 1))^N : Σ_i r_i V_i ∈ ℤ^N}` is finite
  abelian of order `|det(V₁, …, V_N)|`; and `f` is ordinary when `p ≡ 1` modulo the exponent of `S(Δ)` (Wan 2004,
  Theorem 3.1 and Corollary 2.6; Wan 1993, boundary decomposition and diagonal criterion). The index condition
  in (b) and the faces in (a) are codimension-one data; nondegeneracy is a condition on all faces not containing
  the origin.

### From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomologyPartII

- §MS.4.6 (the specified-map theorem on curves, in Layer MS.4): on a smooth connected curve over a
  perfect field, for irreducible overconvergent F-isocrystals whose convergent realizations carry
  slope filtrations, every isomorphism between their maximal-slope quotients lifts uniquely to an
  isomorphism of overconvergent F-isocrystals (Tsuzuki, Theorem 1.3).

### From TauCetiRoadmap.BunGAndNewtonStrata

- §1.5: the Newton orbit space of rational cocharacters modulo the Weyl group, dominant
  representatives and rational dominance; §1.22: representations detect Newton dominance.

### From TauCetiRoadmap.MotivesAndAlgebraicCycles

- Layer 6, §§6.1–6.3 and §6.5: neutral fibre functors, reconstruction of the neutral group,
  generation, finite type, and tensor-isomorphism torsors without a chosen point.

### From TauCetiRoadmap.FormalConnectionsOpers, AffineLieAlgebras and SpringerResolutionAndCharacteristicCycles

- FormalConnectionsOpers F2 (algebraic connections on torsors and gauge forms), F4 (intrinsic opers
  and the Drinfeld–Sokolov–Kostant slice) and F6 (oper reduction over the punctured disc).
- AffineLieAlgebras A7–A8: the vacuum center and the completed center at the critical level.
- SpringerResolutionAndCharacteristicCycles Layer 8 (§§8.1–8.6: differential operators, good
  filtrations, characteristic varieties and cycles) and Layer 9 (§§9.1–9.2, 9.4, 9.6–9.7: transfer modules,
  the operations and duality, Kashiwara's equivalence, holonomic modules, intermediate extension, regular
  holonomic modules), on smooth varieties over a field of characteristic zero; Kashiwara's equivalence
  defines the categories on the singular bounded pieces of the Grassmannian through closed embeddings into
  smooth varieties.

- What AffineLieAlgebras must provide (gap:critical-center-rational-forms): the vacuum and
  completed critical centres and their oper identifications for pinned split semisimple
  Chevalley Lie algebras over any characteristic-zero field, with a rational form and
  compatibility with field extension, extending A7–A8's complex centre theorems; the
  two-point localization and its normalized descent remain targets of §§2.4–2.7 here.

### From TauCetiRoadmap.DeligneWeightsAndPurity and EtaleCohomologyFoundations

- DeligneWeightsAndPurity DWP.8: mixed complexes and their stability under the six operations
  (§8.5), purity of proper direct images (§8.12), geometric monodromy (§8.14) and Deligne
  semisimplicity (§8.19); EtaleCohomologyFoundations: constructible `ℓ`-adic complexes and their
  operations on schemes of finite type.

## How to read the build

Layer 0 fixes the coefficient datum and the level data. Layer 1 builds the coefficient theories on
the level stacks, proves the Satake equivalences needed for them, and constructs the Kloosterman
eigenobjects with matching traces. Layer 2 identifies the de Rham eigenvalue with the Frenkel–Gross
connection, computes its characteristic-zero adjoint cohomology, and establishes the central and pinned symmetries. Layer 3 compares the de Rham and rigid eigenvalues over `R`. Layer 4 transports Frobenius
to the Frenkel–Gross connection and computes it at zero and as a matrix. Layer 5 proves generic
ordinarity from the cuspidal Newton bound, independently of the 2-adic branch. Layer 6 computes the
monodromy away from type `A_{2n}` at `p = 2`, and Layer 7 deduces functoriality and the companion
comparison. Layers 8 and 9 compute the classical and hypergeometric realizations in odd
characteristic. Layer 10 proves the characteristic-two comparison using Layers 4–6 and 8, and
Layer 11 completes the identities, the slopes, the even-`A` case at `p = 2` and the all-prime
corollaries. No target is used in its own proof: the central torsor and the even-`A` statements at
`p = 2` sit after the monodromy theorems they use, and the characteristic-two identities sit after the
isocrystal comparison that proves them.

The former layer labels `KB.k` mean Layer `k`, for `0 ≤ k ≤ 11`. The following
former target labels identify the same mathematical targets; former §7.2 is now §2.9.

| Former numbering | Section |
| --- | --- |
| KB.0 affine-depth | §0.2 |
| KB.0 level-model | §0.3 |
| KB.1 clean-datum | §1.4 |
| KB.1 hecke-action | §1.5 |
| KB.1 eigenobject | §1.6 |
| KB.1 trace-companions | §1.8 |
| KB.2 invariant-parameter | §2.2 |
| KB.2 oper-slice | §2.3 |
| KB.2 quantized-hitchin | §2.5 |
| KB.2 zhu-identification | §2.7 |
| KB.3 tensor-comparison | §3.5 |
| KB.4 bessel-isocrystal | §4.1 |
| KB.4 log-extension | §4.2 |
| KB.6 rigidity-local | §6.6 |
| KB.7 symmetry-central | §2.9 |
| KB.11 all-prime-corollaries | §11.5 |

## Layer 0: Coefficients, normalizations and level data

This layer fixes the coefficient datum, the root-depth quotient at `∞` and the two-point level
models. Everything later refers to these choices;
a sign or degree chosen here is checked once by a two-term witness and then reused.

### 0.1 The normalized coefficient datum

Define a *normalized datum* as a tuple `(p, s, k, R, K, c_p, ψ, π)`: a prime `p`, `s ≥ 1`, `k = 𝔽_q` with
`q = p^s`, a complete discrete valuation ring `R` of mixed characteristic `(0, p)` whose residue field is a
finite extension of `k`, with fraction field `K`, a square root `c_p ∈ K` of `p`, a nontrivial additive character `ψ` of `𝔽_p` and
the Dwork parameter `π ∈ K` attached to it (`π^{p−1} = −p`). Put `c_q = c_p^s`, use `ψ ∘ Tr_{k_d/𝔽_p}` over
`k_d`, half twists with `q`-Frobenius scalar `c_q^{−1}` and the valuation normalized by `v(q) = 1`.
Finite extensions of `K` carrying `π` and `c_p` to fixed images are allowed throughout (Xu–Zhu §1.1.1,
pp. 2–3; §4.1, p. 37; §4.4.3, p. 50). The datum must contain `c_p`: the uniform field `K = ℚ_p(π)` of
Xu–Zhu Theorems 1.1.4 and 1.2.4 (pp. 3–5) is too small for the normalized traces, as the witness in
the conventions shows. *Needs:* Mathlib `AddChar`, `AddChar.compAddMonoidHom`, `Algebra.trace`,
`FiniteField.algebraMap_trace_eq_sum_pow`, `IsDiscreteValuationRing`, `IsAdicComplete`, `IsFractionRing`;
PadicDifferentialEquationsAndRigidCohomology §RD.6.2 (Frobenius at a closed point and under residue
extension), §RD.6.3 (Tate twists), §RD.6.46 (the character attached to `π`) and §RD.6.48 (direction of
Frobenius structures).

- The scalar normalization of a rank-`r` trace at a point of degree `d` is
  `(−1)^{r−1} c_q^{−d(r−1)}`, and it is compatible with finite coefficient extension.
- The additive character over `k_d` is `ψ ∘ Tr_{k_d/𝔽_p}`, and it is compatible with traces in towers
  `k ⊂ k_d ⊂ k_{de}` (Mathlib `FiniteField.algebraMap_trace_eq_sum_pow`).
- The half twist has `q^d`-Frobenius `c_q^{−d}`, and its square is the Tate twist `(1)`, whose
  `q^d`-Frobenius is `q^{−d}`.
- After successive constant extensions of degrees `d` and `e` the half-twist scalar is `c_q^{−de}`.
- A point valued in `k_d` whose residue degree `d′` divides `d` has `q^d`-Frobenius the `d/d′`-th power
  of its own Frobenius, so a trace over `k_d` uses `d` factors of the Frobenius matrix.

**Checks.**

- At `r = 2`, `d = 1` the normalized trace is `−R₂(a)/c_q`; the wrong candidates `R₂(a)` and `−R₂(a)/q`
  differ already at `q = 2`, `a = 1`, where `R₂(1) = 1` and the three values are `−1/√2`, `1` and `−1/2`.
- For `a ∈ k^×` viewed in `k_d`, the Frobenius product has `d` factors; using one factor gives the trace
  over `k`, not over `k_d`.
- Over `𝔽₃` the normalized rank-two trace at `a = 1` is `1/√3 ∉ ℚ₃(μ₃)`, so a datum without `√3` cannot
  carry the normalization.
- The half-twist witness: for `q = 4` and `d = 2` the scalar is `c_4^{−2} = 1/4`, and its square
  `1/16` is the `q²`-Frobenius of `(1)`, not of `(1/2)`.
- For `p = q = 3`: `π² = −3` and `c_3² = 3` give `(π/c_3)² = −1`, and `ℚ₃(√−1)` is unramified of degree two, so the
  residue field of `R` is at least `𝔽₉`; a datum required to have residue field exactly `𝔽₃` does not exist. For
  `p = 5` the same element lies in `ℚ₅`, since `−1` is a square modulo `5`.

### 0.2 The root-depth quotient and generic functionals

For split pinned `G` and the alcove determined by `B ⊃ T` at `∞`, let `I(0) ⊂ G(k[[1/x]])` be the
Iwahori subgroup, `I(1)` its pro-unipotent radical and `I(2)` the next Moy–Prasad step at the
barycentre, generated by `T(1)` (the second torus filtration step) and the affine root groups of
affine roots that are positive and not simple (ReductiveGroupsPartII RG2.3.6; HNY §1.2, pp. 250–252).
Define `V = I(1)/I(2)`. Prove that `V` is the direct sum of the root lines `U_α` over the affine-simple
roots `α` of the derived root system, naturally for pinned automorphisms. A linear functional
`φ : V → 𝔾_a` is *generic* when its restriction to every `U_α` is nonzero; over `R` genericity means
nonzero reduction on every line. For a torus `V = 0`. The commutator-plus-center description of
`I(2)` printed in Xu–Zhu §4.1.1 (pp. 37–38) is not used: it differs from the Moy–Prasad kernel when the
residue characteristic divides an isogeny degree. *Needs:* ReductiveGroupsPartII RG2.3.6; ReductiveGroups
Layer 9.

- `V` is identified with `⊕_α U_α` over the affine-simple roots; the identification is natural for
  pinned automorphisms of `(G, B, T)`.
- A functional on `V` is generic exactly when every affine-simple coefficient is nonzero over a field,
  respectively a unit over `R`.
- The adjoint torus `T_ad` acts on functionals through the root characters and preserves genericity.
- Two functionals on `V` are equal if they agree on every affine-simple root line, including the
  empty case of a torus.

**Checks.**

- For `SL₂`, `V` has the two coordinates of the finite simple root and of the affine root `δ − θ`; a
  description with only the finite coordinate misses the affine one.
- For `G = 𝔾_m`, `V = 0` and the zero functional is generic by the empty condition.
- For `GL₂` over `𝔽₂`, `diag(1 + t, 1)` with `t` a uniformizer of `𝔽₂[[t]]` lies in the Moy–Prasad `I(2)`; its
  determinant `1 + t` is not a square times a commutator, so the commutator-plus-scalar kernel is a
  different subgroup. For `y = t²` the determinant is `(1 + t)²`, so an arbitrary maximal-ideal element does not give this control.

### 0.3 The two-point level models

Let `G(0,2)` be the smooth affine model of `G` over `ℙ¹` that is `G` on `𝔾_m`, the opposite Iwahori
`I(0)^op` at `0` and `I(2)` at `∞`, and `G(1,2)` the model with `I(1)^op` at `0`. Construct
`Bun_G(0,2)` and `Bun_G(1,2)` as instances of GlobalShtukasAndFunctionFieldLanglands §0.1 over `k`, and
over `R` and `K` by gap:relative-level-geometry. Prove: the length-zero subgroup `Ω` of the Iwahori–Weyl
group (ReductiveGroupsPartII RG2.4.1) indexes the connected components; for each `γ ∈ Ω` the action of
`V × {γ}` on the Hecke translate of the trivial bundle gives an affine open immersion
`j_γ : V → Bun_G(0,2)^γ`, the big cell; and for `(1,2)` the big cell is `T̃ × V`, where
`T̃ = N_{G(k((x)))}(I(0)^op)/I(1)^op` sits in `1 → T → T̃ → Ω → 1`, after a chosen splitting
`T ⋊ Ω ≅ T̃` (HNY Proposition 1.1 and Corollaries 1.2–1.3, pp. 253–255; Xu–Zhu §4.1.1, pp. 37–38;
§4.1.11, pp. 41–42). These are particular level models, not a new moduli construction.
*Needs:* GlobalShtukasAndFunctionFieldLanglands §0.1, §1.1; gap:relative-level-geometry;
ReductiveGroupsPartII RG2.3.3, RG2.4.1; §0.2.

- For every `γ ∈ Ω`, `j_γ` is an affine open immersion with origin the Hecke translate of the trivial
  bundle.
- The Hecke translation by `γ` carries the neutral chart to the `γ` chart and respects composition in `Ω`.
- `Bun_G(1,2) → Bun_G(0,2)` is the torus level change, and its big cell is `T̃ × V`.
- Pullback along a finite residue-field extension, and over `R` along the closed and generic fibres,
  commutes with the model, its neutral bundle and each `j_γ`.

**Checks.**

- `j₀(0)` is the trivial `G(0,2)`-bundle with its levels, an object with trivial automorphism group;
  the classifying stack of `T` is a different point.
- For `SL₂` the neutral big cell is `𝔸²`, matching the two affine-root lines of §0.2.
- A nonidentity `γ ∈ Ω` sends the neutral point to a different component; a chart confined to the
  neutral component fails for `PGL₂`, where `Ω = ℤ/2`.

### Examples

- For `G = PGL₂` (`H = SL₂`) the datum is: `V = 𝔸²` with coordinates of the simple root and the affine
  root, `Ω = ℤ/2`, a generic functional `φ(u₁, u₀) = u₁ + u₀`, and `Bun_G(0,2)` with two components.
- For `G = 𝔾_m` all level data are trivial and the eigenobject of Layer 1 is the constant object.

### Dependencies

ReductiveGroups Layers 1, 9; ReductiveGroupsPartII RG2.3.3, RG2.3.6, RG2.4.1;
GlobalShtukasAndFunctionFieldLanglands §§0.1, 1.1 and gap:relative-level-geometry; Mathlib `AddChar`,
`AddChar.compAddMonoidHom`, `Algebra.trace`, `FiniteField.algebraMap_trace_eq_sum_pow`,
`IsDiscreteValuationRing`, `IsAdicComplete`, `IsFractionRing`; PadicDifferentialEquationsAndRigidCohomology
§§RD.6.2, RD.6.3, RD.6.46–RD.6.48.

## Layer 1: Coefficients on the level stacks, Satake realizations and Kloosterman eigenobjects

This layer puts three coefficient theories on the level stacks of Layer 0, proves the geometric
Satake equivalence in the two theories where it is not supplied, and constructs the
Heinloth–Ngô–Yun eigenobject in all three. The `ℓ`-adic theory and its Satake equivalence are
GlobalShtukasAndFunctionFieldLanglands Layer 1. The arithmetic theory rests on
gap:arithmetic-d-module-operations, and the de Rham theory on SpringerResolutionAndCharacteristicCycles
Layer 9.

### 1.1 Holonomic coefficients on the level stacks

Construct, for the stacks `Bun_G(m,n)`, the Hecke stacks over `X` and the bounded pieces of the
Beilinson–Drinfeld Grassmannian, three triangulated categories with perverse or holonomic hearts:
(i) constructible `ℓ`-adic complexes over `k` (GlobalShtukasAndFunctionFieldLanglands §1.4);
(ii) complexes of algebraic `D`-modules with holonomic cohomology over `K`, by smooth descent from the
smooth atlas of GlobalShtukasAndFunctionFieldLanglands §0.1 (base-changed to `K` through
gap:relative-level-geometry) of the categories of SpringerResolutionAndCharacteristicCycles Layer 9;
(iii) complexes of arithmetic `D`-modules with holonomic cohomology over `k` with coefficients in
`K`, with and without Frobenius, by the same descent from gap:arithmetic-d-module-operations
(Xu–Zhu §§2.3–2.5, pp. 13–19). Each has the operations `f_!`, `f_+` (respectively `f_!`, `f_*`) for
schematic morphisms of finite type between these stacks, the canonical map `f_! → f_+`, smooth
pullback, external products and duality, with the normalized shifts of the holonomic heart.
*Needs:* §§0.1, 0.3; GlobalShtukasAndFunctionFieldLanglands §0.1 (the stacks and their smooth atlases),
§§1.1–1.3 (Beilinson–Drinfeld Grassmannians, Schubert bounds and Hecke stacks) and §1.4 (`ℓ`-adic
sheaves on stacks of finite type); gap:relative-level-geometry; SpringerResolutionAndCharacteristicCycles
Layer 9 (§§9.1–9.2, 9.4, 9.6–9.7; Kashiwara's equivalence for the singular bounded pieces);
gap:arithmetic-d-module-operations (operations, holonomic t-structure and weights for (iii)).

- For a schematic affine morphism, `f_+` is right exact and `f_!` is left exact for the holonomic
  t-structure (Abe–Caro Proposition 1.3.13(i), for a complete c-affine morphism of realizable couples admitting the locally proper smooth frames of its proof, transported to these schematic morphisms by gap:arithmetic-d-module-operations).
- Smooth pullback commutes with `j_!` and `j_+` for open immersions `j`, so cleanness can be checked on a
  smooth atlas.
- The weight theory of (iii) gives: `f_!` preserves objects of weight `≤ w`, `f_+` preserves objects of weight
  `≥ w`, duality sends weight `≤ w` to weight `≥ −w`, and for a pure object of weight `w` with `f_! ≅ f_+` the
  direct image is pure of weight `w` (Xu–Zhu §2.6, Theorem 2.6.4).
- Base change holds for `f_!` along arbitrary morphisms and for `f_+` along smooth morphisms; proper
  base change for `f_+` is not asserted beyond proper `f`.

**Checks.**

- On `𝔸¹` the exponential object `E_{−π}` in (ii) and the Dwork F-isocrystal in (iii) have the
  matching trace function `ψ ∘ Tr` (§RD.6.48 with `ε = −1`); `E_{π}` gives `ψ^{−1}`.
- For the open immersion `j : 𝔾_m → 𝔸¹` and the constant object, `j_! → j_+` is not an isomorphism (its
  cone is supported at `0`), so cleanness is a property and not a formal identity.
- The dual weight bound is `≥ −w`, not `≥ w`: the dual of `K(−1/2)` on a point has weight `−1`.

### 1.2 Universal local acyclicity and hyperbolic localization for arithmetic `D`-modules

Let `S` be a smooth realizable `k`-scheme, `f : Y → S` a morphism from a realizable
`k`-scheme, and `M ∈ D(Y)` in theory (iii). Write `g : Y → Y × S` for the graph,
`d_S` for the componentwise dimension of `S`, `⊗` for the ordinary tensor product and `~⊗` for its dual tensor product. Define local
acyclicity by requiring, for every `N ∈ D(S)`, the graph-induced comparison
`M ⊗ f^+N → (M ~⊗ f^!N)(d_S)[2d_S]` to be an isomorphism. Define universal
local acyclicity (ULA) by requiring this property after `+`-pullback along every morphism
`S′ → S` between smooth `k`-schemes; the morphism itself need not be smooth (Xu–Zhu
Definition 2.8.2 and (2.8.1.1)–(2.8.1.3), p. 21). Prove preservation under smooth
pullback and proper pushforward (Proposition 2.8.3), and prove that for a smooth `k`-scheme `S`
and every object `M` on a realizable `k`-scheme `Y`, the pullback `pr₁^+M` to `Y × S` is ULA over `S`
through `pr₂` (Proposition 2.8.3(i), ULA over `Spec k`, with the base changes `S′ → Spec k` of
Definition 2.8.2, p. 21); on an ind-scheme LA and ULA are read on the closed subschemes of finite
type supporting the object (Proposition 2.8.3(iv), p. 21, and Remark 2.8.4, p. 22). This is the case used
for the Satake kernel spread over `X` and for external products over `X²` in the fusion product
(Xu–Zhu §3.2.2, p. 28, and proof of Proposition 3.2.5(i), p. 29). Prove that for a smooth effective
divisor `D ⊂ S`, with inverse-image immersion `i` and complementary immersion `j`, an
LA object whose restriction to `j` is holonomic is its intermediate extension, and
`i^+M[−1] ≅ i^!M(1)[1]` (Proposition 2.8.5, p. 22). Deduce vanishing of full and
unipotent vanishing cycles along every strict henselian trait mapping to `S`, and smoothness
of all cohomology objects for an object ULA over the identity of a smooth scheme
(Corollaries 2.8.6–2.8.7, p. 23). Prove Braden's
hyperbolic localization for weakly `𝔾_m`-equivariant objects `F` on a quasi-projective `k`-scheme `Q`,
geometrically connected and normal, with a `𝔾_m`-action: with `a₊ : Q⁺ → Q` and `a₋ : Q⁻ → Q` the attracting and repelling loci and
`e₊ : Q⁰ → Q⁺`, `e₋ : Q⁰ → Q⁻` the inclusions of the fixed locus, the canonical map
`e₋^+ a₋^! F → e₊^! a₊^+ F`, from the repelling side (`!`-restriction to the repelling locus,
then `+`-restriction to the fixed locus) to the attracting side (`+`-restriction to the attracting locus,
then `!`-restriction to the fixed locus), is an isomorphism (Xu–Zhu §2.10, (2.10.1.2) and
Theorem 2.10.2, pp. 25–26). *Needs:* gap:arithmetic-d-module-operations; §1.1.

**Checks.**

- The zero-point map `Spec k → 𝔸¹` is an allowed base change between smooth schemes although it is not smooth; the constant object stays locally acyclic after it. The constant object on a smooth `Y` is ULA over every smooth `f`; the object `j_!K` for `j : 𝔾_m → 𝔸¹` is
  not ULA over the identity of `𝔸¹`, since its vanishing cycles at `0` are nonzero.
- The smoothness conclusion requires the identity morphism: the constant object on `𝔸¹` is ULA over the map to a
  point but is already smooth, while a skyscraper is ULA over the point and is not smooth on `𝔸¹`.
- ULA depends on the morphism, not on the object alone: `j_!K` on `𝔸¹` is not ULA over the identity, yet its
  pullback `pr₁^+(j_!K)` to `𝔸¹ × 𝔸¹` is ULA over the second factor by the product clause; a definition of
  ULA as a property of the object alone would contradict one of the two.
- For the constant object on `𝔸²` with weights `(1, −1)`, the attracting locus is the `x`-axis and the
  repelling locus the `y`-axis. The attracting side is the `!`-restriction to the origin of the constant
  object of the `x`-axis (equivalently, compactly supported cohomology of the `x`-axis); the repelling
  side is the stalk at the origin of the `!`-restriction `K[−2](−1)` of the constant object to the
  `y`-axis; both are `K[−2](−1)`. With weights `(1, 1)` the attracting locus is all of `𝔸²`, the repelling
  locus is the origin, and both sides are `K[−4](−2)`; a comparison landing in degree `0` would be
  wrong in both cases.

### 1.3 Geometric Satake for arithmetic and de Rham coefficients

Let `Sat_G` be the category of `L⁺G`-equivariant holonomic arithmetic `D`-modules on the affine
Grassmannian `Gr_G` over `k` with coefficients in a finite extension `L` of `K`. Prove: `Sat_G` is
semisimple with simple objects `IC_μ` (Xu–Zhu Proposition 3.1.2, p. 26); convolution with the fusion
constraint and the corrected commutativity constraint makes it a symmetric monoidal category; the
hypercohomology functor is an exact faithful tensor functor making `Sat_G` neutral Tannakian; its
Tannakian group is the Langlands dual group `H` over `L`, with the canonical pinning from
semi-infinite orbits (Xu–Zhu Theorems 3.5.1 and 3.5.3, pp. 33–34). With Frobenius structures, prove that
the category `F-Sat_G` is equivalent to the category of `σ`-semilinear representations of `H(L) ⋊ ℤ`
of Xu–Zhu §3.6, and that after the half twist by `c_q` the Tate-normalized subcategory is `Rep(H)`
(Xu–Zhu Theorem 3.6.7, p. 36). For holonomic `D`-modules on `Gr_G ⊗ K` over a field `K` of characteristic
zero, prove the same equivalence with `Rep(H)` (Beilinson–Drinfeld, *Quantization of Hitchin's
integrable system*, §5.3). Prove that both equivalences are compatible with the `ℓ`-adic one of
GlobalShtukasAndFunctionFieldLanglands §1.9 on characteristic polynomials of the hypercohomology of
`IC_μ` stalks. *Needs:* §§1.1–1.2; GlobalShtukasAndFunctionFieldLanglands §§1.1–1.2, 1.5, 1.8;
ReductiveGroups Layers 1, 10.

- The simple objects are `IC_μ = j_{μ,!+}(L_{Gr_μ}[⟨2ρ, μ⟩])` for dominant coweights `μ`, and the parity
  vanishing of their stalks holds (Xu–Zhu Lemma 3.1.4).
- The fusion product on `Gr_{X²}` restricts to convolution on the diagonal and to the external product
  off it (Xu–Zhu Proposition 3.2.5).
- Hypercohomology is monoidal and decomposes by semi-infinite orbits into weight spaces for `Ť`
  (Xu–Zhu Corollary 3.3.3 and Propositions 3.4.3–3.4.4).
- Pinned automorphisms of `G` act on `Sat_G` and induce the homomorphism `Aut(G) → Aut(H, B̌, Ť, N)`
  (Xu–Zhu Lemma 3.6.10).

**Checks.**

- For `G = 𝔾_m`, `Gr` is the discrete set `ℤ` on reduced points and `Sat` is graded vector spaces, whose
  group is `𝔾_m` (Xu–Zhu Lemma 3.5.4).
- For a minuscule `μ`, `IC_μ` is the constant object shifted by `dim Gr_μ`; with the Tate normalization
  its Frobenius is `c_q^{−dim Gr_μ}` times the identity on stalks, not `q^{−dim Gr_μ}`.
- Without the corrected commutativity constraint the hypercohomology of `IC_μ ⋆ IC_μ` for `G = PGL₂` and
  `μ` minuscule would give a super vector space with odd part, so the Tannakian group would not be `SL₂`.

### 1.4 The clean automorphic datum

For a generic functional `φ` on `V` (§0.2) put `A_ψφ = φ^*(A_ψ)`, the pullback of the exponential object
in each theory: the Artin–Schreier sheaf, `E_{−π}` in the de Rham theory, the Dwork F-isocrystal in the
arithmetic theory. On the `γ` component define `A_γ = j_{γ,!}(A_ψφ)[dim Bun_G(0,2)]`. Prove: the canonical
map `j_{γ,!}(A_ψφ) → j_{γ,+}(A_ψφ)` is an isomorphism; and restriction to the base point followed by the shift `[−dim Bun_G(0,2)]` induces an
equivalence between `(V, A_ψφ)`-equivariant holonomic objects on `Bun_G(0,2)^γ × X` and holonomic objects
on `X`, with quasi-inverse `M ↦ A_γ ⊠ M` (Xu–Zhu Lemma 4.1.4 and (4.1.3.2), pp. 38–39; HNY Lemma 2.3 and
Definition 2.4, pp. 256–257). *Needs:* §§0.2–0.3, 1.1; PadicDifferentialEquationsAndRigidCohomology
§RD.6.42.

- Restriction of `A_γ` along `j_γ` recovers `A_ψφ` with the stated shift.
- The canonical support-to-ordinary map is invertible, naturally in the coefficient object.
- Every generic-equivariant holonomic object is `A_γ` tensored with its normalized fibre at the chart origin, and
  this description is fully faithful.
- A morphism between generic-equivariant objects is determined by its fibre at the chart origin.

**Checks.**

- The normalized fibre `i_γ^*A_γ[−dim Bun_G(0,2)]` is the unit in degree zero. For `SL₂` the ordinary fibre is `K[2]`, with its single cohomology in degree `−2`.
- Every `!`-stalk and `+`-stalk on the complement of the big cell vanishes: at each boundary orbit some
  root group in the stabilizer acts through a nontrivial character of `φ`.
- For `SL₂` and `φ = 0` the stabilizer argument fails at the boundary point of the affine-root line, and
  `j_! → j_+` has a nonzero cone there; genericity cannot be dropped.

### 1.5 The normalized Hecke action

For `W ∈ Rep(H)` let `IC_W` be the Satake kernel of §1.3 (or GlobalShtukasAndFunctionFieldLanglands §1.9
in the `ℓ`-adic theory) spread out over `X` by smooth descent from `U × X × Gr`, supported on the bounded
Hecke stack. Define `Hk_W(M) = pr_{2,!}(pr_1^+ M ⊗ IC_W)` on `Bun_G(0,2) × X`, with the canonical
map to `pr_{2,+}`. Prove: fusion identifies `Hk_{W⊗W′}` with the composite of `Hk_W` and `Hk_{W′}`
followed by restriction to the diagonal, compatibly with associativity and with all intertwiners;
`Hk_1(M) = M ⊠ 1`; and over the base point the eigenvalue is the pushforward from the open part
`GR_W°` of the bounded Grassmannian with the exponential coefficient (Xu–Zhu §4.1.2, (4.1.2.1)–(4.1.2.4),
p. 38; §4.1.8, (4.1.8.1)–(4.1.8.4), p. 40). *Needs:* §§1.3–1.4; GlobalShtukasAndFunctionFieldLanglands
§§1.1–1.5; gap:relative-level-geometry.

- The trivial representation acts by exterior product with the unit on `X`.
- The collision isomorphism gives a tensor constraint compatible with associativity, and every
  intertwiner `W → W′` acts naturally.
- Restriction to the trivial bundle equals the exponential direct image from `GR_W°`, with the Satake
  shift and half twist.
- Identity intertwiners induce identities, composites induce composites, and these commute with
  fusion.

**Checks.**

- `W = 1` gives rank one in degree zero and no twist.
- For the standard `W` of `SL₂`, `W ⊗ W` has an eigenvalue of rank four, not two.
- For minuscule `W` with `dim Gr_W = d`, `IC_W` is the constant object shifted by `d` and twisted by `d/2`
  in the arithmetic theory; the integral twist `(d)` instead of `(d/2)` would multiply the trace by `c_q^{−d}`.

### 1.6 The Kloosterman Hecke eigenobject

Prove that `A = (A_γ)_γ` is a Hecke eigenobject: there is an exact tensor functor
`Kl_H^rig(ψφ) : Rep(H) → F-Isoc†(X/K)` and isomorphisms `Hk_W(A) ≅ A ⊠ Kl_W^rig`, compatible with fusion
and all intertwiners; each `Kl_W^rig` has rank `dim W` and is pure of weight zero; in the base-point
formula the canonical map from `!`-pushforward to `+`-pushforward is an isomorphism. The same holds in the
`ℓ`-adic theory, giving `Kl_H^{ét,ℓ}(ψφ)` (HNY Theorem 1, p. 261), and in the de Rham theory, giving an
`H`-connection `Kl_H^dR(λφ)` on `X_K` for `λ ∈ K^×` (HNY §2.6; Xu–Zhu Theorem 4.1.5, §§4.1.6–4.1.8 and
§4.1.13, pp. 39–42). Route: extract the eigenvalue by the equivalence of §1.4 and prove holonomicity
using the affineness of `pr₂` restricted to the big cell; prove smoothness from ULA of `IC_W` and the identity-morphism consequence of §1.2;
use fusion for tensor compatibility; deduce purity from cleanness and the weight theory of §1.1.
*Needs:* §§1.2–1.5; DeligneWeightsAndPurity §§8.5, 8.12 in the `ℓ`-adic theory.

**Checks.**

- The unit representation has eigenvalue the constant rank-one object, and the evaluation
  `W ⊗ W^∨ → 1` is carried to the evaluation morphism, not merely to an object of the right rank.
- Smoothness uses ULA of the Satake kernel with the nonsmooth automorphic factor `A`; ULA of `A` alone is
  false at the boundary of the big cell.
- For `H = SL₂` and `W` standard, the degree-one normalized trace of `Kl_W^rig` at `a ∈ k^×` is
  `−R₂(a)/c_q`, matching the normalization of §0.1.

### 1.7 The tame-character variant

For a character `χ : T(k) → K^×` and a splitting `s : T ⋊ Ω ≅ T̃`, use on the `γ` chart of
`Bun_G(1,2)` the object `K_{χ_γ} ⊠ A_ψφ` with `χ_γ = χ ∘ Ad γ`, where `K_χ` is the Kummer object of
§RD.6.47. Prove that its clean extension is a Hecke eigenobject with `H`-valued eigenvalue
`Kl_H(ψφ, χ, s)` in the `ℓ`-adic and arithmetic theories, pure of weight zero, and that
`Kl_H(ψφ, 1, s) = Kl_H(ψφ)` for every `s` (Xu–Zhu §4.1.11, pp. 41–42; HNY Remark 2.5, Definition 2.6 and
Definition 2.11, pp. 257, 260). In the de Rham theory use a Lie-torus exponent `η ∈ Lie(T)^*` and the
algebraic Kummer object; a comparison with the arithmetic variant requires a rational exponent lifting
`χ` through the rank-one dictionary, and is not available from an integral exponent (Xu–Zhu §4.1.13,
p. 42, corrected). *Needs:* §§0.3, 1.6; PadicDifferentialEquationsAndRigidCohomology §RD.6.47.

- With `χ = 1` and exponent `0` the construction is that of §1.6, independently of `s`.
- The restriction to the `γ` chart is `K_{χ∘Ad γ} ⊠ A_ψφ` with the fixed shift.
- Changing the splitting transports the eigenvalue by the resulting torus-character cocycle; no
  independence is asserted for nontrivial `χ`.
- Changing a rational Kummer exponent by an integral character gives an algebraic gauge isomorphism
  that must be transported with the Frobenius; the induced tame character depends only on the class
  modulo integers.

**Checks.**

- For `χ = 1` the rational exponent `0` gives the base construction.
- Over `𝔽₅`, the order-four Teichmüller character needs an exponent with denominator `4`; the integral
  exponent `1` gives trivial algebraic monodromy.
- For `G = PGL₂` and the nontrivial `γ ∈ Ω`, which acts on `T` by inversion, replacing `χ_γ` by `χ`
  gives the wrong character on that component.

### 1.8 Closed-point comparison of traces

Under a fixed isomorphism `K̄ ≅ ℚ̄_ℓ`, `ℓ ≠ p`, prove that for every `W ∈ Rep(H)` and every closed point `a`
of `X`, the characteristic polynomials of Frobenius of `Kl_W^rig(ψφ, χ, s)` and `Kl_W^{ét,ℓ}(ψφ, χ, s)` at
`a` agree (Xu–Zhu §4.1.12, p. 42). Route: compute both trace functions over every finite extension by the
base-point formula of §1.5 and the trace formulas of gap:arithmetic-d-module-operations and
EtaleCohomologyFoundations, which apply to the same correspondence and coefficients; recover the
characteristic polynomials from traces of all powers. *Needs:* §§1.5–1.7; gap:arithmetic-d-module-operations.

**Checks.**

- Agreement over `k` alone does not determine a characteristic polynomial of rank `≥ 2`: two rank-two
  Frobenius classes with equal trace and different determinant are separated over `k₂`.
- In rank two the comparison at `a = 1`, `q = 3` reads `1/√3` on both sides, after the half twist.
- The de Rham object of §1.6 carries no Frobenius; it enters the comparison only through Layer 3.

### Examples

- For `H = SL₂`, `Kl_{Std}^{ét}` is the normalized rank-two Kloosterman sheaf of
  KloostermanMomentsAndPotentialAutomorphy §§1.1, 1.3, and `Kl_{Std}^dR(λφ)` is the rank-two Bessel
  connection with parameter `λ²` of §§2.1, 2.5–2.6.
- For `H = SO₃ ≅ PGL₂`, `Kl_{SO₃,Std} ≅ Kl_{SL₂,Sym²}` (Xu–Zhu (4.1.9.1)).

### Dependencies

Layer 0; GlobalShtukasAndFunctionFieldLanglands §§0.1, 1.1–1.9 and gap:relative-level-geometry;
gap:arithmetic-d-module-operations; SpringerResolutionAndCharacteristicCycles Layer 9;
PadicDifferentialEquationsAndRigidCohomology §§RD.6.42, RD.6.47; DeligneWeightsAndPurity DWP.8;
EtaleCohomologyFoundations.

## Layer 2: The Frenkel–Gross connection and Zhu's comparison

This layer works over a field `K` of characteristic zero. It defines the Frenkel–Gross connection
from the pinning, matches its parameter with the generic functional of §0.2, and identifies it with
the de Rham Kloosterman eigenvalue through the Bessel oper slice and critical-level localization at
the two-point level, descending from the adjoint group to every split reductive group. Its last
target is the differential Galois group of the connection.

### 2.1 The Frenkel–Gross connection

Let `H` be split reductive over `K` with pinning `(B̌, Ť, {e_i})`, `N = Σ_i e_i`, and choose in each simple
factor `H_j` of the derived group a nonzero lowest-root vector `E_j`, with `h_j` the Coxeter number of
`H_j`. For `λ ∈ K` put `A_λ = N + x Σ_j λ^{h_j} E_j`. The *Frenkel–Gross connection* is the connection
`Be_H(λ) = d + A_λ dx/x` on the trivial `H`-bundle over `𝔾_{m,K}`, viewed as the tensor functor
`Rep(H) → Conn(𝔾_{m,K})`, `W ↦ (O ⊗ W, d + dρ_W(A_λ) dx/x)` (Frenkel–Gross §§5–6, pp. 8–14; Xu–Zhu
§4.3.1, pp. 46–47, and (1.2.2.2), p. 5). The central torus contributes the zero connection.
*Needs:* ReductiveGroups Layers 1, 9; FormalConnectionsOpers F2 (connections on torsors and gauge
forms).

- In a representation `W` the connection matrix is `dρ_W(A_λ) dx/x`, and every intertwiner of
  `H`-representations is horizontal.
- On `W ⊗ W′` the connection operator is the sum of the two factor operators; the unit is `(O, d)`.
- On `W^∨` the matrix is the negative transpose, and evaluation `W^∨ ⊗ W → 1` is horizontal.
- In an almost-simple factor, rescaling `λ` multiplies the degree-`h` invariant of `A_λ` by `λ^h`; for
  `H = SL_r` and `W` standard, `Be_H(λ)` is the rank-`r` Bessel connection of Xu–Zhu (1.1.1.3), the
  cyclic operator with superdiagonal ones and lower-left entry `λ^r x`
  (KloostermanMomentsAndPotentialAutomorphy §2.6, Bessel dictionary).

**Checks.**

- For `H = 𝔾_m` and any character the connection is `d`.
- For `H = SL₂` with `N = E₁₂`, `E = E₂₁`: `A_λ = [[0, 1], [λ² x, 0]]`.
- For `SL₂ × SL₃` the affine terms are `λ² x E₂₁` and `λ³ x E₃₁`; a common exponent `λ²` in both factors
  gives a connection that is not the pushout of the factorwise ones.

### 2.2 The dual invariant parameter

Prove that the invariant quotient `V^*//T` (§0.2) and the quotient `𝔥_aff(1)//Ť` of the degree-one part of
the affine Lie algebra of `H` are canonically identified through their equal images in the Hitchin base,
and that after the pinning both are the product of the lowest-root parameter lines `⊕_j x·𝔥_{−θ_j}`. For
almost-simple `G`, a functional `φ` and a lowest-root vector `E` match when `P_h(λφ) = λ^h P_h(φ)` equals the
degree-`h` invariant `P̌_h(N + x E)`, with all invariant generators matched through the Cartan duality
`(Lie T)^* = Lie Ť` (Xu–Zhu Theorem 4.3.3 and §4.3.4, (4.3.3.1)–(4.3.4.2), pp. 47–48).
*Needs:* §§0.2, 2.1; ReductiveGroups Layer 7 (Chevalley restriction).

**Checks.**

- For `SL₂ × SL₃`, rescaling `φ` by `λ` scales the two invariant coordinates by `λ²` and `λ³`.
- Independent scalar normalizations of the invariant generators on the two sides are excluded: for
  `SL₂` the matching `P₂(φ) = P̌₂(N + xE)` fixes `E` up to the `T_ad`-orbit of `φ`.
- For a torus both quotients are points and the matching is empty.

### 2.3 The Bessel oper slice

For `H_ad` almost simple, let `Op_{H_ad}(𝔾_m)_{(0, ϖ(0)), (∞, 1/h)}` be the space of `H_ad`-opers on `𝔾_m` with
regular singularity of residue class `ϖ(0)` at `0` and formal slope at most `1/h` at `∞`, in the
principal-graded normal form of FormalConnectionsOpers F4. Prove that it is an affine line, a torsor
under `x·𝔥_{−θ}` with a distinguished tame point, and that its point `xE` is the oper
`d + (N + xE) dx/x` (Zhu Lemma 20, pp. 21–22; Xu–Zhu §4.3.5, pp. 48–49). For semisimple `H_ad` take the
product over the simple factors. The residue condition at `0` is part of the definition.
*Needs:* §§2.1–2.2; FormalConnectionsOpers F4, F6.

- The point `xE` gives the principal-graded oper `d + (N + xE) dx/x`, and these exhaust the slice.
- At `E = 0` the distinguished point is regular singular at both ends.
- Functions on the slice carry the oper filtration, with associated graded the invariant polynomial
  algebra on affine-generic parameters.
- Two points of the slice have the same normal form exactly when their invariant parameters agree.

**Checks.**

- For `H = PGL₂` the slice has one parameter and is `𝔸¹` after fixing the root vector.
- The origin lies in the slice but is not generic: it is regular singular at `∞`, while a generic point
  has slope exactly `1/h` there.
- An oper with a different regular-singular residue at `0` is excluded even when its slope at `∞` is
  `≤ 1/h`.

### 2.4 Critical-level localization at the two-point level

Let `X` be a smooth projective curve over an algebraically closed field of characteristic zero, `𝒢` a
smooth affine group scheme over `X` with connected fibres and adjoint dual at the unramified points, and
assume `ω_{Bun_𝒢}^{1/2}` exists. For each unramified point the critical center `z_x` acts on the vacuum
module, and localization gives `h : Fun Op_{H}(U) → Γ(Bun_𝒢, D′)` into global critically twisted
differential operators, a filtered map whose associated graded is the classical Hitchin map. For
commutative subalgebras `A_y ⊂ End(Vac_y)` at the ramified points containing the image of `Z_y`, let `A`
be the image of `A_H(U) ⊗ ⊗_y A_y` in `Γ(Bun_𝒢, D′)`. Prove: if `D′` is flat over `A`, then for every
`χ ∈ Spec A` the module `ω^{−1/2} ⊗ (D′ ⊗_{A, χ} K)` is a Hecke eigensheaf whose eigenvalue is the
`H`-local system of the oper underlying `χ` (Zhu Theorem 8 and Corollary 9, pp. 8–10, recording
Beilinson–Drinfeld §§5.5 and 7.8). *Needs:* AffineLieAlgebras A7–A8; FormalConnectionsOpers F4, F6;
SpringerResolutionAndCharacteristicCycles Layer 9; gap:critical-center-rational-forms; §§1.1, 1.3.

**Checks.**

- For the constant group scheme the flatness holds and `A = Fun Op_H(X)` (Beilinson–Drinfeld); for
  `G(0,2)` the image of `Fun Op_H(X)^𝒢` alone is too small to give a holonomic module, which is why the
  ramified algebras `A_y` are added.
- Flatness is a hypothesis: without it only the derived tensor product is a Hecke eigenobject, and it
  can fail to be concentrated in degree zero.
- The eigenvalue is attached to the oper `π(χ)`, not to `χ`: two points of `Spec A` over the same oper
  give eigensheaves with the same eigenvalue.

### 2.5 The quantized Hitchin identification

For the level `G(0,2)` over `ℙ¹` and almost-simple adjoint `H`, prove that the invariant algebra
`U(Lie V)^T` is canonically identified with functions on the Bessel oper slice of §2.3, compatibly with
filtrations and with its action on `Bun_G(0,2)` by global twisted differential operators; that the
associated graded recovers the invariant-parameter comparison of §2.2; that the moment map
`T^*Bun_G(0,2) → V^*` is flat, so that `D′` is flat over the resulting `A`; and that localization at a generic
character gives a nonzero holonomic eigenobject whose big-cell restriction is the exponential object
`A_ψφ` (Zhu Lemmas 18–21 and the final localization argument, pp. 20–23; Xu–Zhu §4.3.5, (4.3.5.1),
pp. 48–49). *Needs:* §§2.2–2.4, 1.4; gap:critical-center-rational-forms.

**Checks.**

- The associated graded map is the classical Hitchin invariant map of §2.2.
- The flatness hypothesis of §2.4 is verified through the flatness of the moment map (Zhu Lemma 18); a
  generic localization alone need not be holonomic or nonzero.
- For `H = PGL₂`, `U(Lie V)^T` is a polynomial ring in one variable, matching the one-parameter slice.

### 2.6 Central descent from the adjoint group

Let `H → H_ad` be the adjoint quotient of a split reductive group in characteristic zero.
For semisimple `H` over an algebraically closed field, prove that two lifts with a specified
identification of their adjoint connections and unipotent monodromy at `0` differ by a finite
`Z(H)`-torsor with connection. It extends across `0` to `𝔸¹` and is trivial there; hence the
lifts are geometrically isomorphic, with their isomorphisms a torsor under `Z(H)` (Xu–Zhu
§4.3.6, p. 49). Over a general coefficient field `K`, the extended torsor can be constant
and nontrivial: require a compatible `K`-rational marking of its fibre at `0` to obtain its
unique trivialization respecting that marking. For reductive `H`, treat `Z(H)°` separately:
the trivial tame datum fixes its rank-one factors to be trivial connections, and recover `H`
through `(H_der × Z(H)°)/(H_der ∩ Z(H)°)`. *Needs:* §2.1; ReductiveGroups Layer 7.

**Checks.**

- For `SL₂`, unipotence at `0` excludes the Kummer torsor `√x`; it does not exclude the constant torsor `Spec K(√a) × 𝔸¹` for nonsquare `a ∈ K^×`, whose fibre at `0` has no `K`-point.
- Conjugating the rank-two Bessel matrix by `P = diag(a,1)` gives the same projective connection. Its horizontal intertwiners are `cP`; an `SL₂` intertwiner needs `c²a = 1`. A nonsquare `a` fails the marking, whereas `a = b²` admits `c = b^{−1}`.
- For `GL₂`, the kernel is `𝔾_m`, not finite; fixing the trivial determinant is essential. For a torus the trivial datum gives only trivial connections.

### 2.7 Zhu's comparison

For a generic functional `φ` over `K` and `λ ∈ K^×`, with matched parameters (§2.2), prove an isomorphism of
tensor functors `Kl_H^dR(λφ) ≅ Be_H(λ)` to algebraic connections on `𝔾_{m,K}`, for trivial tame character
(Xu–Zhu Theorem 4.3.3 and §§4.3.5–4.3.6, pp. 47–49; Zhu §5, p. 23). Route: for adjoint `H` over `K̄`,
identify the localized eigensheaf of §2.5 with the clean extension of its big-cell restriction by
§1.4, so its eigenvalue is `Kl_H^dR`; compare with the oper, which is `Be_H`.
The rational descent target is to construct this tensor comparison from the normalized localization
map of §2.5 and its specified exponential identification on every big cell, both over `K`,
and prove that its Galois conjugates agree with it: the clean-extension equivalence determines
the normalized eigensheaf map, Hecke compatibility determines its eigenvalue maps, and the
induced marking of the finite central comparison torsor at `0` must be `K`-rational. Prove
these assertions before applying Galois descent and §2.6. This retains the comparison over `K`;
geometric existence and definition of the two functors over `K` alone do not imply it.
*Needs:* §§1.4, 1.6, 2.2, 2.5, 2.6.

**Checks.**

- The big-cell restriction of the localized object is the exponential object of §1.4, with `E_{−π}`
  replaced by `E_λ`.
- For a nonsemisimple `H` the torus is treated before the finite central kernel; the normalized comparison has Galois cocycle `1`. The nonsquare conjugate in §2.6 lacks that rational marking and cannot be substituted for it.
- For `H = SL_r` and `W` standard the comparison is the classical identity `Be_r ≅ Kl_r^dR` of Xu–Zhu §1.1.1,
  checked on the solution functional of the cyclic module, `Σ_{m ≥ 0} (λ^r x)^m/(m!)^r`. A horizontal first coefficient of the original column connection is instead `Σ_{m ≥ 0} ((−1)^r λ^r x)^m/(m!)^r`: for `r = 3`, `λ = 1` these begin `1 + x + x²/8` and `1 − x + x²/8`; substituting the first into the horizontal equation leaves coefficient `2` at `x` (KloostermanMomentsAndPotentialAutomorphy §2.6).

### 2.8 The Frenkel–Gross monodromy

For almost-simple `H` over an algebraically closed field of characteristic zero, prove that the
differential Galois group of `Be_H(λ)`, `λ ≠ 0`, is connected and, up to central isogeny, is given by the
table `A_{2n} → A_{2n}`; `A_{2n−1}, C_n → C_n`; `B_n, D_{n+1} → B_n` for `n ≥ 4`; `B₃, D₄, G₂ → G₂`;
`E₆, F₄ → F₄`; `E₇ → E₇`; `E₈ → E₈`. The reductions `A_{2n−1} → C_n`, `D_{n+1} → B_n`, `E₆ → F₄` and
`D₄ → G₂` come from pinned fixed groups (triality for `D₄`). The inclusion `G₂ ⊂ B₃`
instead is its seven-dimensional orthogonal representation: the matrices `N,E` lie in `𝔤₂`
and preserve its invariant alternating three-form (Frenkel–Gross §6, Case IV, p. 13;
§13, Corollary 10, p. 28). The central form in every row is the image in `H` of the
simply connected group of the displayed type. The connection is principal unipotent at `0`, and the intermediate extension of its adjoint
local system to `ℙ¹` has vanishing cohomology in every degree (Frenkel–Gross Theorem 1, p. 16,
Proposition 8 and Corollaries 9–10, pp. 27–29; Xu–Zhu table (1.2.6.1), p. 6, and §4.5.1, p. 51).
Route: the formal Coxeter type at `∞` and principal unipotence at `0` force a connected reductive group
containing a principal `SL₂`; apply gap:principal-sl2-subgroups; the fixed-group symmetries and the exceptional seven-dimensional inclusion give the upper
bounds in the smaller rows. Prove adjoint rigidity directly in characteristic zero using the
algebraic de Rham boundary exact sequence, duality and the formal index computation of
Frenkel–Gross §§7–10 and §14, Proposition 11, pp. 14–22 and 29–30: for `V = Lie H`,
`H⁰ = H² = V^{G_alg} = 0`, `Irr_∞(V) = r`, `dim V^{I₀} = r`, and
`dim V^{I_∞} = 0`, so `h¹ = r − r − 0 = 0`. The two local terms in (14.1) are at
`0` and `∞`, as the boundary sequence immediately preceding it shows. For a proper
monodromy subgroup decompose the adjoint into its adjoint and the complementary
constituents and apply the same computation (Frenkel–Gross §14, pp. 30–31).
*Needs:* §2.1; SpringerResolutionAndCharacteristicCycles Layer 9 (algebraic de Rham operations and duality); gap:principal-sl2-subgroups; KloostermanMomentsAndPotentialAutomorphy §2.5
(differential Galois group) for the rows `A_n` and `C_n`; OrthogonalSpinGroups Layers 0–1.

**Checks.**

- For `SL₂` adjoint rigidity gives `h¹ = 1 − 1 − 0 = 0`; counting the zero-place invariants twice gives `−1`. `SL₃` has characteristic-zero group `SL₃`; the group `SO₃` that appears at `p = 2` in §11.4 is not
  substituted here.
- `G₂ ⊂ SO₇` and `SO₇` have the same seven-dimensional standard connection; the group is `G₂` and the
  ambient central form is retained. Here `dim G₂ = 14 < 21 = dim SO₇`, while `B₃` has no nontrivial diagram automorphism. For `D₄`, actual triality has fixed group `G₂` of dimension `14 < 28`.
- The row is `D_{n+1} → B_n` for `n ≥ 4`; the index `D_{2n+1}` printed in Frenkel–Gross Corollary 10 (p. 28)
  contradicts the inclusion `so_{2n+1} ⊂ so_{2n+2}` displayed before it, and `D₄` is the separate `G₂` row.

### 2.9 Central and pinned symmetries

For `(a, σ) ∈ 𝔾_m × Aut(G,B,T)`, define `r_{a,σ} : V → V` by loop
rotation followed by the automorphism of the based group. In the affine-root coordinates
with local loop parameter `t = 1/x`, its rotation part fixes every finite simple-root
coordinate and multiplies the coordinate `t e_{−θ_j}` in each factor by `a`; its second
part is the actual root-line map induced by `σ` (including its scalar on the lowest-root
line). For pinned `σ`, the finite simple lines are permuted with their pinned coordinates;
for `σ = Ad(s)`, the coordinate on a root line `α` is multiplied by `α(s)`.
Rotation commutes with these root-line maps, so `r_{a,σ} r_{b,τ} = r_{ab,στ}`.
The induced pullback on generic functionals is `φ ↦ φ ∘ r_{a,σ}`; it preserves genericity.
This action is distinct from the logarithmic derivation `δ = x d/dx`.
Prove: (i) for a homomorphism `G′ → G` inducing an isomorphism of adjoint groups and of root-depth
quotients, the dual map `H → H′` pushes `Kl_H` to `Kl_{H′}` in each theory; (ii) for `(a, σ) ∈ 𝔾_m(k) × Aut(G, B, T)`, `Kl_{H, W}(ψ(φ ∘ r_{a,σ})) ≅ a^* Kl_{H, ι(σ^{−1}) W}(ψφ)`, compatibly with tensor structures; (iii) the
eigenvalue depends only on the `T_ad`-orbit of `φ`, and replacing `ψ` by `ψ(a ·)` pulls back by `x ↦ a^h x`; (iv) for
almost-simple `G` not of type `A_{2n}`, or for `p = 2`, every outer automorphism preserves `Kl_H(ψφ)`, while for
type `A_{2n}` and `p > 2` the outer involution gives `Kl_{H,W} ≅ (−1)^* Kl_{H, W^∨}`; (v) the exceptional
identities `Kl_{SL₂, Sym²} ≅ Kl_{SO₃, Std}`, `Kl_{Sp₄, ker(Λ² → 1)} ≅ Kl_{SO₅, Std}`,
`Kl_{SO₄, Std} ≅ Kl_{SL₂ × SL₂, Std ⊠ Std}` and `Kl_{SO₆, Std} ≅ Kl_{SL₄, Λ²}` (Xu–Zhu §§4.1.9–4.1.10,
(4.1.9.1)–(4.1.10.5), pp. 40–41). *Needs:* §§0.2, 1.6, 2.7; §1.3 (the action of `Aut(G)`).

**Checks.**

- `r_{1,id}` is the identity. For `SL₂` and `φ(v₁,v₀) = b₁v₁ + b₀v₀`, rotation gives `b₁v₁ + ab₀v₀`, so the invariant product becomes `a b₁b₀`; scaling both coordinates would give `a²b₁b₀`.
- Two rotations by `a,b` give `v₀ ↦ abv₀`, agreeing with `r_{ab,id}`. The scalar on the lowest-root line is retained under a pinned outer involution in type `A_{2n}`.
- A map `G′ → G` of automorphic groups induces `H → H′` in the opposite direction.
- `SO₄` is handled through `SL₂ × SL₂` and the tensor product; there is no almost-simple `D₂`.
- For `H = SL₃` and `p` odd, (iv) relates `Kl_{Std}` to the pullback by `x ↦ −x` of `Kl_{Std^∨}`; at `p = 2` the
  pullback is the identity and `Kl_{Std} ≅ Kl_{Std^∨}`.

### Examples

- `H = SL₂`: `Be_H(λ) = d + [[0, 1], [λ² x, 0]] dx/x`, differential Galois group `SL₂`.
- `H = SO₇`: the group is `G₂`, embedded through the seven-dimensional representation.

### Dependencies

Layers 0–1; ReductiveGroups Layers 1, 7, 9; FormalConnectionsOpers F2, F4, F6; AffineLieAlgebras
A7–A8 and gap:critical-center-rational-forms; SpringerResolutionAndCharacteristicCycles Layer 9; KloostermanMomentsAndPotentialAutomorphy §§2.1, 2.5–2.6;
gap:principal-sl2-subgroups; OrthogonalSpinGroups Layers 0–1.

## Layer 3: The relative de Rham–rigid comparison

This layer works over the complete discrete valuation ring `R` of the coefficient datum. Its comparisons
forget Frobenius and use `π` but not `c_p`, so `R` may be taken to be `W(k)[π]`, whose residue field is `k`
because `π` is a root of the Eisenstein polynomial `x^{p−1} + p`; the results then extend to the coefficient
field of §0.1 by finite coefficient extension (§0.1). It compares
the analytification of the de Rham eigenvalue with the rigid eigenvalue, first for minuscule and
quasi-minuscule representations by relative cohomology of the bounded Hecke family, then for all
representations through tensor generators. The main comparison has trivial tame character.

### 3.1 Relative specialization for the bounded Hecke family

For a representation `W` with `Gr_{≤W}` smooth or with a resolution, put `d = dim Gr_W`, let
`p₂° : GR_W° → X` be the open part of the bounded Grassmannian over the big cell (§1.5), base-changed
over `R` through gap:relative-level-geometry, and let `GR_W°° ⊂ GR_W°` be its smooth locus (all of
`GR_W°` when `Gr_{≤W}` is smooth), with the good compactification `Gr_{≤W, ℙ¹} → ℙ¹` (respectively
`G̃r_{≤W} × ℙ¹ → ℙ¹` from the resolution). The coefficient is Satake-normalized: on `GR_W°°` put
`M = p₁^+ E_{−π}[d]` in the de Rham theory and `M = p₁^+ A_ψ[d]` in the arithmetic theory, with the half
twist `(d/2)` added when Frobenius is kept. Here `p₁^+` of a smooth coefficient is its unshifted pullback
as a connection (respectively overconvergent isocrystal), and a smooth object on a smooth scheme of
dimension `e` lies in the holonomic heart only after the shift `[e]` (Xu–Zhu §2.3.4, (2.3.4.1)–(2.3.4.2),
p. 15). Since `IC_W` is constant on `GR_W°°` with shift `[d]` and twist `(d/2)` (§§1.3, 1.5), `M` is the
restriction of `p₁^+ A_ψ ⊗ IC_W`; its restriction to the `d`-dimensional smooth part of a fibre over a
point of `X` lies in the holonomic heart, while on the `(d + 1)`-dimensional total space it is `M[1]` that
does. In the same way the eigenvalue `Kl_W` is a connection (respectively overconvergent isocrystal) on
the curve `X`, and its holonomic object is `Kl_W[1]` (Xu–Zhu §4.2.2 and §4.2.5, pp. 43–44). Construct the
relative specialization map from relative twisted de Rham cohomology of `(GR_W°°)_K` with coefficient `M`
to relative rigid cohomology of `(GR_W°°)_k` with coefficient `M` (both computed by derived direct image
of the relative de Rham complex, as `GR_W°°` need not be affine over `X`), as a morphism of these
derived direct images that induces, on each cohomology object `ℋ^k` for the holonomic t-structure on
`X`, a horizontal map of `A†`-modules on `𝔾_m`. When `GR_W°°` is not affine over `X` (the quasi-minuscule
case of §3.3) the derived direct images are not concentrated in one degree, and only the map on `ℋ⁰` of
the direct images shifted by the curve shift `[1]` is used. Here `A†` is the ring of functions on `ℙ¹` overconvergent along `{0, ∞}` (Xu–Zhu §2.3.7,
(2.3.7.2), and §4.2.4, (4.2.4.1), pp. 15–16 and 43–44). Prove that the dagger-to-completed ring map
`A† → A₀` is faithfully flat, so that an isomorphism after `⊗ A₀` descends, and that the fibre of the
map at an `R`-point after any finite extension of `R` is the absolute specialization map of
PadicDifferentialEquationsAndRigidCohomology §RD.4.58. *Needs:* §§1.3, 1.5–1.6; §RD.4.58, §RD.4.59,
§RD.3.8; gap:relative-level-geometry.

- The relative map is `D_{X_K}`-linear and horizontal after `⊗ A†`.
- Its formation commutes with finite extension of `R` and with restriction to opens of `X`.
- Its fibre at a lifted closed point is the absolute specialization map of §RD.4.58.

**Checks.**

- For `W = 1` the family is `X` itself and the map is the identity of `A†`.
- The fibre test must run over every rigid point after finite extension of the residue field and of
  `R`; `R`-points alone miss closed points of degree `> 1`.
- The support and ordinary specialization maps go in opposite directions (§RD.4.59); the comparison
  uses the square, not an inverse of either map.

### 3.2 The minuscule comparison

For generic `φ` over `R` and minuscule `W`, prove that the relative specialization map induces an
isomorphism of connections `(Kl_W^dR(−πφ))† ≅ Kl_W^rig(ψφ)`. On each lifted closed-point fibre, with the
Satake-normalized coefficient `M` of §3.1 (for minuscule `W`, `IC_W` is the constant object shifted by
`d` and twisted by `d/2`, so `M = p₁^+ A_ψ ⊗ IC_W`), the
compact-to-ordinary square and cleanness (§1.4) identify cohomology in degree zero, all other degrees
vanish, and the common dimension is `dim W` (Xu–Zhu Lemma 4.2.3 and §4.2.4, (4.2.4.1)–(4.2.4.2),
pp. 43–44). Route: the minuscule Schubert variety is a smooth projective partial flag variety, so the
fibre has a smooth compactification with divisorial boundary and §RD.4.59 applies; surjectivity of
specialization plus equality of dimensions gives the fibre isomorphism; faithful flatness descends it.
*Needs:* §3.1; §§1.4, 1.6; PadicDifferentialEquationsAndRigidCohomology §RD.4.59.

**Checks.**

- The fibre cohomology with coefficient `M` vanishes outside degree zero and has dimension `dim W` there. For
  `H = SL₂` and `W` standard (`d = 1`) this is `2` in degree `0`; the unshifted coefficient `p₁^+ A_ψ` would
  put the two-dimensional space in degree `1` and nothing in degree `0`.
- A rigid point not rational over `K` is tested after its finite extension, and the conclusion descends.
- For `H = SL₂` and `W` standard both sides have rank two and the comparison is the rank-two case of
  §2.7 after analytification.

### 3.3 The quasi-minuscule middle image

For quasi-minuscule `W`, the closed Schubert variety `Gr_{≤W}` has an isolated singular point (the
vertex) and a resolution `G̃r_{≤W}`; let `τ : GR_W°° → X` be the smooth part of the family, `j : GR_W°° → GR_W°`
the open immersion, `i : Z → GR_W°` the complementary vertex section (`Z ≅ X`, `p₂° ∘ i = id`), and `M` the
Satake-normalized coefficient of §3.1, so that `j_{!+}(M) ≅ p₁^+ A_ψ ⊗ IC_W` on `GR_W°` (with `p₁^+ E_{−π}` in
the de Rham theory). Write `ℋ^k` for the cohomology objects of the holonomic t-structure on `X`, and recall
that `Kl_W[1] = p°_{2,+}(j_{!+}(M))[1]` lies in the heart (§1.6, `p₂°` being affine on the big cell and
clean). Over a point `s` of `X` write `Y_s` for the fibre of `GR_W°`, `U_s` for its smooth part of dimension
`d = dim Gr_W`, and `M_s` for the restriction of `M`, which is `p₁^+ A_ψ[d]` on `U_s` (twisted by `(d/2)` when
Frobenius is kept) and lies in its holonomic heart (Xu–Zhu §4.2.5, p. 44). Prove, in both the de Rham and
the rigid theories: (i) for every point `s` of `X`, the image of the forget-supports map
`H^*_c(U_s, M_s) → H^*(U_s, M_s)` is `H^*(Y_s, j_{!+}(M_s))`, through the factorization
`H^0_c(U_s, M_s) ↠ H^0_c(Y_s, j_{!+}(M_s)) ≅ H^0(Y_s, j_{!+}(M_s)) ↪ H^0(U_s, M_s)`, and it is concentrated in
degree zero, of dimension `dim W`; (ii) the cone `C` of `j_{!+}(M)[1] → j_+(M)[1]` is `i_+ i^!(j_{!+}(M))[2]`,
supported on `Z` and in holonomic degrees `≥ 0` (Xu–Zhu Corollary 2.6.2(i), p. 19), hence
`ℋ^k(τ_+(M)[1]) = 0` for `k < 0`, the map `Kl_W[1] → ℋ⁰(τ_+(M)[1])` is injective with cokernel
`ℋ⁰(i^!(j_{!+}(M))[2])`, and `ℋ^k(τ_+(M)[1]) ≅ ℋ^k(i^!(j_{!+}(M))[2])` for `k ≥ 1`; dually
`ℋ⁰(τ_!(M)[1]) → Kl_W[1]` is surjective, so `Kl_W[1]` is the image of `ℋ⁰(τ_!(M)[1]) → ℋ⁰(τ_+(M)[1])`.
The complex `τ_+(M)[1]` is not in the heart (Checks). Route: the localization triangles along the vertex
section and at the vertex of `Y_s`, the support and cosupport conditions that characterize `j_{!+}`
(Xu–Zhu Corollary 2.6.2(i)), cleanness of `p₂°` (§§1.4, 1.6) and `p₂° ∘ i = id`; no affineness of `τ` is
used. Xu–Zhu Lemma 4.2.6(i) (p. 44) asserts that `τ_+(M)[1]` is holonomic, deducing it from an asserted
affineness of `τ`; `τ` is not affine and that conclusion fails as well (Checks), so (ii) replaces the whole
of that lemma. The quasi-minuscule comparison (§3.4) uses only the degree-zero map
`Kl_W[1] → ℋ⁰(τ_+(M)[1])` of (ii), as in Xu–Zhu (4.2.7.1), p. 45. *Needs:* §§1.1, 1.3, 1.4, 1.5, 1.6, 3.1;
SpringerResolutionAndCharacteristicCycles Layer 9 (§9.6, intermediate extension);
gap:arithmetic-d-module-operations.

**Checks.**

- In the simplest case `G = PGL₂` the projective quasi-minuscule Schubert surface has a vertex neighbourhood isomorphic to the affine quadric cone `Spec K[u,v,w]/(uv−w²)`, whose
  punctured chart is not affine; the middle image still has dimension `3 = dim W` for the adjoint `W`.
- The Satake shift is part of the statement. For `G = PGL₂` (`d = 2`) the normalized coefficient gives
  middle-image dimensions `3` in degree `0` and `0` in degree `2`; the unshifted `j_{!+}(p₁^+ A_ψ)` moves the
  three-dimensional space to degree `2`, leaving `0` in degree `0`. On the curve it is
  `Kl_W[1] = p°_{2,+}(j_{!+}(M))[1]` that lies in the heart; `τ_+(M)[1]` does not: for `PGL₂` its `ℋ⁰` has
  rank `3` and its `ℋ¹` rank `1`, the fibre dimensions of the next Check. In (ii), `j_{!+}(M)` is a rank-one
  smooth object in ordinary degree `−2` near the vertex section, which has codimension `2` in a rationally
  smooth threefold, so `i^!(j_{!+}(M))[2]` is a rank-one smooth object on `Z` in ordinary degree `0`, that is,
  in holonomic degree `1` (up to Tate twist): the cokernel in degree `0` vanishes and `ℋ¹(τ_+(M)[1])` has
  rank `1`.
- Extension by zero has no vertex stalk: for `i` the vertex of `Y_s`, `i^+ j_!(M_s) = 0`. For `G = PGL₂` the
  coefficient `p₁^+ A_ψ` is a rank-one smooth object across the vertex, and the cone is the quotient of
  `𝔸²` by `μ₂` acting by `−1` (an étale double cover off the vertex for odd `p`, radicial for `p = 2`), so
  with characteristic-zero coefficients `j_{!+}(M_s)` is `p₁^+ A_ψ[2]` near the vertex, up to the half twist. The vertex stalks
  in degree `−2` therefore have dimensions `0` for `j_!` and `1` for `j_{!+}`. The localization triangle
  `j_!(M_s) → j_{!+}(M_s) → i_+ i^+ j_{!+}(M_s)`, with the concentration of `H^*(Y_s, j_{!+}(M_s))` in (i), then gives
  `H^{−1}_c(U_s, M_s)` of dimension `1` besides `H^0_c(U_s, M_s)` of dimension `3`; dually `H^0(U_s, M_s)` has
  dimension `3` and `H^1(U_s, M_s)` dimension `1`. Only the intermediate extension is concentrated in
  degree zero; the image of `H^*_c(U_s, M_s) → H^*(U_s, M_s)` is the three-dimensional space in degree `0`, as
  (i) says, although neither side is concentrated in one degree.
- `τ` is not affine in any quasi-minuscule case, and `ℋ^{d−1}(τ_+(M)[1]) ≠ 0` with `d − 1 ≥ 1`. On a fibre,
  `H^{d−1}(U_s, M_s)` is the degree-`d` costalk of `j_{!+}(M_s)` at the vertex, which is dual to the lowest
  stalk cohomology of the intersection complex there and so is nonzero; Artin vanishing would put the
  cohomology of the heart object `M_s` on an affine `U_s` in degrees `≤ 0`. Near the vertex section the family
  is a product of `X` with the Schubert variety, so the same costalk gives `ℋ^{d−1}(i^!(j_{!+}(M))[2]) ≠ 0`.
- The statement is fibrewise over every closed point of `X`, including after finite residue extension.

### 3.4 The quasi-minuscule comparison

For quasi-minuscule `W`, first prove the convergence theorem: the finite locally free
dagger module with connection obtained by analytifying `Kl_W^dR(−πφ)` is convergent on
the tube of `X_k` and has an overconvergent Taylor stratification along `{0,∞}`, without
any Frobenius on this module. Route: over a dense open `U ⊂ X` on which the cohomology
objects of `τ_+(M)[1]` are smooth in both theories, the relative specialization map of §3.1
on `ℋ⁰(τ_+(M)[1])` carries the image of `Kl_W^dR` (§3.3(ii)) isomorphically onto the image
of `Kl_W^rig`, by the fibre calculation of §3.3(i), the commutative specialization and
forget-supports square of §RD.4.59 (which makes specialization map the de Rham middle image
onto the rigid one, an isomorphism by equality of dimensions, as in §3.2) and faithful
flatness; so on `U` the Taylor stratification of the analytified module
is that of `Kl_W^rig` with Frobenius forgotten. Apply the
convergence-detection contract below to the connection, which is defined over the entire
dagger lift of `X`; this is the analytic input of Xu–Zhu §4.2.7, (4.2.7.1)–(4.2.7.2),
p. 45, and it precedes any use of Frobenius transport. Then prove
`(Kl_W^dR(−πφ))† ≅ Kl_W^rig(ψφ)` on `X` by full faithfulness for underlying
overconvergent isocrystals (PadicDifferentialEquationsAndRigidCohomology §RD.5.102(a),
also distinguished in §RD.5.112(ii)). Neither forgetting overconvergence nor convergent
F-isocrystal full faithfulness is this restriction theorem.
*Needs:* §§3.1–3.3; gap:dense-convergence-detection;
PadicDifferentialEquationsAndRigidCohomology §§RD.3.37, RD.4.59, RD.5.102(a).

**Checks.**

- For `E₈` there are zero nontrivial minuscule representations: take the quasi-minuscule adjoint `W` of rank `248`. Its de Rham module and its dense-open middle-image comparison have rank `248`; the convergence theorem applies to that module directly, before §4.1.
- For the unit connection on `X` and its restriction to any dense open `U`, both underlying endomorphism spaces are `K`; retaining semilinear Frobenius instead gives `K^σ`. The extension here uses the former spaces.
- For `G = PGL₂`, the adjoint comparison has rank `3`, agreeing with `Sym²` of the rank-two comparison. No step assumes that the punctured vertex chart is affine.

### 3.5 The tensor comparison

For trivial tame character and generic integral `φ`, prove a natural isomorphism of tensor functors
`(Kl_H^dR(−πφ))† ≅ Kl_H^rig(ψφ)` from `Rep(H)` to overconvergent isocrystals (Frobenius forgotten),
including the central characters for reductive `H` (Xu–Zhu Theorem 4.2.1 and §4.2.8, pp. 42–46). Route:
choose tensor generators of `Rep(H)` consisting of minuscule and quasi-minuscule representations and a
finite set of central characters, with their duals; prove that the comparison commutes with
evaluation, coevaluation, convolution, fusion and every intertwiner between tensor powers of generators,
using one normalized fibre identification; pass to idempotent images in characteristic zero; show
independence of the presentation. Equality of two abstract fibre functors does not give this
compatibility. For a nontrivial tame character only the rational-Kummer comparison of §1.7 is available.
*Needs:* §§3.2, 3.4, 1.5, 1.7; ReductiveGroups Layer 1.

**Checks.**

- The comparison preserves evaluation and coevaluation of generators, intertwiners on tensor powers and
  idempotent images.
- For the order-four Teichmüller character over `𝔽₅`, an integral algebraic exponent cannot pass the
  tame-character comparison.
- For `H = E₈`, which has no nontrivial minuscule representation, the generator is the adjoint
  (quasi-minuscule) representation; the minuscule comparison of §3.2 alone gives nothing there.

### Examples

- `H = SL₂`: the comparison is the classical identification of Dwork's Bessel F-isocrystal with the
  analytified rank-two Bessel connection, here obtained without Dwork's explicit Frobenius.

### Dependencies

Layers 1–2; PadicDifferentialEquationsAndRigidCohomology §§RD.3.8, RD.3.37, RD.4.58, RD.4.59,
RD.5.102(a); gap:dense-convergence-detection; gap:relative-level-geometry; gap:arithmetic-d-module-operations;
SpringerResolutionAndCharacteristicCycles Layer 9; ReductiveGroups Layer 1.

## Layer 4: Bessel Frobenius structures

This layer transports the Frobenius of `Kl_H^rig` to the Frenkel–Gross connection, extends it
logarithmically across `0`, computes it at `0` and writes its horizontal matrix equation and closed-point
traces in the column convention. It also states the dictionary between the column convention and the
gauge equation printed by Xu–Zhu.

### 4.1 The Bessel F-isocrystal

Let `φ` be generic over `R` with trivial tame character, and let `E_j` be the matched pinned parameters of
§2.2. Define `Be_H† : Rep(H) → F-Isoc†(𝔾_{m,k}/K)` as the tensor functor whose underlying connection is
`Be_H(−π) = d + (N + x Σ_j (−π)^{h_j} E_j) dx/x` and whose Frobenius is transported from `Kl_H^rig(ψφ)` along
the composite of the isomorphisms of §2.7 and §3.5 (Xu–Zhu §4.4.1, (4.4.1.1)–(4.4.1.3), pp. 49–50). Prove
that it is independent of the chosen comparisons: two choices differ by a horizontal tensor automorphism
of `Be_H`, a constant central element, whose action commutes with the transported Frobenius.
*Needs:* §§1.6, 1.8, 2.7–2.8, 3.5; PadicDifferentialEquationsAndRigidCohomology §RD.3.25.

- For every `W`, the underlying overconvergent connection is `d + dρ_W(N + x Σ_j (−π)^{h_j} E_j) dx/x`.
- The Frobenius commutes with all intertwiners and with the unit, dual and tensor constraints.
- At every closed point and for every `W`, the characteristic polynomial of Frobenius equals that of
  `Kl_W^{ét,ℓ}(ψφ)` (§1.8); each `Be_W†` is pure of weight zero.
- Finite extension of `K` carrying `π` and `c_p` to fixed images commutes with the functor, its
  Frobenius and its closed-point characteristic polynomials.

**Checks.**

- The trivial representation gives the constant rank-one F-isocrystal with Frobenius `1`.
- For `H = SL₂` and `W` standard, the degree-one trace at `a` is `−R₂(a)/c_q`.
- For a split torus with trivial tame character every character gives the constant rank-one object,
  consistent with `2ρ = 0`.

### 4.2 The nilpotent logarithmic extension

Prove that `Be_H†` extends uniquely to a tensor functor into log-convergent F-isocrystals on `(𝔸¹_k, 0)`,
nilpotent at the logarithmic point and overconvergent along `∞`, with residue `dρ_W(N)` in representation
`W`; the local Robba object at `0` is unipotent with this principal nilpotent residue (Xu–Zhu §4.4.2,
(4.4.2.1), p. 50; §2.9.3, p. 24). This specializes §RD.5.103 to the Bessel residue; regularity at `∞`
is not asserted. *Needs:* §4.1; PadicDifferentialEquationsAndRigidCohomology §§RD.2.13–RD.2.16,
RD.2.33, RD.5.101–RD.5.103.

- Restriction to `𝔾_m` recovers `Be_H†`.
- The residue in `W` is `dρ_W(N)`; residues add on tensor products and change sign under transpose on
  duals.
- Every morphism between these unipotent objects extends uniquely to the logarithmic extensions.

**Checks.**

- For `SL₂` the standard residue is `E₁₂`: rank one, square zero, not zero.
- The unit representation has residue `0` and logarithmic Frobenius `1`.
- At `∞` a generic parameter has positive irregularity, so the same nilpotent logarithmic rule does not
  extend `Be_H†` there.

### 4.3 Frobenius at zero

Prove that in the logarithmic fibre of `Be_H†` at `0` the semisimple part of Frobenius is conjugate to
`(2ρ)(c_q)`, where `2ρ` is the integral sum of the positive coroots of `H`. In the column convention the
Frobenius matrix satisfies `N C(0) = q C(0) N`, so `C(0)^{−1} N C(0) = qN`; for the inverse `Φ = C^{−1}`,
`Ad_{Φ(0)} N = qN` (Xu–Zhu Proposition 4.4.5 and its proof, p. 50, with the conjugation direction fixed by
the column equation). For `SL_r` the eigenvalues are `q^{−(r−1)/2}, …, q^{(r−1)/2}`. Route: horizontality
with the logarithmic residue constrains the Frobenius to the principal grading coset; the normalized
Satake weights fix the central scalar in every irreducible representation. *Needs:* §4.2, §1.8;
ReductiveGroups Layer 7.

**Checks.**

- For `H = SL₂`, `N = E₁₂` and `c_q² = q`, `C(0) = diag(c_q^{−1}, c_q)` satisfies `N C(0) = q C(0) N`: both sides have
  upper-right entry `c_q`.
- For `H = SL₂`, `ρ` is not a cocharacter, since half the coroot requires half-integral exponents. In `PGL₂` it is integral, represented by `t ↦ [diag(t,1)]`: the image of `diag(c_q^{−1}, c_q)` is `[diag(1,q)]`, Weyl conjugate to `ρ(q) = [diag(q,1)]`.
- The conjugation equation for `Φ = C^{−1}` is the opposite one, `Φ(0) N Φ(0)^{−1} = qN`; mixing the two
  inverts the eigenvalues.

### 4.4 The horizontal Frobenius matrix

Set `A(x) = N + x Σ_j (−π)^{h_j} E_j`. Prove that in any representation, in a basis with `∇ = d + A(x) dx/x`,
the Frobenius `C : F^*Be → Be` has entries in the dagger algebra of `𝔸¹` overconvergent at `∞` and
satisfies `δC + A(x) C = q C A(x^q)`; that at a closed point `a` of degree `d` the linear Frobenius is the
ordered product `C(ã) C(ã^q) ⋯ C(ã^{q^{d−1}})`, with `ã` the Teichmüller lift in an unramified extension; and
that its trace in `W` is the normalized trace of `Kl_W^{ét,ℓ}` at `a` (Xu–Zhu §4.4.3 and Theorem 4.4.4,
(4.4.3.1)–(4.4.4.1), p. 50). The inverse `Φ = C^{−1}` satisfies `δΦ + q A(x^q) Φ = Φ A(x)`.
*Needs:* §§4.1–4.2; Mathlib `Matrix.trace`; PadicDifferentialEquationsAndRigidCohomology §RD.6.23.

**Checks.**

- Differentiating `CΦ = 1` gives `δΦ = Φ A − q A(x^q) Φ`; the sign distinguishes it from the printed
  source equation of §4.5.
- At a point valued in `k_d` of smaller residue degree, all `d` factors are used.
- In rank one with `A = −a` (the Kummer connection `d − a dx/x`) the equation gives `C = x^{−(q−1)a}`,
  agreeing with the rank-one dictionary.

### 4.5 The source gauge dictionary

Xu–Zhu Theorem 1.2.4 and §4.4.3 print the gauge equation `δS + S A = q A(x^q) S` for a matrix `S`. Prove:
(i) if `C` is the column Frobenius matrix of `(W, d + A dx/x)`, then `S = C^t` satisfies the printed
equation with `A` replaced by `A^t`; (ii) `A^t = dρ_{W^∨}(−A)` in the dual basis, and `Ad((2ρ)(√−1))`
carries `−N − λ^h x E` to `N + (−1)^h λ^h x E`, so `A^t` is the Frenkel–Gross matrix of `W^∨` at the point
`(−1)^h x`; (iii) consequently the printed product `S(ã) S(ã^q) ⋯ S(ã^{q^{d−1}})` for the matrix of `W` is the
transpose of the product `C′(ã^{q^{d−1}}) ⋯ C′(ã)` in the reverse order, where `C′` is the column
Frobenius matrix of `W^∨` for the connection pulled back along the lift `x ↦ (−1)^h x` and written in
the basis conjugated by `ρ_{W^∨}((2ρ)(√−1))`; when `p = 2` this pulled-back Frobenius is transported to the
lift `x ↦ x^q` by the Taylor isomorphism of §RD.1.44. The theorems of this roadmap are stated in the
column convention, so no trace in them depends on this dictionary; it reconciles the printed
formulas with the column ones. *Needs:* §§4.3–4.4; PadicDifferentialEquationsAndRigidCohomology §RD.1.44.

**Checks.**

- For `H = SL₂` with `C(0) = diag(c_q^{−1}, c_q)` the printed residue relation `Ad_{S(0)} N = qN` holds for
  `S(0) = C(0)^{−1}` and fails for `S(0) = C(0)`.
- Inversion alone does not give the printed equation: `C^{−1}` satisfies `δΦ + qA(x^q)Φ = ΦA`, which has the
  opposite sign of the derivative term relative to `ΦA`.
- `ρ` and `−ρ` are Weyl conjugate, which identifies the semisimple class at `0` in both conventions but
  not the trace formula in every representation away from `0`.

### Examples

- `H = SL₂`, `W` standard: `C(x)` is Dwork's Frobenius matrix for the Bessel equation, with
  `C(0) = diag(c_q^{−1}, c_q)` and trace at `a ∈ 𝔽_q^×` equal to `−R₂(a)/c_q`.

### Dependencies

Layers 1–3; PadicDifferentialEquationsAndRigidCohomology §§RD.2.13–RD.2.16, RD.2.33, RD.3.25,
RD.5.101–RD.5.103, RD.6.23; ReductiveGroups Layer 7; Mathlib `Matrix.trace`.

## Layer 5: Newton bounds and generic ordinarity

This layer specializes the rational Newton construction to Bessel Frobenius classes and proves
generic ordinarity from the cuspidal Newton bound and the logarithmic fibre at `0`, independently of the
characteristic-two branch.

### 5.1 The Bessel Newton class

For the semisimple part `b_a` of the Frobenius class of `Be_H†` at a closed point `a` of degree `d`, after a
finite coefficient extension splitting a torus containing `b_a`, define `ν_a` as the dominant rational
cocharacter given by the valuations of characters on `b_a`, normalized by `v(q^d) = 1`. This specializes
BunGAndNewtonStrata §1.5 to a linear `q^d`-Frobenius class and is independent of the torus. On `GL_r` it
gives the nondecreasing slopes, and dominance is polygon dominance (Xu–Zhu §5.4.1, (5.4.1.1), p. 62).
*Needs:* §4.4; BunGAndNewtonStrata §§1.5, 1.22.

- `ν_a` is unchanged by conjugation of `b_a` and by finite coefficient extension.
- For every representation `W`, the slopes of Frobenius on `Be_W†` at `a` are the values of the weights of
  `W` on `ν_a` (BunGAndNewtonStrata §1.22).
- At a point valued in `k_{de}` viewed in `k_{de}` the normalization divides the valuations by `de`.

**Checks.**

- For `GL₂` the pair `(0, 0)` is below `(−1/2, 1/2)` in dominance, and its polygon lies above.
- Changing the normalization from `v(q^d) = 1` to `v(q) = 1` multiplies the slopes by `d`.
- For `H = SL₂` the ordinary class is `ρ = (−1/2, 1/2)`, the slopes of `diag(c_q^{−1}, c_q)`.

### 5.2 The cuspidal Newton bound

For split almost-simple `G` and the normalized Bessel datum, prove that `ν_a ≤ ρ` at every closed point `a`
of `𝔾_m`; the bound persists for products and compatible central quotients of split reductive `H`
(Xu–Zhu Theorem 5.4.2(i) and its proof, p. 62; §1.3.4, pp. 7–8). Route: the clean eigenobject has, by the
function-sheaf dictionary over `k`, a nonzero cuspidal Hecke eigenfunction, with its
component values fixed by the chosen normalized eigenobject (HNY Lemma 2.1 and Remark 2.2,
pp. 255–256). Normalize its chart-origin values by removing the common cohomological
shift sign; for the trivial component character they are `1` on every `γ ∈ Ω`.
Its normalized Hecke eigenvalues are the Frobenius classes of `Kl_H^{ét,ℓ}`. For an
almost-simple automorphic group the centre is finite; for a reductive group the trivial
tame and central datum makes the eigenfunction invariant under the degree lattice of
the connected centre. Thus its central character is finite order, and the Satake class
has zero central Newton projection, including after products and compatible central quotients;
apply gap:cuspidal-newton-bound; transfer to `Be_H†` by §1.8. Purity of weight zero alone does not give
`ν_a ≤ ρ`. *Needs:* §§1.6, 1.8, 5.1; GlobalShtukasAndFunctionFieldLanglands §0.14;
gap:cuspidal-newton-bound.

**Checks.**

- A pure weight-zero rank-two Frobenius with slopes `(−1, 1)` satisfies purity but violates `ν ≤ ρ`; the
  bound is an automorphic input.
- For the split torus factor `ρ = 0`, a finite-order central character has slope `0`. The degree character sending a degree-one idele to `q` has slope `1`, so is excluded by the central-character hypothesis.
- For `G = PGL₂`, `Ω = ℤ/2`, and `(1,1)` and `(1,−1)` are the two component eigenvectors, exchanged by the unramified quadratic twist. The chosen trivial component character selects `(1,1)`; the datum alone does not select an eigenfunction or its scalar.
- For `H = SL₂` the bound says each Frobenius eigenvalue of the normalized Kloosterman sheaf has slope in
  `[−1/2, 1/2]`.

### 5.3 Generic ordinarity

Prove that for every split reductive `H` with the normalized trivial-tame datum there is a dense open
`U ⊂ 𝔾_m` with `ν_a = ρ` for every closed point `a ∈ U`; equivalently the exceptional closed points form a
finite set (Xu–Zhu Theorem 5.4.2(i) and its proof, p. 62; Appendix A.2, p. 64). Route: the logarithmic
fibre at `0` has Newton class `ρ` (§4.3); Newton semicontinuity for log-convergent F-isocrystals on a
connected neighbourhood of `0` bounds the generic class from below by the class at `0`; the bound of §5.2
gives the opposite inequality; finitely many tensor generators give one common open. No input from
Layers 10–11 is used. *Needs:* §§4.2–4.3, 5.1–5.2; PadicDifferentialEquationsAndRigidCohomology §§RD.3.43,
RD.5.101.

**Checks.**

- The proof uses neither the characteristic-two comparison nor everywhere ordinarity.
- One common open comes from finitely many tensor generators; on a curve its complement is finite.
- For `H = SL₂` at `p = 2` generic ordinarity is the generic ordinarity of the rank-two Kloosterman sums
  over `𝔽_{2^m}`, which is also everywhere ordinarity (§11.3).

### Examples

- For `H = SL₂` the ordinary Newton class `ρ` means one Frobenius eigenvalue of slope `−1/2` and one of slope
  `1/2` after normalization, i.e. `v(α) = 0`, `v(β) = 1` for the raw Kloosterman eigenvalues with `αβ = q`.

### Dependencies

Layer 4; BunGAndNewtonStrata §§1.5, 1.22; GlobalShtukasAndFunctionFieldLanglands §0.14 and
gap:cuspidal-newton-bound; PadicDifferentialEquationsAndRigidCohomology §§RD.3.43, RD.5.101.

## Layer 6: Local and global monodromy

This layer defines the monodromy groups of the Bessel objects inside `H`, shows that wild inertia at
`∞` acts nontrivially, excludes the principal `PGL₂`, identifies the geometric and arithmetic monodromy
with the Frenkel–Gross group away from type `A_{2n}` at `p = 2`, and proves adjoint rigidity and the
simple-wild property at `∞`. The case `A_{2n}` at `p = 2` is completed in Layer 11.

### 6.1 The Bessel monodromy groups

Define `G_alg ⊂ H` as the Tannakian group of the tensor category generated (with all subquotients of
finite tensor constructions) by the image of `Rep(H)` under `Be_H`, with fibre functor the fibre at a
`K`-point; `G_geo ⊂ H` as that of the category generated by `Be_H†` with Frobenius forgotten, with the
fibre at a rational point; and `G_arith ⊂ H` as that of the category generated with Frobenius retained,
with a fibre functor that is exact and faithful after a finite extension of coefficients. This
specializes PadicDifferentialEquationsAndRigidCohomology §RD.2.52 and §RD.6.65 and MotivesAndAlgebraicCycles
§§6.1–6.3 to the image of `Rep(H)`, and gives closed embeddings `G_geo → G_alg → H` and `G_geo → G_arith → H`
compatible with the fibres (Xu–Zhu §4.5.1, (4.5.1.1), p. 51). A comparison of monodromy across coefficient
theories is §7.6, not an arrow among these groups. *Needs:* §§2.1, 4.1; §§RD.2.52, RD.6.65;
MotivesAndAlgebraicCycles §§6.1–6.3, 6.5; ReductiveGroups Layer 1.

- Each functor from `Rep(H)` factors through its generated category, and the associated group embeds in
  `H` through the given fibre identification.
- Forgetting Frobenius gives the embedding `G_geo → G_arith` with compatible fibres.
- Changing the fibre functor changes the embedded group by conjugation through the tensor-isomorphism
  torsor of MotivesAndAlgebraicCycles §6.5; statements are made up to that conjugation.
- A tensor of a representation is invariant under `G_geo` exactly when it comes from a constant
  subobject of the corresponding Bessel object with Frobenius forgotten.

**Checks.**

- For the trivial tensor functor on `Rep(𝔾_m)` the generated group is trivial, not `𝔾_m`.
- For `H = SL₂` the standard object generates `G_geo = SL₂` at every `p`, agreeing with
  KloostermanMomentsAndPotentialAutomorphy §1.3 (monodromy) for `r = 2`.
- A reducible tensor construction contributes its invariant line as a subobject; using the literal image
  without subquotient closure gives the wrong group for `Std ⊗ Std` of `SL₂`.

### 6.2 Nontrivial wild monodromy

For almost-simple `H`, prove that `G_geo` contains `exp(tN)` coming from the unipotent local object at `0`
(§4.2), that `G_geo°` is semisimple, and that wild inertia at `∞` has nontrivial image in `G_geo`
(Xu–Zhu Lemma 4.5.3 and §4.5.4, pp. 51–52). Route: if wild inertia acted trivially, the `ℓ`-adic companion
would be tame at both ends, the tame geometric fundamental group of `𝔾_m` is procyclic, and a
semisimple group generated by a procyclic image cannot contain a nontrivial principal unipotent element
as required. Semisimplicity of `G_geo°` comes from purity of weight zero and Deligne semisimplicity.
*Needs:* §§4.2, 6.1, 1.8; §RD.2.51; DeligneWeightsAndPurity §8.19.

**Checks.**

- For almost-simple `H` the principal nilpotent gives a nontrivial one-parameter unipotent subgroup.
- The contradiction uses geometric semisimplicity of the companion, not purity of a trace function.
- For a torus `H` there is no unipotent element and wild inertia acts trivially for the trivial datum; the
  hypothesis "almost simple" is necessary.

### 6.3 Exclusion of the principal `PGL₂`

For almost-simple `H` of rank `r` and Coxeter number `h`, prove that the irregularity at `∞` of the adjoint
Bessel object is at most `r`, and that unless the type is `A₁`, or `A₂` with `p = 2`, the image of `G_geo` in
`H_ad` is not contained in a principal `PGL₂` (Xu–Zhu Lemma 4.5.5, (4.5.5.1), pp. 52–53). Route: by
gap:formal-slope-comparison every `p`-adic break of `Ad(Be_H†)` at `∞` is at most the formal slope `1/h` of the
algebraic connection, so the irregularity is at most `dim(Lie H)/h = r + r/h < r + 1`, hence at most `r`; by
gap:principal-sl2-subgroups the restriction of `Lie H` to a principal `SL₂` is `⊕_i Sym^{2e_i}` over the
exponents; nontrivial wild inertia (§6.2) and the finite solvable subgroups of `PGL₂` force irregularity
`> r` for that containment, except in the listed low-rank cases, where `A₄ ⊂ PGL₂` at `p = 2` is the
exception. *Needs:* §§2.8, 6.2; gap:formal-slope-comparison; gap:principal-sl2-subgroups;
PadicDifferentialEquationsAndRigidCohomology §§RD.1.17–RD.1.19, RD.6.52.

**Checks.**

- The decomposition uses `Sym^{2e_i}`: for `SL₃` the exponents are `1, 2` and `3 + 5 = 8 = dim sl₃`; the printed
  indexing `ℓ_i + 1 = e_i` (proof of Xu–Zhu Lemma 4.5.5, p. 53) gives `Sym^{2e_i − 2}`, of dimension `1 + 3 = 4`.
- `A₁` and `A₂` at `p = 2` are exceptions: for `SL₃` at `p = 2` the monodromy is `SO₃`, whose adjoint image is a
  principal `PGL₂`.
- The bound `r + r/h < r + 1` uses `|Φ| = rh`; for `G₂`, `dim = 14`, `h = 6`, `14/6 < 3`.

### 6.4 The monodromy classification

If `H` is almost simple and either `p > 2` or `H` is not of type `A_{2n}` (`n ≥ 1`), prove that `G_geo = G_alg`
and `G_arith = G_geo` as embedded subgroups up to the chosen fibre conjugation; the groups and their
central forms are those of the table of §2.8 (Xu–Zhu Theorem 4.5.2(i),(iii), pp. 51–53). Route: §2.8 gives
`G_alg`; §6.3 and gap:principal-sl2-subgroups force `G_geo` to be a subgroup containing a principal `SL₂`
and not a principal `PGL₂`, and the pinned symmetries of §2.9 force equality outside even `A`; for even `A` in
odd characteristic, the outer involution gives `Be_H† ≅ (−1)^* (Be_H†)^∨` (Xu–Zhu (4.1.10.5)), normalized to a
`μ₂`-descent cocycle, and a proper image `SO_{2n+1} ⊂ SL_{2n+1}` would make the standard Swan conductor at `∞`
even, contradicting Swan `1`; the logarithmic Frobenius at `0` (§4.3) excludes extra central components of
`G_arith`; descend along the actual central isogeny. The scalar type-`A` statement of
KloostermanMomentsAndPotentialAutomorphy §1.3 (monodromy) is an independent check.
*Needs:* §§2.8, 4.3, 6.1–6.3, 2.9; KloostermanMomentsAndPotentialAutomorphy §§1.1, 1.3.

**Checks.**

- For type `A₂` in odd characteristic the group is `SL₃`; `p = 2` is reserved for §11.4.
- The `μ₂` descent needs an involutive cocycle, not only an isomorphism with the dual, before Swan
  multiplicativity under the double cover is used.
- For `H = SO₇` the group is `G₂` at every `p`, and for `H = Sp₄` it is `Sp₄`.

### 6.5 Simple wild parameters

Let `k_∞` be a local field of characteristic `p` with finite residue field, `W_{k_∞}` its Weil group with inertia
subgroup `I` and wild inertia `I⁺`, and `H` almost simple of rank `ℓ`, with centre `Z(H)`, adjoint quotient
`π_ad : H → H_ad` and `Ť_ad = π_ad(Ť)`. A *discrete parameter* is a homomorphism `ϕ : W_{k_∞} → H` with finite image
on inertia, defined on the whole Weil group (Frobenius included), whose image has finite centralizer in `H`.
Define a *simple wild parameter* as a discrete parameter with `(Lie H)^{ϕ(I)} = 0` and adjoint Swan conductor
`b(Ad ∘ ϕ) = ℓ` (Gross–Reeder §6, p. 35). Since `Ad` factors through `H_ad`, the composite `ϕ_ad = π_ad ∘ ϕ` is again
a simple wild parameter. The finite groups `D = ϕ(I)` and `D^ad = ϕ_ad(I)` are the inertia groups of finite Galois
extensions of `k_∞` cut out by `ϕ` and `ϕ_ad`, with lower filtrations `D_u`, `D^ad_u` and upper filtrations; `D₁ = ϕ(I⁺)`
is the wild image.

Assume `p ∤ |W_H|`. For the adjoint parameter prove (Gross–Reeder Proposition 5.6, p. 34, where the dual group is
adjoint by the standing assumption of Gross–Reeder §5.3, p. 31): `D^ad_1` lies in a unique maximal torus of `H_ad`,
after conjugation `Ť_ad`, and `ϕ_ad(W_{k_∞})` lies in its normalizer; the tame quotient `D^ad/D^ad_1` maps onto the
subgroup of `W_H` generated by a Coxeter element `w` of order `h`; `D^ad_2 = 1` and `D^ad_1` is a simple
`𝔽_p[w]`-submodule of `Ť_ad[p]` of order `p^a`, with `a` the order of `p` in `(ℤ/h)^×`; and the upper breaks of
`ϕ_ad(W_{k_∞})` are `0` and `1/h`. For `ϕ` itself, with `C = D ∩ Z(H)` of order `c`, prove: `p ∤ c`, because `|Z(H)|`
divides the index of the root lattice in the weight lattice, which divides `|W_H|`; `π_ad` maps `D₁` isomorphically
onto `D^ad_1`, so `D₁` lies in the unique maximal torus `Ť = π_ad^{−1}(Ť_ad)` and is a simple `𝔽_p[w]`-submodule of
`Ť[p] ≅ Ť_ad[p]`; the upper breaks of `D` are `0` and `1/h`; and the lower filtration of `D` jumps at `c`:
`D₁ = D_c` and `D_{c+1} = 1`. In particular `D₂ = 1` holds for `ϕ` exactly when `C = 1`; the lower numbering is not
invariant under a central lift, and the conclusion `D₂ = 1` of Gross–Reeder belongs to the adjoint parameter.
Route: `D/C = D^ad`; the upper filtration passes to quotients, and `C` meets no upper ramification group of
positive index, these being `p`-groups; the subextension cut out by `C` is tame of degree `c`, so its Herbrand
function is `u ↦ u/c`, and Herbrand's theorem for the quotient carries the lower break `1` of `D^ad` to the lower
break `c` of `D`. *Needs:* ReductiveGroups Layers 7, 9; §RD.6.51; Tau Ceti
`TauCeti.LocalFieldsRamification.map_restrictNormalHom_lowerRamificationGroupReal` and
`TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup`.

- If `p ∤ |W_H|`, every discrete parameter with `(Lie H)^{ϕ(I)} = 0` has `b(Ad ∘ ϕ) ≥ ℓ` (Gross–Reeder
  Proposition 5.4, pp. 31–33, applied to `ϕ_ad`); without that hypothesis the inequality is Gross–Reeder
  Conjecture 5.2, p. 30, and is not asserted here.
- Under `p ∤ |W_H|`, all nonzero adjoint upper breaks of a simple wild parameter equal `1/h`.
- A bare inertia homomorphism without the Frobenius element is not a discrete parameter in this sense.

**Checks.**

- For `H = SL₂` (`ℓ = 1`, `h = 2`, `|W| = 2`) and `p` odd: `D₁` is the subgroup `μ_p = Ť[p]`, the tame image acts on it by
  inversion (the Coxeter element), and the upper breaks are `0` and `1/2`. Every element of `N(Ť) − Ť` squares to `−1`,
  so `C = {±1}`, `c = 2` and `D₁ = D₂ ≠ D₃ = 1` for every simple wild parameter of `SL₂`; for `PGL₂`, `c = 1` and `D₂ = 1`.
- Negative control for a central lift. Over `k_∞ = 𝔽₅((t))` put `u⁴ = t` and `z⁵ − z = u^{−2}`: a totally ramified
  Galois extension of degree `20` with `σ : (u, z) ↦ (u, z + 1)` of order `5` and `τ : (u, z) ↦ (2u, −z)` of order `4`
  (`(2u)^{−2} = −u^{−2}` in `𝔽₅`), and `τστ^{−1} = σ^{−1}`. Sending `σ ↦ diag(ζ₅, ζ₅^{−1})` and `τ ↦ [[0, 1], [−1, 0]]`
  gives a parameter into `SL₂` with centralizer `{±1}` and `(Lie SL₂)^{ϕ(I)} = 0`. With `v(u) = 5`, `v(z) = −2`, the
  uniformizer `uz²` has `v(σ(uz²) − uz²) = v(u(2z + 1)) = 3`, so `|D| = 20`, `D₁ = D₂ = C₅` and `D₃ = 1`; the upper break
  is `2 · 5/20 = 1/2`, and `b(Ad ∘ ϕ) = 2 · 1/2 = 1 = ℓ` with `5 ∤ 2`. Every hypothesis holds and `D₂ ≠ 1`, as
  `c = |⟨τ²⟩| = 2` predicts; the adjoint image in `PGL₂` has order `10`, lower break `2/c = 1` and `D^ad_2 = 1`.
- For `p = 2` and `H = SO₃` the hypothesis `p ∤ |W|` fails, and the inertia image `A₄` of §11.5 has breaks that the
  proposition does not describe.
- The tamely ramified principal parameter has `b = 0 < ℓ` only because `(Lie H)^{ϕ(I)} ≠ 0`; the lower bound needs
  the vanishing of inertia invariants.

### 6.6 Adjoint rigidity and the simple-wild property at `∞`

For almost-simple `H` outside type `A_{2n}` at `p = 2`, put `E = Ad(Be_H†)`. Prove: `H^i(ℙ¹, j_{!+}E) = 0` for every `i`;
`Irr_∞(E) = rank H`; `E^{I_∞} = 0`; the nilpotent monodromy operator at `∞` vanishes; and the local Weil
parameter at `∞` attached to the companion is a simple wild parameter in the sense of §6.5, whose nonzero
adjoint upper breaks are all `1/h` when `p ∤ |W_H|` (Xu–Zhu Corollary 4.5.7 and Remark 4.5.8, pp. 53–54; HNY
Corollary 2.15, p. 262). Route: the localization sequence for `j_{!+}E`, duality and the
Grothendieck–Ogg–Shafarevich formula give `χ = −Irr_∞(E) + dim E^{I_0} + dim E^{I_∞}` with
`dim E^{I_0} = r` (the centralizer of a principal nilpotent); with `Irr_∞ ≤ r` (§6.3) this forces all
cohomology and `E^{I_∞}` to vanish; a nonzero adjoint `N_∞` would lie in `E^{I_∞}`. In the characteristic-zero
dimension formula one subtracts `dim V^{I_0} + dim V^{I_∞}`; Frenkel–Gross (14.1), p. 29, prints `I₀` twice,
and its preceding boundary sequence gives the correct `I₀ ⊕ I_∞`. *Needs:* §§4.2, 6.3–6.5;
PadicDifferentialEquationsAndRigidCohomology §§RD.5.76, RD.5.89, RD.6.51–RD.6.52, RD.6.55.

**Checks.**

- The adjoint invariants at `0` have dimension `rank H`; with `Irr_∞ ≤ rank H` the Euler characteristic forces
  `E^{I_∞} = 0`.
- For `SL₂`: `Irr_∞(Ad) = 1`, `dim Ad^{I₀} = 1` and `dim Ad^{I_∞} = 0`, so `h¹ = 1 − 1 − 0 = 0`; counting `I₀` twice gives
  the impossible `h¹ = −1`.
- The `1/h` break statement is applied only under `p ∤ |W_H|` and to the full discrete Weil parameter.

### Examples

- `H = SL₂`, `p` odd: `G_geo = SL₂`, `Irr_∞(Ad) = 1`, the adjoint break at `∞` is `1/2`.
- `H = SO₇`: `G_geo = G₂`, and `Ad_{SO₇} = Ad_{G₂} ⊕ Std₇` restricted to `G₂`.

### Dependencies

Layers 2, 4; PadicDifferentialEquationsAndRigidCohomology §§RD.1.17–RD.1.19, RD.2.51, RD.5.76, RD.5.89,
RD.2.52, RD.6.51–RD.6.52, RD.6.55, RD.6.65; MotivesAndAlgebraicCycles §§6.1–6.3, 6.5;
gap:formal-slope-comparison; gap:principal-sl2-subgroups; KloostermanMomentsAndPotentialAutomorphy §§1.1, 1.3;
DeligneWeightsAndPurity §8.19; ReductiveGroups Layers 1, 7, 9; Tau Ceti
`TauCeti.LocalFieldsRamification.map_restrictNormalHom_lowerRamificationGroupReal`,
`TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup`.

## Layer 7: Functoriality and companions

This layer proves that Frobenius structures on the Frenkel–Gross connection differ by central
elements, uses the pinned and central symmetries of §2.9, proves functoriality between groups in one row of
the table of §2.8 first for integral parameters and then for Heinloth–Ngô–Yun sheaves, and compares
monodromy across companions.

### 7.1 The central torsor of Frobenius structures

For almost-simple `H` outside type `A_{2n}` at `p = 2`, and fixed coefficient Frobenius, prove that the set of
tensor Frobenius structures on the overconvergent connection underlying `Be_H†` is a torsor under `Z(H)(K)`,
and that the normalized Frobenius eigenvalues at `0` in every representation (§4.3) single out `Be_H†`
(Xu–Zhu Lemma 5.1.1, p. 55; §4.4.1 and Theorem 4.4.4, pp. 49–50). Route: the ratio of two Frobenius
structures is a horizontal tensor automorphism, hence an element of the centralizer of `G_geo` in `H`, which
is `Z(H)` by §6.4; compare scalars on residue lines at `0`. For type `A_{2n}` at `p = 2` the same statement holds
after §11.4. *Needs:* §§4.1, 4.3, 6.4; MotivesAndAlgebraicCycles §6.5.

**Checks.**

- The differential equation alone admits central multiples of a Frobenius; the normalized eigenvalues at
  `0` remove them: for `SL₂` the multiple `−C` has eigenvalues `−c_q^{∓1}` at `0`.
- The centralizer used is that of `G_geo`, not of `G_alg`.
- For `H = PGL₂` the center is trivial and the Frobenius structure is unique.

### 7.3 The exact radius of adjoint solutions

Let `H′ ⊂ H` be a pinning-compatible inclusion in one row of the table of §2.8,
and `V` a nontrivial irreducible constituent of `Lie H` restricted to `H′`.
Outside type `A_{2n}` at `p=2`, for the normalized integral parameter, prove that a nonzero solution functional at `0`
`u : Be_{H′,V}(−π)|₀ → (K{x},d)` in the dual-solution convention of Xu–Zhu
§2.9.2, (2.9.2.2), p. 24, has coefficient series of common radius exactly `1`.
Use the nilpotent logarithmic extension at `0` to get a nonzero functional converging
on the open unit disc. The monodromy classification of §6.4 and its finite centralizer in `H` show that the
adjoint restriction, hence `V`, has no trivial constituent. Its semisimple decomposition
into irreducible overconvergent constituents therefore has no constant quotient; a
functional of radius greater than `1` would extend to such a quotient, contradicting
that decomposition (Xu–Zhu proof of Proposition 5.1.3, p. 55). For `c ∈ K^×`,
the functional with coefficients `f_i(cx)` has radius `1/|c|`; for parameter change
`λ ↦ uλ`, `u ∈ K^×`, it is `|u|^{−h′}`, with `h′` the Coxeter number of `H′`.
*Needs:* §§2.1, 4.2, 6.4; PadicDifferentialEquationsAndRigidCohomology
§§RD.1.11–RD.1.13, RD.2.13–RD.2.16, RD.6.65.

**Checks.**

- At `p = 2`, the rank-two cyclic solution functional has coefficients `4^j/(j!)²`; since `v₂(4^j/(j!)²) = 2s₂(j)`, its radius is `1`. Replacing `λ` by `2λ` gives radius `|2|^{−2} = 4`; replacing it by `λ/2` gives `1/4`.
- For the adjoint `SL₂` connection at infinity, set `y = 1/x` and `a = λ² ≠ 0`. Horizontality of `uE+vH+wF` gives `δ_y u = −2v`, `δ_y v = w−au/y`, `δ_y w = 2av/y`. Power-series coefficients force `u₀=v₀=w₀=0` and `a(2k−1)u_k=0`, hence the only such section is zero. Infinity cannot replace zero in the theorem.
- For `Sp₄ ⊂ SL₄`, the constituent `Λ²_0` has radius `1`. For the identity inclusion on `SL₄`, its adjoint splits under monodromy `Sp₄` into dimensions `10+5=15`, both nontrivial; irreducibility as an `SL₄` representation alone would not suffice; the trivial constituent has constant functionals of infinite radius. Unit scale `|c|=1` preserves `1`, and `c=0` is excluded.

### 7.4 Integral functoriality

For `H′ ⊂ H` in a common table row and a generic integral `φ′` for the dual of `H′`, prove that the matched Frenkel–Gross
parameter also comes from a generic integral `φ` for the dual of `H`, and that `Be_H†` is the pushout of
`Be_{H′}†` along `H′ → H` (Xu–Zhu Proposition 5.1.3 and §5.1.2, p. 55). Integrality means the affine invariant
has unit scale relative to a generic integral parameter. Route: the pushout of connections is immediate from
the pinned matrices; §7.3 compares the solution functionals at `0` for the reference normalized connection
and its pullback `x ↦ cx`. For distinct groups in the row, both arise from Frobenius objects with the same nontrivial
irreducible monodromy constituents, so each has radius `1`; the rescaling formula `1/|c|`
forces `|c| = 1` (a larger radius on either side would give a constant quotient). The identity inclusion needs no radius argument, and covers the single-group `A_{2n}` row at `p=2`; the two Frobenius structures on the
pushout differ centrally (§7.1) and agree at `0`. *Needs:* §§2.2, 2.9; §§6.4, 7.1, 7.3 for proper inclusions.

**Checks.**

- A nonzero parameter over `K` alone is not enough; its affine invariant must have unit scale.
- The residual central Frobenius ratio is `1` after matching every normalized eigenvalue at `0`.
- For `G₂ ⊂ SO₇` the pushout of `Be_{G₂}†` along the seven-dimensional representation is `Be_{SO₇, Std}†`.

### 7.5 Heinloth–Ngô–Yun functoriality

For `H′ ⊂ H` in a common table row and any generic `φ′` over `k`, prove that there is a generic `φ` over `k` such that
`Kl_H^{ét,ℓ}(ψφ)` is isomorphic, as a tensor functor to `ℓ`-adic local systems, to the pushout of
`Kl_{H′}^{ét,ℓ}(ψφ′)`, `ℓ ≠ p`; this is Heinloth–Ngô–Yun's Conjecture 7.3 (Xu–Zhu Theorem 5.1.4, pp. 55–56).
Route: for an identity or central-form map use §2.9; for a proper inclusion lift `φ′` over `R`, construct `φ` by §7.4 and reduce it; companion traces (§§1.8, 4.1) and restriction
of the rational representation ring of `H` onto that of the common geometric monodromy group give equal
traces in every representation of that group; semisimple Chebotarev in a faithful representation gives an
isomorphism up to an automorphism preserving semisimple conjugacy classes, which is inner by
gap:principal-sl2-subgroups. In the `Spin₇/G₂` case use `V₇|_{G₂} = Std₇` and `V₁₄ = Λ²V₇ − V₇` to generate the
`G₂` representation ring; the spin representation alone does not. *Needs:* §§1.8, 4.1, 6.4, 7.4;
gap:principal-sl2-subgroups; ReductiveGroups Layers 1, 7.

**Checks.**

- `φ′` is lifted over `R` first; the invariant parameter for the larger group is matched and then reduced.
- For `Spin₇ ⊃ G₂`, `V₇` and `Λ²V₇ − V₇` restrict to the standard and adjoint representations of `G₂`.
- For `Sp_{2n} ⊂ SL_{2n}` the statement recovers that the rank-`2n` Kloosterman sheaf has symplectic monodromy.

### 7.6 Companion monodromy comparison

Outside type `A_{2n}` at `p = 2`, prove that the `ℓ`-adic companions `Kl_H^{ét,ℓ}` have the same geometric and
arithmetic monodromy groups, component groups and embedded `H`-conjugacy classes of subgroups as `Be_H†`
(Xu–Zhu Corollary 4.5.6, p. 53). Route: purity and semisimplicity place the companions in
gap:companion-monodromy, which identifies the neutral components with their tautological representations
over a common algebraically closed field, and the component groups; identify the embeddings in `H` by
tensor invariants through the pinning-compatible representations. The printed inference from a
surjection between two subgroups of `H` is replaced by this argument. *Needs:* §§1.8, 6.4, 7.5;
gap:companion-monodromy.

**Checks.**

- Neutral components and component groups are compared separately, then the embeddings.
- A surjection between two subgroups of `H` is not an isomorphism without control of its kernel: `SL₂ → PGL₂`
  inside `SL₂ × PGL₂` is surjective and not injective.
- For `H = SL₂` both companions have monodromy `SL₂`, and for `H = SO₇` both have `G₂`.

### Examples

- `G₂ ⊂ SO₇ ⊂ SO₈`: `Kl_{SO₈, Std} ≅ Kl_{G₂, Std₇} ⊕ 1` and `Kl_{SO₇, Std} ≅ Kl_{G₂, Std₇}` for matched parameters.

### Dependencies

Layers 1, 2, 4, 6; PadicDifferentialEquationsAndRigidCohomology §§RD.1.11–RD.1.13, RD.2.13–RD.2.16, RD.6.65;
MotivesAndAlgebraicCycles §6.5; gap:principal-sl2-subgroups; gap:companion-monodromy;
ReductiveGroups Layers 1, 7.

## Layer 8: Classical realizations and orthogonal sums

This layer identifies the special linear and symplectic standard objects with the scalar Kloosterman
objects, writes the orthogonal Frenkel–Gross matrices explicitly, splits off the invariant line of the
even orthogonal standard object, realizes the even orthogonal standard object by the quadric
Landau–Ginzburg potential for `n ≥ 3`, and computes its trace as a toric exponential sum.

### 8.1 Classical scalar realizations

For the standard summed generic functional, prove that `Be†_{SL_r, Std}`, `r ≥ 2`, has underlying connection
the rank-`r` Bessel connection `Be_r(−π)` and Frobenius traces the normalized scalar traces
`(−1)^{r−1} c_q^{−d(r−1)} R_r(a)`, so that it is the `p`-adic companion of the normalized Kloosterman sheaf of
KloostermanMomentsAndPotentialAutomorphy §1.1 (normalized sheaf), built from CongruenceSpectralGap §4.2b;
at every prime `p` and every rank `r` it is the half-twisted Kloosterman F-isocrystal `Kl_r` of
PadicDifferentialEquationsAndRigidCohomology §RD.6.95, built with the Dwork parameter `−π` for odd `p` and with
`π = −2` itself for `p = 2` (rank-one dictionary of the conventions). Likewise `Be†_{Sp_{2n}, Std}` is
the rank-`2n` scalar object, and the `GL_r` object is its central extension with trivial normalized
determinant (Xu–Zhu §§5.3.1–5.3.2, (5.3.1.1)–(5.3.1.3), pp. 57–58). These are comparisons; no second
scalar Kloosterman sum, sheaf or connection is defined. Route: the Hecke diagram of the standard
representation is the torus diagram of the scalar sum; the superdiagonal and last-row matrix matches the
cyclic generator and the parameter (§2.6 Bessel dictionary); the anti-diagonal alternating form is
preserved, so §7.4 identifies the symplectic object. *Needs:* §§1.5, 4.1, 7.4;
KloostermanMomentsAndPotentialAutomorphy §§1.1, 1.3, 2.1, 2.5–2.6; CongruenceSpectralGap §§4.2a–4.2b;
PadicDifferentialEquationsAndRigidCohomology §RD.6.95.

**Checks.**

- The rank-two standard trace is `−R₂(a)/c_q`: over `𝔽₃` at `a = 1` it is `1/√3`, and at `a = −1` it is `−2/√3`.
- The comparison with §RD.6.95 replaces `ψ` by `ψ^{−1}`, which replaces `R_r(a)` by `R_r((−1)^r a)`: in rank two the
  values agree, while in rank three over `𝔽₃` the raw sums at `a = 1` and `a = −1` are `R₃(1)` and its complex
  conjugate; at `p = 2` the characters `ψ` and `ψ^{−1}` coincide and the comparison is an equality of raw sums in
  every rank.
- The scalar sign dictionary is KloostermanMomentsAndPotentialAutomorphy §2.6: a solution functional of the cyclic module satisfies `δ^r f − λ^r x f = 0`; a horizontal first coefficient of the column connection satisfies `δ^r f − (−1)^r λ^r x f = 0`. For `r=3`, `λ=1` the two normalized series begin `1+x+x²/8` and `1−x+x²/8`, respectively.

### 8.2 Orthogonal Bessel matrices

In `SO_{2n}`, `n ≥ 3`, with the anti-diagonal form whose entry at `(i, 2n+1−i)` is `(−1)^{max(i, 2n+1−i)}`,
define `N = Σ_{1 ≤ i ≤ 2n−1, i ≠ n} E_{i,i+1} + E_{n−1,n+1} + E_{n,n+2}` and `E = E_{2n−1,1} + E_{2n,2}`, with connection
`d + (N + λ^{2n−2} x E) dx/x`. In `SO_{2n+1}`, `n ≥ 1`, with the anti-diagonal form of entries `(−1)^i`, define
`N = Σ_{i=1}^{2n} E_{i,i+1}` and `E = 2E_{2n,1} + 2E_{2n+1,2}`, with connection `d + (N + λ^{2n} x E) dx/x`; its cyclic
operator in the column convention of Xu–Zhu is `δ^{2n+1} − λ^{2n} x (4δ + 2)`. The dual group of this odd
orthogonal datum is `Sp_{2n}`, whose middle simple-root coordinate is `E_{n,n+1}` (Xu–Zhu §5.3.3,
(5.3.3.1)–(5.3.3.2), p. 58; §5.3.6, (5.3.6.1)–(5.3.6.4), p. 60, with the root coordinates of the
lowest-root entries corrected). *Needs:* §§2.1–2.2; OrthogonalSpinGroups Layer 0; Mathlib `Matrix.trace`.

- Both `N` and `E` satisfy the infinitesimal form equation `X^t J + J X = 0` for the stated forms.
- For the even matrices, `(N + λ^{2n−2} x E)(e_n − e_{n+1}) = 0`.
- The cyclic presentation of the odd connection is the stated operator, and its holomorphic solution at `0`
  normalized by `f(0) = 1` has coefficients `(2r−1)!! (2λ^{2n})^r/(r!)^{2n+1}`.
- The integral matrix entries commute with every characteristic-zero coefficient extension, including
  fields of residue characteristic two.

**Checks.**

- For `n = 1` in odd rank: `N = E₁₂ + E₂₃`, `E = 2E₂₁ + 2E₃₂`, and the operator is `δ³ − λ²x(4δ + 2)`.
- For `n = 3` in even rank: `N` has the entries `E₁₂, E₂₃, E₄₅, E₅₆, E₂₄, E₃₅`, satisfies the form equation and
  kills `e₃ − e₄`; adding `E₃₄` destroys both properties.
- Replacing `E` by `E/2` in odd rank changes the first solution coefficient from `2λ^{2n}` to `λ^{2n}` and breaks
  the normalization against the Dwork series `G` of §10.4.

### 8.3 The orthogonal invariant-line decomposition

For `n ≥ 2`, prove that the standard object of `SO_{2n+2}` decomposes as `Be†_{SO_{2n+1}, Std} ⊕ 1`, the trivial
summand spanned by `e_{n+1} − e_{n+2}` with Frobenius `1`; for `n = 1`, `SO₄` is handled through `SL₂ × SL₂`, whose
standard object restricted to the diagonal is `Sym² Std ⊕ 1`. Hence the normalized traces satisfy
`T_{SO_{2n+2}}(a) − 1 = T_{SO_{2n+1}}(a)` for every `n ≥ 1` (Xu–Zhu §5.3.3, p. 58; (5.3.6.5), p. 60; Corollary
5.3.11(ii), p. 61). Route: split the invariant line and its orthogonal complement in the explicit even
matrix; after adjoining `√2` identify the complement with the odd pinning; §7.4 and the Frobenius at `0`
fix the Frobenius on the line. *Needs:* §§2.9, 7.4, 8.2.

**Checks.**

- The invariant line has Frobenius `1`, not a nontrivial constant: the eigenvalue `1` of `(2ρ)(c_q)` on
  `Std_{2n+2}` occurs twice (on the weights `±e_{n+1}`, where `ρ` vanishes), once on each summand.
- The `SO₄` diagonal restriction gives `Sym² Std ⊕ 1`, providing the `n = 1` case.
- Over `𝔽₂` at `n = 3`: `T_{SO₈}(1) = 7/8` and `T_{SO₇}(1) = −1/8`, and their difference is `1`.

### 8.4 The quadric Landau–Ginzburg realization

For `n ≥ 3`, let `Q ⊂ ℙ^{2n−1}` be the quadric with coordinates `(p₀, …, p_{n−1}, p′_{n−1}, p_n, …, p_{2n−2})` and
equation `p_{n−1} p′_{n−1} + Σ_{j=0}^{n−2} (−1)^{n−1−j} p_j p_{2n−2−j} = 0`; put
`δ_l = Σ_{j=0}^{l} (−1)^j p_{l−j} p_{2n−2−l+j}`, let `Q°` be the complement of the zeros of `p₀, p_{2n−2}, p_{n−1}, p′_{n−1}`
and `δ_l` for `1 ≤ l ≤ n−3`, and define on `Q° × 𝔾_m` the potential
`W = p₁/p₀ + Σ_{l=1}^{n−3} p_{l+1} p_{2n−2−l}/δ_l + p_n/p_{n−1} + p_n/p′_{n−1} + x p₁/p_{2n−2}`. Prove that the standard
object of `Be†_{SO_{2n}}` is `pr_{2,!}(W^* A_ψ)[2(n−1)](n−1)`, and that its de Rham version is the corresponding
exponential pushforward of `E_λ` with the same shift and no twist (Xu–Zhu §5.3.4, (5.3.4.1)–(5.3.4.6),
pp. 58–59; Lam–Templier Theorem 1.8 (= Theorem 7.10); Pech–Rietsch–Williams §3.3, pp. 13–14, and Theorem 3.2, p. 14). Route: the base-point formula of §1.5 for the minuscule standard representation, whose
Schubert variety is the quadric; Lam–Templier's identification of the Hecke chart with the geometric
crystal; the explicit potential of Pech–Rietsch–Williams. The formula is not used for `n = 2`, where the
divisor labels overlap. *Needs:* §§1.5, 8.2; PadicDifferentialEquationsAndRigidCohomology §RD.6.42.

- Every denominator of `W` is invertible on `Q°`, and `W` is homogeneous of degree zero in the projective
  coordinates.
- At degree `d` the trace is `q^{−d(n−1)} Σ_{z ∈ Q°(k_d)} ψ(Tr W(z, a))`, with no sign from the even shift.
- The standard orthogonal Hecke chart is `Q° × 𝔾_m` with character `W`, for the chosen invariant parameter.
- Constant-field extension commutes with `Q°`, `W` and the exponential direct image.

**Checks.**

- For `n = 3` the `δ_l` sum is empty and `W = p₁/p₀ + p₃/p₂ + p₃/p′₂ + x p₁/p₄` on `p₂p′₂ − p₁p₃ + p₀p₄ = 0`.
- Rescaling all `p` coordinates leaves `W` unchanged; rescaling `x` changes only the last term.
- `n = 2` is excluded from the formula; `SO₄` is computed by the product realization of §8.3.

### 8.5 The boundary count for the quadric chart

For `n ≥ 3` and `a ∈ 𝔽_Q^×`, prove by stratifying `Q°(𝔽_Q)` according to the vanishing of the Plücker coordinates
and summing the free additive variables by orthogonality (Mathlib `AddChar.sum_eq_ite`) that
`Σ_{z ∈ Q°(𝔽_Q)} ψ(Tr W(z, a)) = S_n(a) + Q^{n−1} − Q`, where
`S_n(a) = Σ_{x₁, …, x_{2n−2} ∈ 𝔽_Q^×} ψ(Tr(Σ_i x_i + a (x₁ + x₂)/∏_i x_i)) = U_{n−1}(a)`. The direct count of the boundary
stratum in every dimension is part of this target; the constant is `Q^{n−1} − Q`, not the printed
`(Q − 1)Q^{n−2}` of Xu–Zhu Proposition 5.3.5 (p. 59), and the proof uses no identity of Layer 11.
*Needs:* §8.4; Mathlib `AddChar.sum_eq_ite`, `AddChar.sum_eq_zero_of_ne_one`.

**Checks.**

- At `n = 3` the two constants coincide (`Q² − Q = (Q − 1)Q`); they first differ at `n = 4`.
- Over `𝔽₂` at `n = 4`, `S₄(1) = 1`, so the corrected count gives `1 + 8 − 2 = 7` and the printed one `1 + 4 = 5`;
  only `7` satisfies the invariant-line identity of §8.3.
- Direct evaluation of the chart sum agrees with `S_n + Q^{n−1} − Q` for `n = 3` over `𝔽₂`, `𝔽₄`, `𝔽₃` (values `3`;
  `5, 37, 5`; `13, 4`) and for `n = 4` over `𝔽₂` and `𝔽₃` (values `7`; `13, 40`), where the printed constant gives
  `5`; `7, 34`.

### 8.6 The even orthogonal toric trace

Let `Q = q^d`. For `n ≥ 3` and `a ∈ 𝔽_Q^×`, prove that the normalized `SO_{2n}` standard trace at `a` is
`Q^{−(n−1)} (S_n(a) + Q^{n−1} − Q)`, and that for `n = 2` it is the square of the normalized rank-two trace
(Xu–Zhu Proposition 5.3.5, (5.3.5.1)–(5.3.5.2), p. 59, with the corrected constant).
*Needs:* §§8.3–8.5; CongruenceSpectralGap §4.2a.

**Checks.**

- At `n = 3` the formula reads `Q^{−2}(S₃ + Q² − Q)`, the same for both constants; `n ≥ 4` discriminates.
- Combined with §8.3 at `p = 2` it gives `U_n − Q = R_{2n+1}` once §10.6 is known; this is a consequence, not an
  input.
- For `n = 2` the formula `T_{SO₄} = T₂²` matches `Std ⊠ Std` of `SL₂ × SL₂` restricted to the diagonal.

### Examples

- Over `𝔽₂`, `a = 1`: `T_{SO₈} = 7/8`, `T_{SO₇} = −1/8 = R₇(1)/8`.

### Dependencies

Layers 1, 2, 4, 7; KloostermanMomentsAndPotentialAutomorphy §§1.1, 1.3, 2.1, 2.5–2.6; CongruenceSpectralGap
§§4.2a–4.2b; PadicDifferentialEquationsAndRigidCohomology §§RD.6.42, RD.6.95; OrthogonalSpinGroups
Layer 0; Mathlib `AddChar.sum_eq_ite`, `Matrix.trace`.

## Layer 9: Hypergeometric realizations and convolution

This layer constructs hypergeometric arithmetic `D`-modules with rational nonresonant parameters,
normalizes the quadratic one to Bessel weight zero, identifies the odd orthogonal standard object with
it in odd characteristic and proves the normalized convolution formula there.

### 9.1 Hypergeometric arithmetic `D`-modules with rational parameters

For finite sequences `α = (α₁,…,α_n)` and `β = (β₁,…,β_m)` in
`(q−1)^{−1}ℤ`, with `α_i−β_j ∉ ℤ` for every pair, construct the arithmetic
hypergeometric module associated to
`∏_i(δ−α_i) − (−1)^{n+mp} π^{n−m} x ∏_j(δ−β_j)` over the coefficient field
of §0.1. Rational parameters of denominator prime to `p` are included after a finite
constant-field extension making the denominators divide `q−1`; no primality condition
relates `p` to the lengths of the sequences. For `n+m>0`, prove that it is an
overconvergent F-isocrystal of rank `max(n,m)` on `𝔾_m` when `n≠m`, and of rank
`n` on `𝔾_m \ {1}` when `n=m`. The latter puncture means the residue point `1`;
at `p=2` the leading coefficient in characteristic zero can vanish at `−1` instead,
which has the same reduction (Miyatani Main theorem(i), pp. 2–3, Lemma 4.1.1 and
Theorem 4.1.3, pp. 27–28).

Let `χ_i,ρ_j` be the multiplicative characters corresponding to `α_i,β_j`.
Prove its identification with the multiplicative convolution of the rank-one
Kummer-twisted Dwork factors and inverse-Dwork factors, with the holonomic shifts of
Miyatani Definition 3.2.1 and Theorem 3.2.5, pp. 22–23; prove that the canonical
support-to-ordinary convolution map is an isomorphism (Proposition 3.3.3, p. 26).
Using the same rank-one and Fourier induction with Frobenius forgotten for geometric irreducibility, on the indicated smooth domain prove purity of weight `n+m−1`, geometric
irreducibility, uniqueness of Frobenius up to a scalar, and the closed-point trace
formula `(−1)^{n+m−1} H_{ψ,d}(χ;ρ)(a)`, where
`H_{ψ,d}(χ;ρ)(a) = Σ_{∏x_i = a∏y_j} ψ(Tr(Σx_i−Σy_j)) ∏χ_i(Nx_i) ∏ρ_j^{−1}(Ny_j)`
with every variable a unit and norms and traces to `k`. For `n = m` this is Katz's exponential sum
`katzExpSum` of HypergeometricMotives §4.2 over `k_d`, with the characters `χ_i ∘ N`, `ρ_j ∘ N`, the additive
character `ψ ∘ Tr` and `t = a^{−1}`; for `n ≠ m` the same formula defines it here. Prove base-change compatibility
by the norm/trace lifts of the characters (Miyatani Lemma 3.2.4, p. 23; Remark 4.1.9,
p. 30, and Propositions 4.2.1–4.2.3, pp. 30–32). For `n=m=0`, retain the convolution unit,
the delta module at `1`, whose restriction off `1` is the rank-zero object
(Definition 3.2.1(i), p. 22).
*Needs:* §1.1; gap:arithmetic-d-module-operations; CharacterSumsOverFiniteFields §3.3; HypergeometricMotives
§4.2 (for `n = m`); PadicDifferentialEquationsAndRigidCohomology §§RD.6.42, RD.6.47.

- Permuting either sequence and shifting a parameter by an integer give the corresponding gauge isomorphisms; individual integral shifts follow by the rank-one Kummer gauge inside convolution. Inversion exchanges the two sequences, inverts their characters and replaces `ψ` by `ψ^{−1}` (Miyatani Definition 3.2.1 and Theorem 3.2.5, pp. 22–24; Lemmas 3.1.3 and 3.2.3, pp. 17–18 and 22–23).
- Write `Hyp_ψ(n;ρ)` for the specialization with all upper parameters zero, `n>m≥0`, and every lower parameter nonintegral. It has rank `n`, operator `δ^n − (−1)^{n+mp} π^{n−m}x∏_j(δ−β_j)`, and trace `(−1)^{n+m−1}H_{ψ,d}(n;ρ)` with no upper-character factors.
- For this specialization only, prove maximal unipotence at `0` and the logarithmic zero spectrum `γq^j`, `0≤j<n`, where `γ=(−1)^m∏_j g(ψ^{−1},ρ_j^{−1})` (Xu–Zhu Theorem 5.2.2 and §5.2.3, p. 57; Katz, *Exponential sums and differential equations*, 7.0.7; *From Clausen to Carlitz*, 2.6.1). The endpoint is `q^{n−1}γ`, and no zero eigenvalue occurs. General upper parameters carry their own tame exponents, so this nilpotent extension and spectrum are not asserted for them.
- With no lower parameters and all upper parameters zero, the specialization is the unnormalized rank-`n` scalar Kloosterman object.

**Checks.**

- Over `𝔽₇`, upper `(0,1/2)` and lower `(1/3)` give differences `−1/3,1/6`, both nonintegral, and rank `2` on `𝔾_m`. The two tame upper exponents at `0` differ, excluding maximal unipotence.
- Over `𝔽₇`, upper `(0)` and lower `(1/2)` give rank `1` on `𝔾_m \ {1}`. The leading coefficient is `x(1−x)` at odd `p`, so the extra point cannot be retained as smooth.
- Upper empty and lower `(1/2)` give rank `1` on `𝔾_m`, obtained by inversion from the one-upper-factor object; `max(0,1)=1` rather than zero. Upper `(0)`, lower `(1)` fail nonresonance since the difference is `−1`.
- Empty sequences give the convolution unit, a delta module supported at the single point `1`; its restriction off `1` has rank `0`, while a constant rank-one local system has rank `1` there.
- In the all-zero-upper case `n=3,m=1`, with quadratic lower character, the zero spectrum is `γ,γq,γq²`. For `n=1,m=0`, the trace is `ψ(Tr a)` and the object is the Dwork object on `𝔾_m`.

### 9.2 The normalized Bessel hypergeometric object

For the all-zero-upper specialization `n>m≥0` of §9.1, with `g_j = g(ψ^{−1}, ρ_j^{−1})` over `k` and `α = (−1)^m ∏ g_j`, define the normalized object by multiplying the
Frobenius of `Hyp_ψ(n; ρ)` by `q^{−(n−1)/2}/α` (using `c_q`). Prove that its zero spectrum is
`q^{−(n−1)/2 + j}`, `0 ≤ j < n`, and that its trace at a point of degree `d` is
`(q^{−(n−1)/2}/α)^d (−1)^{n+m−1} H_{ψ,d}(n; ρ)` (Xu–Zhu §§5.2.1–5.2.3, (5.2.1.1)–(5.2.3.1), pp. 56–57, and
Theorem 5.2.2, with the zero spectrum corrected). The base-field Gauss sums are raised to the `d`-th
power; over `k_d` this agrees with the Gauss sums of `k_d` through the Hasse–Davenport relation of
CharacterSumsOverFiniteFields §3.3, transported to `K`-valued characters as in the supplier contract.
*Needs:* §9.1; CharacterSumsOverFiniteFields §3.3.

- The `n` zero eigenvalues are `q^{−(n−1)/2}, …, q^{(n−1)/2}`; in odd rank the middle one is `1`.
- At a `k`-point the trace is `H_ψ(n; ρ)/((−c_q)^{n−1} ∏_j g_j)`.
- For `m = 0` and `n ≥ 2` the normalized object is `Be†_{SL_n, Std}` of §8.1, including its sign; at `n=1` it remains the Dwork object, not the trivial representation of `SL₁`.
- Under degree-`d` extension, `g_{j,d} = (−1)^{d−1} g_j^d`, and the hypergeometric sign and the `d`-th power of the
  scalar are transported together.

**Checks.**

- `n = 3`, `m = 1`: the zero spectrum is `q^{−1}, 1, q`.
- `n = 2`, `m = 0`: the trace is `−R₂/c_q` and the zero spectrum `c_q^{−1}, c_q`.
- At `d = 2` the normalizing scalar is the square of the base scalar; using the Gauss sum of `k₂` without the
  sign `(−1)^{d−1}` multiplies the trace by `−1`.

### 9.3 The odd orthogonal hypergeometric comparison

For `p > 2` and `n ≥ 1`, prove that `Be†_{SO_{2n+1}, Std}` is the pullback along `x ↦ 4x` of the normalized
hypergeometric object with `2n + 1` numerator parameters and one quadratic denominator character; both have
zero spectrum `q^{−n}, …, 1, …, q^n` (Xu–Zhu Proposition 5.3.8(i), (5.3.8.1), p. 61, with the middle eigenvalue
corrected to `1`). Route: rescale the operator of §8.2 by `x ↦ x/4` and compare with the quadratic
hypergeometric operator up to the integral shift `β ↦ β + 1`; Frobenius is unique up to a scalar on the
irreducible object (§9.1); the zero spectrum fixes the scalar. *Needs:* §§4.3, 8.2, 9.1–9.2.

**Checks.**

- The normalized zero spectrum in rank `2n + 1` has exactly `2n + 1` eigenvalues and contains `1`.
- The pullback factor is `4`, from the coefficient `2` in each lowest-root entry of `E` squared; without it the
  operators differ by `x ↦ x/4`.
- At `p = 2` there is no quadratic character of the required kind and §10.6 replaces this comparison.

### 9.4 The normalized Bessel convolution

Overconvergent F-isocrystals on `𝔾_m` are placed in the heart of the constructible t-structure (Xu–Zhu §§2.3.4–2.3.5,
(2.3.4.1), p. 15), so that their closed-point traces are the traces of the isocrystals, and `M ⋆ N = Rμ_!(M ⊠ N)` is the
unshifted multiplicative convolution under `μ : 𝔾_m × 𝔾_m → 𝔾_m` (Miyatani Definition 2.1.1, p. 14; Xu–Zhu (5.2.1.2),
p. 56), whose trace at `a` is `+Σ_{uv=a}` of the products of traces (Miyatani Proposition 2.1.3, p. 15). Write
`Be†_r = Be†_{SL_r, Std}`. For `p > 2` and `n ≥ 2`, prove that `Be†_{SO₃, Std} ⋆ Be†_{2n−2}` has constructible
cohomology only in degree `1`, that this cohomology is smooth of rank `2n + 1`, and that
`Be†_{SO_{2n+1}, Std} ≅ (Be†_{SO₃, Std} ⋆ Be†_{2n−2})[1](1/2)`.
On traces over `𝔽_Q` the shift `[1]` gives the sign: `T_{SO_{2n+1}}(a) = −Q^{−1/2} Σ_{uv=a} T_{SO₃}(u) K_{2n−2}(v)` with `K_r`
the normalized scalar trace (Xu–Zhu §5.3.9, (5.3.9.1), and Corollary 5.3.11(i), p. 61, with the shift and half
twist added; Miyatani Main theorem (ii), p. 3, and Proposition 3.3.3, p. 26). The case `n = 1` is `Sym²` of `SL₂`
and uses no rank-zero object. Route: along each fibre `uv = a`, a punctured line, the smooth object
`Be†_{SO₃, Std} ⊗ inv_a^* Be†_{2n−2}` (with `inv_a(u) = a/u`) has no compactly supported cohomology in degree `0`, being
smooth on an affine curve, nor in degree `2`, since a geometrically constant quotient would give a common
constituent of `Be†_{SO₃, Std}`, tame at `0`, and the dual of `inv_a^* Be†_{2n−2}`, totally wild at `0`; the
Grothendieck–Ogg–Shafarevich formula gives rank `Sw_∞ + Sw_0 = (2n − 2) + 3 = 2n + 1`; then multiplicative
convolution of hypergeometric objects with explicit shifts, comparison of quadratic hypergeometric objects in
odd characteristic, and the zero spectrum fix the twist. *Needs:* §§8.1, 9.1–9.3;
gap:arithmetic-d-module-operations; PadicDifferentialEquationsAndRigidCohomology §RD.6.55.

**Checks.**

- Object against trace, over `𝔽₃`, `n = 2`, `a = 1`: `R₂(1) = −1`, `R₂(2) = 2`, `U₂(1) = 7`; the `SO₃` traces are `−2/3`
  and `1/3`, the normalized rank-two traces `1/√3` and `−2/√3`, and `Σ_{uv=1} T_{SO₃}(u) K₂(v) = −4/(3√3)`. The unshifted
  twisted convolution has trace `−4/9`, while `T_{SO₅}(1) = (U₂(1) − 3)/3² = 4/9`; the shift `[1]` supplies the sign.
- The trace formula carries both the cohomological sign and `Q^{−1/2}`; in raw sums it is
  `U_n(a) − Q = Σ_{uv=a} (R₂(u)² − Q) R_{2n−2}(v)`, which holds over `𝔽₃`, `𝔽₅`, `𝔽₇`, `𝔽₉` for `n = 2, 3` by direct computation.
- The printed form `−Q^{−1/2}(U_n − Q^{n−1})` of Xu–Zhu (1.2.9.2) fails over `𝔽₂` at `n = 2`, `a = 1`: the left side is
  `−1` and the printed right side is `1/√2`.
- `n = 1` is excluded from this formula and handled by `Sym²`.

### Examples

- `p = 3`, `n = 1`: `R₂(1)² − 3 = −2`, and `g · (−2) = H₃(4)` with `g = Σ_y ρ(y) ψ(−y) = −i√3` for `ψ(1) = e^{2πi/3}`.

### Dependencies

Layers 0, 1, 4, 8; CharacterSumsOverFiniteFields §3.3; HypergeometricMotives §4.2;
gap:arithmetic-d-module-operations; PadicDifferentialEquationsAndRigidCohomology §§RD.6.42, RD.6.47, RD.6.55.

## Layer 10: The characteristic-two comparison

This layer proves `Be†_{2n+1} ≅ Be†_{SO_{2n+1}, Std}` at `p = 2`. It specifies Dwork's congruence data and
refines his congruences 2-adically with signs, constructs the unit-root lines of the two Bessel solution
series and an isomorphism between them, identifies them with duals of the maximal-slope quotients with
the correct Frobenius scale, and concludes with the minimal-slope reconstruction.

### 10.1 Dwork congruence data

Let `R` be a complete discrete valuation ring of mixed characteristic `(0, p)` with fraction field `K`, and let
`B⁽ⁱ⁾ : ℕ → K^×` for `i ≥ 0`. The *Dwork conditions* are: (a) `B⁽ⁱ⁾(0) ∈ R^×`; (b) `B⁽ⁱ⁾(a + pn)/B⁽ⁱ⁺¹⁾(n) ∈ R` for
`0 ≤ a < p`; (c) `B⁽ⁱ⁾(a + pn + m p^{s+1})/B⁽ⁱ⁺¹⁾(n + m p^s) ≡ B⁽ⁱ⁾(a + pn)/B⁽ⁱ⁺¹⁾(n)` modulo `p^{s+1} R` for all
`a, n, m, s`. For `p = 2` the *signed condition* (c′) replaces (c) by the congruence with right side multiplied
by `u(i, s, m) ∈ {±1}`, independent of `a, n`, and `u(i, s, m) = 1` for `s ≠ 1`. Put `F⁽ⁱ⁾ = Σ_j B⁽ⁱ⁾(j) x^j` and the
block truncations `F⁽ⁱ⁾_{m,s} = Σ_{m p^s ≤ j < (m+1) p^s} B⁽ⁱ⁾(j) x^j` (`dworkBlock` in `Suggested.lean`); `F⁽ⁱ⁾_s = F⁽ⁱ⁾_{0,s}`. A
*normalized periodic* datum is a family satisfying (a), (b) and either (c) or, for `p = 2`, (c′), together with
`B⁽ⁱ⁾(0) = 1` and `B⁽ⁱ⁺ʳ⁾ = B⁽ⁱ⁾` for a fixed `r ≥ 1`; it is *ordinary* or *signed* according as (c) or (c′) is
used (Xu–Zhu Appendix A.4–A.6, (A.5.1)–(A.5.4), pp. 64–65). *Needs:* Mathlib `PowerSeries.mk`, `IsDiscreteValuationRing`.

- The block `F_{m,s}` starts at `m p^s` and stops before `(m+1) p^s`.
- Conditions (a) and (b) imply `B⁽ⁱ⁾(j) ∈ R` for all `i, j`, by induction on `j`.
- Normalization and periodicity are extra structure, not consequences of (a), (b) and (c) or (c′).
- Deleting the first sequence gives a datum `B⁽ⁱ⁺¹⁾` with the inherited conditions and signs `u(i+1, s, m)`.

**Checks.**

- `B⁽ⁱ⁾(j) = 1` satisfies (a)–(c) and is periodic of period `1`.
- For `p = 2`, `m = 1`, `s = 2` the block contains exactly `j = 4, 5, 6, 7`; an inclusive upper end adds `j = 8`.
- At `s=0`, `B(j)=j+1`, `m=2`, the block is `3x²`: coefficients at `1,2,3` are `0,3,0`, not a prefix truncation.
- At `p=2`, `m=0`, `s=1`, `B(j)=1`, the block is `1+x` with coefficient `0` at degree `2`; for the total definition with `p=0`, `s=1`, every block is empty. The congruence theorems require prime `p`.
- For the rank-three sequence `B(j) = (−2)^{3j}/(j!)³`, `B(4)/B(2) = 1/27 ≡ −1` modulo `4` while `B(0)/B(0) = 1`: the
  ordinary condition (c) fails at `s = 1` and the signed condition holds with `u = −1`. With `B(0) = 1` and
  period `1` this sequence, and its rank-five analogue, is a signed and not an ordinary normalized periodic
  datum, with `u(i, 1, m) = (−1)^m`; a definition admitting only (c) would exclude the series of §10.4.

### 10.2 Signed 2-adic Dwork congruences

Prove: (i) under (a)–(c), `F⁽⁰⁾(x) F⁽¹⁾_{m,s}(x^p) − F⁽⁰⁾_{m,s+1}(x) F⁽¹⁾(x^p) ∈ p^{s+1} B⁽ˢ⁺¹⁾(m) R⟦x⟧` (Dwork, *p-adic
cycles*, Theorem 2); (ii) under (a), (b), (c′) at `p = 2`, the same difference with `x²` lies in
`2^s B⁽ˢ⁺¹⁾(m) R⟦x⟧`; (iii) for a normalized periodic datum, ordinary or signed, `F⁽⁰⁾_{s+1}(x)/F⁽¹⁾_s(x^p)` converges, as `s → ∞`, to a
function on the formal open where all reductions `F⁽ⁱ⁾₁`, `i < r`, are nonzero, with unit value at every rigid
point after finite extension (Xu–Zhu Theorem A.5, pp. 64–65, and proof A.13, pp. 67–69; Dwork Theorem 3).
Statements (i) and (ii) are congruences on single coefficients and hold for every discrete valuation ring
of mixed characteristic `(0, p)`, complete or not: the hypotheses over `R` give those over the completion
`R̂`, and the quotient of a coefficient by `p^{s+1} B⁽ˢ⁺¹⁾(m)` (respectively `2^s B⁽ˢ⁺¹⁾(m)`) lies in
`K ∩ R̂ = R`; completeness is used only in (iii). Statement (ii) is `signed_dwork_congruence`. Route for
(ii): Dwork's antisymmetric block sums
`H_a(m, s, N)` and induction on the block length, propagating the signs `u(i, s, m)`, with the parity-splitting
indices as determined by the block endpoints. *Needs:* §10.1; PadicDifferentialEquationsAndRigidCohomology
§RD.3.8 for (iii).

**Checks.**

- The signed modulus is `2^s`, the ordinary one `p^{s+1}`; for the sequence of §10.1 at `s = 1` the ordinary
  congruence (c) fails, so (i) does not apply and (ii) is needed.
- Over the incomplete ring `ℤ_(2)` with `K = ℚ`, the constant sequence `B(j) = (−2)^{3j}/(j!)³` and the alternating
  pair below at `n = 1, 2` give, for `s ≤ 3`, `m ≤ 2` and coefficient degree `N ≤ 40`, quotients by `2^s B⁽ˢ⁺¹⁾(m)` with odd
  denominators; the least `2`-adic valuation of a nonzero quotient is `0` for the constant sequence, so `2^s`
  cannot be raised to `2^{s+1}`.
- For the alternating pair `B⁽⁰⁾(j) = (−2)^{(2n+1)j}/(j!)^{2n+1}`, `B⁽¹⁾(j) = 2^{(2n+1)j}(2j−1)!!/(j!)^{2n+1}`,
  `B⁽ⁱ⁺²⁾ = B⁽ⁱ⁾`, conditions (b) and (c′) hold with `u(0, 1, m) = 1`, `u(1, 1, m) = (−1)^m`, and the coefficient
  divisibility of (ii) holds for `n = 1, 2`, `s ≤ 3`, `m ≤ 2` and all relevant coefficients by direct computation.
- The convergence domain in (iii) is tested at every period `i < r` and at every rigid point after finite
  extension.

### 10.3 Dwork unit-root lines

Over `k = 𝔽_p`, for a power series `F` whose constant sequence `B⁽ⁱ⁾ = B` is a normalized periodic datum of
period `1`, ordinary or signed, let `U` be the formal open where the reduction of `F₁` is nonzero. Prove that `f = F(x)/F(x^p)` and
`η = F′(x)/F(x)` extend to `U`, that `f` is invertible, that `f′/f + p x^{p−1} η(x^p) = η(x)`, and that
`E_F = (O, d − η dx)` with multiplier `f` is a unit-root convergent F-isocrystal on `U` with `f(0) = 1` (Xu–Zhu A.6
and Corollary A.7, p. 65). After constant extension to `𝔽_q`, `q = p^s`, for `F` with coefficients fixed by the
coefficient Frobenius, the `q`-Frobenius multiplier is `f_{F,q}(x) = ∏_{i<s} f(x^{p^i}) = F(x)/F(x^q)`. This
construction does not by itself identify `E_F` with any quotient of a Bessel object. *Needs:* §10.2;
PadicDifferentialEquationsAndRigidCohomology §§RD.3.33–RD.3.34, RD.3.47.

- The connection of `E_F` is `d − η dx`, and `F` is its local horizontal solution.
- The multiplier `f` satisfies the horizontality equation and `E_F` has all slopes `0`.
- `F(0) = 1` gives `f(0) = 1`; multiplying `F` by a nonzero constant changes neither `η` nor `f`.
- For `q = p^s` the composite of the `s` pullbacks gives `f_{F,q} = F(x)/F(x^q)`, with `f_{F,q}(0) = 1`.

**Checks.**

- For `B(j) = 1`: `F = (1 − x)^{−1}`, `U = {x ≠ 1}`, `η = (1 − x)^{−1}`, `f = (1 − x^p)/(1 − x)`.
- The inverse multiplier `1/f` is not horizontal for `d − η dx`: its logarithmic derivative has the opposite sign.
- For the geometric series at `p = 2`, `q = 4`: `f_{F,4} = (1 + x)(1 + x²) = (1 − x⁴)/(1 − x)`, whereas the single
  `p`-step multiplier is `1 + x`.

### 10.4 The two Bessel solution series

For `n ≥ 1` at `p = 2`, put `r = 2n + 1`, `F(x) = Σ_{j ≥ 0} (−2)^{rj} x^j/(j!)^r` and
`G(x) = Σ_{j ≥ 0} 2^{rj} (2j−1)!! x^j/(j!)^r` with `(−1)!! = 1`. Prove that `F` satisfies the signed conditions and `G`
the ordinary ones, that their alternating period-two datum satisfies the signed conditions with
`u(0, 1, m) = 1`, `u(1, 1, m) = (−1)^m`, that both first truncations reduce to `1`, and that `h = F/G` extends to an
invertible function on the completed affine line with `h(0) = 1` intertwining `E_G` and `E_F` with their
Frobenius: `h′/h = η_F − η_G` and `h(x) f_G(x) = f_F(x) h(x²)`, hence `h(x) f_{G,q}(x) = f_{F,q}(x) h(x^q)` for
`q = 2^s` (Xu–Zhu Lemma A.12, pp. 66–67). `F` is the solution series of the rank-`(2n+1)` scalar operator in the
coordinate `x ↦ −x` of the appendix, and `G` that of the odd orthogonal operator of §8.2 at `λ = −π = 2`.
*Needs:* §§8.2, 10.1–10.3.

**Checks.**

- At `p = 2` both first truncations are `1` modulo `2`, so the domain is the whole completed affine line.
- Both `h′/h = η_F − η_G` and `h f_G = f_F h(x²)` are needed; a horizontal map need not respect Frobenius.
- For a constant extension of degree `s` the `s`-fold products are used, not the squaring multiplier.

### 10.5 Frobenius on the maximal-slope quotient

On a common connected open of constant Newton polygon for `Be†_{2n+1}` and `Be†_{SO_{2n+1}, Std}` at `p = 2`, with the
logarithmic point `0` adjoined (its polygon is ordinary by §4.3), prove: the maximal-slope quotients are of
rank one and slope `n`; in the column cyclic basis `∇_δ e_i = e_{i+1}`, Ore division by `δ − x F′/F` gives the
quotient connection `d + η_F dx`, the dual of `E_F`, and similarly for `G`; the quotient Frobenius is `q^n/f_{F,q}`,
respectively `q^n/f_{G,q}`, fixed by the common eigenvalue `q^n` at `0`; and multiplication by `h^{−1}` is a
Frobenius-compatible isomorphism from the `G` quotient to the `F` quotient (Xu–Zhu A.8, Proposition A.9 and A.11,
pp. 65–66, with the Frobenius step added). Route: §5.3 gives the common ordinary open independently of
Layer 11; factor the Ore operators and identify the horizontal quotient with the maximal-slope quotient
using the dense-open slope filtration (§RD.3.45); the ratio of the quotient Frobenius to `q^n/f_{F,q}` is
horizontal, hence constant on the connected open, and equals `1` at `0`. *Needs:* §§4.3, 5.3, 10.4;
PadicDifferentialEquationsAndRigidCohomology §§RD.2.33, RD.3.43–RD.3.45, RD.5.101.

**Checks.**

- In the column cyclic basis, `e₂ = x η e₁` makes the quotient connection `d + η dx`, the dual of the solution line
  `d − η dx`.
- `c = q^n/f_{F,q}` has slope `n`, satisfies `c′ + η(x) c = q x^{q−1} c η(x^q)` and takes the value `q^n` at `0`; the
  multiplier `f_F` has slope `0` and the wrong equation.
- `h^{−1}` intertwines the two quotient multipliers because `h f_{G,q} = f_{F,q} h(x^q)`; the constancy of the ratio
  is proved on the connected open before evaluating at `0`.

### 10.6 The characteristic-two comparison

For `p = 2` and `n ≥ 1`, prove `Be†_{2n+1} ≅ Be†_{SO_{2n+1}, Std}` as normalized overconvergent F-isocrystals on `𝔾_m`,
compatibly with all finite constant-field extensions (Xu–Zhu Proposition A.1 and Theorem A.3, pp. 63–64; A.11–A.12,
pp. 66–67; Proposition 5.3.8(ii), p. 61). Route: both objects are geometrically irreducible (§6.4 for the odd
orthogonal one, KloostermanMomentsAndPotentialAutomorphy §§1.1, 1.3 for the scalar one); §10.5 gives an
isomorphism of maximal-slope quotients on a common open; PadicDifferentialEquationsAndRigidCohomologyPartII
§MS.4.6 lifts it to an isomorphism on that open; full faithfulness of restriction to a dense open (§RD.5.112)
extends it to `𝔾_m`; the sign of `x` in the appendix is transported by the Taylor isomorphism between the lifts
`x` and `−x` of the same map in characteristic two, with its Frobenius (§RD.1.44). *Needs:* §§6.4, 8.1,
10.5; PadicDifferentialEquationsAndRigidCohomologyPartII §MS.4.6; PadicDifferentialEquationsAndRigidCohomology
§§RD.0.37, RD.1.44, RD.5.112; KloostermanMomentsAndPotentialAutomorphy §§1.1, 1.3.

**Checks.**

- The minimal-slope theorem is applied only to an isomorphism of Frobenius-compatible maximal quotients on a
  common open of constant polygon.
- The lifts `x` and `−x` coincide modulo `2`; the Taylor isomorphism, not equality, identifies the two pullbacks,
  and it carries the Frobenius.
- Over `𝔽₂` at `a = 1` the traces agree: `T_{2n+1}(1) = R_{2n+1}(1)/2^n = −1/2^n` and `T_{SO_{2n+1}}(1) = (U_n(1) − 2)/2^n`
  with `U_n(1) = 1`.

### Examples

- `n = 1`: `Be†₃ ≅ Be†_{SO₃, Std} ≅ Sym² Be†₂` at `p = 2`, whose trace identity is Carlitz's `R₂² − q = R₃`.

### Dependencies

Layers 4–8; PadicDifferentialEquationsAndRigidCohomology §§RD.0.37, RD.1.44, RD.2.33, RD.3.8,
RD.3.33–RD.3.34, RD.3.43–RD.3.45, RD.3.47, RD.5.101, RD.5.112; PadicDifferentialEquationsAndRigidCohomologyPartII
§MS.4.6; KloostermanMomentsAndPotentialAutomorphy §§1.1, 1.3; Mathlib `PowerSeries.mk`, `PowerSeries.expand`,
`IsDiscreteValuationRing`, `IsAdicComplete`.

## Layer 11: Everywhere ordinarity, the exceptional branch and the identities

This layer reads the comparisons of Layers 8–10 as exponential-sum identities, computes the Frobenius
slopes of the toric sums behind the odd orthogonal objects, proves everywhere ordinarity for the
classical groups and `G₂`, completes the monodromy of type `A_{2n}` at `p = 2` and extends the corollaries of
Layers 6–7 to every prime.

### 11.1 Kloosterman and orthogonal identities

Define, for a finite field `F`, a field `K` and an additive character `ψ : F → K`, the raw Kloosterman sum
`kloostermanSum ψ k a = Σ_{x₁⋯x_k = a} ψ(x₁ + ⋯ + x_k)` over unit tuples, the even orthogonal sum
`orthogonalSum ψ n a = U_n(a)` of the conventions (sum over `2n` units, meant for `n ≥ 1`), the quadratic character
`quadraticCharIn F K` (Mathlib `quadraticChar` composed with `ℤ → K`), the quadratic hypergeometric sum
`quadraticHypergeometricSum ψ N b = H_N(b)`, and, for prime `p` and finite `ZMod p`-algebra field `F`, the trace character
`traceChar p F ψ₀ = ψ₀ ∘ Tr_{F/𝔽_p}`.

- `kloostermanSum` agrees with `hyperKloosterman` of CongruenceSpectralGap §4.2a, and, for `k ≥ 1`, its eliminated-variable
  form is `Σ_{x : Fin (k−1) → F^×} ψ(Σx_i + a/∏x_i)`.
- For `k = 0`, `kloostermanSum ψ 0 a` is `1` if `a = 1` and `0` otherwise.
- For `n ≥ 2`, `orthogonalSum ψ n a` is the toric sum `S_{n+1}(a)` of §8.5. At `n=1`, `orthogonalSum ψ 1 a = kloostermanSum ψ 2 a ^ 2`, using the `SO₄` product case rather than the quadric chart.
- For `b ≠ 0`, `quadraticHypergeometricSum ψ N b` eliminates `y = (x₁ ⋯ x_N)/b`, so it is the sum over `x` alone. Its total definition at `b = 0` is `0`, since the argument of the quadratic character is `0`.
- For prime `p` and finite `F`, `traceChar p F ψ₀` is a nontrivial character when `ψ₀` is (Mathlib `FiniteField.trace_to_zmod_nondegenerate`).

Prove: (i) in characteristic two, with `ψ = traceChar 2 F ψ₀`, `ψ₀ ≠ 1`, `U_n(a) − |F| = R_{2n+1}(a)` for `n ≥ 1`
(`orthogonalSum_sub_card_eq_kloostermanSum`; Carlitz (4), p. 35, at `n = 1`); (ii) in odd characteristic, for
every nontrivial `ψ` and `g = Σ_y ρ(y) ψ(−y)`, `g · (U_n(a) − |F|) = H_{2n+1}(4a)` for `n ≥ 1`
(`gaussSum_mul_orthogonalSum_sub_card`); (iii) in every characteristic, for every nontrivial `ψ` and `N ≥ 2`,
`U_N(a) − |F| = Σ_{uv=a} (R₂(u)² − |F|) R_{2N−2}(v)` (`orthogonalSum_sub_card_eq_convolution`) (Xu–Zhu §1.2.9, pp. 6–7,
and Corollary 5.3.11, p. 61, corrected). Route: (i) is the trace identity of §10.6 with §§8.3 and 8.6; (ii) is the
trace identity of §9.3 with §§8.3 and 8.6; (iii) is §9.4 in odd characteristic. At `p = 2`, (iii) follows for the
trace character from (i), `U_1 = R₂²` and the convolution property `R_{2N+1}(a) = Σ_{uv=a} R₃(u) R_{2N−2}(v)` of raw
sums, and for every other nontrivial character `x ↦ ψ(cx)`, `c ≠ 0`, by the substitution `x ↦ x/c`, which turns
`R_k(a)` into `R_k(c^k a)` and `U_N(a)` into `U_N(c^{2N} a)`, so that both sides of (iii) become the trace-character
sides at `c^{2N} a`; in (i) the two sides move to `c^{2n} a` and `c^{2n+1} a`, which is why (i) is stated for the
trace character only. All identities are first proved
for `K ⊂ ℂ` and transported to any field `K` in which the character is nontrivial. For (i) the values are `±1` and
the identity is one between integers. For (ii) and (iii) both sides are integer polynomials in a primitive `p`-th
root of unity `ζ`; their difference vanishes at every primitive `p`-th root of unity of `ℂ`, because (ii) and (iii)
hold for every nontrivial character, hence is divisible by the `p`-th cyclotomic polynomial. *Needs:* §§8.3, 8.6,
9.3–9.4, 10.6; CongruenceSpectralGap §4.2a; Mathlib `gaussSum`, `quadraticChar`, `AddChar`.

The finite-field signatures use `[Finite F]` and `Nat.card F`; the finite-support sums
agree with the usual sums over any finite enumeration. No enumeration is part of the datum.

**Checks.** For the raw sum.

- Over `𝔽₂`, `k=0`, `a=1`, the product-fibre sum is `ψ(0)=1`; the truncated-subtraction formula would instead give `ψ(1)=−1`.
- Over `𝔽₃`, `k=0`, `a=2`, the fibre is empty, so the sum is `0`; for `a=1` it is `1`.
- At `k=1` the unique tuple is `(a)`, giving `ψ(a)`. For `𝔽₂`, the values at `a=1`, `k=1,2,3` are `−1,1,−1`.

**Checks.** For the orthogonal sum.

- Over `𝔽₂`, `a=1`, its unique tuple gives `U₁=U₂=1`, since both distinguished coordinates add to zero.
- Over `𝔽₃`, for `ψ(1)=ζ₃`, `U₁(1)=1` and `U₁(2)=4`, agreeing with `R₂(1)²=(−1)²` and `R₂(2)²=2²`.
- At `n=0` the defining expression, with its two distinguished coordinates and `2n − 2` truncated to `0` further ones, is still a sum over two units; over `𝔽₃`, `a=2`, it gives `4`, whereas an empty-tuple sum with zero additive argument would give `1`. Every orthogonal headline requires `n≥1`.

**Checks.** For the quadratic character.

- On `𝔽₃` with coefficients `ℂ`, its values at `0,1,2` are `0,1,−1`; zero is not a unit and is assigned `0`.
- On `𝔽₅`, the nonzero square `4` gives `1`, while the nonsquare `2` gives `−1`.
- On `𝔽₃` with characteristic-two coefficients the values at `1,2` both become `1`. On `𝔽₄`, every nonzero element is a square, so the character takes `0` at zero and `1` on all units; the odd-characteristic identity excludes this source field.

**Checks.** For the quadratic hypergeometric sum.

- At `b=0`, every summand has quadratic-character factor `ρ(0)=0`, hence the total is `0`, even for `N=0`.
- Over `𝔽₃`, `N=0`, `b=1`, the sole tuple gives `ψ(−1)ρ(1)=ζ₃²`; for `b=2` it gives `ψ(−2)ρ(2)=−ζ₃`.
- Over `𝔽₃`, `N=1`, `b=1`, the two summands are `1` and `−1`, giving `0`; for `b=2` they are `−ζ₃²` and `ζ₃`, giving `i√3`.

**Checks.** For the trace character.

- For `F=𝔽₄=𝔽₂[ω]`, `ω²=ω+1`, the traces at `0,1,ω` are `0,0,1`, giving character values `1,1,−1` for the nontrivial base character.
- The other non-prime-field element `ω+1` also has trace `1` and value `−1`; composing with the identity instead of the field trace would not give these four values.
- With trivial base character all four values are `1`; on the prime field `𝔽₂` with nontrivial base character the values at `0,1` are `1,−1`.

**Checks.** For the identities.

- Over `𝔽₂`, `a = 1`: `R₂ = 1`, `R₃ = −1` and `R₂² − 2 = −1`; the printed factor `−1/√q` of Xu–Zhu (1.2.9.1) at `p = 2`
  would give `1/√2`.
- Over `𝔽₂` at `n = 2`: `U₂(1) = 1` and `R₅(1) = −1`, so `U₂ − 2 = R₅`.
- Over `𝔽₃`, `a = 1`: `R₂ = −1`, `R₂² − 3 = −2`, and `g = −i√3` for `ψ(1) = e^{2πi/3}`, so `H₃(1) = 2i√3`. The Gauss sum
  `Σ_y ρ(y) ψ(y)` instead of `Σ_y ρ(y) ψ(−y)` fails over `𝔽₃` and `𝔽₇` (where `ρ(−1) = −1`) and passes over `𝔽₅` and `𝔽₉`.
- Identity (i) is false for a nontrivial character of `𝔽₄` not of the form `ψ₀ ∘ Tr`, i.e. `x ↦ ψ₀(Tr(cx))` with `c ≠ 1`:
  then `U₁(a) − 4 = R₃(a/c)`, not `R₃(a)`; identities (ii) and (iii) hold for every nontrivial character. All
  three were checked by direct computation: (i) over `𝔽₂, 𝔽₄, 𝔽₈`; (ii) over `𝔽₃, 𝔽₉, 𝔽₅, 𝔽₇`; (iii) over all seven
  fields; for `n ≤ 3` where the sums are small enough.

### 11.2 Toric hypergeometric slopes

For odd `p`, `n ≥ 1`, `d | p − 1` and `a ∈ 𝔽_q^×`, let `f_d = Σ_{i=1}^{2n} x_i − z^d + a z^d/∏_{i=1}^{2n} x_i` on `𝔾_m^{2n+1}`, and
let `Δ(f_d)` be its Newton polyhedron, the convex hull of the origin and the exponent vectors. Prove that `f_d` is
nondegenerate on every face of `Δ(f_d)` not containing the origin, that `Δ(f_d)` has dimension `2n + 1` and volume
`d/(2n)!`, that the `L`-function `exp(Σ_m S_m(f_d) T^m/m)` of the toric sums `S_m` over `(𝔽_{q^m}^×)^{2n+1}` is a polynomial
of degree `d(2n + 1)`, and that its Hodge and Newton slopes are `j/d`, `0 ≤ j < d(2n + 1)`, each once; and that
`S_m(f₂) − S_m(f₁)` is the raw quadratic hypergeometric sum `H_{ψ,m}(2n + 1; ρ)(a)` (Xu–Zhu Lemma 5.4.3,
(5.4.3.1)–(5.4.3.2), pp. 62–63; Adolphson–Sperber, Corollary 3.11; Wan 2004, Corollary 2.6 and Theorem 3.1;
Wan 1993, boundary decomposition). Hence the unnormalized quadratic hypergeometric object of §9.1 with
`2n + 1` upper parameters has slopes `1/2, 3/2, …, 2n + 1/2` at every `a`. Route: `Δ(f_d)` has vertices `0`, `e₁, …, e_{2n}`, `d e_z` and
`(−1, …, −1, d)`; its codimension-one faces not containing the origin are the `2n + 1` simplices
`{e₁, …, e_{2n}, d e_z}` and `{e_i (i ≠ j), d e_z, (−1, …, −1, d)}` for `1 ≤ j ≤ 2n`, each with vertex determinant `±d`, and every face
not containing the origin lies in one of them. Since `p ∤ d`, the restriction of `f_d` to each such simplex is a
diagonal Laurent polynomial that is nondegenerate on all its faces (gap:toric-exponential-sum-ordinarity), so
`f_d` is nondegenerate; gap:toric-exponential-sum-hodge-bound gives the polynomiality, the degree
`(2n + 1)! · d/(2n)! = d(2n + 1)` and Newton above Hodge; counting the lattice points of the cone over `Δ(f_d)` by
weight gives the Hodge numbers `1` at each `j/d`, `0 ≤ j < d(2n + 1)`. For each codimension-one face `δ` not containing
the origin the group `S(δ)` has order `d`, so its exponent divides `p − 1`, and the diagonal criterion of
gap:toric-exponential-sum-ordinarity makes the restriction `f_d^δ` ordinary; the facial decomposition there gives
ordinarity of `f_d`. The index `d` is a property of the codimension-one faces only, while nondegeneracy is needed on
every face not containing the origin. Divide the two `L`-polynomials, keeping the sign: the unnormalized trace of
the hypergeometric object is minus the raw sum (§9.1 with `n + m − 1 = 2n + 1` odd).
*Needs:* §9.1; gap:toric-exponential-sum-hodge-bound; gap:toric-exponential-sum-ordinarity;
PadicDifferentialEquationsAndRigidCohomology §§RD.6.4, RD.6.25.

**Checks.**

- `d = 1` gives slopes `0, 1, …, 2n`; `d = 2` gives `0, 1/2, 1, …, 2n + 1/2`; the quotient keeps the half-integers.
- `S_m(f₂) − S_m(f₁)` is the raw sum, minus the unnormalized trace; the sign has valuation zero and does not move
  the polygon, but it fixes the quotient `L(f₂)/L(f₁)` as the hypergeometric determinant.
- For `n = 1`, `p = 3`, `d = 2`: `Δ(f₂)` has dimension `3` and volume `1`, the degree is `3! · 1 = 6` and the slopes are
  `0, 1/2, 1, 3/2, 2, 5/2`; for `d = 1` the volume is `1/2`, the degree `3` and the slopes `0, 1, 2`, so the quotient keeps
  `1/2, 3/2, 5/2`.
- Codimension-one faces only: for `n = 1`, `d = 2` the face with vertices `(1, 0, 0)`, `(0, 1, 0)`, `(0, 0, 2)` has determinant
  `2` and `S(δ)` of order `2`, while the vertex `(1, 0, 0)`, a face of dimension `0` not containing the origin, is primitive
  in its saturated span and has index `1`, not `2`; "every face has index `d`" is false.
- At `p = 2`, `d = 2` the hypotheses fail twice: `d ∤ p − 1 = 1`, and on the vertex `(0, …, 0, 2)` the restriction `−z²` has
  logarithmic derivative `z ∂_z(−z²) = −2z²`, identically zero in characteristic `2`, so `f₂` is degenerate there.

### 11.3 Everywhere ordinarity

For split `H` of type `A_n`, `B_n`, `C_n`, `D_n` or `G₂`, prove that `ν_a = ρ` at every closed point `a` of `𝔾_m`, and at
the logarithmic point `0` (Xu–Zhu Theorem 1.2.4(ii), p. 5, and Theorem 5.4.2(ii), p. 62; Lemma 5.4.3, pp. 62–63). The
normalized slopes are `−(r−1)/2, …, (r−1)/2` for scalar rank `r ≥ 2` at every prime, with no condition `(r, p) = 1`,
and `−n, …, n` for the odd orthogonal standard representation of rank `2n + 1`. Route: types `A` and `C` are
gap:scalar-kloosterman-ordinarity through §8.1; types `B` and `D` use §11.2 with the normalization of §9.2 at odd `p`
and §10.6 with the scalar case at `p = 2`, together with §8.3; the faithful standard representation detects the
Newton point (§5.1), and `G₂ ⊂ SO₇` and central pushouts give the rest. On trace functions, for types `B_n` and
`D_{n+1}`: for a finite field `F` of characteristic `p`, `a ∈ F^×` and `n ≥ 1` there are `β₀, …, β_{2n} ∈ ℂ_p` with
`v(β_i) = i·v(|F|)` and `U_n(a) − |L| = Σ_i β_i^{[L:F]}` for every finite extension `L/F`, the sums over `L` taken with
`ψ₀ ∘ Tr_{L/𝔽_p}` (`orthogonalSum_ordinary`). *Needs:* §§5.1, 8.1, 8.3, 9.2–9.3, 10.6, 11.2;
gap:scalar-kloosterman-ordinarity; Mathlib `PadicComplex`.

**Checks.**

- Scalar rank divisible by `p` is included: rank `2` at `p = 2` has slopes `−1/2, 1/2`, i.e. `v(α) = 0`, `v(β) = 1` for the
  raw eigenvalues with `α + β = −R₂`, `αβ = q`.
- The odd standard slopes are `−n, …, n`, and the even standard object of rank `2n + 2` adds one more slope `0`.
- At `n = 1` the trace statement is `Sym²` of the rank-two case for `p` odd (slopes `0, 1, 2` of `α², q, β²`) and the
  rank-three scalar case for `p = 2`; a polygon with a repeated slope, such as `0, 1, 1`, is excluded.

### 11.4 Monodromy of type `A_{2n}` at `p = 2`

For `H = SL_{2n+1}`, `n ≥ 1`, and `p = 2`, prove that `Be_H†` is the pushout of `Be†_{SO_{2n+1}}` along the standard
inclusion, and that its geometric and arithmetic monodromy is `SO_{2n+1}` for `n ≠ 3` and `G₂` for `n = 3`, embedded
through the standard representation; for another central form of type `A_{2n}` the monodromy is the image under
the central quotient (Xu–Zhu Theorem 4.5.2(ii),(iii), pp. 51–53; Corollary 5.3.10, p. 61). This includes `A₂` at
`p = 2` and differs from the characteristic-zero group `SL_{2n+1}` of §2.8. Route: §10.6 identifies the standard
objects; recover the group-valued pushout through the faithful standard representation and its preserved
quadratic form; apply §6.4 to `SO_{2n+1}`; pass through the central kernel. *Needs:* §§6.4, 2.9, 10.6;
KloostermanMomentsAndPotentialAutomorphy §§1.1, 1.3 (as a check).

**Checks.**

- For `SL₃` at `p = 2` the group is `SO₃`, and for its central quotients the image of `SO₃`.
- At rank seven the group is `G₂ ⊂ SO₇ ⊂ SL₇`; the adjoint representation of `SL₇` is not identified with anything by
  the standard comparison.
- KloostermanMomentsAndPotentialAutomorphy §§1.1, 1.3 gives `SO_r` (`r ≠ 7`) and `G₂` (`r = 7`) for the scalar sheaf at `p = 2`,
  `r` odd, in agreement.

### 11.5 All-prime corollaries

After §11.4, prove that the companion monodromy comparison (§7.6), the central torsor (§7.1), the radius statement (§7.3), adjoint rigidity and
the local statements of §6.6 hold for type `A_{2n}` at `p = 2` as well: `H^i(ℙ¹, j_{!+} Ad(Be_H†)) = 0` and
`Irr_∞ = rank H` for every almost-simple `H` at every `p`, and if `p ∤ |W_H|` the only nonzero adjoint upper break at
`∞` is `1/h`; and that the normalized convolution of §9.4 and the identity (iii) of §11.1 hold at `p = 2` with the
same shift and half twist, `Be†_{SO_{2n+1}, Std} ≅ (Be†_{SO₃, Std} ⋆ Be†_{2n−2})[1](1/2)` for `n ≥ 2` (Xu–Zhu
Corollaries 4.5.6–4.5.7 and Remark 4.5.8(iv), pp. 53–54; §§5.3.9–5.3.11, p. 61). Route:
repeat the localization computation of §6.6 with the known group, without identifying adjoint representations
through the standard comparison; apply gap:companion-monodromy; transport the convolution through §10.6.
*Needs:* §§6.6, 7.1, 7.3, 7.6, 9.4, 10.6, 11.4; gap:companion-monodromy.

**Checks.**

- The adjoint computation is repeated for the ambient group `SL_{2n+1}` at `p = 2`; equality of standard objects does
  not identify the adjoint functors of `SL_{2n+1}` and `SO_{2n+1}`.
- For `SO₃` at `p = 2` the inertia image at `∞` is `A₄`, compatible with `Sym²` of the rank-two object.
- `p = 2` divides `|W_H|` for every almost-simple `H`, so the `1/h` statement is never applied at `p = 2`.
- The shift at `p = 2`, over `𝔽₂`, `n = 2`, `a = 1`: `T_{SO₃}(1) = −1/2` and `K₂(1) = −1/√2`, so the unshifted twisted
  convolution has trace `(1/√2) · (1/(2√2)) = 1/4`, while `T_{SO₅}(1) = (U₂(1) − 2)/2² = −1/4`; `[1]` gives `−1/4`.

### Examples

- Over `𝔽₂`, `a = 1`, `n = 1, 2, 3`: `U_n(1) − 2 = −1 = R_{2n+1}(1)`.
- Over `𝔽₃`, `a = 1`, `n = 1`: `g (U₁(1) − 3) = (−i√3)(−2) = 2i√3 = H₃(1)`.

### Dependencies

Layers 5–10; KloostermanMomentsAndPotentialAutomorphy §§1.1, 1.3 and gap:scalar-kloosterman-ordinarity;
CongruenceSpectralGap §4.2a; gap:companion-monodromy; PadicDifferentialEquationsAndRigidCohomology
§§RD.6.4, RD.6.25; gap:toric-exponential-sum-hodge-bound; gap:toric-exponential-sum-ordinarity;
Mathlib `gaussSum`, `quadraticChar`, `AddChar`, `PadicComplex`.

## Downstream consumers

- **GlobalShtukasAndFunctionFieldLanglandsPartII** uses the root-depth quotient and the two-point level model
  (§§0.2–0.3), the clean datum, the Hecke action, the eigenobject and the closed-point trace comparison
  (§§1.4–1.6, 1.8), the Bessel F-isocrystal and its logarithmic extension (§§4.1–4.2), and adjoint rigidity with
  the vanishing of adjoint inertia invariants at `∞` at every prime (§§6.6, 11.5), for Kloosterman parameters of
  split almost-simple groups. It cites these targets by the former labels of the table under *How to read the
  build*.

## Worked examples

**Characteristic two.** Over `𝔽₂` the only unit is `1` and `ψ(1) = −1`. The raw values are `R₂(1) = 1`, `R₃(1) = −1`,
`R₅(1) = −1`, `R₇(1) = −1`, and `U_n(1) = 1` for every `n` (all coordinates are `1`, and the argument is `2n + 2 = 0`).
Thus `U_n(1) − 2 = −1 = R_{2n+1}(1)`. The normalized traces are `T₂ = −1/√2`, `T₃ = −1/2` and `T_{SO_{2n+1}}(1) = −1/2^n`;
`T₂² − 1 = −1/2 = T₃` is the normalized Carlitz identity, while a raw identity with an extra factor `2` fails.

**Odd characteristic.** Over `𝔽₃` with `ψ(1) = e^{2πi/3}`: `R₂(1) = ψ(2) + ψ(1) = −1`, `R₂(−1) = 2`, the normalized
traces are `1/√3` and `−2/√3`, and `√3` must lie in the coefficient field. `R₂(1)² − 3 = −2`, the quadratic Gauss sum
`g = Σ_y ρ(y) ψ(−y) = −i√3`, and the identity `g (U₁(1) − 3) = H₃(4) = H₃(1)` gives `H₃(1) = 2i√3`. Over `𝔽₉` the
quadratic Gauss sum is `3 = −(i√3)²`, as the Hasse–Davenport relation of CharacterSumsOverFiniteFields §3.3 requires.

**The even toric constant.** At `n = 3` the candidate constants `Q² − Q` and `(Q − 1)Q` coincide. At `n = 4` over `𝔽₂`,
`S₄(1) = 1`, the chart sum is `7 = 1 + 8 − 2`, the normalized `SO₈` trace is `7/8 = 1 + (−1/8)` and
`T_{SO₇}(1) = −1/8 = R₇(1)/8`; the printed constant gives `5/8`.

**The residue convention.** With `N = E₁₂` and `C₀ = diag(t^{−1}, t)`, `t² = q`: `N C₀` and `q C₀ N` both have upper
right entry `t`. The inverse satisfies the opposite relation. The two diagonal spectra are Weyl conjugate, which
does not by itself identify trace formulas in other representations.

**The cyclic quotient.** In the column cyclic basis, `∇_δ e₁ = e₂ = x η e₁` gives `∇ e₁ = η e₁ dx`: the connection
`d + η dx`, dual to the solution line `d − η dx` of `F`. With `f = F(x)/F(x^q)`, `c = q^n/f` satisfies
`c′ + η(x) c = q x^{q−1} c η(x^q)` and `c(0) = q^n`; for `h = F/G`, `h f_{G,q} = f_{F,q} h(x^q)` makes `h^{−1}` the quotient
isomorphism.

**The signed congruence.** For `B(j) = (−2)^{3j}/(j!)³`: `B(4)/B(2) = 1/27 ≡ −1 (mod 4)` while `B(0)/B(0) = 1`, so the
ordinary congruence fails at `s = 1` and the signed one holds; the first truncations of both Bessel series reduce
to `1`.

## References

- **[XZ]** D. Xu, X. Zhu, *Bessel F-isocrystals for reductive groups*, Invent. Math. 227 (2022), 997–1092;
  arXiv:1910.13391v2. Locators use the 71-page arXiv v2 pagination.
- **[HNY]** J. Heinloth, B. C. Ngô, Z. Yun, *Kloosterman sheaves for reductive groups*, Ann. of Math. 177 (2013),
  241–310; author-hosted published version, printed page numbers.
- **[FG]** E. Frenkel, B. Gross, *A rigid irregular connection on the projective line*, Ann. of Math. 170 (2009),
  1469–1512; arXiv:0901.2163v3, preprint pagination.
- **[Zhu]** X. Zhu, *Frenkel–Gross' irregular connection and Heinloth–Ngô–Yun's are the same*, Selecta Math. 23
  (2017); arXiv:1603.05796v2, preprint pagination.
- **[BD]** A. Beilinson, V. Drinfeld, *Quantization of Hitchin's integrable system and Hecke eigensheaves*,
  preprint, author-hosted; §5.3.
- **[Miy]** K. Miyatani, *p-adic generalized hypergeometric equations from the viewpoint of arithmetic
  D-modules*, Amer. J. Math. 142 (2020); arXiv:1607.04852v2, preprint pagination.
- **[GR]** B. H. Gross, M. Reeder, *Arithmetic invariants of discrete Langlands parameters*, Duke Math. J. 154
  (2010); author preprint of 1 March 2010.
- **[LT]** T. Lam, N. Templier, *The mirror conjecture for minuscule flag varieties*, arXiv:1705.00758v4.
- **[PRW]** C. Pech, K. Rietsch, L. Williams, *On Landau–Ginzburg models for quadrics and flat sections of
  Dubrovin connections*, arXiv:1404.4844v2.
- **[Car]** L. Carlitz, *A note on exponential sums*, Pacific J. Math. 30 (1969), 35–37.
- **[Dw]** B. Dwork, *p-adic cycles*, Publ. Math. IHÉS 37 (1969), 27–115.
- **[Spe]** S. Sperber, *Congruence properties of the hyper-Kloosterman sum*, Compositio Math. 40 (1980), 3–33.
- **[AS]** A. Adolphson, S. Sperber, *Exponential sums and Newton polyhedra: cohomology and estimates*, Ann. of
  Math. 130 (1989), 367–406.
- **[Wan93]** D. Wan, *Newton polygons of zeta functions and L functions*, Ann. of Math. 137 (1993), 247–293.
- **[Wan04]** D. Wan, *Variation of p-adic Newton polygons for L-functions of exponential sums*, Asian J. Math. 8
  (2004).
- **[VL]** V. Lafforgue, *Estimées pour les valuations p-adiques des valeurs propres des opérateurs de Hecke*,
  Bull. SMF 139 (2011), 455–477.
- **[DAd]** M. D'Addezio, *The monodromy groups of lisse sheaves and overconvergent F-isocrystals*, Selecta Math.
  26 (2020); arXiv:1711.06669v6.
- **[Tsu]** N. Tsuzuki, *Minimal slope conjecture of F-isocrystals*, arXiv:1910.03871v3.
- **[Abe]** T. Abe, *Langlands correspondence for isocrystals and the existence of crystalline companions for
  curves*, J. Amer. Math. Soc. 31 (2018); arXiv:1310.0528v3.
- **[AC]** T. Abe, D. Caro, *Theory of weights in p-adic cohomology*, Amer. J. Math. 140 (2018); arXiv:1303.0662v4.
- **[Bal]** F. Baldassarri, *Differential modules and singular points of p-adic differential equations*, Adv.
  Math. 44 (1982), 155–179.
- **[DH]** H. Davenport, H. Hasse, *Die Nullstellen der Kongruenzzetafunktionen in gewissen zyklischen Fällen*,
  J. reine angew. Math. 172 (1935), 151–182.
- **[ESDE]** N. Katz, *Exponential sums and differential equations*, Ann. of Math. Stud. 124 (1990).
- **[KatzCC]** N. Katz, *From Clausen to Carlitz: low-dimensional spin groups and identities among character
  sums*, Mosc. Math. J. 9 (2009).
