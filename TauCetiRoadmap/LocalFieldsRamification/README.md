# Roadmap: local fields and ramification

**Summary.** This roadmap develops the arithmetic of finite extensions of nonarchimedean local
fields: normalized valuations, unit filtrations and power classes, unramified extensions and
Frobenius, Eisenstein and tame extensions, lower and upper ramification groups and the Herbrand
functions, the norm on the unit filtration, the different and the discriminant, and, inside the
absolute Galois group, inertia, wild inertia and the marked Iwasawa presentation of the tame
quotient. All of that is proved in the pinned Tau Ceti, on Mathlib's carriers
(`IsNonarchimedeanLocalField`, `ValuativeRel`, `ValuativeExtension`), and is consumed here by name.
What remains is the arithmetic that makes ramification breaks of abelian extensions integral:
Sen's congruence for the lower breaks of a totally ramified cyclic extension of degree `pʳ`
(Layer 1) and the Hasse–Arf theorem for every finite abelian extension (Layer 2), together with
three complements on the native carriers (Layer 0). The end theorems are
`pow_succ_dvd_lowerIndex_sub` and `hasseArf`.

## Scope and ownership

**Owned here.** The targets of Layers 0–2: the comparison of `U(ℚ_p, i)` with congruences in
`ℤ_p`, the unshifted norm inclusion on the unit filtration and the dyadic square-class count in
degree form (Layer 0); the lower-break list, Sen's congruence and the integrality of upper breaks
of a totally ramified cyclic `p`-power extension (Layer 1); the reduction of a positive upper
break of a cyclic extension to its totally ramified `p`-part, and the Hasse–Arf theorem (Layer 2).
No roadmap on main or among the open roadmap proposals states Sen's congruence or the general
Hasse–Arf theorem; the consumers listed under *Downstream consumers* import Hasse–Arf from here.

**Already in the library.** The rest of the subject is proved in the pinned Tau Ceti, and the exact declarations are listed under *Exact supplier contracts*:

- the local-field structure on a finite extension and on a finite intermediate field, its
  uniqueness, the normalized valuation and absolute value, `e`, `f`, `e · f = [L : K]`, the
  valuation of natural numbers and the absolute ramification index;
- the unit filtration, its graded pieces, the Teichmüller section, the decomposition
  `Kˣ ≃ ℤ × μ_{q−1} × U(K,1)`, the pro-`p` property of `U(K,1)`, the torsion of `Kˣ`, the deep-unit
  logarithm, power classes, openness of the power subgroups and the local square theorem;
- unramified extensions, the residue correspondence, Frobenius, existence and rigidity, the
  lattice of finite unramified subextensions, the maximal unramified extension with its
  identification with `Ẑ`, and the unramified norm theorems;
- Eisenstein extensions, the unramified–totally ramified factorization, tame totally ramified
  extensions as radical extensions, local monogenicity and the Eisenstein power-basis valuation
  formula;
- the lower ramification groups, the quotient embeddings and the tame character with its
  Frobenius twist, the Herbrand functions, the upper numbering with the quotient and tower
  theorems, the integral depth `ψℕ`, the Herbrand-shifted norm inclusion, the five regimes of the
  graded norm of a cyclic extension of prime degree with their index and conductor consequences,
  and Hasse–Arf for elementary abelian extensions;
- the different and the discriminant, Hilbert's different formula, the tame criterion, the wild
  bounds and invariance under `K`-isomorphism;
- inertia, arithmetic Frobenius lifts, wild inertia and its pro-`p` Sylow identification, the
  maximal tamely ramified extension, the tame character `I_K/P_K ≃ Ẑ^{(p')}(1)` with its twist,
  and the marked Iwasawa presentation of `G_K/P_K` in its arithmetic and geometric forms.

**Left to other roadmaps.** Finite-group Tate cohomology, class formations, local reciprocity and
local duality are **ClassFieldTheory**'s (Layers 5–8). The maximal pro-`p` quotient `G_K(p)`, its
generator rank and its Demushkin presentation are **LocalGaloisGroups**'. Completion maps from
number fields, comparison with decomposition groups and the global different and discriminant are
**NumberFieldArithmetic**'s. Families of totally ramified extensions, their counting and Serre's
mass formula are **MassFormula**'s. Abstract pro-`p` and profinite Sylow theory is
**ProfiniteProPGroups**', whose predicates are Tau Ceti's `TauCeti.IsProP` and
`TauCeti.IsProPSylow`. Valued fields beyond local fields (henselization, tame and defectless
extensions of general valued fields) are **LocalFieldsRamificationPartII**'s.

## Conventions

`K` is a nonarchimedean local field in Mathlib's sense (`IsNonarchimedeanLocalField K` on a field
with `ValuativeRel K` and a compatible topology), with integer ring `𝒪[K]`, maximal ideal `𝓂[K]`,
residue field `𝓀[K]` of order `q` and residue characteristic `p`. A finite extension `L/K` carries
`ValuativeExtension K L`; Tau Ceti's uniqueness theorem makes that structure canonical.

- **Valuations.** `v_K` is the additive normalized valuation, `v_K(π) = 1` on a uniformizer
  (`TauCeti.normalizedValuation`, valued in `Multiplicative ℤ`). Mathlib's canonical valuation is
  multiplicative with value `< 1` on a uniformizer; the two are related only through
  `TauCeti.toAdd_normalizedValuation_eq_neg_log`. The absolute value is `‖x‖_K = q^{−v_K(x)}`.
