# Roadmap: local fields and ramification

This roadmap owns the local-field substrate: normalized valuations, unit filtrations,
unramified extensions, lower and upper ramification groups, Herbrand functions, wild inertia,
and tame quotients. It stops before local reciprocity and before the arithmetic structure of the
maximal pro-`p` quotient of the absolute Galois group.

The boundary is deliberate. The **Class Field Theory** roadmap consumes these objects to build
finite-group Tate cohomology, class formations, local reciprocity, and duality. The **Local
Galois Groups** roadmap consumes them, together with abstract pro-`p` group theory, to determine
`G_K(p)` and its Demushkin presentation. This roadmap in turn depends on [**Profinite and
Pro-`p` Groups**](../ProfiniteProPGroups/README.md) for abstract profinite Sylow theory, and
imports its `Suggested.lean` directly, and on Tau Ceti's free profinite groups and profinite
presentations (`TauCeti.freeProfiniteGroup`, `TauCeti.presentedProfiniteGroup`). It does not
redeclare any of those group-theoretic suppliers.

## Scope and exported contract

The accepted roadmap exports one canonical vocabulary for finite extensions of
nonarchimedean local fields, their normalized valuations and unit filtrations, unramified
extensions and Frobenius, the ramification filtrations and Herbrand transition, wild inertia,
the tame character, and the Iwasawa presentation of the tame quotient. Downstream roadmaps
import those declarations directly; they do not reconstruct private local-field toolkits.

In particular, [the Number-Field Arithmetic roadmap](../NumberFieldArithmetic/README.md) is a
downstream consumer of this roadmap. This roadmap owns the intrinsic local extension,
normalized valuations and `(e,f)`, the integer-ring/integral-closure theory, local
monogenicity, the canonical lower filtration, and the local different theorems. Number-Field
Arithmetic owns the global-to-local completion maps, the completed integer-ring map, comparison
with decomposition groups and the global ideal-theoretic filtration, localization of the global
different, and the relative-discriminant consequences. In particular it imports
`lowerRamificationGroup`; it does not define a second filtration or choose another indexing
convention.