- **Unit filtration.** `U(K,0) = 𝒪[K]ˣ` and `U(K,i) = 1 + 𝓂[K]^i` for `i ≥ 1`, indexed by `ℕ`
  (`TauCeti.unitFiltration`). `U(K,0)/U(K,1)` is multiplicative (`𝓀[K]ˣ`); the deeper graded
  pieces are additive (`𝓀[K]`).
- **Lower numbering.** For `L/K` finite Galois, `G_i = {σ | v_L(σx − x) ≥ i + 1 for all x ∈ 𝒪[L]}`
  for `i : ℤ`, so `G_{−1} = G` and `G_0` is inertia; equivalently `σ ∈ G_i` iff
  `i + 1 ≤ i_G(σ)` for Serre's lower index `i_G(σ) = min_x v_L(σx − x)`
  (`TauCeti.IsLocalRing.lowerIndex`). The real index is `G_u = G_{⌈u⌉}`. A *lower break* is an
  `i ≥ 0` with `G_i ≠ G_{i+1}`; for `σ ≠ 1` it is `i_G(σ) − 1` for any `σ ∈ G_i ∖ G_{i+1}`.
- **Herbrand functions.** `φ_{L/K}(u) = ∫_0^u dt / [G_0 : G_t]` on `[−1, ∞)`, with inverse
  `ψ_{L/K}`, both order isomorphisms of `RamificationIndexDomain = [−1, ∞)`. The upper numbering is
  `G^v = G_{ψ(v)}`, the numbering compatible with quotients. An *upper break* is a `u` with
  `G^v ⊊ G^u` for every `v > u` (`TauCeti.LocalFieldsRamification.UpperJump`).
- **Towers.** For `M/L/K` with `M/K` and `L/K` Galois, `φ_{M/K} = φ_{L/K} ∘ φ_{M/L}` and
  `ψ_{M/K} = ψ_{M/L} ∘ ψ_{L/K}`. The order of composition is part of the statement: the two orders
  can differ, but they need not.
- **Frobenius.** Frobenius is arithmetic, `σ(y) ≡ y^q mod 𝓂[L]`; geometric Frobenius is its
  inverse. `G_K = Field.absoluteGaloisGroup K` on `AlgebraicClosure K`; `G_K^t` is the quotient by
  wild inertia (not the maximal pro-`p` quotient), and the Iwasawa relation is `σ τ σ⁻¹ = τ^q` for
  an arithmetic Frobenius lift `σ`.

**Checks.**

- `v_{ℚ_2}(12) = 2` and `‖12‖_{ℚ_2} = 1/4`, while Mathlib's multiplicative valuation of `12` is
  `< 1`; a definition that forgot the sign of the logarithm would give `v = −2`.
- On `ℚ_2`: `U(ℚ_2,0)/U(ℚ_2,1)` has order `q − 1 = 1`; `5 ∈ U(ℚ_2,2)` because `v_2(5 − 1) = 2`,
  but `5 ∉ U(ℚ_2,3)`; and `2 ∉ U(ℚ_2,0)` because `v_2(2) = 1`. An indexing off by one would place
  `5` in `U(ℚ_2,3)`.
- For `L = ℚ_2(ζ_8)` over `ℚ_2`, with `G = (ℤ/8)ˣ`: `G_0 = G_1 = G`, `G_2 = G_3 = {1, 5}`, `G_4 = 1`.
  Hence `φ(2) = 1 + 1/2 = 3/2`, which is not an integer, and `ψ(2) = 3`, which is; a definition of
  `φ` with slope `[G_t : G_0]` instead of its inverse would give `φ(2) = 3`.
- For the same field, with `H = {1, 7}` fixing `ℚ_2(√2)`: `G_3 H/H = G/H` while `(G/H)_3 = 1`,
  because `v_{ℚ_2(√2)}(σ(√2) − √2) = v(2√2) = 3`. Lower numbering is not compatible with quotients.
- Tower order, positive control: for `M = ℚ_2(ζ_8)`, `L = ℚ_2(√2)`, `K = ℚ_2`, the lower break of
  `L/K` is `2` and that of `M/L` is `1`, so `φ_{L/K}(φ_{M/L}(4)) = φ_{L/K}(5/2) = 9/4 = φ_{M/K}(4)`,
  while the reversed composite gives `φ_{M/L}(φ_{L/K}(4)) = φ_{M/L}(3) = 2`.
- Tower order, negative control: for `L/ℚ_2` unramified quadratic and `M = L(√2)`, `φ_{L/K}` is the
  identity and `φ_{M/L}(4) = 2 + (4 − 2)/2 = 3`; both orders give `3`, although `M/L` is wild.
- Herbrand shift: in `L = ℚ_3(√3)` (tame quadratic, `ψ_{L/ℚ_3}(v) = 2v`), the unit `4` lies in
  `U(L,2)` because `v_L(3) = 2`, but `N(4) = 16` and `v_3(15) = 1`, so `N(U(L,2)) ⊄ U(ℚ_3,2)`; the
  true inclusion is `N(U(L,4)) ⊆ U(ℚ_3,2)`.
- Arithmetic versus geometric Frobenius: on the unramified cubic extension `ℚ_2(ζ_7)`, arithmetic
  Frobenius sends `ζ_7 ↦ ζ_7^2` and geometric Frobenius sends `ζ_7 ↦ ζ_7^4`. (On a quadratic
  extension the two coincide, so a quadratic example cannot pin the convention.)
- Square classes: `#(ℚ_2ˣ/(ℚ_2ˣ)²) = 4 · 2^{v_2(2)} = 8`, while `#(ℚ_3ˣ/(ℚ_3ˣ)²) = 4`.

## Exact supplier contracts

### From Mathlib

- `IsNonarchimedeanLocalField`, `ValuativeRel`, `ValuativeExtension`, `IsValuativeTopology`;
  `ValuativeRel.valuation` and the notations `𝒪[K]`, `𝓂[K]`, `𝓀[K]`. A local field in this sense is
  locally compact with nontrivial valuation; its residue field is finite.
- `IsGalois`, `IsAbelianGalois` (Galois with commutative group), `AlgEquiv.restrictNormalHom`,
  `IsGalois.normalAutEquivQuotient`, `IntermediateField.fixedField`, `Subgroup.zpowers`,
  `Module.finrank`, `Field.absoluteGaloisGroup`, `AlgebraicClosure`.
- `PadicInt`, `Padic`, `PadicInt.toZMod`, `padicValNat`, `powMonoidHom`, `Algebra.norm`.

### From Tau Ceti

Each item names the declarations consumed and the file under `TauCeti/NumberTheory/LocalField/`
unless another directory is given. Hypotheses are as at the pin.

- *Finite extensions* (`FiniteExtension/Basic.lean`, `FiniteExtension/IntermediateField.lean`):
  `TauCeti.finiteExtensionValuativeRel`, `TauCeti.finiteExtension_isNonarchimedeanLocalField`,
  `TauCeti.finiteExtensionValuation_isEquiv`, `TauCeti.finiteExtensionValuativeRel_eq`,
  `TauCeti.finiteIntermediateFieldValuativeRel`, `TauCeti.finiteIntermediateFieldTopology`,
  `TauCeti.finiteIntermediateField_isNonarchimedeanLocalField`,
  `TauCeti.finiteIntermediateField_valuativeExtension`; the integer-ring algebra and its
  comparison `TauCeti.integerRing_eq_integralClosure`.
- *Valuations and `e`, `f`* (`NormalizedValuation.lean`, `RamificationIndex.lean`,
  `InertiaDegree.lean`, `NatCastValuation.lean`, `AbsoluteRamificationIndex.lean`, `Padic.lean`):
  `TauCeti.normalizedValuation`, `TauCeti.normalizedAbsoluteValue`,
  `TauCeti.toAdd_normalizedValuation_eq_neg_log`, `TauCeti.ramificationIndex`,
  `TauCeti.inertiaDegree`, `TauCeti.ramificationIndex_mul_inertiaDegree`,
  `TauCeti.ramificationIndex_tower`, `TauCeti.IsTotallyRamified` (`e = [L : K]`),
  `TauCeti.IsTamelyRamified`, `TauCeti.IsWildlyRamified`, `TauCeti.natCastValuation`,
  `TauCeti.absoluteRamificationIndex`, `TauCeti.absoluteRamificationIndex_eq_natCastValuation`,
  `Padic.integerRingEquiv`, `Padic.coe_integerRingEquiv_apply`, `Padic.natCard_residueField`.
- *Units* (`UnitFiltration/Basic.lean`, `UnitFiltration/Uniformizer.lean`,
  `UnitFiltration/ProP.lean`, `Teichmuller.lean`, `UnitsDecomposition.lean`,
  `RootsOfUnity/Torsion.lean`, `DeepUnits/Basic.lean`, `DeepUnits/Coordinates.lean`):
  `TauCeti.unitFiltration`, `TauCeti.UnitFiltrationGraded`,
  `TauCeti.unitFiltrationGradedZeroEquivResidueFieldUnits`,
  `TauCeti.unitFiltrationGradedSuccEquivResidueFieldOfUniformizer`, `TauCeti.teichmuller`,
  `TauCeti.unitsEquivIntProd`, `TauCeti.unitFiltration_one_isProP`, `TauCeti.natCard_torsion_units`,
  `TauCeti.deepUnitExpLogEquiv` (for `e < (p − 1) i`), `TauCeti.deepUnitEquivPiPadicInt`.
- *Power classes* (`PowerSubgroup/Basic.lean`, `PowerSubgroup/Open.lean`, `Squares.lean`):
  `TauCeti.card_powerClasses` (for `(n : K) ≠ 0`),
  `TauCeti.card_powerClasses_eq_mul_inv_normalizedAbsoluteValue`, `TauCeti.card_squareClasses`,
  `TauCeti.isOpen_range_powMonoidHom`, `TauCeti.unitFiltration_le_range_powMonoidHom_two_iff`.