[Counting Totally Ramified Extensions #226](https://github.com/TauCetiProject/TauCetiRoadmap/pull/226)
is a direct downstream consumer. This roadmap owns the arithmetic of each finite extension:
the induced local-field structures, `ramificationIndex`, `inertiaDegree`, total/tame/wild
ramification, Eisenstein generators and integral monogenicity, the different and local
discriminant exponents, their invariance under `K`-equivalence, and Eisenstein power-basis
valuation orthogonality. #226 owns the family and counting layer: `σ_K(n)`, its derived weight
`c(L) = d(L) - n + 1`, representative sets, quantitative root counting, coefficient-space and
Haar-measure calculations, and the mass formulas. It may define intermediate-field wrappers,
but they must install this roadmap's canonical structures and reduce to its canonical invariants.

Where a milestone below names a Tau Ceti declaration as its implementation, this roadmap's Lean
name for it is a reducible alias of that declaration, or, where the hypotheses are packaged
differently, an adapter that supplies Tau Ceti's hypothesis from this roadmap's (the Frobenius
`frobeniusAlgEquiv` and the absolute ramification index `absoluteRamificationIndex`). The
milestone's statements are about that declaration, and the ones Tau Ceti proves are closed proofs
of its theorems.

Conventions are fixed throughout: valuations are normalized additively by `v_K(π) = 1`;
arithmetic Frobenius is primary and geometric Frobenius is its inverse; upper numbering is the
one functorial under quotients; and `G_K^t` means the quotient by wild inertia, not the maximal
pro-`p` quotient.

## The build, in layers

### Layer 0: local fields and their finite extensions

- **`ℚ_p` is a local field.** Mathlib proves `IsValuativeTopology ℚ_[p]`, that is, the valuation
  topology is the norm topology, and the instance `IsNonarchimedeanLocalField ℚ_[p]`, for every
  prime `p` (`Mathlib/NumberTheory/Padics/ValuativeRel.lean`,
  `Mathlib/NumberTheory/Padics/LocalField.lean`). Tau Ceti compares the normalized valuation of the
  next milestone with Mathlib's `p`-adic API: `Padic.toAdd_normalizedValuation_eq_valuation`,
  `Padic.normalizedAbsoluteValue_eq_nnnorm` and `Padic.natCastValuation_eq_padicValNat`
  (`TauCeti/NumberTheory/LocalField/Padic.lean`). The milestone is the rest of the API below. ⚠
  Instance hygiene: `ℚ_[p]` carries a metric `UniformSpace`. Its compatibility with
  `IsTopologicalAddGroup.rightUniformSpace` must be a lemma, and not an accident of unification,
  or the `CompleteSpace` instances will not fire.
  - *Prerequisites:*
    - `Mathlib: Padic.mulValuation` and the instances of
      `Mathlib/NumberTheory/Padics/ValuativeRel.lean` and
      `Mathlib/NumberTheory/Padics/LocalField.lean`;
    - `Mathlib: IsNonarchimedeanLocalField`.
  - *API:*
    - the compatibility lemma for the two uniformities;
    - `IsNonarchimedeanLocalField ℤ_[p]`-facing corollaries, that is `CompactSpace ℤ_[p]` and
      `IsAdicComplete`;
    - the same structure for a finite extension of `ℚ_[p]`, through Layer 0.III.
- **The normalized valuation.** Define `v_K^× : Kˣ →* Multiplicative ℤ` through
  `valueGroupWithZeroIsoInt` and `WithZero.log`, and extend it across zero with `ℤᵐ⁰`. Prove the
  uniformizer equation `v_K^×(π) = Multiplicative.ofAdd 1`, surjectivity, and that `v_K^×(x) = 1`
  holds exactly on `𝒪[K]ˣ`. Decode with `v_K(x) := Multiplicative.toAdd (v_K^× x)` when an integer
  is wanted. Define the absolute value `‖x‖_K = q^{−v_K(x)}` with `q = Nat.card 𝓀[K]`, with values
  in `ℚ≥0`, and prove that it agrees with the `Padic` norm on `ℚ_[p]`. ⚠ The canonical valuation
  of Mathlib has `v(π) = exp(−1)`, so the integers are the elements with `v ≤ 1`, and the additive
  normalization carries a minus sign. Every statement that mixes the two cites the one named
  `−log` translation lemma. Tau Ceti implements the two constructors as `TauCeti.normalizedValuation`
  and `TauCeti.normalizedAbsoluteValue` (`TauCeti/NumberTheory/LocalField/NormalizedValuation.lean`),
  with the translation lemma `TauCeti.toAdd_normalizedValuation_eq_neg_log`, surjectivity, the
  uniformizer equation and the kernel condition; this roadmap's `normalizedValuation` is a reducible
  alias of the first, so the valuative relation, the topology and the local-field hypothesis of `K`
  are parameters of it.
  - *Prerequisites:* `Mathlib: valueGroupWithZeroIsoInt`, `WithZero.log`,
    `Padic.norm_eq_zpow_neg_valuation`.
  - *API:*
    - the two constructors, `v_K^×` and `‖·‖_K`, and the translation lemma between them;
    - `v_K^×` is a monoid homomorphism, and `‖·‖_K` is multiplicative and ultrametric;
    - the value on a uniformizer, on a unit, and on a root of unity;
    - monotonicity against divisibility in `𝒪[K]`;
    - the point-set consequences, namely `𝒪[K]` open and compact, the family `𝓂[K]^i` a
      neighbourhood basis of `0`, and `Kˣ` locally compact with `𝒪[K]ˣ` compact open;
    - naturality along a finite extension, which is the characteristic property of `e` below;
    - the worked values on `ℚ_2` in the examples section.
- **Finite extensions, I: construction of the valuative structure.** Let
  `[Field L] [Algebra K L] [Module.Finite K L]`, with no valuative structure assumed on `L`. Use the
  spectral norm, but make the analytic bridge explicit first. Construct
  `normalizedNormedField K : NormedField K` from the normalized absolute value and prove
  `normalizedNormedField_topology_eq`, so the topology consumed by `spectralNorm` is identified
  with the original valuative topology. Then construct
  `finiteExtensionNormedField K L : NormedField L`, its named topology
  `finiteExtensionNormedFieldTopology K L`, and
  `finiteExtensionValuativeRel K L : ValuativeRel L`. The closed public chain is
  `finiteExtension_valuativeExtension`, `finiteExtension_isValuativeTopology`, and
  `finiteExtension_isNonarchimedeanLocalField`; none of these theorems assumes a topology or
  valuative relation on `L`. A particular `Valuation L ℤᵐ⁰`, together with its equivalence to the
  pullback of `valuation K`, is a proof witness rather than a second public carrier. All constructed
  structures are named definitions rather than global instances, which keeps a field already
  carrying compatible structures free of diamonds. Tau Ceti implements this construction and its
  closed chain (`TauCeti.normalizedNormedField`, `TauCeti.finiteExtensionNormedField`,
  `TauCeti.finiteExtensionNormedFieldTopology`, `TauCeti.finiteExtensionValuativeRel`, in
  `TauCeti/NumberTheory/LocalField/FiniteExtension/Basic.lean`); this roadmap's names are reducible
  aliases of them.
  - *Prerequisites:*
    - `Mathlib: Mathlib/RingTheory/Valuation/Extension.lean`;
    - `Mathlib: spectralNorm` and `Mathlib/Analysis/Normed/Field/Krasner.lean`;
    - `Mathlib: Mathlib/RingTheory/Valuation/AlgebraInstances.lean`.
  - *Source:* Neukirch ANT II §6 and II §8, for a complete discretely valued base. The hypotheses
    used are completeness of `K` and finiteness of `L/K`. *False generalization:* a valuation on
    an incomplete field has several inequivalent extensions to a finite extension, so completeness
    is not a convenience here.
- **Finite extensions, II: uniqueness.** Any two valuations on `L` that restrict to the valuation
  class of `K` are equivalent, in the sense of `Valuation.IsEquiv`. Any two `ValuativeRel L`
  structures for which `ValuativeExtension K L` holds are equal. Corollary: every `K`-algebra
  automorphism of `L` preserves the valuation, and therefore acts on `𝒪[L]`, `𝓂[L]`, and `𝓀[L]`.
  The corollary is stated here because Layers 2 and 3 use it many times. Tau Ceti implements both
  forms of uniqueness and the corollary (`TauCeti.finiteExtensionValuation_isEquiv`,
  `TauCeti.finiteExtensionValuativeRel_eq`, `TauCeti.finiteExtensionNormedFieldTopology_eq`,
  `AlgEquiv.valuation_eq`), and the milestones here are closed proofs of them.
  - *Prerequisites:*
    - `Layer 0: finite extensions, I`;
    - `Mathlib: Valuation.IsEquiv`.
  - *API:*
    - uniqueness in both forms above;
    - the action of `L ≃ₐ[K] L` on `𝒪[L]`, on `𝓂[L]`, and on `𝓀[L]`, with functoriality in the
      extension;
    - invariance of `v_L` under that action;
    - the induced map `Gal(L/K) → Gal(𝓀[L]/𝓀[K])`, whose kernel Layer 3 names the inertia group.
- **Finite extensions, III: consequences.** From I and II derive `IsNonarchimedeanLocalField L`,
  completeness of `L`, the instances `Algebra 𝒪[K] 𝒪[L]` and `Algebra 𝓀[K] 𝓀[L]`, and freeness of
  `𝒪[L]` as a finite `𝒪[K]`-module. The two algebra structures are Tau Ceti's instances
  `TauCeti.integerRingAlgebra` and `TauCeti.residueFieldAlgebra`, and finiteness and freeness are its
  instances `TauCeti.integerRingModuleFinite` and `TauCeti.integerRingModuleFree`; this roadmap names
  them by reducible alias and closed proof and declares no second instance. The comparison with the
  integral closure, the tower lemmas and the intermediate-field adapters are Tau Ceti's as well
  (`TauCeti.integerRing_eq_integralClosure`, `TauCeti.finiteExtensionValuativeRel_tower`,
  `TauCeti.finiteIntermediateFieldValuativeRel` and its companions).
  - *Prerequisites:*
    - `Layer 0: finite extensions, I`;
    - `Layer 0: finite extensions, II`;
    - `Mathlib: IsNonarchimedeanLocalField`.
  - *API:*
    - `integerRingAlgebra`, `residueFieldAlgebra`, `integerRingModuleFinite`, and
      `integerRingModuleFree`;
    - `finiteExtensionNormedFieldTopology_eq`, comparing the construction with an already
      topologized compatible extension;
    - `finiteExtensionNormedFieldTopology_tower` and `finiteExtensionValuativeRel_tower` for a
      tower `M/L/K`;
    - `integerRing_eq_integralClosure`, comparing `𝒪[L]` with the integral closure of `𝒪[K]` in
      `L`;
    - the intermediate-field adapters `finiteIntermediateFieldNormedField`,
      `finiteIntermediateFieldValuativeRel`, `finiteIntermediateFieldTopology`,
      `finiteIntermediateField_valuativeExtension`,
      `finiteIntermediateField_isValuativeTopology`, and
      `finiteIntermediateField_isNonarchimedeanLocalField`, which take a finite
      `M : IntermediateField K Ω` directly to the structures above;
    - a basis of `𝒪[L]` over `𝒪[K]` in the unramified case and in the totally ramified case, which
      Layers 2 and 3 use.
- **`e` and `f`, intrinsically.** Define `ramificationIndex K L : ℕ` as the index of the image of
  the normalized value group. Equivalently, it is the unique positive integer `e` with
  `v_L(algebraMap K L x) = e * v_K(x)` for all `x : Kˣ`. Positivity is part of the
  characterization. Define `inertiaDegree K L := Module.finrank 𝓀[K] 𝓀[L]`, which Layer 0.III
  makes available. Prove `v_L(algebraMap K L π_K) = e` for **every** uniformizer `π_K` of `K`, so
  that no statement below has to choose one; `0 < e`; `0 < f`; `e * f = Module.finrank K L`;
  multiplicativity of each in a tower; and the comparison lemmas with `Ideal.ramificationIdx` and
  `Ideal.inertiaDeg`. The comparison needs one bridging fact, proved once: at a local field
  `primesOver 𝓂[K] 𝒪[L]` is the singleton `{𝓂[L]}`. Do not re-derive the Dedekind theory here, and
  do not force a consumer through the `sSup` in `Ideal.ramificationIdx`. Tau Ceti implements both
  invariants and this theory: `TauCeti.ramificationIndex` with its characteristic property
  `TauCeti.normalizedValuation_algebraMap`, the uniqueness `TauCeti.ramificationIndex_eq_iff`, the
  value on every uniformizer `TauCeti.normalizedValuation_algebraMap_irreducible`, positivity
  `TauCeti.ramificationIndex_pos`, the comparison `TauCeti.ramificationIndex_eq_ramificationIdx` and
  the tower law `TauCeti.ramificationIndex_tower`
  (`TauCeti/NumberTheory/LocalField/RamificationIndex.lean`); and `TauCeti.inertiaDegree` with
  `TauCeti.natCard_residueField`, `TauCeti.inertiaDegree_pos`,
  `TauCeti.primesOver_maximalIdeal_eq_singleton`, `TauCeti.inertiaDegree_eq_inertiaDeg`, the
  product formula `TauCeti.ramificationIndex_mul_inertiaDegree` and `TauCeti.inertiaDegree_tower`
  (`TauCeti/NumberTheory/LocalField/InertiaDegree.lean`). This roadmap's `ramificationIndex` and
  `inertiaDegree` are reducible aliases of the two definitions, and its
  `normalizedValuation_algebraMap`, `card_residueField` and `ramificationIndex_mul_inertiaDegree`
  are closed proofs of Tau Ceti's theorems. `TauCeti.ramificationIndex` reads only the normalized
  valuation of `L` and the algebra map, and every theorem about it assumes
  `ValuativeExtension K L`. The total-ramification predicate
  `IsTotallyRamified K L`, that is `ramificationIndex K L = Module.finrank K L`, is defined here on
  that object, and `isTotallyRamified_iff_inertiaDegree_eq_one` is a closed proof from the product
  formula.
  - *Prerequisites:*
    - `Layer 0: the normalized valuation`;
    - `Layer 0: finite extensions, III`;
    - `Mathlib: Ideal.ramificationIdx`, `Ideal.inertiaDeg`, `sum_ramification_inertia`.
  - *API:*
    - the two definitions and their characteristic properties;
    - positivity;
    - the product formula;
    - multiplicativity in towers;
    - the values in the unramified case and in the totally ramified case;
    - the comparison lemmas with the Dedekind-level pair;
    - the singleton lemma for `primesOver`;
    - the worked values for `ℚ_2(√2)/ℚ_2` in the examples section.
  - *Source:* Serre LF I §4 and Neukirch ANT II §6, for `e · f = [L:K]` over a complete discretely
    valued base. *False generalization:* over an incomplete base, or with more than one prime
    above `𝓂[K]`, the identity becomes `∑_P e_P f_P = [L:K]`, which is `sum_ramification_inertia`
    and is a different theorem.
- **Valuations of natural numbers and the absolute ramification index.** Define
  `natCastValuation K n hn : ℕ` as the decoded normalized valuation `v_K((n : K))`, where
  `hn : (n : K) ≠ 0` is supplied to the definition. This is the general quantity used in power-class
  formulas and in the wild-different upper bound. Separately, for `p` prime and `K/ℚ_p` finite,
  define `absoluteRamificationIndex K p := ramificationIndex ℚ_[p] K`. Prove
  `absoluteRamificationIndex_eq_natCastValuation`, identifying it with
  `natCastValuation K p hp`. Thus the invariant called the absolute ramification index exists only
  in mixed characteristic; there is no equal-characteristic junk branch, and the relative
  `e(L/K)` above remains a different invariant. `natCastValuation`, its characteristic equation and
  its vanishing criterion are Tau Ceti's `TauCeti.natCastValuation`,
  `TauCeti.normalizedValuation_natCast` and `TauCeti.natCastValuation_eq_zero_iff`
  (`TauCeti/NumberTheory/LocalField/NatCastValuation.lean`), consumed by reducible alias and closed
  proof. The absolute ramification index is Tau Ceti's `TauCeti.absoluteRamificationIndex`
  (`TauCeti/NumberTheory/LocalField/AbsoluteRamificationIndex.lean`), which bundles
  `[Algebra ℚ_[p] K] [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]` as the class
  `TauCeti.FinitePadicExtension K p`, supplied from the three instances by
  `TauCeti.FinitePadicExtension.ofInstances`. This roadmap's `absoluteRamificationIndex` takes the
  three instances separately, as every statement below does, and its value is Tau Ceti's
  declaration at that instance. Tau Ceti proves the comparison
  `TauCeti.absoluteRamificationIndex_eq_natCastValuation`, of which this roadmap's
  `absoluteRamificationIndex_eq_natCastValuation` is a closed proof, together with positivity
  `TauCeti.absoluteRamificationIndex_pos`, multiplicativity
  `TauCeti.absoluteRamificationIndex_tower` and the values `e_{ℚ_p} = 1`
  (`TauCeti.absoluteRamificationIndex_padic`) and
  `natCastValuation ℚ_[p] 2 = 0` for odd `p` (`Padic.natCastValuation_two`).
  - *Prerequisites:*
    - `Layer 0: the normalized valuation`;
    - `Layer 0: e and f, intrinsically`, for the comparison below.
  - *API:*
    - `natCastValuation`, its characteristic equation, and its vanishing criterion when the cast
      is nonzero;
    - `absoluteRamificationIndex` for finite `K/ℚ_p` and
      `absoluteRamificationIndex_eq_natCastValuation`, with `e_K · f = [K : ℚ_p]` as a corollary
      of the product formula above;
    - multiplicativity along a finite extension `L/K`, that is
      `absoluteRamificationIndex L p = ramificationIndex K L * absoluteRamificationIndex K p`;
    - the values `e_{ℚ_p} = 1`, `natCastValuation ℚ_[p] 2 = 0` for odd `p`, and `e_K = 2` for
      `K = ℚ_2(√2)`, in the examples section.
  - *Source:* Serre LF II §1; Neukirch ANT II §6, for `e_K · f = [K : ℚ_p]`. The hypothesis is
    explicitly that `K` is a finite extension of `ℚ_p`; no absolute-index statement is made for
    `𝔽_p((t))`.

### Layer 1: units, the filtration, and the multiplicative group

- **The unit filtration as an object.** Define `unitFiltration K i : Subgroup Kˣ` for `i : ℕ`,
  with the depth-zero case explicit: `U(K,0)` is the image of `𝒪[K]ˣ → Kˣ`, and for `i ≥ 1`,
  `U(K,i) = {x : Kˣ | x ∈ 𝒪[K] ∧ v_K(x − 1) ≥ i}`. State membership in the two forms that are
  used, namely the congruence `x ≡ 1 mod 𝓂[K]^i` inside `𝒪[K]` and the valuation inequality on
  `x − 1`, and prove that they agree. Indices are natural numbers throughout. Layers 3 and 7
  compare `U(K,i)` with a ramification group `G_j`. Each such statement writes out the shift
  between the two index conventions. Tau Ceti implements the object, both membership forms,
  antitonicity, separation, openness, compactness and the neighbourhood basis
  (`TauCeti.unitFiltration`, `TauCeti.mem_unitFiltration_succ_congr`,
  `TauCeti.mem_unitFiltration_succ_valuation`, `TauCeti.unitFiltration_antitone`,
  `TauCeti.iInf_unitFiltration`, `TauCeti.isOpen_unitFiltration`, `TauCeti.isCompact_unitFiltration`,
  `TauCeti.hasBasis_nhds_one_unitFiltration`, in
  `TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean`), and the graded pieces
  `U(K,i)/U(K,i+1)` as `TauCeti.UnitFiltrationGraded`; this roadmap's `unitFiltration` and
  `UnitFiltrationGraded` are reducible aliases of them. The rest of the API below is Tau Ceti's as
  well: `U(K,0) = 𝒪[K]ˣ` (`TauCeti.unitFiltration_zero`,
  `TauCeti.unitFiltrationZeroEquivIntegerUnits`), stability under automorphisms
  (`AlgEquiv.smul_unitFiltration`), the indices (`TauCeti.relIndex_unitFiltration_one_zero`,
  `TauCeti.relIndex_unitFiltration_succ_succ`) and the covariant contract
  (`TauCeti.map_unitFiltration_le`, of which this roadmap's `map_unitFiltration_le` is a closed
  proof). The norm contract is a milestone of Layer 3.
  - *Prerequisites:*
    - `Layer 0: the normalized valuation`;
    - `Mathlib: Subgroup`, `Valuation`.
  - *API:*
    - the definition with both membership forms;
    - `U(K,0) = 𝒪[K]ˣ` as a subgroup of `Kˣ`;
    - antitonicity in `i`;
    - `⋂_i U(K,i) = 1`;
    - each `U(K,i)` open and compact in `Kˣ`;
    - the family a neighbourhood basis of `1`;
    - stability under every `K`-automorphism of a Galois extension, which Layer 3 uses;
    - the index `[U(K,i) : U(K,i+1)]`, which is `q − 1` at `i = 0` and `q` otherwise;
    - the covariant algebra-map contract
      `map_unitFiltration_le K L i : map(K → L)(U(K,i)) ≤ U(L,e(L/K) * i)`;
    - separately, the contravariant norm contract
      `map_norm_unitFiltration_psiNat_le K L i : N(U(L,ψℕ(i))) ≤ U(K,i)` from Layer 3.
- **Graded pieces.** Prove `U(K,0)/U(K,1) ≃* 𝓀[K]ˣ` by reduction, and, for `i ≥ 1`,
  `U(K,i)/U(K,i+1) ≃* 𝓀[K]⁺` through `1 + x ↦ x mod 𝓂^{i+1}`. The counts `q − 1` and `q` are
  corollaries. ⚠ The depth-zero piece is multiplicative and the deeper pieces are additive. The
  two isomorphisms stay separate, and do not combine into one statement. Tau Ceti implements both
  isomorphisms and both counts: `TauCeti.unitFiltrationGradedZeroEquivResidueFieldUnits`
  (`TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean`),
  `TauCeti.unitFiltrationGradedSuccEquivResidueFieldOfUniformizer` with its change of uniformizer
  `TauCeti.unitFiltrationGradedSuccEquivResidueFieldOfUniformizer_change`
  (`UnitFiltration/Uniformizer.lean`), and `TauCeti.natCard_unitFiltrationGraded_zero`,
  `TauCeti.natCard_unitFiltrationGraded_succ`. The compatibility with the embeddings `θ_i` is the
  remaining item.
  - *Prerequisites:*
    - `Layer 1: the unit filtration as an object`;
    - `Layer 0: the normalized valuation`.
  - *API:*
    - the two isomorphisms;
    - independence of the choice of uniformizer in the second, up to the induced automorphism of
      `𝓀[K]⁺`;
    - naturality in `i`;
    - the two counts;
    - the compatibility of the second isomorphism with the embeddings `θ_i` of Layer 3, which is
      where the choice of uniformizer is fixed again.
  - *Source:* Serre LF IV §2; Neukirch ANT II §3 and II §5.
- **Teichmüller.** Define the multiplicative section `ω : 𝓀[K]ˣ →* 𝒪[K]ˣ` of the reduction map.
  Characterize it as the unique section whose image consists of `(q−1)`-torsion elements, and
  prove `μ_{q−1}(K) ≅ 𝓀[K]ˣ`. That characterization is the public statement. Tau Ceti implements
  it for every Henselian local ring with finite residue field, as `TauCeti.teichmuller 𝒪[K]`
  (`TauCeti/RingTheory/Henselian/Teichmuller.lean`; `𝒪[K]` is Henselian by
  `TauCeti.henselianLocalRing_integer`), with the section property
  `TauCeti.unitsMap_residue_teichmuller`, the characterization `TauCeti.teichmuller_eq_iff`, the
  uniqueness among multiplicative sections `TauCeti.eq_teichmuller`, injectivity
  `TauCeti.teichmuller_injective`, the image `TauCeti.range_teichmuller`, and
  `μ_{q−1}(K) ≃* 𝓀[K]ˣ` as `TauCeti.rootsOfUnityAlgebraMulEquivUnitsResidueField 𝒪[K] K`. Its
  zero-preserving extension `TauCeti.teichmullerLift` comes from `Perfection.teichmuller₀`, and
  commutes with automorphisms of a finite extension (`AlgEquiv.smul_teichmullerLift`) and with
  Frobenius (`TauCeti.frobeniusAlgEquiv_teichmullerLift`). This roadmap's `teichmuller` is a
  reducible alias of `TauCeti.teichmuller 𝒪[K]`, and `teichmuller_section` is a closed proof; the
  worked values below remain.
  - *Prerequisites:*
    - `Mathlib: Perfection.teichmuller₀`, `HenselianLocalRing`, `IsAdicComplete 𝓂[K] 𝒪[K]`;
    - `Layer 1: graded pieces`.
  - *API:*
    - the definition, the section property, and the uniqueness characterization;
    - `ω` is a monoid homomorphism and is injective;
    - `ω(1) = 1`;
    - the image is exactly `μ_{q−1}(K)`;
    - naturality along an unramified extension, which Layer 2 uses for the Frobenius;
    - the values on `ℚ_2` and on `ℚ_5` in the examples section.
- **Structure of `Kˣ`.** Prove the topological isomorphism `Kˣ ≃ ℤ × 𝒪[K]ˣ` attached to a choice
  of uniformizer, and `𝒪[K]ˣ ≃ μ_{q−1} × U(K,1)`. Prove that `U(K,1)` is pro-`p`, as the inverse
  limit of the `p`-groups `U(K,1)/U(K,i)`. State it in quotient form: every continuous finite
  quotient of `U(K,1)` is a `p`-group. This is exactly the predicate
  `ProfiniteProPGroups.IsProP p (U(K,1))`, so the two statements are the same statement and not
  two rephrasings. Prove that the torsion subgroup
  `μ(K)` is finite. Tau Ceti implements the two isomorphisms, on `U(K,0) = 𝒪[K]ˣ`, as
  `TauCeti.unitsEquivIntProd` and `TauCeti.unitFiltrationZeroEquivProd`
  (`TauCeti/NumberTheory/LocalField/UnitsDecomposition.lean`), with the uniqueness of the
  decomposition `TauCeti.existsUnique_eq_zpow_mul`, the change of uniformizer
  `TauCeti.coe_unitsEquivIntProd_apply_snd_eq_mul`, the kernel and continuity of `v_K`
  (`TauCeti.ker_normalizedValuation`, `TauCeti.continuous_normalizedValuation`) and its splitting
  `TauCeti.normalizedValuation_comp_zpowersHom`. The pro-`p` statement and the statements about
  `μ(K)` remain.
  - *Prerequisites:*
    - `Layer 1: the unit filtration as an object`;
    - `Layer 1: Teichmüller`;
    - `Mathlib: OpenNormalSubgroup`, `IsPGroup`.
  - *API:*
    - the two isomorphisms, with their inverses and their continuity;
    - the dependence on the uniformizer, which is an isomorphism of the two splittings;
    - finiteness of `μ(K)` and its order;
    - the `p`-part and the prime-to-`p` part of `μ(K)`;
    - the projection `Kˣ → ℤ`, which is `v_K`, and its splitting.
  - *Source:* Serre LF II §§4–5; Neukirch ANT II §5.
- **Deep units in mixed characteristic.** Let `K/ℚ_p` be finite of degree `N`, with absolute
  ramification index `e = absoluteRamificationIndex K p`. Let `i : ℕ` satisfy the integer
  inequality `(p − 1) * i > e`. Then the logarithm is an isomorphism of topological groups
  `U(K,i) ≃ (𝓂[K]^i, +)`, with `exp` as its inverse, and therefore `U(K,i) ≃ ℤ_p^N` as
  `ℤ_p`-modules. State the threshold as that integer inequality, and never as `i > e/(p−1)`, so
  that no division of natural numbers occurs.
  - *Prerequisites:*
    - `Layer 1: the unit filtration as an object`;
    - `Layer 0: the absolute ramification index`;
    - `Layer 0: finite extensions, III`;
    - at the exact pin, `NormedSpace.expSeries`, `NormedSpace.exp`,
      `NormedSpace.expSeries_hasSum_exp_of_mem_ball`, and `NormedSpace.continuousOn_exp` provide
      the exponential-series side, while `PowerSeries.log`, `PowerSeries.coeff_log`,
      `PowerSeries.map_log`, and `PowerSeries.HasEval` provide the formal logarithm and evaluation
      interface. The pin does **not** provide a ready-made local-field logarithm with the sharp
      domain or inverse theorems. Constructing `localExponential` and `localLogarithm`, proving
      their convergence and continuity on the stated depths, and proving
      `localLogarithm_localExponential` and `localExponential_localLogarithm` are separate named
      submilestones, summarized by `deepUnitExpLogEquiv`.
  - *Source:* NSW (7.4.4); Neukirch ANT II §5. The hypotheses used are `char K = 0` and the
    integer inequality. At the boundary `(p − 1) * i = e`, the series `log` still converges but
    injectivity is not uniform: it fails when `U(K,i)` contains a nontrivial `p`-power root of
    unity, while fields without that torsion can still have injectivity. No unconditional boundary
    theorem is part of the contract.
- **Power classes, the primary statement.** For `n : ℕ` with `n ≠ 0`, the primary theorem is an
  equality of natural numbers:

  ```text
  Nat.card (Kˣ ⧸ (powMonoidHom n).range) =
    n * Nat.card (μ_n(K)) * q ^ natCastValuation K n hnK,
  ```

  where `μ_n(K)` is the group of `n`-th roots of unity in `K`, and the final exponent is
  `natCastValuation K n hnK`, where `hnK : (n : K) ≠ 0`. In regime 1 the hypothesis
  `IsUnit (n : 𝒪[K])` supplies `hnK` and gives `natCastValuation K n hnK = 0` as a named lemma,
  so the formula becomes `n · #μ_n(K)`; that case holds in either
  characteristic. In regime 2, with `K/ℚ_p` finite, the formula holds for every `n ≠ 0`, including
  `p ∣ n`; the deep-unit logarithm supplies the `p`-primary factor. Finiteness of the quotient
  follows from the formula and is exported separately as
  `finiteIndex_range_powMonoidHom_of_isUnit` or `finiteIndex_range_powMonoidHom`, so downstream
  declarations can consume a `Subgroup.FiniteIndex` proof without reconstructing it. Tau Ceti
  implements regime 1: the count `TauCeti.card_powerClasses_of_isUnit`, the vanishing
  `TauCeti.natCastValuation_eq_zero_of_isUnit`, finite index
  `TauCeti.finiteIndex_range_powMonoidHom_of_isUnit` and the count `4`
  `TauCeti.card_squareClasses_of_isUnit` (`TauCeti/NumberTheory/LocalField/PowerSubgroup.lean`), and
  the identification of the two spellings of the square classes,
  `TauCeti.square_eq_powMonoidHom_two_range`. This roadmap's `card_powerClasses_of_isUnit`,
  `finiteIndex_range_powMonoidHom_of_isUnit`, `card_squareClasses_of_isUnit` and
  `square_eq_range_powMonoidHom` are closed proofs of them. Regime 2, the dyadic count and the
  worked example are the remaining milestones.
  - *Prerequisites:*
    - `Layer 1: structure of Kˣ`;
    - `Layer 1: deep units in mixed characteristic` (regime 2 only);
    - `Layer 0: the normalized valuation`;
    - `Layer 0: natCastValuation` for the exponent in the formula.
  - *API:*
    - the count in each regime, named `card_powerClasses_of_isUnit` and `card_powerClasses_mixed`,
      with `natCastValuation K n hnK = 0` under `IsUnit (n : 𝒪[K])` as a named lemma;
    - finiteness of `Kˣ/(Kˣ)ⁿ`, through the two named finite-index corollaries derived from the
      cardinality formulas;
    - the two specializations at `n = 2`, which is where the dyadic factor of two appears:
      `card_squareClasses_of_isUnit`,
      which is `4` when `2` is a unit of `𝒪[K]`, and `card_squareClasses_dyadic`, which is
      `4 · q^e` with `q = Nat.card 𝓀[K]` and `e = absoluteRamificationIndex K 2` for `K/ℚ_2`
      finite. The second reads `2^{N+2}` for `[K : ℚ_2] = N`, since `q^e = #(𝒪[K]/2𝒪[K]) = 2^N`.
      ⚠ Their hypotheses are exclusive, and neither is an instance of the other;
    - the identification `Subgroup.square Kˣ = (powMonoidHom 2).range` of the two spellings of the
      square classes, Mathlib's subgroup of squares and the range this formula is stated at. It is
      what lets the count at `n = 2`, and `ProfiniteCohomology.kummerIso`, be read on
      `Subgroup.square Kˣ`;
    - the dyadic instance `#(ℚ_2ˣ/(ℚ_2ˣ)²) = 8` of the examples section.
  - *Source:* the formula follows from the structure of `Kˣ` above, with the logarithm in regime
    2; compare NSW VII §3. *False generalization:* at `K = 𝔽_q((t))`, `n = p`, the left side is
    infinite, so the equation fails in equal characteristic when `p ∣ n`. The hypothesis
    `IsUnit (n : 𝒪[K])` excludes that case in regime 1, and `char K = 0` excludes it in regime 2.
- **Power classes, the absolute-value form.** After the theorem in `ℕ`, derive
  `#(Kˣ/(Kˣ)ⁿ) = n · #μ_n(K) · ‖n‖_K⁻¹` as an equality in `ℚ≥0`, with the coercion `ℕ → ℚ≥0` named
  in the statement. This form is the input compared with
  `ClassFieldTheory.eulerCharacteristic_finrank_fp`. It is the only place in this layer where the
  absolute value occurs.
  - *Prerequisites:*
    - `Layer 1: power classes, the primary statement`;
    - `Layer 0: the normalized valuation`.
- **The power subgroup is open.** For `n : ℕ` with `n ≠ 0`, the primary theorem is

  ```text
  IsOpen ((powMonoidHom n : Kˣ →* Kˣ).range).
  ```

  The name is `isOpen_range_powMonoidHom`. It holds in regime 1 for either characteristic, and in
  regime 2 for every `n`. ⚠ This does **not** follow from the count above. Finiteness of an
  abstract quotient of a topological group says nothing about the topology of the kernel: the
  additive group `ℚ_p` with the discrete topology has finite quotients by non-open subgroups. The
  proof exhibits an open subgroup inside the range:
  - in regime 1, `U(K,1) ⊆ (Kˣ)^n`, by Hensel's lemma applied to `X^n − u` at the approximate
    root `1`. The derivative `n X^{n−1}` is a unit there, because `n` is a unit in `𝒪[K]`, and
    `1 − u ∈ 𝓂[K]` for `u ∈ U(K,1)`;
  - in regime 2, take `i` with `(p − 1) · i > e`. The logarithm of the deep-unit milestone carries
    `x ↦ x^n` on `U(K,i)` to `y ↦ n · y` on `𝓂[K]^i`, and
    `n · 𝓂[K]^i = 𝓂[K]^{i + natCastValuation K n hnK}`. So
    `(U(K,i))^n = U(K, i + natCastValuation K n hnK)`, which is open. This covers the `p`-primary case, where the
    argument of regime 1 is unavailable.

  A subgroup of a topological group that contains an open subgroup is open, and is therefore
  closed. In this application finite index is a separate consequence of
  `card_powerClasses_of_isUnit` or `card_powerClasses_mixed`; it does not follow from openness.
  Tau Ceti implements regime 1: `TauCeti.isOpen_range_powMonoidHom_of_isUnit`, with the
  containment `TauCeti.unitFiltration_one_le_range_powMonoidHom_of_isUnit`, closedness
  `TauCeti.isClosed_range_powMonoidHom_of_isUnit`, and the corollary for subgroups
  `TauCeti.isOpen_of_isUnit_exponent` and `TauCeti.isOpen_of_isUnit_index`; this roadmap's
  `isOpen_range_powMonoidHom_of_isUnit` is a closed proof. It also proves the case `n = 2` in every
  characteristic other than `2`, `TauCeti.isOpen_range_powMonoidHom_two`, from the local square
  theorem below. Regime 2 for general `n` remains.
  - *Prerequisites:*
    - `Layer 1: the unit filtration as an object`;
    - `Layer 1: deep units in mixed characteristic` (regime 2 only);
    - `Mathlib: Hensel's lemma in Mathlib/RingTheory/Henselian.lean` (regime 1 only);
    - `Mathlib: Subgroup.isOpen_of_isOpen_subgroup_le`.
  - *API:*
    - the openness statement in each regime;
    - the containment `U(K,1) ⊆ (Kˣ)^n` in regime 1, and
      `U(K, i + natCastValuation K n hnK)` inside the range in regime 2, as named lemmas; these are
      consumed by `ClassFieldTheory.conductorExponent` and `characterConductorExp`;
    - closedness from openness, and finite index separately through
      `finiteIndex_range_powMonoidHom_of_isUnit` or `finiteIndex_range_powMonoidHom`;
    - the corollary that every subgroup of `Kˣ` of finite index whose exponent satisfies the
      regime hypothesis is open, which is an input to the local existence theorem accompanying
      `ClassFieldTheory.normResidue`.
  - *Source:* Serre LF V §3 and Neukirch ANT II §5. The hypotheses are the regime hypotheses.
    *False generalization:* at `K = 𝔽_q((t))` and `n = p` the range is not open, because
    `1 + t^m` is not a `p`-th power for `p ∤ m` and those elements accumulate at `1`.
- **The dyadic square-class count.** Prove `#(ℚ_2ˣ/(ℚ_2ˣ)²) = 8`. This is an instance of the
  primary statement, and not a separate theorem.
  - *Prerequisites:* `Layer 1: power classes, the primary statement`.
- **Deep units are squares, in mixed characteristic.** Let `K/ℚ_2` be finite, let
  `h2 : (2 : K) ≠ 0` be the characteristic-zero proof, and let
  `e = absoluteRamificationIndex K 2`, equivalently `e = natCastValuation K 2 h2`. Then
  `U(K, 2e+1) ⊆ (Kˣ)²`, named
  `unitFiltration_le_range_powMonoidHom_two`. ⚠ This is **not** an instance
  of the cardinality count, which decides how many square classes there are and not which
  subgroup lies inside the squares. The proof is Hensel's lemma applied to `X² − u`, or the
  deep-unit logarithm with the fact that multiplication by `2` carries the logarithmic lattice at
  depth `2e+1` into the lattice at depth `e+1`. ⚠ The hypothesis is mixed characteristic. In
  equal characteristic `2` the element `2` is zero and there is no absolute ramification index,
  so the displayed statement is not even the contract for that case.

  The threshold is sharp, and sharp over every such `K` and not only over `ℚ_2`:
  `U(K, 2e) ⊄ (Kˣ)²`, named `not_unitFiltration_le_range_powMonoidHom_two`. This is a milestone
  of its own, because a containment with no matching failure leaves a consumer free to use a
  weaker depth and discover later that its bound is not attained. The obstruction is
  Artin–Schreier: `℘(t) = t² + t` is `𝔽_2`-linear on `𝓀[K]` with kernel `𝔽_2`, so its image has
  index `2`. Since `𝓂[K]^{2e} = 4·𝒪[K]`, a unit `1 + 4c` is `(1 + 2t)²` exactly when
  `c = t + t²`, so `1 + 4c` is a square exactly when the residue of `c` lies in the image of `℘`,
  and any `c` outside it is a witness. At `K = ℚ_2` the witness is `5`: `U(K,3) = 1 + 8ℤ_2`
  consists of squares while `U(K,2) = 1 + 4ℤ_2` does not.

  Tau Ceti implements both halves and the two-sided consequence for every nonarchimedean local
  field in which `2 ≠ 0`, indexed by `natCastValuation K 2 h2`, which is `0` in odd residue
  characteristic: `TauCeti.unitFiltration_le_range_powMonoidHom_two`,
  `TauCeti.not_unitFiltration_le_range_powMonoidHom_two` and
  `TauCeti.unitFiltration_le_range_powMonoidHom_two_iff`
  (`TauCeti/NumberTheory/LocalField/Squares.lean`). This roadmap's uniformly indexed
  `unitFiltration_natCastValuation_le_range_powMonoidHom_two` and
  `not_unitFiltration_natCastValuation_le_range_powMonoidHom_two` are those theorems, and its
  `ℚ_2`-indexed statements are closed proofs from them through
  `absoluteRamificationIndex_eq_natCastValuation`.
  - *Prerequisites:*
    - `Layer 1: deep units in mixed characteristic`;
    - `Layer 1: the unit filtration as an object`;
    - `Layer 1: graded pieces`, for the residue-field computation behind the sharpness;
    - `Layer 0: the absolute ramification index`;
    - `Mathlib: Hensel's lemma in Mathlib/NumberTheory/Padics/Hensel.lean`.
  - *API:*
    - the containment at depth `2e+1` and its failure at depth `2e`;
    - the two-sided consequence, that `U(K,n) ⊆ (Kˣ)²` holds exactly for `n ≥ 2e+1`, which is
      antitonicity of the filtration applied to the two above.
  - *Source:* Serre, *A Course in Arithmetic*, II §3, for `ℚ_2`; Neukirch ANT II §5 in general.
    The hypotheses used are that `K/ℚ_2` is finite, for both halves. There is no corresponding
    absolute-index threshold statement in equal characteristic `2`.

### Layer 2: unramified extensions and Frobenius

- **The arithmetic predicate.** Define `IsUnramified K L` for a finite extension of local fields:
  the map of value groups is bijective, equivalently `ramificationIndex K L = 1`, and the residue
  extension `𝓀[L]/𝓀[K]` is separable. Separability is automatic for finite residue fields. Carry
  it in the definition, so that the statement matches the general definition for valued fields and
  survives generalization. Compare the predicate once, as a theorem, with `Algebra.IsUnramifiedAt`
  and `Algebra.FormallyUnramified` over `𝒪[K]`, so that the étale library becomes usable. Do not
  redefine those notions. Tau Ceti implements the predicate as the class `TauCeti.IsUnramified K L`
  (`TauCeti/NumberTheory/LocalField/Unramified.lean`), with the equivalence with `e = 1`
  (`TauCeti.isUnramified_iff_ramificationIndex_eq_one`), the value-group, valuation, ideal and
  degree forms, tameness (`TauCeti.IsUnramified.isTamelyRamified`), stability in towers in both
  directions (`TauCeti.isUnramified_tower_iff`) and the comparison theorems
  `TauCeti.isUnramified_iff_formallyUnramified` and `TauCeti.isUnramified_iff_isUnramifiedAt`. This
  roadmap states unramifiedness as `ramificationIndex K L = 1` and passes to the class through
  `TauCeti.isUnramified_iff_ramificationIndex_eq_one` wherever a Tau Ceti theorem asks for it.
  Composita, base change and the negative instance remain.
  - *Prerequisites:*
    - `Layer 0: e and f, intrinsically`;
    - `Mathlib: Algebra.IsUnramifiedAt`, `Algebra.FormallyUnramified`.
  - *API:*
    - the definition;
    - the equivalence with `e = 1`;
    - stability in towers, in both directions;
    - stability under composita and under base change to an unramified extension;
    - the comparison theorem with the étale notions;
    - the negative instance `ℚ_2(√2)/ℚ_2`, which is ramified.
- **Residue correspondence.** For `L/K` unramified and Galois, prove `Gal(L/K) ≃* Gal(𝓀[L]/𝓀[K])`
  through the machinery of `Mathlib/RingTheory/Invariant/`, with trivial inertia group. Define the
  **Frobenius element** `Frob L/K ∈ Gal(L/K)` as the preimage of `x ↦ x^q`, named
  `frobeniusAlgEquiv`, and prove that `Gal(L/K)` is cyclic of order `f`, generated by it. The
  equation that fixes it is `valuation_frobeniusAlgEquiv_sub_pow`, that is `σ(y) ≡ y^q mod 𝓂[L]`
  for `y ∈ 𝒪[L]`, stated on the valuation of `σ(y) − y^q` so that it needs no separate name for
  the induced action on the residue field. Every later statement about Frobenius is stated at
  that declaration, and never at an arbitrary generator of `Gal(L/K)`: a cyclic group of order
  `f > 2` has generators that are not Frobenius, so the equation pinned by
  `ClassFieldTheory.normResidue_uniformizer` would be strictly weaker if stated at an arbitrary
  generator. Tau Ceti implements the correspondence and the Frobenius
  (`TauCeti/NumberTheory/LocalField/ResidueCorrespondence.lean`, `Frobenius.lean`):
  `TauCeti.residueFieldAutEquiv`, `TauCeti.frobeniusAlgEquiv` under the class
  `TauCeti.IsUnramified K L`, its order `TauCeti.orderOf_frobeniusAlgEquiv`, generation
  `TauCeti.zpowers_frobeniusAlgEquiv`, the congruence `TauCeti.valuation_frobeniusAlgEquiv_sub_pow`
  and the uniqueness it gives, `TauCeti.eq_frobeniusAlgEquiv_of_valuation_sub_pow_lt_one`,
  functoriality `TauCeti.frobeniusAlgEquiv_restrictNormal`, the compatibility with the Teichmüller
  lift `TauCeti.frobeniusAlgEquiv_teichmullerLift` and the action on roots of unity
  `TauCeti.frobeniusAlgEquiv_rootsOfUnity`. This roadmap's `frobeniusAlgEquiv K L h`, with
  `h : ramificationIndex K L = 1`, is `TauCeti.frobeniusAlgEquiv` with the class supplied from `h`,
  and `valuation_frobeniusAlgEquiv_sub_pow` is a closed proof; the worked case remains.
  - *Prerequisites:*
    - `Layer 2: the arithmetic predicate`;
    - `Layer 0: finite extensions, II`;
    - `Mathlib: Ideal.inertia`, `stabilizer G Q ⧸ inertia G Q ≃* Gal(residue extension)`;
    - `Mathlib: GaloisField` and the Frobenius of a finite field.
  - *API:*
    - the isomorphism and its inverse;
    - `Frob` and its order, with the congruence that characterizes it;
    - functoriality in a tower, that is, restriction of `Frob` to a subextension is `Frob`;
    - compatibility with the Teichmüller section of Layer 1;
    - the action of `Frob` on `μ_{q^f−1}`;
    - the worked case `ℚ_2(√5)/ℚ_2` in the examples section.
- **Existence and uniqueness, stated precisely.** These four statements together replace the
  informal phrase "the unramified extension of degree `f`".
  1. *Inside a fixed algebraic closure.* For every `f ≥ 1` there is exactly one unramified
     intermediate field `K_f` of `AlgebraicClosure K` with `[K_f : K] = f`, namely the splitting
     field of `X^{q^f} − X`, equivalently `K(μ_{q^f−1})`.
  2. *Abstract extensions.* Reduction is an equivalence between the finite unramified extensions
     of `K` and the finite extensions of `𝓀[K]`.
  3. *After a choice of residue data.* A chosen `𝓀[K]`-isomorphism of the residue extensions lifts
     to a unique `K`-isomorphism of the unramified extensions. Without that choice the lift is not
     unique.
  4. *Automorphisms.* `Gal(K_f/K)` is cyclic of order `f`, generated by the arithmetic Frobenius.
     So `K_f` has exactly `f` automorphisms over `K`. The condition of commuting with Frobenius
     selects none of them, because an abelian group is centralized by its own elements. Statement
     3, which fixes the map on residue fields, is the correct rigidity statement.

  Prove also that a compositum of unramified extensions is unramified. Prove that the finite
  unramified subextensions of `K` inside the fixed closure, ordered by inclusion, form a lattice.
  That lattice is isomorphic to the positive integers ordered by divisibility. The statement is
  about the finite subextensions: the maximal unramified extension has infinite intermediate
  fields as well.
  - *Prerequisites:*
    - `Layer 2: residue correspondence`;
    - `Mathlib: GaloisField` and the classification of finite extensions of a finite field;
    - `Mathlib: IntermediateField`.
  - *Source:* Serre LF III §5; Neukirch ANT II §7. *False generalization:* uniqueness of the
    isomorphism holds only after statement 3 fixes the residue map. The phrase "the unique
    unramified extension of degree `f`, with its unique `K`-isomorphism" is false for `f > 1`.
- **The maximal unramified extension.** Define `K^{ur} ⊆ AlgebraicClosure K` as the union of the
  `K_f`. Prove `Gal(K^{ur}/K) ≅ Ẑ`, carrying Frobenius to the canonical topological generator `1`,
  with `Ẑ ≅ lim ℤ/n` built on the completion API of `ProfiniteGrp`. Every unramified coordinate
  below is expressed through this isomorphism, whose target is `Ẑ` and never `ℤ`. In Tau Ceti these
  are `TauCeti.maximalUnramifiedExtension K (AlgebraicClosure K)`, its arithmetic Frobenius
  `TauCeti.maximalUnramifiedFrobenius`, and `TauCeti.maximalUnramifiedGaloisGroupEquivZHat`, which
  sends that Frobenius to the generator `TauCeti.zHat.gen` of the profinite integers
  `TauCeti.zHat` (`maximalUnramifiedGaloisGroupEquivZHat_apply_frobenius`); Layer 4 states
  against these declarations.
  - *Prerequisites:*
    - `Layer 2: existence and uniqueness`;
    - `Mathlib: profiniteCompletion`, `Mathlib/Topology/Algebra/Category/ProfiniteGrp/`.
  - *API:*
    - the intermediate field `K^{ur}`;
    - the isomorphism to `Ẑ` and its inverse;
    - the image of `Frob`;
    - compatibility with the finite levels;
    - the induced surjection `G_K → Ẑ`, which Layer 4 names;
    - the fixed field of a closed subgroup, in the two directions.
- **Norms.** Name the image of the field norm: `normGroup L/K := (N_{L/K})(Lˣ) : Subgroup Kˣ`,
  which `ClassFieldTheory.normResidue` and `conductorExponent` consume. For `L/K` unramified prove
  `N_{L/K}(𝒪[L]ˣ) = 𝒪[K]ˣ`, named `map_norm_unitFiltration_zero` and stated on the depth-zero
  step `U(L,0)` of the unit filtration, and `N_{L/K}(Lˣ) = π^{fℤ} × 𝒪[K]ˣ`. State the second in
  **norm-equation form**, as `mem_normGroup_iff_dvd_normalizedValuation`: `x ∈ normGroup L/K` if
  and only if `f` divides `v_K(x)`. That is the shape a consumer applies, since it decides one
  element at a time when the equation `N_{L/K}(y) = x` is solvable, and it needs no chosen
  uniformizer, where the product description does. Both come from `e = 1`, which makes
  `v_K(N_{L/K} y) = f · v_L(y)`, together with surjectivity on units. This is the concrete form
  of the statement that units are universal norms in the unramified direction. It is consumed by
  `ClassFieldTheory.normResidue` and the finite-Tate package `ClassFieldTheory.tateH`. ⚠ `f` here
  is the residue degree `inertiaDegree K L` of Layer 0, and the
  letter is never reused for a conductor. Tau Ceti implements all three: the norm group
  `TauCeti.normGroup K L`, the range of the norm on units `TauCeti.Algebra.normUnits K`
  (`TauCeti/RingTheory/Norm/Units.lean`); the valuation identity `TauCeti.normalizedValuation_norm`
  (`TauCeti/NumberTheory/LocalField/Norm/Basic.lean`); and, under the class
  `TauCeti.IsUnramified K L`, `TauCeti.map_normUnits_unitFiltration_zero` and
  `TauCeti.mem_normGroup_iff_dvd_normalizedValuation` (`Norm/Unramified.lean`). This roadmap's
  `normGroup` is a reducible alias, and
  `map_norm_unitFiltration_zero` and `mem_normGroup_iff_dvd_normalizedValuation` are closed proofs,
  with the class supplied from `e = 1` as for the Frobenius; the worked cases remain.
  - *Prerequisites:*
    - `Layer 2: residue correspondence`;
    - `Layer 1: graded pieces`;
    - `Layer 1: the unit filtration as an object`;
    - `Layer 0: e and f, intrinsically`;
    - `Layer 0: finite extensions, III`.
  - *API:*
    - the norm group as a named subgroup of `Kˣ`;
    - surjectivity of the norm on units, in the filtration form above;
    - the norm-equation criterion, and the valuation identity `v_K(N_{L/K} y) = f · v_L(y)` that
      it rests on;
    - the two worked `ℚ_2(√5)/ℚ_2` cases of the examples section, one solvable and one not.
  - *Source:* Serre LF V §2. The proof is surjectivity on each graded piece, plus completeness.
    *False generalization:* for a ramified extension the norm of a unit is a unit, but the image
    is a proper subgroup: at `L = ℚ_2(√2)` the image of `𝒪[L]ˣ` has index `2` in `ℤ_2ˣ`, so the
    norm-equation criterion is false there in both directions.

### Layer 3: ramification, the tame and wild cases, and the filtration

- **Totally ramified is equivalent to Eisenstein.** Prove that `e = [L:K]` holds if and only if
  `L = K(π_L)` for a root `π_L` of an Eisenstein polynomial over `𝒪[K]`. Prove also that an
  Eisenstein polynomial is irreducible, and that it generates a totally ramified extension in
  which its root is a uniformizer. Prove the factorization of an arbitrary finite `L/K` as
  `L/L_0/K`, where `L_0/K` is the maximal unramified subextension and `L/L_0` is totally ramified
  of degree `e`.
  - *Prerequisites:*
    - `Layer 0: e and f, intrinsically`;
    - `Layer 2: existence and uniqueness`;
    - `Mathlib: Polynomial.IsEisensteinAt` and its irreducibility results.
  - *API:*
    - the equivalence in both directions;
    - the uniformizer produced by the Eisenstein polynomial;
    - the factorization `L/L_0/K` and its uniqueness;
    - the degree of `L_0/K`, which is `f`;
    - the behaviour of the factorization in a tower.
- **Tame and wild.** Define `IsTamelyRamified K L` by `p ∤ e` and `IsWildlyRamified K L` by
  `p ∣ e`, where `p` is the residue characteristic. These are Tau Ceti's `TauCeti.IsTamelyRamified`
  and `TauCeti.IsWildlyRamified` (`TauCeti/NumberTheory/LocalField/RamificationIndex.lean`), with
  `TauCeti.not_isTamelyRamified_iff` and `TauCeti.isTamelyRamified_iff_natCast_ne_zero`, and this
  roadmap's two predicates are reducible aliases of them. Reserve *totally wildly ramified* for the
  stronger conjunction that `L/K` is totally ramified and `e` is a power of `p`. The public
  theorem about tame extensions is:

  ```text
  If L/K is finite, totally ramified, and tamely ramified of degree e,
  then there are a uniformizer π of K and α ∈ L with α^e = π and L = K(α).
  ```

  The corollaries carry their own hypotheses. `L/K` is Galois exactly when `μ_e ⊆ K`, and then
  `Gal(L/K) ↪ μ_e` by `σ ↦ σ(α)/α`. The proof may enlarge the residue field, prove the statement
  over `K^{ur}`, and descend. That belongs to the proof, and not to the public statement.
  - *Prerequisites:*
    - `Layer 3: totally ramified is equivalent to Eisenstein`;
    - `Layer 2: the maximal unramified extension`;
    - `Layer 1: graded pieces`.
  - *API:*
    - the two predicates;
    - the theorem above;
    - the Galois criterion;
    - the embedding into `μ_e`;
    - stability of tameness in towers and under composita;
    - the degree of the maximal tamely ramified subextension.
  - *Source:* Serre LF IV §2; Neukirch ANT II §7. *False generalization:* in residue
    characteristic `2` every totally ramified quadratic extension is wild. Keep the dyadic
    examples in the test suite, so that a hypothesis `p ∤ e` cannot enter a statement about the
    tame case that is later applied at `p = 2`.
- **Local monogenicity.** For every finite separable extension `L/K`, prove that the integer ring
  is generated by one integral element: there is an `x : 𝒪[L]` with
  `Algebra.adjoin 𝒪[K] {x} = ⊤`. Package the induced integral-basis and field-generation
  consequences so consumers do not have to reconstruct them from the primitive-element theorem.
  This is a local theorem: [the Number-Field Arithmetic
  roadmap](../NumberFieldArithmetic/README.md) consumes it only after passing to a completion.
  For an Eisenstein generator `ξ` of degree `n`, also prove the orthogonality of its power
  basis. If `c_i ∈ 𝒪[K]`, then

  ```text
  v_L(Σ_{i<n} c_i ξ^i) = min_{i<n} (e(L/K) v_K(c_i) + i)
                       = min_{i<n} (n v_K(c_i) + i).
  ```

  The second equality uses total ramification. The summands with nonzero coefficients have
  pairwise distinct values modulo `n`, so there is no cancellation. Export the formula in the
  canonical `IsDiscreteValuationRing.addVal` spelling. Counting Totally Ramified Extensions #226
  consumes it to derive the box/ball and coordinate-cube descriptions used by its measure
  argument; those family-level corollaries are not owned here.
  - *Prerequisites:*
    - `Layer 0: finite extensions, III`;
    - `Mathlib: Algebra.adjoin`, `Mathlib: IsIntegral`;
    - the primitive-element theorem for finite separable extensions.
  - *API:*
    - `exists_integerRing_adjoin_eq_top`;
    - the chosen-generator form, including integrality over `𝒪[K]` and generation of `L` over
      `K`;
    - `addVal_sum_eisenstein_powerBasis`, the exact minimum formula above;
    - the induced power basis;
    - compatibility with the comparison of `𝒪[L]` and the integral closure from Layer 0.III.
  - *Source:* Serre LF III §6, Proposition 12.
- **The lower-numbering filtration.** For `L/K` finite Galois with group `G`, define `G_i = {σ | ∀
  x : 𝒪[L], v_L(σ x − x) ≥ i + 1}` for `i : ℤ`. The function is total, with `G_i = ⊤` for
  `i ≤ −1`. Equivalently, `σ` acts trivially on `𝒪[L]/𝓂[L]^{i+1}`. Prove that each `G_i` is a
  normal subgroup of `G`, and that the family is antitone. Prove that `G_0` is the inertia group,
  with one comparison lemma to `ValuationSubring.inertiaSubgroup` and one to `Ideal.inertia`.
  Prove that `G_i = 1` for large `i`. Extend to a real index by `G_u := G_{⌈u⌉}` for `u : ℝ` with
  `u ≥ −1`. This ceiling-indexed family is constant on `(i-1,i]`, hence left-continuous in the
  usual step-function sense; do not call it right-continuous. Pin the interval theorem
  `i - 1 < u → u ≤ i → lowerRamificationGroupReal K L u = lowerRamificationGroup K L i`, as
  well as agreement at integers. No topological `LeftContinuous` theorem is required before a
  topology on subgroup values is chosen. The Herbrand integral below needs `G_t` for real `t`.
  Prove compatibility with subgroups: `H_i = H ∩ G_i` for
  `H = Gal(L/K')`. Tau Ceti implements the filtration at integer and at real index, for every
  finite `L/K`, as `TauCeti.LocalFieldsRamification.lowerRamificationGroup` and
  `lowerRamificationGroupReal` (`TauCeti/NumberTheory/LocalField/RamificationGroup.lean`), with
  normality, antitonicity, the negative-index convention, the two comparison lemmas at `0`, eventual
  triviality with the largest jump, the interval and integer-agreement lemmas, and compatibility
  with subgroups; this roadmap's `lowerRamificationGroup` and `lowerRamificationGroupReal` are
  reducible aliases of them, stated for `L/K` Galois.
  - *Prerequisites:*
    - `Layer 0: finite extensions, II`;
    - `Layer 0: the normalized valuation`;
    - `Mathlib: ValuationSubring.inertiaSubgroup`, `Ideal.inertia`.
  - *API:*
    - the definition at integer and at real index, with the integer-agreement and interval lemmas;
    - normality;
    - antitonicity;
    - the two comparison lemmas at `i = 0`;
    - the finiteness statement `G_i = 1` for large `i`, and the largest jump as a definition;
    - compatibility with subgroups;
    - the failure of compatibility with quotients, which is the next milestone;
    - the computation for `ℚ_2(μ_8)/ℚ_2` in the examples section.
  - *Source:* Serre LF IV §1.
- **Lower numbering is not compatible with quotients.** State this as a theorem with a witness,
  and not as a warning. In `L = ℚ_2(ζ_8)` over `K = ℚ_2`, with `G = (ℤ/8)ˣ` and `H = ⟨σ_7⟩` the
  subgroup generated by `ζ ↦ ζ^{-1}`, so that `L^H = ℚ_2(√2)`, one has `G_3 = ⟨σ_5⟩` and therefore
  `G_3H/H = G/H`, while `(G/H)_3 = 1`, because `v_{ℚ_2(√2)}(σ(√2) − √2) = v_{ℚ_2(√2)}(2√2) = 3`.
  The upper numbering repairs this failure.
  - *Prerequisites:* `Layer 3: the lower-numbering filtration`.
- **The quotient embeddings.** One formula covers every level:
  `θ_i : G_i/G_{i+1} ↪ U(L,i)/U(L,i+1)` by `σ ↦ σ(π_L)/π_L`. Prove injectivity and independence of
  the uniformizer. Composed with the graded pieces of Layer 1 this reads `θ_0 : G_0/G_1 ↪ 𝓀[L]ˣ`,
  the tame character, so `G_0/G_1` is cyclic of order prime to `p`; and
  `θ_i : G_i/G_{i+1} ↪ 𝓀[L]⁺` for `i ≥ 1`, by `σ ↦ (σ(π_L) − π_L)/π_L^{i+1}`, so those quotients
  are elementary abelian `p`-groups. In Tau Ceti the tame character is `TauCeti.tameCharacter`,
  with `TauCeti.tameCharacterGraded` on `G_0/G_1`, for any group acting on `L` and preserving
  `𝒪[L]`. Prove the consequences: `G_1` is the unique `p`-Sylow subgroup of `G_0` and is normal,
  which is wild inertia at finite level; and `G_0` has the cyclic tame quotient `G_0/G_1`. Prove
  the action formula: for `σ ∈ G_0` and `τ ∈ G_i`, `θ_i(στσ⁻¹) = θ_0(σ)^i · θ_i(τ)` (Serre LF IV
  §2, Proposition 9). It describes how the tame quotient acts on the wild graded pieces, and `θ_t`
  is the constant in the norm computation below. Prove the equivariance of the tame character:
  for `g ∈ G` and `σ ∈ G_0`, `θ_0(gσg⁻¹) = ḡ(θ_0(σ))`, where `ḡ` is the automorphism of `𝓀[L]`
  induced by `g` (`tameCharacter_conj`). Hence `θ_0(gσg⁻¹) = θ_0(σ)^q` whenever `g` acts on
  `𝓀[L]` as `x ↦ x^q` (`tameCharacter_conj_of_smul_eq_pow`), in particular, with `q = #𝓀[K]`,
  for every `g ∈ Gal(L/K)` restricting to the arithmetic Frobenius of the maximal unramified
  subextension. This is the finite-level form of the Frobenius twist `σ τ σ⁻¹ = τ^q` of Layer 4.
  ⚠ The action formula is not that twist: its `σ` lies in `G_0` and acts trivially on `𝓀[L]`, and
  at `i = 0` it says only that `G_0/G_1` is abelian. The twist conjugates by an element outside
  `G_0`.
  - *Prerequisites:*
    - `Layer 3: the lower-numbering filtration`;
    - `Layer 1: graded pieces`;
    - `Mathlib: IsLocalRing.ResidueField`, with the induced action of a group acting on the ring
      (`IsLocalRing.ResidueField.residue_smul`);
    - Tau Ceti: `TauCeti.tameCharacter` and its independence of the uniformizer,
      `TauCeti.tameCharacter_eq_of_irreducible`.
  - *API:*
    - the embeddings at every level, with injectivity and independence of the uniformizer;
    - the two composed forms;
    - the group-theoretic consequences above;
    - the action formula;
    - `tameCharacter_conj` and `tameCharacter_conj_of_smul_eq_pow`;
    - naturality under passage to a subgroup `H ≤ G`.
  - *Source:* Serre LF IV §2.
- **Herbrand functions and the upper numbering.** Define `φ_{L/K}(u) = ∫_0^u dt/[G_0 : G_t]` for
  `u ≥ −1`, with the usual convention that the integrand is `[G_t : G_0]` on `[−1, 0]`. Prove the
  analytic facts as milestones: `φ` is continuous, piecewise linear with an explicit finite-sum
  formula, strictly increasing and concave, `φ(0) = 0`, and `φ(u) = u` for `−1 ≤ u ≤ 0`. Define
  `RamificationIndexDomain := Set.Ici (-1 : ℝ)` and package the two functions as
  `herbrandOrderIso : RamificationIndexDomain ≃o RamificationIndexDomain`; `herbrand` is its
  forward map and `inverseHerbrand` its inverse. Thus `φ ∘ ψ = id` and `ψ ∘ φ = id` are typed
  equalities on the mathematical domain, and no theorem makes an arbitrary claim below `-1`.
  A global wrapper may be added only after its value below `-1` is fixed explicitly. Prove that
  `ψ` carries the jumps of the upper filtration to the jumps of the lower one. The upper numbering
  is `G^u := G_{ψ(u)}`, with the real-index groups above. Tau Ceti implements the definitions and
  the analytic facts in `TauCeti/NumberTheory/LocalField/Herbrand.lean`, in the namespace
  `TauCeti.LocalFieldsRamification`: `RamificationIndexDomain`, `herbrandOrderIso`, `herbrand` and
  `inverseHerbrand`, with the integral formula `coe_herbrand`, the finite-sum formula
  (`coe_herbrand_of_mem_Icc`, `coe_herbrand_of_coe_eq_natCast`), continuity and strict
  monotonicity (`continuous_herbrand`, `herbrand_strictMono` and their counterparts for `ψ`),
  concavity (`herbrand_slope_anti_adjacent`), the identity on `[-1, 0]`
  (`herbrand_of_coe_le_zero`, `inverseHerbrand_of_coe_le_zero`), `herbrand_inverseHerbrand` and
  `inverseHerbrand_herbrand`; and the upper numbering `upperRamificationGroup`, with
  `G^{φ(u)} = G_u` (`upperRamificationGroup_herbrand`), antitonicity and normality. This roadmap's
  names are reducible aliases of these definitions and its two inversion theorems are closed
  proofs. The image of a jump, the quotient theorem and its field-theoretic corollary, tower
  transitivity and the worked computation remain.

  State the abstract quotient theorem first. Let `M/K` be finite Galois, put
  `G = Gal(M/K)`, let `H ≤ G` be normal, and equip `G ⧸ H` with the quotient filtration. Then
  `upperRamificationGroupQuotient H u` is the image of `G^u`, equivalently
  `(G/H)^u = G^u H/H`. Only afterward derive the field-theoretic corollary: for an intermediate
  field `L = M^H`, fix the restriction equivalence `G ⧸ H ≃ Gal(L/K)`; normality of `H`
  (equivalently, `L/K` Galois) is required for that identification.

  Tower transitivity carries the same hypotheses: `M/K` is finite Galois, `L` is intermediate,
  and `L/K` is Galois. With the restriction/quotient equivalences fixed, prove
  `φ_{M/K} = φ_{L/K} ∘ φ_{M/L}` and
  `ψ_{M/K} = ψ_{M/L} ∘ ψ_{L/K}`. Inverting the composite reverses its order, and the two orders
  differ as soon as one step is wild. These exports are consumed by
  `ClassFieldTheory.conductorExponent` and `characterConductorExp`.
  - *Prerequisites:*
    - `Layer 3: the lower-numbering filtration`;
    - `Mathlib: intervalIntegral` and the API for piecewise linear monotone functions.
  - *API:*
    - `RamificationIndexDomain`, `herbrandOrderIso`, `herbrand`, and `inverseHerbrand`;
    - continuity, monotonicity, concavity, and the values at `0`;
    - the finite-sum formula at integers;
    - `herbrand_inverseHerbrand` and `inverseHerbrand_herbrand`;
    - the image of a jump;
    - `upperRamificationGroup` as a filtration, with normality and antitonicity;
    - `upperRamificationGroupQuotient`, `upperRamificationGroup_quotient`, and the field-theoretic
      `upperRamificationGroup_fixedField`, stated through Mathlib's actual
      `IsGalois.normalAutEquivQuotient` restriction equivalence;
    - `herbrand_tower` and `inverseHerbrand_tower`, with the finite-Galois and normality
      hypotheses above;
    - the computation for `ℚ_2(μ_8)/ℚ_2` in the examples section.
  - *Source:* Serre LF IV §3.
- **Herbrand values as unit depths.** `φ` takes non-integral values at integers: in `ℚ_2(μ_8)/ℚ_2`
  below, `φ(2) = 3/2`. Its inverse does not. Prove that `ψ_{L/K}(n)` is a natural number for every
  `n : ℕ`. The integral depth `ψℕ_{L/K} : ℕ → ℕ` (`psiNat`) is `n ↦ ⌊ψ_{L/K}(n)⌋₊`, read on the
  canonical `inverseHerbrand`, and the integrality is its characterizing lemma
  `(ψℕ_{L/K} n : ℝ) = ψ_{L/K} n` (`coe_psiNat`): the floor rounds nothing. This is the only
  conversion from a Herbrand value to a unit depth in this roadmap. Every index of `U(K, −)` and
  of `U(L, −)` below is a literal natural number or a value of `ψℕ`, and `φ` never indexes a unit
  group. The proof is the piecewise
  formula with Lagrange's theorem: write `g_i = #G_i`, and take `t` to be the largest jump with
  `φ(t) ≤ n`; then `ψ(n) = t + (g_0·n − ∑_{i=1}^{t} g_i) / g_{t+1}`, and `g_{t+1}` divides `g_0`
  and every `g_i` with `i ≤ t`, because the filtration is decreasing.
  - *Prerequisites:* `Layer 3: Herbrand functions and the upper numbering`.
  - *API:*
    - `psiNat`;
    - `coe_psiNat`;
    - `ψℕ 0 = 0`;
    - monotonicity;
    - `n ≤ ψℕ n`;
    - `psiNat_tower`, stating `ψℕ_{M/K} = ψℕ_{M/L} ∘ ψℕ_{L/K}`, under the same hypotheses as real-valued
      transitivity: `M/K` finite Galois and the intermediate extension `L/K` Galois, with the
      quotient/restriction equivalences fixed;
    - the closed form in the cyclic prime-degree case, which is `ψℕ v = v` for `v ≤ t` and
      `ψℕ v = t + ℓ(v − t)` for `v ≥ t`.
- **The norm on the unit filtration.** ⚠ `N_{L/K}(U(L,i)) ⊆ U(K,i)` is **false** for a ramified
  extension `L/K`. In a tame quadratic extension in residue characteristic `3`, the norm of an
  element of `U(L,2)` is outside `U(K,2)`; the examples section has the computation. The true
  inclusion carries a Herbrand shift, which no milestone may remove. Each item names its consumer.
  1. *The norm on valuations and on units, for any finite `L/K`.* `v_K(N_{L/K}(x)) = f · v_L(x)`
     for `x : Lˣ`. Therefore `N_{L/K}(𝒪[L]ˣ) ⊆ 𝒪[K]ˣ`, which is `N_{L/K}(U(L,0)) ⊆ U(K,0)`. If
     `L/K` is totally ramified, `N_{L/K}(π_L)` is a uniformizer of `K`. This is the basic API of
     the norm at a local field. The last part fixes the coordinate on the target of the graded
     maps in item 4. Tau Ceti implements this item: `TauCeti.normalizedValuation_norm`,
     `TauCeti.map_normUnits_unitFiltration_zero_le` and, for the uniformizer,
     `TauCeti.isUniformizer_normUnits_iff` (`TauCeti/NumberTheory/LocalField/Norm/Basic.lean`).
  2. *The Herbrand-shifted inclusion, for `L/K` finite Galois.*
     `N_{L/K}(U(L, ψℕ_{L/K}(i))) ⊆ U(K, i)` for every `i : ℕ`. Both depths are natural numbers,
     because `ψℕ` is. The unshifted corollary is `N_{L/K}(U(L,i)) ⊆ U(K, ⌊φ_{L/K}(i)⌋)`, which
     follows from `ψ(⌊φ(i)⌋) ≤ i`. Name the shifted theorem
     `map_norm_unitFiltration_psiNat_le`; it is the form consumed by
     `ClassFieldTheory.conductorExponent` and `characterConductorExp`.
  3. *Unramified `L/K`.* `N_{L/K}(U(L,i)) = U(K,i)` for every `i : ℕ`, an equality, and here `ψℕ`
     is the identity. The case `i = 0` is the norm surjectivity of Layer 2. The downstream
     cohomological formulation uses `ClassFieldTheory.tateH` on `ClassFieldTheory.unitsRep`.
  4. *Cyclic totally ramified of prime degree `ℓ`: the graded maps.* Write `G = ⟨σ⟩`, and let
     `t ≥ 0` be the unique jump, so that `G_i = G` for `i ≤ t` and `G_i = 1` for `i > t`. Then
     `t = 0` holds exactly in the tame case `ℓ ≠ p`, where the Galois hypothesis forces `μ_ℓ ⊆ K`
     and therefore `ℓ ∣ q − 1`. Coordinatize the graded pieces by a uniformizer `π_L` and by
     `π_K = N_{L/K}(π_L)`. The norm induces `gr_v N : U(L, ψℕ v)/U(L, ψℕ v + 1) → U(K, v)/U(K,
     v+1)`. The milestone is the computation of that map in the four cases that occur:
     - `v = t = 0`, the tame case: `y ↦ y^ℓ` on `𝓀ˣ`, with kernel and cokernel `μ_ℓ(𝓀)` of order
       `ℓ`, by `ℓ ∣ q − 1`;
     - `v = 0 < t`, so `ℓ = p`: `y ↦ y^p` on `𝓀ˣ`, the Frobenius of a finite field, bijective;
     - `0 < v < t`, which again forces `ℓ = p`: `y ↦ y^p` on `𝓀⁺`, Frobenius again, bijective;
     - `v = t > 0`: the additive map `y ↦ y^ℓ − c^{ℓ−1}·y` on `𝓀⁺`, where `c = θ_t(σ) ∈ 𝓀ˣ` is the
       value at a generator `σ` of `G` of the level-`t` embedding `θ_t` above. The map is
       `𝔽_ℓ`-linear, with kernel the line `𝔽_ℓ·c` and cokernel of order `ℓ`.

     ⚠ The exponent on `c` is not a slip. The element `c` changes when the generator `σ` changes,
     and `c^{ℓ−1}` does not, because `λ^{ℓ−1} = 1` for `λ ∈ 𝔽_ℓˣ`. A version with a bare `c` would
     make the kernel depend on the choice of `σ`, which the norm map cannot see. In summary:
     `gr_v N` is bijective for `v ≠ t`, and at `v = t` its kernel and its cokernel both have order
     `ℓ`. The representative declarations keep these regimes separate:
     `normGradedMap_tame_break_zero` covers `v = t = 0`;
     `normGradedMap_zero_before_break` covers `v = 0 < t`;
     `normGradedMap_positive_before_break` covers `0 < v < t`; and
     `normGradedMap_at_break` covers only `v = t > 0`. The last theorem explicitly requires
     `IsTotallyRamified K L`, `0 < t`, and
     `UpperJump K L ⟨(t : ℝ), _⟩`; prime-degree Galois hypotheses supply cyclicity. In particular,
     its kernel-and-cokernel conclusion is unavailable for an unramified extension or for the tame
     break at zero.
  5. *The consequences of item 4, for the same extensions.* `N_{L/K}(U(L, ψℕ v)) = U(K,v)` for
     every `v > t`, by successive approximation from item 4 and completeness. `[U(K,v) :
     N_{L/K}(U(L, ψℕ v)) · U(K,v+1)] = ℓ` for `v = t`, and `= 1` for `v ≠ t`. Multiplication up
     the filtration then gives `[𝒪[K]ˣ : N_{L/K}(𝒪[L]ˣ)] = ℓ`. The induction for Hasse–Arf
     consumes item 4 and these indices, and the conductor of a cyclic extension of prime degree is
     `c(L/K) = t + 1`.
  - *Prerequisites:*
    - `Layer 3: Herbrand values as unit depths`;
    - `Layer 3: the quotient embeddings`;
    - `Layer 1: graded pieces`;
    - `Layer 2: norms` (for item 3);
    - `Layer 0: e and f, intrinsically`.
  - *Source:* Serre LF V §2 for item 3, Serre LF V §3 for item 4, and Serre LF V §6 for item 2.
    *False generalization:* the unshifted inclusion in item 2, which the counterexample in the
    examples section refutes.
  - *Lean-facing exports:* `map_norm_unitFiltration_psiNat_le`, `UnitFiltrationGraded`,
    `normGradedMap`, `normGradedMap_tame_break_zero`, `normGradedMap_zero_before_break`,
    `normGradedMap_positive_before_break`, and `normGradedMap_at_break`.
- **Hasse–Arf.** For a finite abelian Galois extension `L/K`, the jumps of the upper-numbering
  filtration are integers. A jump is a `u` with `G^v ≠ G^u` for every `v > u` (Serre LF IV §3),
  defined as `UpperJump K L u` on the upper filtration `upperRamificationGroup` of the preceding
  milestone. The proof contract includes the induction chain, not merely the phrase
  “reduce to cyclic prime degree”:
  1. prove the unique-break and conductor calculation for cyclic extensions of prime degree;
  2. choose a prime-order normal quotient series for the finite abelian group;
  3. transport the filtration at every step using the abstract Herbrand quotient theorem and its
     fixed field-theoretic equivalence;
  4. compare conductors with norms using the four graded norm maps and their kernel/cokernel
     calculation above;
  5. induct along the series, showing at each quotient that integrality of the upper breaks is
     preserved.
  - *Prerequisites:*
    - `Layer 3: the norm on the unit filtration` (items 4 and 5);
    - `Layer 3: Herbrand functions and the upper numbering` (normal-quotient compatibility and
      tower transitivity);
  - *Lean-facing exports:* `UpperJump` and `hasseArf`.
  - *Source:* Serre LF V §7. The hypothesis is that `G` is abelian. *False generalization:* for
    `G` non-abelian the jumps of the upper numbering need not be integers; the quaternion
    extension in Serre LF IV §3, exercise 3, is the standard witness.
- **The different and the discriminant.** Let `L/K` be finite separable. The different
  `𝔡_{L/K} ⊆ 𝒪[L]` is Mathlib's `differentIdeal 𝒪[K] 𝒪[L]`, the inverse of the trace dual of
  `𝒪[L]`. Define the discriminant `𝔩_{L/K} = N_{L/K}(𝔡_{L/K}) ⊆ 𝒪[K]`,
  which is an ideal of the base. The two are not to be conflated. Define the local different
  exponent `d(L/K) := v_L(𝔡_{L/K})` and the local discriminant exponent
  `δ(L/K) := v_K(𝔩_{L/K})`; prove `δ(L/K) = f(L/K) d(L/K)`. Both exponents and both ideals are
  invariant under a `K`-algebra isomorphism of finite separable extensions, with transport along
  the induced integer-ring equivalence. This is the exact invariance consumed when #226 regroups
  its mass formula by `K`-isomorphism classes. Prove: `𝔡_{L/K} = 𝒪[L]` if and only if `L/K` is
  unramified; for `L/K` Galois,
  `d(L/K) = ∑_{i≥0} (#(lowerRamificationGroup K L i) − 1)`; and generally
  `d(L/K) = e − 1` if and only if `L/K` is tamely ramified. Thus a wildly ramified extension has
  `e ≤ d(L/K)`. Given `he : (e : L) ≠ 0` (in particular in mixed characteristic), also prove the sharp
  upper bound `d(L/K) ≤ e − 1 + natCastValuation L e he`. Neither endpoint is forced in the wild case:
  `ℚ_2(i)/ℚ_2` has `d = e = 2`, while `ℚ_2(√2)/ℚ_2` has
  `d = 3 = e − 1 + natCastValuation L e he`. The trace-dual definition comes before the valuation formula, which
  needs `L/K` Galois; the bounds and tame equality criterion do not.

  Tau Ceti implements the discriminant ideal and both exponents, `TauCeti.discriminantIdeal`,
  `TauCeti.differentExponent` and `TauCeti.discriminantExponent`
  (`TauCeti/NumberTheory/LocalField/Different/Basic.lean`, `Discriminant.lean`), with
  `𝔡_{L/K} = 𝓂[L]^{d(L/K)}` (`TauCeti.differentIdeal_eq_maximalIdeal_pow`),
  `𝔩_{L/K} = 𝓂[K]^{δ(L/K)}` (`TauCeti.discriminantIdeal_eq_maximalIdeal_pow`), the product formula
  `TauCeti.discriminantExponent_eq_inertiaDegree_mul_differentExponent`, the unramified criteria
  `TauCeti.differentIdeal_eq_top_iff` and `TauCeti.discriminantIdeal_eq_top_iff`, the tame equality
  criterion `TauCeti.differentExponent_eq_ramificationIndex_sub_one_iff`, the wild lower bound
  `TauCeti.ramificationIndex_le_differentExponent_iff`, and multiplicativity in a tower,
  `TauCeti.differentExponent_tower` (`Different/Tower.lean`). This roadmap's `differentExponent`,
  `localDiscriminantIdeal` and `discriminantExponent` are reducible aliases of them, and its
  product formula and tame criterion are closed proofs. `TauCeti.differentExponent` is defined for
  every compatible extension and its theorems assume `Algebra.IsSeparable K L`;
  `TauCeti.discriminantExponent` takes separability as an argument of the definition. The
  invariance under `K`-isomorphism, the Hilbert formula, the mixed-characteristic upper bound and
  the worked value remain.
  - *Prerequisites:*
    - `Mathlib: differentIdeal`, `Mathlib/RingTheory/Trace/`;
    - `Layer 3: the lower-numbering filtration`;
    - `Layer 0: finite extensions, III`.
  - *API:*
    - the two ideals;
    - `discriminantExponent` and
      `discriminantExponent_eq_inertiaDegree_mul_differentExponent`;
    - `differentExponent_eq_of_algEquiv` and `discriminantExponent_eq_of_algEquiv`;
    - multiplicativity in a tower;
    - the unramified criterion;
    - `differentExponent` and the Hilbert valuation formula in the Galois case;
    - the tame equality criterion and the wild lower bound;
    - the mixed-characteristic upper bound;
    - the value for `ℚ_2(√2)/ℚ_2`, which is `3`.
  - *Source:* Serre LF III §§3–6 for the different and the discriminant, and Serre LF IV §1 for
    the valuation formula, which needs `L/K` Galois.

### Consumer contract: Counting Totally Ramified Extensions

The governing rule is that this roadmap owns the arithmetic of one finite extension of a
nonarchimedean local field, while [Counting Totally Ramified Extensions
#226](https://github.com/TauCetiProject/TauCetiRoadmap/pull/226) owns the construction and counting
of families of such extensions. The dependency is one-way:

```text
LocalFieldsRamification (this roadmap) → TotallyRamified (#226)
```

This roadmap owns the canonical induced local-field structure, `e` and `f`, total/tame/wild
ramification, Eisenstein generators and integral monogenicity, the different and local
discriminant exponents, their invariance under `K`-algebra equivalence, and the valuation formula
for an Eisenstein power basis.

#226 consumes those declarations. It owns the family `σ_K(n)`, `totallyRamifiedOfDegree`,
`IsRepresentativeSet`, the mass-formula weight `wildExponent c(L) = d(L) - n + 1`, quantitative
Newton and root-counting arguments, local constancy of root counts, the coefficient space and
Eisenstein region, nonarchimedean lattice-index and Haar-scaling formulas, finiteness and
orbit-stabilizer weights, and both forms of Serre's mass formula. None of those are definitions or
milestones of this roadmap.

The consumer represents extensions by arbitrary terms
`M : IntermediateField K (SeparableClosure K)`. It may define total or junk-tolerant wrappers such
as `intermediateFieldIsTotallyRamified` and `intermediateFieldDiscriminantExponent`, but each
wrapper must install this roadmap's `finiteIntermediateField*` structures and carry a comparison
theorem with the canonical invariant below. A wrapper must not contain an independent definition
of the ramification index, total-ramification predicate, different, discriminant ideal, or
discriminant exponent. This permits harmless family-level totalization without making this
roadmap a counting roadmap or introducing a dependency on #226.

| Consumer need in #226 | Owner/export in this roadmap |
|---|---|
| local structure on a finite intermediate field | `finiteIntermediateFieldNormedField`, `finiteIntermediateFieldValuativeRel`, `finiteIntermediateFieldTopology`, `finiteIntermediateField_valuativeExtension`, `finiteIntermediateField_isValuativeTopology`, `finiteIntermediateField_isNonarchimedeanLocalField` |
| ramification index | `ramificationIndex` |
| residue degree | `inertiaDegree` |
| total ramification | `IsTotallyRamified`, `isTotallyRamified_iff_inertiaDegree_eq_one` |
| Eisenstein generator | `isTotallyRamified_iff_exists_eisenstein_generator` |
| integral monogenicity | `exists_integerRing_adjoin_eq_top` |
| local different exponent | `differentExponent` |
| local discriminant exponent | `discriminantExponent` |
| tame and wild bounds | `differentExponent_eq_ramificationIndex_sub_one_iff`, `differentExponent_bounds_of_wild` |
| invariance under `K`-equivalence | `differentExponent_eq_of_algEquiv`, `discriminantExponent_eq_of_algEquiv` |
| power-basis valuation orthogonality | `addVal_sum_eisenstein_powerBasis` |

Two results needed by the mass formula remain owned here:

1. `discriminantExponent_eq_of_algEquiv`, since invariance of a local arithmetic invariant is
   reusable outside counting;
2. `addVal_sum_eisenstein_powerBasis`, since it is a valuation theorem about one Eisenstein
   extension.

The counting roadmap owns only their family-level consequences: invariance of `wildExponent`,
coordinate-box and coordinate-cube descriptions, volume computations, and the resulting
integrals. #226 itself must be updated separately to install this adapter contract and replace its
temporary arithmetic declarations with the canonical exports above.

### Layer 4: the tame quotient of the absolute Galois group

**Suppliers.** For the group theory of this layer, `Suggested.lean` imports
`TauCetiRoadmap.ProfiniteProPGroups.Suggested` and Tau Ceti's
`TauCeti.Topology.Algebra.Group.Profinite.Presentation` and
`TauCeti.Topology.Algebra.Group.Profinite.ZHat.Basic` directly. No supplied group-theoretic
declaration is restated: there is no `Supplied.*` alias and no private replacement carrier for the
pro-`p`, Sylow, free-group or presentation API. For the Galois theory of the finite levels it uses
Mathlib's `FiniteGaloisIntermediateField` and `AlgEquiv.restrictNormalHom`, and Tau Ceti's Galois
correspondence for normal extensions, `TauCeti.fixingSubgroup_fixedField`
(`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean`), which covers the algebraic closure in
every characteristic.

The dependency is **type-checked, not promised**. Layer 1's `unitFiltration_one_isProP` is stated
against `ProfiniteProPGroups.IsProP` — the same statement as the inverse-limit description, not a
rephrasing of it — and Layer 4 consumes its suppliers with **closed** proofs: the uniqueness of
wild inertia as the pro-`p` Sylow subgroup of inertia is
`ProfiniteProPGroups.IsProPSylow.eq_of_normal` applied, and the uniqueness of the marked Iwasawa
presentation and of its coordinate is `TauCeti.presentedProfiniteGroup.hom_ext_of` applied. A
rename, a carrier change or a changed hypothesis in a supplier breaks this build rather than being
absorbed silently.

**Contract audit.** The group-theoretic and Galois-theoretic declarations this roadmap consumes are
exactly these, and no others:

| Used in | Declaration |
| --- | --- |
| Layer 1, and inside `IsProPSylow` | `ProfiniteProPGroups.IsProP` |
| Layer 4, wild inertia | `ProfiniteProPGroups.exists_isProPSylow`, `ProfiniteProPGroups.IsProP.exists_le_isProPSylow`, `ProfiniteProPGroups.IsProPSylow.eq_of_normal`, `ProfiniteProPGroups.IsProPSylow.map_of_surjective` |
| Layer 4, the Iwasawa presentation | `TauCeti.freeProfiniteGroup` with `of` and `lift`; `TauCeti.presentedProfiniteGroup` with `of`, `lift`, `hom_ext_of` and `congr` |
| Layers 2 and 4, the unramified coordinate | `TauCeti.zHat` and `TauCeti.zHat.gen` |
| Layer 4, the finite levels, wild inertia and `K^t` | Mathlib's `FiniteGaloisIntermediateField`, `AlgEquiv.restrictNormalHom` and `InfiniteGalois.restrictNormalHom_continuous`; Tau Ceti's `TauCeti.fixingSubgroup_fixedField` and `IntermediateField.fixingSubgroup_inf_separableClosure` |

This roadmap consumes **no** maximal pro-`p` quotient, **no** free pro-`p` group, and **no**
generator-rank declaration. `G_K(p)`, its rank and its Demushkin presentation are
`LocalGaloisGroups`', and the generic constructions that roadmap defers to
`ProfiniteArithmetic` — the
profinite integers as a ring, profinite exponentiation and continuous outer automorphisms — are
used by no milestone here.

- **The ambient model, fixed once.** Use `G_K := Field.absoluteGaloisGroup K` with the Krull
  topology, in every public statement and in every characteristic. Prove once, as a comparison
  theorem, that the restriction `Gal(AlgebraicClosure K / K) → Gal(separableClosure K / K)`, that
  is `separableClosure.algEquivOfAlgEquiv`, is an isomorphism of topological groups. A proof that
  is more convenient over a separable closure may then transport along it. No theorem below
  chooses its own model. Every infinite subextension, that is `K^{ur}`, `K^{t}`, and `K^{ab}`, is
  an `IntermediateField K (AlgebraicClosure K)`. Inertia, wild inertia, and the unramified
  quotient are the corresponding closed subgroups and quotients, and are named as such. The finite
  levels are the finite Galois subextensions `L`, Mathlib's
  `FiniteGaloisIntermediateField K (AlgebraicClosure K)`, with restriction
  `AlgEquiv.restrictNormalHom L : G_K → Gal(L/K)`. Each carries the local-field structure that
  Layer 0.III builds from that of `K` (`finiteIntermediateFieldValuativeRel`,
  `finiteIntermediateFieldTopology`), and `finiteGaloisLowerRamificationGroup K L i` is the lower
  ramification group `G_i(L/K)` of Layer 3 for that structure. It adapts the intermediate-field
  carrier to the local-field carrier and defines no second filtration.
  - *Prerequisites:*
    - `Mathlib: Field.absoluteGaloisGroup`, `separableClosure.algEquivOfAlgEquiv`,
      `Mathlib/FieldTheory/KrullTopology.lean`;
    - `Mathlib: FiniteGaloisIntermediateField`, `AlgEquiv.restrictNormalHom`;
    - `Layer 0: finite extensions, III`, for the intermediate-field adapters;
    - `Layer 3: the lower-numbering filtration`.
  - *API:*
    - the comparison isomorphism, with continuity in both directions;
    - the transport lemmas for subgroups and for quotients;
    - the profinite structure;
    - the correspondence between closed subgroups and intermediate fields, specialized to the
      three named fields;
    - `finiteGaloisLowerRamificationGroup` and its normality.
- **Inertia.** `I_K = Gal(Kˢ/K^{ur})` is Tau Ceti's `TauCeti.inertiaSubgroup K`, the fixing
  subgroup of `TauCeti.maximalUnramifiedExtension K (AlgebraicClosure K)`; it is closed
  (`TauCeti.isClosed_inertiaSubgroup`) and normal (`TauCeti.inertiaSubgroup_normal`). This
  roadmap's `inertia` is a reducible alias of it, under the name `ClassFieldTheory` states
  against. The exact sequence `1 → I_K → G_K → Ẑ → 1` is restriction to `K^{ur}`,
  `TauCeti.restrictMaximalUnramifiedHom`, a continuous surjection with kernel `I_K`
  (`TauCeti.ker_restrictMaximalUnramifiedHom`), followed by the isomorphism of Layer 2. The
  unramified quotient `G_K/I_K` is `TauCeti.unramifiedQuotient`, identified with `Gal(K^{ur}/K)`
  by `TauCeti.quotientInertiaSubgroupEquiv`. The arithmetic Frobenius lifts are the `σ` with
  `TauCeti.IsArithFrobeniusLift K σ`, that is, restricting to `TauCeti.maximalUnramifiedFrobenius`:
  they exist (`TauCeti.exists_isArithFrobeniusLift`), they form a left coset of `I_K`
  (`TauCeti.IsArithFrobeniusLift.setOf_eq_leftCoset`), and each of them generates `G_K`
  topologically together with `I_K`
  (`TauCeti.IsArithFrobeniusLift.topologicalClosure_zpowers_sup_inertiaSubgroup`). Every
  statement below about Frobenius lifts is made against `TauCeti.IsArithFrobeniusLift`.
  - *Prerequisites:*
    - `Layer 2: the maximal unramified extension`;
    - `Layer 4: the ambient model`.
  - *API:*
    - functoriality in a finite extension of `K`;
    - the image of `I_K` in `Gal(L/K)` for each finite Galois subextension `L`, which is
      `G_0(L/K)` of Layer 3 (`map_restrictNormalHom_inertia`).
- **Wild inertia.** Define wild inertia `P_K` (`wildInertia`) as the inverse limit of the
  finite-level `G_1`: the elements of `G_K` whose restriction to every finite Galois subextension
  `L` lies in `G_1(L/K)`, that is, in `finiteGaloisLowerRamificationGroup K L 1`. The
  characterizing statement is `mem_wildInertia_iff`, a closed proof. `P_K` is a closed normal
  subgroup of `G_K` (`wildInertia_isClosed`, `wildInertia_normal`), by closed proofs: restriction is
  continuous into each finite discrete `Gal(L/K)`, and each `G_1(L/K)` is normal. Closedness is
  what makes the tame quotient `G_K/P_K` Hausdorff, hence profinite. Define the maximal tamely
  ramified extension `K^{t}` (`maximalTame`) as the separable part of the fixed field of `P_K`,
  that is, the fixed field intersected with `separableClosure K K^{al}`. ⚠ The intersection is part
  of the definition: in characteristic `p` the fixed field of every subgroup of `G_K` contains the
  purely inseparable closure of `K`, while `K^{t}` is separable over `K`. Then
  `P_K = Gal(K^{al}/K^{t})` (`fixingSubgroup_maximalTame`) is a closed proof from closedness,
  `TauCeti.fixingSubgroup_fixedField` and `IntermediateField.fixingSubgroup_inf_separableClosure`.
  Prove that the image of `P_K` in each `Gal(L/K)` is all of
  `G_1(L/K)` (`map_restrictNormalHom_wildInertia`): restriction maps `G_0` onto `G_0` and `G_1` is
  the unique `p`-Sylow subgroup of `G_0`, and compactness passes to the limit. Prove that a finite
  Galois subextension lies in `K^{t}` exactly when its `G_1` is trivial, that is, exactly when it is
  tamely ramified (`le_maximalTame_iff`), so that `K^{t}` is the compositum of the finite tamely
  ramified subextensions, and prove the classical description `K^{t} = K^{ur}(π^{1/m} : p ∤ m)` for
  any uniformizer `π` (`maximalTame_eq_maximalUnramified_sup_adjoin`). Prove that `P_K ≤ I_K`
  (`wildInertia_le_inertia`), that `P_K` is pro-`p`, and that it is the unique maximal such subgroup
  of `I_K`, that is, its pro-`p` Sylow subgroup. Sylow theory for profinite groups is free of
  Galois vocabulary, and this roadmap does not restate it in that vocabulary. What is proved here is
  the identification of that Sylow subgroup with `P_K`.
  - *Prerequisites:*
    - `Layer 3: tame and wild`;
    - `Layer 3: the quotient embeddings`, for `G_1` as the `p`-Sylow subgroup of `G_0`;
    - `Layer 4: the ambient model`, for the finite levels;
    - `Layer 4: inertia`;
    - `Mathlib: InfiniteGalois.restrictNormalHom_continuous`, `Subgroup.normalClosure`,
      `OpenNormalSubgroup`;
    - Tau Ceti: `TauCeti.fixingSubgroup_fixedField`,
      `IntermediateField.fixingSubgroup_inf_separableClosure`;
    - **Profinite and Pro-`p` Groups**:
      `ProfiniteProPGroups.exists_isProPSylow`,
      `ProfiniteProPGroups.IsProP.exists_le_isProPSylow`,
      `ProfiniteProPGroups.IsProPSylow.eq_of_normal`, and
      `ProfiniteProPGroups.IsProPSylow.map_of_surjective`.
  - *API:*
    - the subgroup `P_K` with `mem_wildInertia_iff`, and the field `K^{t}`;
    - closedness, `wildInertia_isClosed`, and normality, `wildInertia_normal`;
    - `fixingSubgroup_maximalTame`, `le_maximalTame_iff` and
      `maximalTame_eq_maximalUnramified_sup_adjoin`;
    - the image of `P_K` in a finite quotient, which is `G_1` of Layer 3
      (`map_restrictNormalHom_wildInertia`);
    - `wildInertia_le_inertia`;
    - the pro-`p` property;
    - the Sylow identification.
- **The tame character and the twist.** Prove `I_K/P_K ≅ lim_{p∤m} μ_m(Kˢ) = Ẑ^{(p')}(1)`, by
  `σ ↦ (σ(π^{1/m})/π^{1/m})_m`, and independence of the choices. ⚠ The notation `Ẑ^{(p')}(1)` is
  *defined* here, as the prime-to-`p` Tate module of `μ`. As a profinite group it is
  `∏_{ℓ ≠ p} ℤ_ℓ`, and the `(1)` is the twist. State the twist intrinsically, in `G_K/P_K`: tame
  inertia `I_K/P_K`, the image `tameInertia` of `I_K`, is abelian, and conjugation by any
  arithmetic Frobenius lift `φ` (`TauCeti.IsArithFrobeniusLift`) is the `q`-th power map on it,
  `φ x φ⁻¹ ≡ x^q mod P_K` for `x ∈ I_K`, where `q = #𝓀[K]`. Under any isomorphism `t` of
  `I_K/P_K` with `Ẑ^{(p')}(1)` this reads `t(φxφ⁻¹) = t(x)^q`, which is what the `(1)` records.
  These two statements determine the conjugation action of all of `G_K` on `I_K/P_K`, because a
  Frobenius lift and `I_K` generate `G_K` topologically; the action is not restated with a
  profinite exponent. The finite-level form of the twist is `tameCharacter_conj_of_smul_eq_pow` of
  Layer 3.
  - *Prerequisites:*
    - `Layer 4: wild inertia`;
    - `Layer 4: inertia`, for the Frobenius lifts;
    - `Layer 3: the quotient embeddings`;
    - `Layer 2: residue correspondence`, for the action of Frobenius on roots of unity;
    - `Mathlib: rootsOfUnity`, `Mathlib/Topology/Algebra/Category/ProfiniteGrp/Limits.lean`.
  - *API:*
    - the object `Ẑ^{(p')}(1)`;
    - the isomorphism and its inverse;
    - independence of the choice of `π` and of the compatible system of roots;
    - `tameInertia` and `tameInertia_isMulCommutative`;
    - the intrinsic twist, `tameQuotient_mk_conj_of_isArithFrobeniusLift`;
    - the specialization at one prime `ℓ ≠ p`.
- **The Iwasawa presentation.** Prove that tame inertia is procyclic, topologically generated by
  the class of an element of inertia: `exists_topologicalClosure_zpowers_eq_tameInertia` gives a
  `τ` together with `τ ∈ I_K` and the equality of the closed subgroup generated by its class with
  `I_K/P_K`. The membership is part of that theorem. It holds because `I_K/P_K` is the image of
  `I_K`, so a generator has a lift in `I_K`, and two lifts of one class differ by an element of
  `P_K ≤ I_K` (`wildInertia_le_inertia`). No canonical `τ` is intended. For an arithmetic
  Frobenius lift `σ` and such a `τ`, construct the topological isomorphism
  `tameQuotientEquiv K σ τ hσ hτ` from `G_K/P_K` onto
  `IwasawaGroup K = presentedProfiniteGroup (Fin 2) {σ τ σ⁻¹ τ^{−q}} = ⟨σ, τ | σ τ σ⁻¹ = τ^q⟩`,
  **marked** by its values `σ̄ ↦ of 0` and `τ̄ ↦ of 1`. These two values determine it, because the
  generators generate the presented group topologically
  (`TauCeti.presentedProfiniteGroup.hom_ext_of`, applied to the inverse), so it involves no choice
  beyond `σ` and `τ`. The coordinate `iwasawaCoordinate : IwasawaGroup K → Ẑ`, `of 0 ↦ zHat.gen`,
  `of 1 ↦ 1`, is built on the presentation: `freeIwasawaCoordinate` is the continuous
  homomorphism of the free profinite group with these values (`TauCeti.freeProfiniteGroup.lift`),
  it kills the relator because `gen · 1 · gen⁻¹ · 1^{−q} = 1`, and
  `TauCeti.presentedProfiniteGroup.lift` descends it. Its kernel is `⟨⟨of 1⟩⟩`, the closed normal
  closure of `of 1`. This is a statement about the presented group alone, proved in its finite
  quotients: an element outside `⟨⟨of 1⟩⟩` survives modulo some open normal subgroup containing
  `of 1`, and there, with a quotient of order `m`, the quotient map is the reduction of the
  coordinate modulo `m` followed by `1 ↦ of 0`, because the two agree on `of 0` and on `of 1`.
  Derive the choice-free consequences: every arithmetic Frobenius lift lands in the coset
  `of 0 · ⟨⟨of 1⟩⟩`; the image of `I_K/P_K` is exactly `⟨⟨of 1⟩⟩`; and the coordinate, composed
  with the isomorphism and the quotient map, is the unramified coordinate of Layer 2: restriction
  to `K^{ur}` followed by `TauCeti.maximalUnramifiedGaloisGroupEquivZHat`
  (`iwasawaCoordinate_tameQuotientEquiv_mk`). The unmarked statement that `G_K/P_K` is isomorphic
  to the presented group, `tameQuotientPresentation`, is a corollary. ⚠ `σ` is **arithmetic** and
  the relation is `σ τ σ⁻¹ = τ^q`. The unmarked statement cannot see this, because the relators
  `σ τ σ⁻¹ τ^{−q}` and `σ⁻¹ τ σ τ^{−q}` present isomorphic groups; the marked one can. The second
  relator presents a group into which the arithmetic Frobenius cannot be sent to `of 0`, since
  `σ⁻¹ τ σ = τ^q` would force `τ^{q²−1} = 1` in `I_K/P_K`, which is torsion-free. ⚠ The object
  needed here is the **profinite** one. The presented pro-`p` group of the same shape is its
  pro-`p` quotient, which forgets the prime-to-`p` tame inertia that this presentation is about, so
  it is a different group.
  - *Prerequisites:*
    - `Layer 4: the tame character and the twist`;
    - `Layer 4: inertia`, for the Frobenius lifts and their topological generation of `G_K`
      together with `I_K`;
    - `Layer 2: the maximal unramified extension`, for the coordinate;
    - Tau Ceti: `TauCeti.freeProfiniteGroup` with `of` and `lift`, and
      `TauCeti.presentedProfiniteGroup`, the quotient of the free profinite group by the closed
      normal closure of the relators, with `of`, `lift` and `hom_ext_of`; `TauCeti.zHat` with
      `zHat.gen` and `zHat.lift`;
    - `Mathlib: ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one`, `ZMod.lift`, for the
      kernel of the coordinate.
  - *API:*
    - `exists_topologicalClosure_zpowers_eq_tameInertia`, whose generator lies in `I_K`;
    - `iwasawaRelator`, `IwasawaGroup` and its marked generators `iwasawaSigma`, `iwasawaTau`;
    - `tameQuotientEquiv` with its two computation rules;
    - the two choice-free consequences;
    - `freeIwasawaCoordinate` and `iwasawaCoordinate`, the values and kernel of the latter, and
      its comparison with the unramified coordinate;
    - `tameQuotientPresentation`.
  - *Source:* NSW (7.5.2) and (7.5.3), after Iwasawa. The hypotheses are that `K` is a
    nonarchimedean local field with finite residue field of order `q`. *False generalization:* the
    analogous presentation of `G_K` itself is false. For a finite extension `K/ℚ_p`, the separate
    **Local Galois Groups** export `LocalGaloisGroups.rank_absoluteGaloisGroup` computes its rank
    as `[K:ℚ_p] + 2`. This roadmap makes no full-group rank claim in equal characteristic; a
    characteristic-`p` analogue requires a separately stated theorem and hypotheses.
- **Translation lemmas.** Define the geometric relator `σ⁻¹ τ σ τ^{−q}` (`iwasawaRelatorGeometric`)
  and the isomorphism of presented groups `σ ↦ σ⁻¹`, `τ ↦ τ` (`iwasawaGeometricEquiv`), built by
  `TauCeti.presentedProfiniteGroup.congr` from the involution of the free profinite group that
  inverts `of 0` and fixes `of 1`, with its two computation rules. Composed with
  `tameQuotientEquiv`, it sends the class of the geometric Frobenius `σ⁻¹` to the generator `of 0`
  of the geometric presentation, and `iwasawaCoordinate` gives that generator the value
  `zHat.gen⁻¹`: in the geometric presentation the arithmetic Frobenius is the inverse of the marked
  generator. Prove the finite-level compatibility: in every finite quotient of `G_K` through which
  `P_K` dies, the image of `τ` has order prime to `p` and generates the image of `I_K`, and the
  tame character of Layer 3 carries `σ τ σ⁻¹ = τ^q` to `θ_0(σ̄ τ̄ σ̄⁻¹) = θ_0(τ̄)^q`; this is
  `tameCharacter_conj_of_smul_eq_pow` at the image `σ̄` of `σ`, which acts on the residue field as
  `x ↦ x^q`. Two statements face reciprocity: units land in inertia, and a uniformizer maps to the
  Frobenius coordinate. They are supplied by `ClassFieldTheory.artinMap`,
  `unramifiedCoordinate_artinMap`, and `normResidue_uniformizer`, not assumed here. This layer
  supplies only the group-theoretic frame in which they are stated.
  - *Prerequisites:*
    - `Layer 4: the Iwasawa presentation`;
    - `Layer 3: the quotient embeddings`;
    - Tau Ceti: `TauCeti.presentedProfiniteGroup.congr` and `TauCeti.freeProfiniteGroup.lift`.

## Worked examples

The acceptance suite includes `ℚ_2`, its unramified quadratic extension, the totally ramified
quadratic extension generated by `√2`, and the dyadic cyclotomic tower generated by `μ_8`.
These examples must exercise normalization, norm groups, lower and upper numbering, and the
tame quotient; they are regression tests for conventions rather than substitutes for the
generic theorems.

## Dependency order

The external abstract dependency order is **[Continuous Cohomology of Profinite
Groups](../ProfiniteCohomology/README.md) → [Profinite and Pro-`p`
Groups](../ProfiniteProPGroups/README.md), a direct `import` of `Suggested.lean` here → this
roadmap**. Within this roadmap the intended order is
Layer 0 → Layer 1 → Layer 2 → Layer 3 → Layer 4. Later work may proceed against explicit
hypotheses, but the accepted exports use the canonical objects produced by the preceding layers.

## Material extracted from the former local-fields portfolio

Finite-group Tate cohomology, local class formations, reciprocity, and Tate duality now belong
to **Class Field Theory**. The maximal pro-`p` quotient `G_K(p)`, its generator rank, the
roots-of-unity dichotomy, and its Demushkin presentation now belong to **Local Galois Groups**.
This roadmap retains the local arithmetic and ramification inputs on which both depend.

## References

The mathematical spine is Serre, *Local Fields*; Neukirch, *Algebraic Number Theory*;
Neukirch–Schmidt–Wingberg, *Cohomology of Number Fields*; and Ribes–Zalesskii,
*Profinite Groups*.

## Existing implementation audit: `LRubia/LeanBridge`

The directory
[`LeanBridge/PadicField`](https://github.com/LRubia/LeanBridge/tree/22c093c1c5de577acebe74cf76bb33d7d2734a6c/LeanBridge/PadicField)
was audited at revision `22c093c1c5de577acebe74cf76bb33d7d2734a6c`. At that revision the
repository is Apache-2.0 and the six files `Basic.lean`, `Ramification.lean`,
`Monogenicity.lean`, `TraceFiltration.lean`, `DiffExp.lean`, and `Test.lean` are sorry-free.

Contact status: this PR records no maintainer-contact outcome concerning reuse. Adaptation status:
this roadmap PR copies no LeanBridge implementation; it records the overlap so an implementer can
contact the maintainers, decide what to adapt, and record that decision before porting code.
Apache-2.0 permits reuse subject to its notice requirements, but the eventual implementation must
still preserve attribution and document any modifications.

The declaration-level overlap is:

| LeanBridge declarations at the audited revision | Roadmap destination and disposition |
|---|---|
| `PadicField.ringOfIntegers`, `PadicField.valuation`, `valuation_le_one_iff_isIntegral`, `ringEquiv_valuation_integer`, and the `ValuativeRel`, `IsValuativeTopology`, and `IsNonarchimedeanLocalField` instances | Adapt the proofs to the roadmap's `ValuativeRel`, `ValuativeExtension`, `𝒪[K]`, and `IsNonarchimedeanLocalField` carriers. The bespoke `PadicField` class is not exported. |
| `PadicField.Extension.ramificationIdx`, `absoluteRamificationIndex`, `inertiaDeg`, `absoluteRamificationIndex_eq`, `ramificationIdx_mul_inertiaDeg`, and `map_maximalIdeal_eq_pow_ramificationIdx` | Tau Ceti implements these destinations on the valuative carriers (`TauCeti.ramificationIndex`, `TauCeti.absoluteRamificationIndex`, `TauCeti.inertiaDegree`, their tower laws, `TauCeti.ramificationIndex_mul_inertiaDegree` and `TauCeti.map_maximalIdeal_eq_maximalIdeal_pow`); nothing is ported. |
| `mono_exists_primitive` and its supporting Newton-lift declarations | Adapt to `exists_integerRing_adjoin_eq_top` on `𝒪[K] → 𝒪[L]`; do not expose the generic helper namespace as a second local-field API. |
| `TraceFiltration.intTrace_residue_scaling` | Reuse or adapt as the residue-trace input to tame/wild different bounds, behind the public different theorems. |
| `PadicField.Extension.differentExponent`, `ramificationIdx_sub_one_le_differentExponent`, `ramificationIdx_le_differentExponent_of_dvd`, `differentExponent_tame`, `discExponent_eq_inertiaDeg_mul_differentExponent`, and `discExponent_tame` | Tau Ceti implements these destinations (`TauCeti.differentExponent`, `TauCeti.ramificationIndex_sub_one_le_differentExponent`, `TauCeti.ramificationIndex_le_differentExponent_iff`, `TauCeti.differentExponent_eq_ramificationIndex_sub_one_iff`, `TauCeti.discriminantExponent_eq_inertiaDegree_mul_differentExponent` and `TauCeti.discriminantExponent_eq_inertiaDegree_mul_ramificationIndex_sub_one_iff`); nothing is ported. The global discriminant consequences stay in [the Number-Field Arithmetic roadmap](../NumberFieldArithmetic/README.md). |

For every adapted proof, the implementation record must identify the LeanBridge declaration and
revision or say explicitly that the proof was replaced. Regardless of implementation source,
`ValuativeRel`, `ValuativeExtension`, and `IsNonarchimedeanLocalField` remain the only public
local-field carriers in this roadmap.