- *Unramified extensions* (`Unramified/Basic.lean`, `ResidueCorrespondence.lean`, `Frobenius.lean`,
  `Unramified/Existence.lean`, `Unramified/Rigidity.lean`, `Unramified/Lattice.lean`,
  `Unramified/Maximal.lean`, `Unramified/ZHat.lean`, `Norm/Unramified/Basic.lean`):
  `TauCeti.IsUnramified`, `TauCeti.isUnramified_iff_ramificationIndex_eq_one`,
  `TauCeti.frobeniusAlgEquiv`, `TauCeti.valuation_frobeniusAlgEquiv_sub_pow`,
  `TauCeti.unramifiedExtension`, `TauCeti.existsUnique_isUnramified_finrank_eq`,
  `TauCeti.IsUnramified.existsUnique_algEquiv_residueFieldHom_eq`,
  `TauCeti.finiteUnramifiedSubextensionDegreeEquiv`, `TauCeti.maximalUnramifiedExtension`,
  `TauCeti.maximalUnramifiedGaloisGroupEquivZHat`, `TauCeti.normGroup`,
  `TauCeti.map_normUnits_unitFiltration`, `TauCeti.mem_normGroup_iff_dvd_normalizedValuation`.
- *Ramified extensions* (`Eisenstein/TotallyRamified.lean`, `Eisenstein/PowerBasis.lean`,
  `Unramified/Factorization.lean`, `TamelyRamified/Basic.lean`, `TamelyRamified/Galois.lean`,
  `Monogenic.lean`): `TauCeti.isTotallyRamified_iff_exists_eisenstein_generator`,
  `TauCeti.addVal_sum_eisenstein_powerBasis`,
  `TauCeti.isTotallyRamified_unramifiedExtension_inertiaDegree`,
  `TauCeti.IsTotallyRamified.exists_pow_eq_uniformizer_of_isTamelyRamified`,
  `TauCeti.IsTotallyRamified.exists_pow_eq_uniformizer_and_autEquivRootsOfUnity`,
  `TauCeti.exists_integerRing_adjoin_eq_top`.
- *Lower numbering* (`TauCeti/RingTheory/LocalRing/RamificationGroup.lean`, `RamificationGroup.lean`,
  `UnitFiltration/RamificationGroup.lean`, `UnitFiltration/Conjugation.lean`):
  `TauCeti.IsLocalRing.lowerIndex`, `TauCeti.LocalFieldsRamification.lowerRamificationGroup`,
  `TauCeti.LocalFieldsRamification.lowerRamificationGroupReal`,
  `TauCeti.LocalFieldsRamification.mem_lowerRamificationGroup_iff_le_lowerIndex`,
  `TauCeti.LocalFieldsRamification.lowerIndex_restrictScalars` (lower indices of a subgroup agree),
  `TauCeti.isPGroup_ramificationGroup` (positive lower groups are `p`-groups),
  `TauCeti.ramificationGroupGradedToResidueField`, `TauCeti.tameCharacter`,
  `TauCeti.tameCharacter_conj_of_smul_eq_pow`.
- *Herbrand functions and upper numbering* (`Herbrand/Basic.lean`, `Herbrand/Tower.lean`,
  `Herbrand/UpperQuotient.lean`, `Herbrand/Jump.lean`, `Herbrand/Unramified.lean`,
  `Herbrand/HasseArf.lean`, `Herbrand/CyclicReduction.lean`):
  `TauCeti.LocalFieldsRamification.RamificationIndexDomain`,
  `TauCeti.LocalFieldsRamification.herbrandOrderIso`, `TauCeti.LocalFieldsRamification.herbrand`,
  `TauCeti.LocalFieldsRamification.inverseHerbrand`,
  `TauCeti.LocalFieldsRamification.upperRamificationGroup`,
  `TauCeti.LocalFieldsRamification.psiNat`, `TauCeti.LocalFieldsRamification.coe_psiNat`,
  `TauCeti.LocalFieldsRamification.herbrand_tower`,
  `TauCeti.LocalFieldsRamification.inverseHerbrand_tower`,
  `TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup`,
  `Subgroup.upperRamificationGroup_fixedField`, `TauCeti.LocalFieldsRamification.UpperJump`,
  `TauCeti.LocalFieldsRamification.upperJump_herbrand_iff`,
  `TauCeti.LocalFieldsRamification.lowerRamificationGroup_eq_bot_of_isUnramified`,
  `TauCeti.LocalFieldsRamification.UpperJump.exists_eq_intCast_of_finrank_prime`,
  `TauCeti.LocalFieldsRamification.upperJump_iff_exists_isCyclic_intermediateField`,
  `TauCeti.LocalFieldsRamification.UpperJump.exists_eq_intCast_of_exponent_prime`. The last three
  are Hasse–Arf for prime degree, the detection of an upper break of an abelian extension in a
  cyclic subextension whose later upper groups are trivial, and Hasse–Arf for elementary abelian
  groups; none of them covers a cyclic group of order `p²`.
- *Norms* (`Norm/Basic.lean`, `Norm/Herbrand.lean`, `Norm/Graded.lean`, `Norm/AfterBreak.lean`,
  `Norm/Surjectivity.lean`, `Norm/Conductor.lean`): `TauCeti.normalizedValuation_norm`,
  `TauCeti.map_normUnits_unitFiltration_psiNat_le`, `TauCeti.normGradedMap`,
  `TauCeti.normGradedMap_tame_break_zero`, `TauCeti.normGradedMap_zero_before_break`,
  `TauCeti.normGradedMap_positive_before_break`, `TauCeti.normGradedMap_at_break`,
  `TauCeti.algebraMap_unitFiltrationGradedSuccEquivResidueFieldOfUniformizer_normGradedMap_mk`,
  `TauCeti.normGradedMap_after_break`, `TauCeti.map_normUnits_unitFiltration_after_break`,
  `TauCeti.relIndex_normUnits_unitFiltration_zero`.
- *Different and discriminant* (`Different/Basic.lean`, `Different/Hilbert.lean`,
  `Different/Wild.lean`, `Different/AlgEquiv.lean`, `Discriminant/Basic.lean`):
  `TauCeti.differentExponent`, `TauCeti.discriminantIdeal`, `TauCeti.discriminantExponent`,
  `TauCeti.discriminantExponent_eq_inertiaDegree_mul_differentExponent`,
  `TauCeti.differentExponent_eq_finsum_lowerRamificationGroup`,
  `TauCeti.differentExponent_eq_ramificationIndex_sub_one_iff`,
  `TauCeti.differentExponent_bounds_of_wild`, `TauCeti.differentExponent_eq_of_algEquiv`,
  `TauCeti.discriminantExponent_eq_of_algEquiv`.
- *Absolute Galois group* (`Unramified/Inertia/Basic.lean`, `WildInertia.lean`, `Tame/Quotient.lean`,
  `Tame/Presentation.lean`, `Tame/Geometric.lean`): `TauCeti.inertiaSubgroup`,
  `TauCeti.IsArithFrobeniusLift`, `TauCeti.wildInertiaSubgroup`, `TauCeti.maximalTameExtension`,
  `TauCeti.maximalTameExtension_eq_sup_adjoin`, `TauCeti.le_maximalTameExtension_iff`,
  `TauCeti.map_wildInertiaSubgroup_restrictNormalHom`, `TauCeti.isProPSylow_wildInertiaSubgroup`,
  `TauCeti.tameQuotient`, `TauCeti.inertiaTameCharacter`, `TauCeti.tameInertiaHom`,
  `TauCeti.toTameQuotient_mul_tameInertiaHom_mul_inv`, `TauCeti.IwasawaGroup`,
  `TauCeti.iwasawaCoordinate`, `TauCeti.ker_iwasawaCoordinate`, `TauCeti.tameQuotientEquiv`,
  `TauCeti.eq_tameQuotientEquiv`, `TauCeti.iwasawaCoordinate_tameQuotientEquiv`,
  `TauCeti.iwasawaGeometricEquiv`, `TauCeti.tameQuotientGeometricEquiv`.
- *Profinite groups* (`TauCeti/Topology/Algebra/Group/Profinite/`): `TauCeti.IsProP`,
  `TauCeti.IsProPSylow`, `TauCeti.presentedProfiniteGroup`, `TauCeti.zHat`.

No other roadmap supplies this one.

## How to read the build

Layer 0 adds three short complements to the native carriers and depends on nothing else here.
Layer 1 is the independent arithmetic input: for a totally ramified cyclic extension of degree
`pʳ` it lists the lower breaks, proves Sen's congruence between consecutive ones and converts them
into integral upper breaks through the Herbrand integral. Layer 2 reduces an arbitrary positive
upper break of a finite abelian extension to that case (cyclic detection, removal of the
unramified part, removal of the tame part) and concludes Hasse–Arf. Neither layer uses local
reciprocity, class field theory or the prime-degree norm computations.

## Layer 0: complements on the native carriers

### 0.1 The unit filtration of `ℚ_p`

Let `p` be prime. Transport `𝒪[ℚ_p]ˣ` to `ℤ_pˣ` along the units of `Padic.integerRingEquiv`, and
prove that a unit `u` lies in `U(ℚ_p, i)` exactly when `p^i` divides `u − 1` in `ℤ_p`, for every
`i : ℕ` (Serre, *Local Fields*, IV §2; standard). Prove also that the residue field `𝓀[ℚ_p]` is
identified with `ZMod p` compatibly with `PadicInt.toZMod`. *Needs:* Tau Ceti
`Padic.integerRingEquiv`, `Padic.natCard_residueField`, `TauCeti.unitFiltration`.

- Membership in `U(ℚ_p, i)` for `i ≥ 1` is the congruence `u ≡ 1 mod p^i` in `ℤ_p`, and every
  unit of `ℤ_p` lies in `U(ℚ_p, 0)`.
- The residue isomorphism sends the class of `x ∈ 𝒪[ℚ_p]` to `PadicInt.toZMod` of its image.

**Checks.**

- `5 ∈ U(ℚ_2, 2)` and `5 ∉ U(ℚ_2, 3)`, since `4 ∣ 4` and `8 ∤ 4`; an exponent shifted by one
  would accept `5` at depth `3`.
- `−1 ∈ U(ℚ_3, 0)` but `−1 ∉ U(ℚ_3, 1)`, since `3 ∤ −2`; a definition that used `1 + p^i ℤ_p` at
  `i = 0` would give all of `ℤ_3`, which is not a group.
- At `i = 0` the statement is the whole unit group, and the residue map sends `7 ∈ ℤ_5` to `2`.

### 0.2 The unshifted norm inclusion

Let `L/K` be finite Galois. Prove `N_{L/K}(U(L, i)) ⊆ U(K, ⌊φ_{L/K}(i)⌋)` for every `i : ℕ`, with
the floor of a nonnegative real. It follows from the Herbrand-shifted inclusion at
`n = ⌊φ(i)⌋`, because `ψ(⌊φ(i)⌋) ≤ ψ(φ(i)) = i` and the filtration is antitone (Serre, *Local
Fields*, V §6). *Needs:* Tau Ceti
`TauCeti.map_normUnits_unitFiltration_psiNat_le`, `TauCeti.LocalFieldsRamification.coe_psiNat`,
`TauCeti.LocalFieldsRamification.inverseHerbrand`.

- For every `i`, the norm maps `U(L, i)` into `U(K, ⌊φ(i)⌋)`; for unramified `L/K` this is
  `U(K, i)`.

**Checks.**

- `L = ℚ_3(√3)`, `i = 2`: `φ(2) = 1`, so the inclusion is `N(U(L,2)) ⊆ U(ℚ_3,1)`, consistent with
  `N(4) = 16 ∈ U(ℚ_3,1) ∖ U(ℚ_3,2)`; the unshifted `U(ℚ_3,2)` would be refuted by `4`.
- Unramified `L/K`: `φ` is the identity and the inclusion is `N(U(L,i)) ⊆ U(K,i)`.
- `L = ℚ_2(ζ_8)`, `i = 2`: `⌊φ(2)⌋ = ⌊3/2⌋ = 1`; using `⌈φ(2)⌉ = 2` instead is not implied by the
  shifted inclusion, whose depth `ψ(2) = 3 > 2`.

### 0.3 The dyadic square-class count

Let `K/ℚ_2` be finite of degree `N`. Prove `#(Kˣ/(Kˣ)²) = 2^{N+2}`. It follows from
`TauCeti.card_squareClasses`, which gives `4 · q^{v_K(2)}`, with `v_K(2) = e(K/ℚ_2)` and
`q = 2^{f(K/ℚ_2)}`, so `q^{v_K(2)} = 2^{e f} = 2^N` (Neukirch, *Algebraic Number Theory*, II §5).
*Needs:* Tau Ceti `TauCeti.card_squareClasses`, `TauCeti.absoluteRamificationIndex_eq_natCastValuation`,
`TauCeti.ramificationIndex_mul_inertiaDegree`, `TauCeti.natCard_residueField`,
`Padic.natCard_residueField`.

- For every finite `K/ℚ_2` of degree `N`, the number of square classes is `2^{N+2}`.

**Checks.**

- `K = ℚ_2`: `N = 1` and the count is `8`.
- `K = ℚ_2(√2)` (`e = 2`, `f = 1`) and `K = ℚ_2(√5)` (`e = 1`, `f = 2`): both have `N = 2` and
  count `16`; a formula `4 · 2^e` would give `16` and `8`.
- `K = ℚ_3`: the hypothesis fails and the count is `4`, not `2^{1+2}`.

### Examples

The values `v_2(5 − 1) = 2`, `N_{ℚ_3(√3)/ℚ_3}(4) = 16` and `#(ℚ_2ˣ/(ℚ_2ˣ)²) = 8` above.

### Dependencies

Tau Ceti only, as listed in each `*Needs:*` line.

## Layer 1: lower breaks of cyclic `p`-power extensions

Throughout this layer `L/F` is a finite Galois extension of nonarchimedean local fields that is
totally ramified, with cyclic group `G = Gal(L/F)` of order `pʳ`, `r ≥ 1`, where `p` is the residue
characteristic, and `σ` generates `G`. For an integer `k` with `σ^k ≠ 1` put
`c_k = v_L(σ^k(π)/π − 1) = i_G(σ^k) − 1` for a uniformizer `π` of `L`; it does not depend on `π`.

### 1.1 The lower-break list

Prove that the lower breaks of `L/F` are exactly `b_j = c_{p^j}` for `0 ≤ j < r`, that
`b_0 < b_1 < … < b_{r−1}`, that `G_{b_j} = ⟨σ^{p^j}⟩` has order `p^{r−j}`, and that `c_k = c_{p^j}`
whenever `σ^k ≠ 1` and `v_p(k) = j`. The last statement holds because `σ^k` and `σ^{p^j}` generate
the same subgroup and each `G_i` is a subgroup; the rest follows since `G = G_1` (the extension is
totally and wildly ramified) and the subgroups of a cyclic `p`-group form a chain (Fesenko–Vostokov,
*Local Fields and Their Extensions*, 2nd ed., III (4.3), Proposition, part (1), p. 92).
*Needs:* Tau Ceti `TauCeti.IsLocalRing.lowerIndex`,
`TauCeti.LocalFieldsRamification.mem_lowerRamificationGroup_iff_le_lowerIndex`,
`TauCeti.isPGroup_ramificationGroup`.

- The finite lower breaks are the `r` integers `c_{p^j}`, `0 ≤ j < r`, strictly increasing; there is
  no break attached to `σ^{p^r} = 1`.
- `#G_{b_j} = p^{r−j}`, and `G_i = 1` for `i > b_{r−1}`.

**Checks.**

- `r = 1` (cyclic of degree `p`): one break `b_0 = c_1`; for `ℚ_2(√2)/ℚ_2` it is `2`, from
  `v(σ(√2) − √2) = v(2√2) = 3`.
- `ℚ_2(ζ_16 + ζ_16⁻¹)/ℚ_2` (`r = 2`): the breaks are `2 < 4`; listing `c_{p^r}` would add a spurious
  infinite break.
- Non-example: `ℚ_3(√3)/ℚ_3` is cyclic of degree `2 ≠ 3`, tame, with single break `0`; the layer's
  hypothesis that the order is a power of the residue characteristic excludes it.

### 1.2 Sen's congruence

Prove that `p^{j+1}` divides `b_{j+1} − b_j` for `0 ≤ j < r − 1`. In terms of the lower index: if
`i_G(σ^{p^j}) = b₀ + 1` and `i_G(σ^{p^{j+1}}) = b₁ + 1` with `j + 1 < r`, then `p^{j+1} ∣ b₁ − b₀`
in `ℤ` (`pow_succ_dvd_lowerIndex_sub`). This is part (3) of Sen's proposition, that
`v_p(k₁ − k₂) ≥ a` implies `v_p(c_{k₁} − c_{k₂}) ≥ a + 1`, applied to `k₁ = p^{j+1}`, `k₂ = p^j`
(Fesenko–Vostokov, 2nd ed., III (4.3), Proposition, parts (2) and (3), pp. 92–93, after Sh. Sen).
The route is the induction of that proof: part (2) builds, for each nonzero `k`, an element `α_k`
of valuation `k` with `v_L(σ(α_k)/α_k − 1) = c_k` as a product of conjugates of `π`; one then
shows that the values `k + c_k` with `v_p(k) < n` are pairwise distinct, and expands a suitable
trace-like element in the `α_k` to contradict `v_p(c_{p^{n−1}} − c_{p^n}) < n`. The source works
over a complete discrete valuation field with perfect residue field, which covers every
nonarchimedean local field, in either characteristic. *Needs:* 1.1; Tau Ceti
`TauCeti.IsLocalRing.lowerIndex`, `TauCeti.IsTotallyRamified`; Mathlib `Subgroup.zpowers`.

- For every `j` with `j + 1 < r`, the consecutive lower breaks `b_j`, `b_{j+1}` satisfy
  `b_{j+1} ≡ b_j mod p^{j+1}`.
- For `r = 1` the statement is empty.

**Checks.**

- `ℚ_2(ζ_16 + ζ_16⁻¹)/ℚ_2`, `j = 0`: `b_1 − b_0 = 4 − 2 = 2` and `2 ∣ 2`.
- For `p` odd, the subfield of degree `p²` of `ℚ_p(ζ_{p³})`: upper breaks `1, 2`, lower breaks
  `1, 1 + p`, and `p ∣ p`.
- Non-example: the abstract filtration on `C₄` with `G_0 = G_1 = G_2 = C₄`, `G_3 = C₂`, `G_4 = 1`
  has lower breaks `2, 3`; `2 ∤ 1`, so no local field realizes it. Its subgroup break `3` and its
  quotient break `φ(2) = 2` are both integers, so a proof that only transports prime-order breaks
  through Herbrand functions cannot exclude it.

### 1.3 Integral upper breaks

Prove that the upper breaks of `L/F` are `u_0 = b_0` and
`u_j = b_0 + Σ_{a=0}^{j−1} (b_{a+1} − b_a)/p^{a+1}` for `1 ≤ j < r`, and that each `u_j` is an
integer. The formula is the Herbrand integral, whose slope on `(b_a, b_{a+1}]` is
`#G_t/#G_0 = p^{−(a+1)}` by 1.1, together with the correspondence of upper and lower breaks under
`φ`; integrality is 1.2 (Serre, *Local Fields*, IV §3; Fesenko–Vostokov, III (4.3), proof of the
Theorem, p. 92). *Needs:* 1.1, 1.2; Tau Ceti `TauCeti.LocalFieldsRamification.herbrand`,
`TauCeti.LocalFieldsRamification.upperJump_herbrand_iff`.

- `u` is an upper break of `L/F` exactly when `u = φ(b_j)` for some `j < r`, and every such `u` is
  an integer.

**Checks.**

- `ℚ_2(ζ_16 + ζ_16⁻¹)/ℚ_2`: `u_0 = 2`, `u_1 = 2 + 2/2 = 3`, the images of the breaks `2` and `3`
  of `ℚ_2(ζ_16)/ℚ_2` under the quotient by `{±1}`.
- `r = 1`: `u_0 = b_0`; for `ℚ_2(√2)/ℚ_2` it is `2`.
- The `C₄` filtration of 1.2 would give `u_1 = 2 + 1/2 = 5/2`, which is what 1.2 rules out.

### Examples

`ℚ_2(√2)/ℚ_2` (`r = 1`), `ℚ_2(ζ_16 + ζ_16⁻¹)/ℚ_2` (`p = 2`, `r = 2`), and the degree-`p²` subfield of
`ℚ_p(ζ_{p³})` for odd `p`, with the values above.

### Dependencies

Tau Ceti lower index, lower ramification groups and Herbrand functions; 1.1 → 1.2 → 1.3.

## Layer 2: the Hasse–Arf theorem

### 2.1 Reduction of a positive break to the totally ramified `p`-part

Let `F/K` be a finite cyclic extension and `u > 0` an upper break of `F/K`. Let `F₀` be the maximal
unramified subextension and let `E` be the fixed field in `F` of the prime-to-`p` part of
`Gal(F/F₀)`. Prove that `u` is an upper break of `E/F₀`, which is totally ramified and cyclic of
`p`-power order. Route: for indices `t ≥ 0` the lower groups of `F/K` and of `F/F₀` agree, and
both Herbrand integrals have the denominator `#G_0`, so the upper filtrations agree on `[0, ∞)`;
then `G^u ⊆ G_1`, a `p`-group meeting the prime-to-`p` subgroup trivially, so `G^u` and every
`G^v` with `v > u` map isomorphically into the quotient, and the quotient theorem makes `u` an
upper break of `E/F₀` (Serre, *Local Fields*, IV §3; Fesenko–Vostokov,
III (4.3), first paragraph of the proof, p. 91). *Needs:* Tau Ceti
`TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup`,
`Subgroup.upperRamificationGroup_fixedField`,
`TauCeti.LocalFieldsRamification.lowerIndex_restrictScalars`, `TauCeti.isPGroup_ramificationGroup`,
`TauCeti.isTotallyRamified_unramifiedExtension_inertiaDegree`.

- Every positive upper break of a cyclic extension is an upper break of a totally ramified cyclic
  `p`-power subextension of it over its maximal unramified subextension.

**Checks.**

- Unramified `F/K`: there is no positive break (Tau Ceti's upper groups vanish on `[0, ∞)`), so the
  statement is empty.
- `F = ℚ_2(i)`: `F₀ = ℚ_2`, the prime-to-`2` part of the group is trivial, `E = F`, and the break
  `1` is unchanged.
- `F = ℚ_3(ζ_9)/ℚ_3` (cyclic of order `6`): the break `1` survives in the degree-`3` subfield, while
  the tame break `0` is not positive and is excluded.

### 2.2 Hasse–Arf

Prove that every upper break of a finite abelian extension `L/K` of nonarchimedean local fields is
an integer (`hasseArf`). Route: an upper break `u` is detected in a cyclic subextension
(`TauCeti.LocalFieldsRamification.upperJump_iff_exists_isCyclic_intermediateField`). If `u ≤ 0`,
then `u ∈ {−1, 0}`, because the upper filtration is constant on `(−1, 0]`. If `u > 0`, 2.1 moves it
to a totally ramified cyclic `p`-power extension, where 1.3 makes it integral (Serre, *Local
Fields*, V §7; Fesenko–Vostokov, 2nd ed., III (4.3), Theorem (Hasse–Arf), pp. 91–92).
Neither local reciprocity nor the prime-degree norm computations enter. *Needs:* 1.3, 2.1; Tau Ceti
`TauCeti.LocalFieldsRamification.UpperJump`,
`TauCeti.LocalFieldsRamification.upperJump_iff_exists_isCyclic_intermediateField`; Mathlib
`IsAbelianGalois`.

- For finite abelian `L/K`, every `u` with `G^v ⊊ G^u` for all `v > u` is an integer.
- Consequently the jumps of `v ↦ G^v` are among `−1, 0, 1, 2, …`.

**Checks.**

- Degree one: there is no upper break. An unramified extension of degree `> 1` has the single
  break `−1`; a totally tamely ramified extension of degree `> 1` has the single break `0`.
- `ℚ_2(ζ_8)/ℚ_2` (group `C₂ × C₂`): upper breaks `φ(1) = 1` and `φ(3) = 2`, detected by `ℚ_2(i)`
  (break `1`) and `ℚ_2(√2)` (break `2`); reading the lower break `3` of the subgroup `{1, 5}` as an
  upper break of `G` would report `3`.
- `ℚ_2(ζ_16)/ℚ_2` (group `C₂ × C₄`): upper breaks `1, 2, 3`, while the lower breaks are `1, 3, 7`.
- Non-example: the quaternion extension of Serre, *Local Fields*, IV §3, Exercise 3, has a
  non-integral upper break, so the abelian hypothesis cannot be dropped.

### Examples

`ℚ_2(ζ_8)/ℚ_2` and `ℚ_2(ζ_16)/ℚ_2` with the breaks above, and the cyclic `ℚ_3(ζ_9)/ℚ_3`.

### Dependencies

Layer 1 (1.3); Tau Ceti upper numbering, its quotient theorem and cyclic detection; 2.1 → 2.2.

## Downstream consumers

- **ClassFieldTheory** consumes the local arithmetic through the Tau Ceti declarations above, and
  Hasse–Arf for the integrality of conductors (Layer 7).
- **NumberFieldArithmetic** consumes local monogenicity, the lower filtration and the local
  different through the same Tau Ceti declarations.
- **MassFormula** consumes `e`, `f`, total ramification, Eisenstein generators, the different and
  discriminant exponents and their invariance, and the Eisenstein power-basis valuation formula.
- **LocalGaloisGroups** consumes the unit filtration, Frobenius, inertia and the tame quotient.
- Roadmaps on Galois representations and on curves over local fields import Hasse–Arf from
  Layer 2 for the integrality of Artin and Swan conductors.

## References

- I. B. Fesenko, S. V. Vostokov, *Local Fields and Their Extensions*, 2nd ed., American
  Mathematical Society, 2002; author-hosted copy. Chapter III, §4, (4.3): the Hasse–Arf theorem
  (p. 91) and Sen's proposition with its proof (pp. 92–93).
- J.-P. Serre, *Local Fields*, Graduate Texts in Mathematics 67, Springer, 1979. Chapter IV, §§1–3
  (ramification groups, Herbrand functions, upper numbering, Exercise 3 of §3), Chapter V, §6
  (norms and the unit filtration) and §7 (the Hasse–Arf theorem).
- J. Neukirch, *Algebraic Number Theory*, Grundlehren 322, Springer, 1999. Chapter II, §5
  (the index of the power subgroup).
- Sh. Sen, *On automorphisms of local fields*, Annals of Mathematics 90 (1969), 33–46.
