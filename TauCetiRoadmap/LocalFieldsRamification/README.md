# Roadmap: local fields and ramification

This roadmap owns the local-field substrate: normalized valuations, unit filtrations,
unramified extensions, lower and upper ramification groups, Herbrand functions, wild inertia,
and tame quotients. The ramification filtrations, Herbrand functions and Hasse–Arf are built
over every complete discretely valued field, whatever its residue field. It stops before local
reciprocity and before the arithmetic structure of the maximal pro-`p` quotient of the absolute
Galois group.

The boundary is deliberate. The **Class Field Theory** roadmap consumes these objects to build
finite-group Tate cohomology, class formations, local reciprocity, and duality. The **Local
Galois Groups** roadmap consumes them, together with abstract pro-`p` group theory, to determine
`G_K(p)` and its Demushkin presentation. This roadmap in turn depends on [**Profinite and
Pro-`p` Groups**](../ProfiniteProPGroups/README.md) for abstract profinite Sylow theory,
consumed through its canonical Tau Ceti implementation, and on Tau Ceti's free profinite groups and profinite
presentations (`TauCeti.freeProfiniteGroup`, `TauCeti.presentedProfiniteGroup`). It does not
redeclare any of those group-theoretic suppliers.

## Scope and exported contract

The accepted roadmap exports one canonical vocabulary for finite extensions of
nonarchimedean local fields, their normalized valuations and unit filtrations, unramified
extensions and Frobenius, the ramification filtrations and Herbrand transition, wild inertia,
the tame character, and the Iwasawa presentation of the tame quotient. Downstream roadmaps
import those declarations directly; they do not reconstruct private local-field toolkits.

It also owns the ramification package over fields complete for a discrete valuation, in equal
and mixed characteristic and with a residue field that need not be finite (Layers 3a and 4a).
For a finite Galois extension whose residue extension is separable, Layer 3a builds the lower
filtration on Tau Ceti's local-ring carrier, the lower index, Hilbert's different formula, the
Herbrand functions, the upper numbering with Herbrand's quotient theorem and tower
transitivity, and full Hasse–Arf for abelian extensions. Over a perfect residue field, Layer 4a
builds the absolute upper filtration of `G_K` with its finite-level surjections, inertia and
wild inertia as `G_K^0` and `G_K^(0+)`, the function `ψ_(L/K)` of a finite separable extension
with the open-subgroup identity, and the comparison with the completed maximal unramified
extension. On nonarchimedean local fields each of these objects is the one of Layers 3 and 4.
Ramification over infinite residue fields, as for `F̄_p((t))` and `Frac W(F̄_p)`, is imported
from Layers 3a and 4a and is not restated elsewhere.

In particular, [the Number-Field Arithmetic roadmap](../../Completed/NumberFieldArithmetic/README.md) is a
downstream consumer of this roadmap. This roadmap owns the intrinsic local extension,
normalized valuations and `(e,f)`, the integer-ring/integral-closure theory, local
monogenicity, the canonical lower filtration, and the local different theorems. Number-Field
Arithmetic owns the global-to-local completion maps, the completed integer-ring map, comparison
with decomposition groups and the global ideal-theoretic filtration, localization of the global
different, and the relative-discriminant consequences. In particular it imports
`TauCeti.LocalFieldsRamification.lowerRamificationGroup`; it does not define a second filtration or choose another indexing
convention.

Counting Totally Ramified Extensions
is a direct downstream consumer. This roadmap owns the arithmetic of each finite extension:
the induced local-field structures, `TauCeti.ramificationIndex`, `TauCeti.inertiaDegree`, total/tame/wild
ramification, Eisenstein generators and integral monogenicity, the different and local
discriminant exponents, their invariance under `K`-equivalence, and Eisenstein power-basis
valuation orthogonality. Counting Totally Ramified Extensions owns the family and counting layer: `σ_K(n)`, its derived weight
`c(L) = d(L) - n + 1`, representative sets, quantitative root counting, coefficient-space and
Haar-measure calculations, and the mass formulas. It may define intermediate-field wrappers,
but they must install this roadmap's canonical structures and reduce to its canonical invariants.

Milestones implemented in Tau Ceti use its declarations directly. Native exports preserve
qualified access to the finite-extension carriers without introducing new constants. The
remaining adapters either change the argument list or give a distinct name to a specialization;
`frobeniusAlgEquiv`, for example, supplies unramifiedness from `e = 1`. The maximal unramified,
inertia, Frobenius-lift, tame-character and Iwasawa APIs use their native Tau Ceti names.
The adapters `normalizedValuation_eq_one_iff`, `normalizedValuation_irreducible`,
`frobeniusAlgEquiv`, `isOpen_range_powMonoidHom` and `square_eq_range_powMonoidHom` retain
explicit argument lists for the local-field contract. They are protected declarations: opening both
namespaces exposes the native Tau Ceti name, while qualification or explicit selective
opening provides the adapted signature.

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
  uniformizer equation and the kernel condition. The valuative relation, topology and local-field
  hypothesis of `K` are parameters of the native definition. The adapters
  `normalizedValuation_eq_one_iff` and `normalizedValuation_irreducible` make the base field,
  uniformizer and nonvanishing proof explicit.
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
  `TauCeti.normalizedNormedField K : NormedField K` from the normalized absolute value and prove
  `TauCeti.normalizedNormedField_topology_eq`, so the topology consumed by `spectralNorm` is identified
  with the original valuative topology. Then construct
  `TauCeti.finiteExtensionNormedField K L : NormedField L`, its named topology
  `TauCeti.finiteExtensionNormedFieldTopology K L`, and
  `TauCeti.finiteExtensionValuativeRel K L : ValuativeRel L`. The closed public chain is
  `TauCeti.finiteExtension_valuativeExtension`, `TauCeti.finiteExtension_isValuativeTopology`, and
  `TauCeti.finiteExtension_isNonarchimedeanLocalField`; none of these theorems assumes a topology or
  valuative relation on `L`. A particular `Valuation L ℤᵐ⁰`, together with its equivalence to the
  pullback of `valuation K`, is a proof witness rather than a second public carrier. All constructed
  structures are named definitions rather than global instances, which keeps a field already
  carrying compatible structures free of diamonds. Tau Ceti implements this construction and its
  closed chain (`TauCeti.normalizedNormedField`, `TauCeti.finiteExtensionNormedField`,
  `TauCeti.finiteExtensionNormedFieldTopology`, `TauCeti.finiteExtensionValuativeRel`, in
  `TauCeti/NumberTheory/LocalField/FiniteExtension/Basic.lean`), consumed directly.
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
  `AlgEquiv.valuation_eq`), which supply these milestones directly.
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
  instances `TauCeti.integerRingModuleFinite` and `TauCeti.integerRingModuleFree`, consumed directly. The comparison with the
  integral closure, the tower lemmas and the intermediate-field adapters are Tau Ceti's as well
  (`TauCeti.integerRing_eq_integralClosure`, `TauCeti.finiteExtensionValuativeRel_tower`,
  `TauCeti.finiteIntermediateFieldValuativeRel` and its companions).
  - *Prerequisites:*
    - `Layer 0: finite extensions, I`;
    - `Layer 0: finite extensions, II`;
    - `Mathlib: IsNonarchimedeanLocalField`.
  - *API:*
    - `TauCeti.integerRingAlgebra`, `TauCeti.residueFieldAlgebra`, `TauCeti.integerRingModuleFinite`, and
      `TauCeti.integerRingModuleFree`;
    - `TauCeti.finiteExtensionNormedFieldTopology_eq`, comparing the construction with an already
      topologized compatible extension;
    - `TauCeti.finiteExtensionNormedFieldTopology_tower` and `TauCeti.finiteExtensionValuativeRel_tower` for a
      tower `M/L/K`;
    - `TauCeti.integerRing_eq_integralClosure`, comparing `𝒪[L]` with the integral closure of `𝒪[K]` in
      `L`;
    - the intermediate-field adapters `TauCeti.finiteIntermediateFieldNormedField`,
      `TauCeti.finiteIntermediateFieldValuativeRel`, `TauCeti.finiteIntermediateFieldTopology`,
      `TauCeti.finiteIntermediateField_valuativeExtension`,
      `TauCeti.finiteIntermediateField_isValuativeTopology`, and
      `TauCeti.finiteIntermediateField_isNonarchimedeanLocalField`, which take a finite
      `M : IntermediateField K Ω` directly to the structures above;
    - a basis of `𝒪[L]` over `𝒪[K]` in the unramified case and in the totally ramified case, which
      Layers 2 and 3 use.
- **`e` and `f`, intrinsically.** Define `TauCeti.ramificationIndex K L : ℕ` as the index of the image of
  the normalized value group. Equivalently, it is the unique positive integer `e` with
  `v_L(algebraMap K L x) = e * v_K(x)` for all `x : Kˣ`. Positivity is part of the
  characterization. Define `TauCeti.inertiaDegree K L := Module.finrank 𝓀[K] 𝓀[L]`, which Layer 0.III
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
  (`TauCeti/NumberTheory/LocalField/InertiaDegree.lean`). These native definitions and theorems supply the invariants directly; `card_residueField`
  adapts the residue-cardinality formula. `TauCeti.ramificationIndex` reads only the normalized
  valuation of `L` and the algebra map, and every theorem about it assumes
  `ValuativeExtension K L`. The total-ramification predicate
  `IsTotallyRamified K L`, that is `TauCeti.ramificationIndex K L = Module.finrank K L`, is defined here on
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
  `TauCeti.natCastValuation K n hn : ℕ` as the decoded normalized valuation `v_K((n : K))`, where
  `hn : (n : K) ≠ 0` is supplied to the definition. This is the general quantity used in power-class
  formulas and in the wild-different upper bound. Separately, for `p` prime and `K/ℚ_p` finite,
  define `TauCeti.absoluteRamificationIndex K p := TauCeti.ramificationIndex ℚ_[p] K`. Prove
  `TauCeti.absoluteRamificationIndex_eq_natCastValuation`, identifying it with
  `TauCeti.natCastValuation K p hp`. Thus the invariant called the absolute ramification index exists only
  in mixed characteristic; there is no equal-characteristic junk branch, and the relative
  `e(L/K)` above remains a different invariant. `TauCeti.natCastValuation`, its characteristic equation and
  its vanishing criterion are Tau Ceti's `TauCeti.natCastValuation`,
  `TauCeti.normalizedValuation_natCast` and `TauCeti.natCastValuation_eq_zero_iff`
  (`TauCeti/NumberTheory/LocalField/NatCastValuation.lean`), consumed directly.
  The absolute ramification index is Tau Ceti's `TauCeti.absoluteRamificationIndex`
  (`TauCeti/NumberTheory/LocalField/AbsoluteRamificationIndex.lean`), which bundles
  `[Algebra ℚ_[p] K] [ValuativeExtension ℚ_[p] K] [Module.Finite ℚ_[p] K]` as the class
  `TauCeti.FinitePadicExtension K p`, supplied from the three instances by
  `TauCeti.FinitePadicExtension.ofInstances`. Thus statements carrying the three instances
  separately use the same native definition. Tau Ceti proves the comparison
  `TauCeti.absoluteRamificationIndex_eq_natCastValuation`, together with positivity
  `TauCeti.absoluteRamificationIndex_pos`, multiplicativity
  `TauCeti.absoluteRamificationIndex_tower` and the values `e_{ℚ_p} = 1`
  (`TauCeti.absoluteRamificationIndex_padic`) and
  `TauCeti.natCastValuation ℚ_[p] 2 = 0` for odd `p` (`Padic.natCastValuation_two`).
  - *Prerequisites:*
    - `Layer 0: the normalized valuation`;
    - `Layer 0: e and f, intrinsically`, for the comparison below.
  - *API:*
    - `TauCeti.natCastValuation`, its characteristic equation, and its vanishing criterion when the cast
      is nonzero;
    - `TauCeti.absoluteRamificationIndex` for finite `K/ℚ_p` and
      `TauCeti.absoluteRamificationIndex_eq_natCastValuation`, with `e_K · f = [K : ℚ_p]` as a corollary
      of the product formula above;
    - multiplicativity along a finite extension `L/K`, that is
      `TauCeti.absoluteRamificationIndex L p = TauCeti.ramificationIndex K L * TauCeti.absoluteRamificationIndex K p`;
    - the values `e_{ℚ_p} = 1`, `TauCeti.natCastValuation ℚ_[p] 2 = 0` for odd `p`, and `e_K = 2` for
      `K = ℚ_2(√2)`, in the examples section.
  - *Source:* Serre LF II §1; Neukirch ANT II §6, for `e_K · f = [K : ℚ_p]`. The hypothesis is
    explicitly that `K` is a finite extension of `ℚ_p`; no absolute-index statement is made for
    `𝔽_p((t))`.

### Layer 1: units, the filtration, and the multiplicative group

- **The unit filtration as an object.** Define `TauCeti.unitFiltration K i : Subgroup Kˣ` for `i : ℕ`,
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
  `U(K,i)/U(K,i+1)` as `TauCeti.UnitFiltrationGraded`, all consumed directly. The rest of the API below is Tau Ceti's as
  well: `U(K,0) = 𝒪[K]ˣ` (`TauCeti.unitFiltration_zero`,
  `TauCeti.unitFiltrationZeroEquivIntegerUnits`), stability under automorphisms
  (`AlgEquiv.smul_unitFiltration`), the indices (`TauCeti.relIndex_unitFiltration_one_zero`,
  `TauCeti.relIndex_unitFiltration_succ_succ`) and the covariant contract
  (`TauCeti.map_unitFiltration_le`). The norm contract is a milestone of Layer 3.
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
      `TauCeti.map_unitFiltration_le K L i : map(K → L)(U(K,i)) ≤ U(L,e(L/K) * i)`;
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
  Frobenius (`TauCeti.frobeniusAlgEquiv_teichmullerLift`). This roadmap's `localTeichmuller` is a
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
  `TauCeti.IsProP p (U(K,1))`, so the two statements are the same statement and not
  two rephrasings. Prove that the torsion subgroup
  `μ(K)` is finite. Tau Ceti implements the two isomorphisms, on `U(K,0) = 𝒪[K]ˣ`, as
  `TauCeti.unitsEquivIntProd` and `TauCeti.unitFiltrationZeroEquivProd`
  (`TauCeti/NumberTheory/LocalField/UnitsDecomposition.lean`), with the uniqueness of the
  decomposition `TauCeti.existsUnique_eq_zpow_mul`, the change of uniformizer
  `TauCeti.coe_unitsEquivIntProd_apply_snd_eq_mul`, the kernel and continuity of `v_K`
  (`TauCeti.ker_normalizedValuation`, `TauCeti.continuous_normalizedValuation`) and its splitting
  `TauCeti.normalizedValuation_comp_zpowersHom`. The pro-`p` statement is supplied by
  `UnitFiltration/ProP.lean`; `TauCeti.unitFiltration_one_isProP` applies that theorem.
  - *Prerequisites:*
    - `Layer 1: the unit filtration as an object`;
    - `Layer 1: Teichmüller`;
    - `Mathlib: OpenNormalSubgroup`, `IsPGroup`.
  - *API:*
    - the two isomorphisms, with their inverses and their continuity;
    - the dependence on the uniformizer, which is an isomorphism of the two splittings;
    - finiteness of `μ(K)` and its order;
    - the `p`-part and the prime-to-`p` part of `μ(K)`;
    - the projection `Kˣ → ℤ`, which is `v_K`, and its splitting;
    - `TauCeti.existsUnique_eq_zpow_mul`, the unique decomposition into a uniformizer power and a unit.
  - *Source:* Serre LF II §§4–5; Neukirch ANT II §5.
- **Deep units in mixed characteristic.** Let `K/ℚ_p` be finite of degree `N`, with absolute
  ramification index `e = TauCeti.absoluteRamificationIndex K p`. Let `i : ℕ` satisfy the integer
  inequality `(p − 1) * i > e`. Then the logarithm is an isomorphism of topological groups
  `U(K,i) ≃ (𝓂[K]^i, +)`, with `exp` as its inverse, and therefore `U(K,i) ≃ ℤ_p^N` as
  `ℤ_p`-modules. State the threshold as that integer inequality, and never as `i > e/(p−1)`, so
  that no division of natural numbers occurs.
  - *Prerequisites:*
    - `Layer 1: the unit filtration as an object`;
    - `Layer 0: the absolute ramification index`;
    - `Layer 0: finite extensions, III`;
    - Mathlib's evaluated series `NormedSpace.exp` and `NormedSpace.log`, named here by
      the reducible aliases `localExponential` and `localLogarithm`;
    - Tau Ceti's `DeepUnits/Basic.lean`: the topological logarithmic equivalence
      `TauCeti.deepUnitExpLogEquiv`, its two evaluation rules and inverse theorems.
      This roadmap's `deepUnitExponentialEquiv` is its inverse, with type
      `Multiplicative (𝓂[K]^i) ≃ₜ* U(K,i)`. Its exponential and logarithm evaluation rules are
      `coe_deepUnitExponentialEquiv_apply` and `coe_deepUnitExponentialEquiv_symm_apply`;
      `localLogarithm_localExponential`, `localExponential_localLogarithm`,
      `continuous_localExponential_deep` and `continuous_localLogarithm_deep` are closed
      applications of Tau Ceti's sharp-domain theorems.
  - *Source:* NSW (7.4.4); Neukirch ANT II §5. The hypotheses used are `char K = 0` and the
    integer inequality. At the boundary `(p − 1) * i = e`, the series `log` still converges but
    injectivity is not uniform: it fails when `U(K,i)` contains a nontrivial `p`-power root of
    unity, while fields without that torsion can still have injectivity. No unconditional boundary
    theorem is part of the contract.
  - *Checks:*
    - On `ℚ_2` at depth `2`, the logarithm identifies `1 + 4ℤ_2` with `4ℤ_2`, with
      exponential as its continuous inverse.
    - At depth `1` on `ℚ_2`, `−1 ∈ U(K,1)` and `log(−1) = 0`; equality in the depth
      inequality does not guarantee injectivity.
    - For an unramified finite extension of `ℚ_p`, `p > 2`, depth `1` satisfies the strict
      inequality; the two evaluation rules agree with the original evaluated series.

- **Power classes, the primary statement.** For `n : ℕ` with `n ≠ 0`, the primary theorem is an
  equality of natural numbers:

  ```text
  Nat.card (Kˣ ⧸ (powMonoidHom n).range) =
    n * Nat.card (μ_n(K)) * q ^ TauCeti.natCastValuation K n hnK,
  ```

  where `μ_n(K)` is the group of `n`-th roots of unity in `K`, and the final exponent is
  `TauCeti.natCastValuation K n hnK`, where `hnK : (n : K) ≠ 0`. In regime 1 the hypothesis
  `IsUnit (n : 𝒪[K])` supplies `hnK` and gives `TauCeti.natCastValuation K n hnK = 0` as a named lemma,
  so the formula becomes `n · #μ_n(K)`; that case holds in either
  characteristic. In regime 2, with `K/ℚ_p` finite, the formula holds for every `n ≠ 0`, including
  `p ∣ n`; the deep-unit logarithm supplies the `p`-primary factor. Finiteness of the quotient
  follows from the formula and is exported separately as
  `TauCeti.finiteIndex_range_powMonoidHom_of_isUnit` or `TauCeti.finiteIndex_range_powMonoidHom`, so downstream
  declarations can consume a `Subgroup.FiniteIndex` proof without reconstructing it. Tau Ceti
  implements both regimes, including the prime-to-residue count `TauCeti.card_powerClasses_of_isUnit`, the vanishing
  `TauCeti.natCastValuation_eq_zero_of_isUnit`, finite index
  `TauCeti.finiteIndex_range_powMonoidHom_of_isUnit` and the count `4`
  `TauCeti.card_squareClasses_of_isUnit`
  (`TauCeti/NumberTheory/LocalField/PowerSubgroup/Basic.lean`), and
  the identification of the two spellings of the square classes,
  `TauCeti.square_eq_range_powMonoidHom`. The adapter `square_eq_range_powMonoidHom`
  specializes the group in the last theorem to `Kˣ`. Tau Ceti also supplies the
  characteristic-zero count and finite index through its generic nonzero-cast theorems in
  `PowerSubgroup/Basic.lean`, and the dyadic specialization in `SquareClass.lean`; this
  roadmap's mixed-characteristic and dyadic statements apply those declarations.
  - *Prerequisites:*
    - `Layer 1: structure of Kˣ`;
    - `Layer 1: deep units in mixed characteristic` (regime 2 only);
    - `Layer 0: the normalized valuation`;
    - `Layer 0: valuations of natural numbers` for the exponent in the formula.
  - *API:*
    - the count in each regime, named `TauCeti.card_powerClasses_of_isUnit` and `card_powerClasses_mixed`,
      with `TauCeti.natCastValuation K n hnK = 0` under `IsUnit (n : 𝒪[K])` as a named lemma;
    - finiteness of `Kˣ/(Kˣ)ⁿ`, through the two named finite-index corollaries derived from the
      cardinality formulas;
    - the two specializations at `n = 2`, which is where the dyadic factor of two appears:
      `TauCeti.card_squareClasses_of_isUnit`,
      which is `4` when `2` is a unit of `𝒪[K]`, and `TauCeti.card_squareClasses_dyadic`, which is
      `4 · q^e` with `q = Nat.card 𝓀[K]` and `e = TauCeti.absoluteRamificationIndex K 2` for `K/ℚ_2`
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
  product `∏_ℕ 𝔽_2` admits an algebraic linear functional to `𝔽_2` extending parity on finitely
  supported sequences. Its kernel has index two but is not open: every basic tail subgroup
  contains a coordinate vector with functional value one. The
  proof exhibits an open subgroup inside the range:
  - in regime 1, `U(K,1) ⊆ (Kˣ)^n`, by Hensel's lemma applied to `X^n − u` at the approximate
    root `1`. The derivative `n X^{n−1}` is a unit there, because `n` is a unit in `𝒪[K]`, and
    `1 − u ∈ 𝓂[K]` for `u ∈ U(K,1)`;
  - in regime 2, take `i` with `(p − 1) · i > e`. The logarithm of the deep-unit milestone carries
    `x ↦ x^n` on `U(K,i)` to `y ↦ n · y` on `𝓂[K]^i`, and
    `n · 𝓂[K]^i = 𝓂[K]^{i + TauCeti.natCastValuation K n hnK}`. So
    `(U(K,i))^n = U(K, i + TauCeti.natCastValuation K n hnK)`, which is open. This covers the `p`-primary case, where the
    argument of regime 1 is unavailable.

  A subgroup of a topological group that contains an open subgroup is open, and is therefore
  closed. In this application finite index is a separate consequence of
  `TauCeti.card_powerClasses_of_isUnit` or `card_powerClasses_mixed`; it does not follow from openness.
  Tau Ceti implements both regimes in one statement, `TauCeti.isOpen_range_powMonoidHom`, whose
  hypothesis `(n : K) ≠ 0` holds in regime 1 and for every `n ≠ 0` in regime 2. It comes with the
  regime 1 containment `TauCeti.unitFiltration_one_le_range_powMonoidHom_of_isUnit`, the deep-unit
  containment `TauCeti.unitFiltration_le_range_powMonoidHom`, closedness
  `TauCeti.isClosed_range_powMonoidHom`, and the corollary for subgroups
  `TauCeti.isOpen_of_natCast_exponent_ne_zero` and `TauCeti.isOpen_of_natCast_index_ne_zero`.
  This roadmap's `isOpen_range_powMonoidHom_of_isUnit` and `isOpen_range_powMonoidHom` are closed
  proofs.
  - *Prerequisites:*
    - `Layer 1: the unit filtration as an object`;
    - `Layer 1: deep units in mixed characteristic` (regime 2 only);
    - `Mathlib: Hensel's lemma in Mathlib/RingTheory/Henselian.lean` (regime 1 only);
    - `Mathlib: Subgroup.isOpen_of_isOpen_subgroup_le`.
  - *API:*
    - the openness statement in each regime;
    - the containment `U(K,1) ⊆ (Kˣ)^n` in regime 1, and
      `U(K, i + TauCeti.natCastValuation K n hnK)` inside the range in regime 2, as named lemmas; these are
      consumed by `ClassFieldTheory.conductorExponent` and `characterConductorExp`;
    - closedness from openness, and finite index separately through
      `TauCeti.finiteIndex_range_powMonoidHom_of_isUnit` or `TauCeti.finiteIndex_range_powMonoidHom`;
    - the corollary that every subgroup of `Kˣ` of finite index whose exponent satisfies the
      regime hypothesis is open, which is an input to the local existence theorem accompanying
      `ClassFieldTheory.normResidue`.
  - *Source:* Serre LF V §3 and Neukirch ANT II §5. The hypotheses are the regime hypotheses.
    *False generalization:* at `K = 𝔽_q((t))` and `n = p` the range is not open, because
    `1 + t^m` is not a `p`-th power for `p ∤ m` and those elements accumulate at `1`.
  - *Checks:*
    - The parity extension on `∏_ℕ 𝔽_2` above has a kernel of index `2` containing no
      basic tail subgroup, so finiteness alone cannot prove openness.
    - On `ℚ_2`, squaring carries `U(K,2)` onto `U(K,3)`, exhibiting an open subgroup
      inside the squares even though `2` is not a unit of the valuation ring.
    - In `𝔽_q((t))`, the elements `1 + t^m`, with `p ∤ m`, approach `1` outside the
      `p`-th powers; the nonzero-cast hypothesis cannot be dropped.

- **The dyadic square-class count.** Prove `#(ℚ_2ˣ/(ℚ_2ˣ)²) = 8`. This is an instance of the
  primary statement, and not a separate theorem.
  - *Prerequisites:* `Layer 1: power classes, the primary statement`.
- **Deep units are squares, in mixed characteristic.** Let `K/ℚ_2` be finite, let
  `h2 : (2 : K) ≠ 0` be the characteristic-zero proof, and let
  `e = TauCeti.absoluteRamificationIndex K 2`, equivalently `e = TauCeti.natCastValuation K 2 h2`. Then
  `U(K, 2e+1) ⊆ (Kˣ)²`, named
  `TauCeti.unitFiltration_le_range_powMonoidHom_two`. ⚠ This is **not** an instance
  of the cardinality count, which decides how many square classes there are and not which
  subgroup lies inside the squares. The proof is Hensel's lemma applied to `X² − u`, or the
  deep-unit logarithm and the equality `2 · 𝓂[K]^(e+1) = 𝓂[K]^(2e+1)`. For
  `u ∈ U(K,2e+1)`, division gives `x = log(u)/2 ∈ 𝓂[K]^(e+1)` and `exp(x)² = u`.
  Both depths lie in the strict dyadic exponential/logarithm domain. ⚠ The hypothesis is mixed characteristic. In
  equal characteristic `2` the element `2` is zero and there is no absolute ramification index,
  so the displayed statement is not even the contract for that case.

  The threshold is sharp, and sharp over every such `K` and not only over `ℚ_2`:
  `U(K, 2e) ⊄ (Kˣ)²`, named `TauCeti.not_unitFiltration_le_range_powMonoidHom_two`. This is a milestone
  of its own, because a containment with no matching failure leaves a consumer free to use a
  weaker depth and discover later that its bound is not attained. The obstruction is
  Artin–Schreier: `℘(t) = t² + t` is `𝔽_2`-linear on `𝓀[K]` with kernel `𝔽_2`, so its image has
  index `2`. Since `𝓂[K]^{2e} = 4·𝒪[K]`, a unit `1 + 4c` is `(1 + 2t)²` exactly when
  `c = t + t²`, so `1 + 4c` is a square exactly when the residue of `c` lies in the image of `℘`,
  and any `c` outside it is a witness. At `K = ℚ_2` the witness is `5`: `U(K,3) = 1 + 8ℤ_2`
  consists of squares while `U(K,2) = 1 + 4ℤ_2` does not.

  Tau Ceti implements both halves and the two-sided consequence for every nonarchimedean local
  field in which `2 ≠ 0`, indexed by `TauCeti.natCastValuation K 2 h2`, which is `0` in odd residue
  characteristic: `TauCeti.unitFiltration_le_range_powMonoidHom_two`,
  `TauCeti.not_unitFiltration_le_range_powMonoidHom_two` and
  `TauCeti.unitFiltration_le_range_powMonoidHom_two_iff`
  (`TauCeti/NumberTheory/LocalField/Squares.lean`). This roadmap's uniformly indexed
  `unitFiltration_natCastValuation_le_range_powMonoidHom_two` and
  `not_unitFiltration_natCastValuation_le_range_powMonoidHom_two` are those theorems, and its
  `ℚ_2`-indexed consequences follow from them through
  `TauCeti.absoluteRamificationIndex_eq_natCastValuation`.
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
  - *Checks:*
    - On `ℚ_2`, the lattice equality is `2 · 4ℤ_2 = 8ℤ_2`; dividing a depth-`3`
      logarithm by `2` gives a depth-`2` logarithm and hence a square root.
    - The unit `5 ∈ 1 + 4ℤ_2` is not a square; the threshold `2e+1` cannot be replaced
      by `2e`.
    - In equal characteristic `2`, `1 + t^(2r+1)` is never a square in `𝔽_2((t))`,
      however large `r` is; division by `2` is unavailable.

### Layer 2: unramified extensions and Frobenius


- **The arithmetic predicate.** Define `IsUnramified K L` for a finite extension of local fields:
  the map of value groups is bijective, equivalently `TauCeti.ramificationIndex K L = 1`, and the residue
  extension `𝓀[L]/𝓀[K]` is separable. Separability is automatic for finite residue fields. Carry
  it in the definition, so that the statement matches the general definition for valued fields and
  survives generalization. Compare the predicate once, as a theorem, with `Algebra.IsUnramifiedAt`
  and `Algebra.FormallyUnramified` over `𝒪[K]`, so that the étale library becomes usable. Do not
  redefine those notions. Tau Ceti implements the predicate as the class `TauCeti.IsUnramified K L`
  (`TauCeti/NumberTheory/LocalField/Unramified/Basic.lean`), with the equivalence with `e = 1`
  (`TauCeti.isUnramified_iff_ramificationIndex_eq_one`), the value-group, valuation, ideal and
  degree forms, tameness (`TauCeti.IsUnramified.isTamelyRamified`), stability in towers in both
  directions (`TauCeti.isUnramified_tower_iff`) and the comparison theorems
  `TauCeti.isUnramified_iff_formallyUnramified` and `TauCeti.isUnramified_iff_isUnramifiedAt`. This
  roadmap states unramifiedness as `TauCeti.ramificationIndex K L = 1` and passes to the class through
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
  equation that fixes it is `TauCeti.valuation_frobeniusAlgEquiv_sub_pow`, that is `σ(y) ≡ y^q mod 𝓂[L]`
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
  `h : TauCeti.ramificationIndex K L = 1`, is `TauCeti.frobeniusAlgEquiv` with the class supplied from `h`,
  and its characteristic equation is the native
  `TauCeti.valuation_frobeniusAlgEquiv_sub_pow`.
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
  `TauCeti.zHat` (`TauCeti.maximalUnramifiedGaloisGroupEquivZHat_apply_frobenius`); Layer 4 states
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
  - *Source:* Serre LF III §5; Tau Ceti `Unramified/Maximal.lean` and `Unramified/ZHat.lean`.
  - *Checks:*
    - On `ℚ_2`, arithmetic Frobenius sends a primitive seventh root `ζ` to `ζ²`,
      and its canonical profinite-integer coordinate is `1`.
    - Its reduction at the unramified degree-`f` level has order `f`; the profinite
      coordinate reduces modulo `f`.
    - A uniformizer has no square root in the maximal unramified extension, since the
      latter keeps the integer value group; it is not the algebraic closure.

- **Norms.** Name the image of the field norm: `TauCeti.normGroup L/K := (N_{L/K})(Lˣ) : Subgroup Kˣ`,
  which `ClassFieldTheory.normResidue` and `conductorExponent` consume. For `L/K` unramified prove
  `N_{L/K}(𝒪[L]ˣ) = 𝒪[K]ˣ`, named `map_norm_unitFiltration_zero` and stated on the depth-zero
  step `U(L,0)` of the unit filtration, and `N_{L/K}(Lˣ) = π^{fℤ} × 𝒪[K]ˣ`. State the second in
  **norm-equation form**, as `TauCeti.mem_normGroup_iff_dvd_normalizedValuation`: `x ∈ TauCeti.normGroup L/K` if
  and only if `f` divides `v_K(x)`. That is the shape a consumer applies, since it decides one
  element at a time when the equation `N_{L/K}(y) = x` is solvable, and it needs no chosen
  uniformizer, where the product description does. The identity
  `v_K(N_{L/K} y) = f · v_L(y)` holds for every finite compatible local-field extension.
  In the unramified case, surjectivity on units makes this necessary valuation condition
  sufficient. This is the concrete form
  of the statement that units are universal norms in the unramified direction. It is consumed by
  `ClassFieldTheory.normResidue` and the finite-Tate package `ClassFieldTheory.tateH`. ⚠ `f` here
  is the residue degree `TauCeti.inertiaDegree K L` of Layer 0, and the
  letter is never reused for a conductor. Tau Ceti implements all three: the norm group
  `TauCeti.normGroup K L`, the range of the norm on units `TauCeti.Algebra.normUnits K`
  (`TauCeti/RingTheory/Norm/Units.lean`); the valuation identity `TauCeti.normalizedValuation_norm`
  (`TauCeti/NumberTheory/LocalField/Norm/Basic.lean`); and, under the class
  `TauCeti.IsUnramified K L`, `TauCeti.map_normUnits_unitFiltration` and
  `TauCeti.mem_normGroup_iff_dvd_normalizedValuation` (`Norm/Unramified/Basic.lean`). The norm group and its valuation criterion use the native declarations directly.
  The adapter `map_norm_unitFiltration_zero` supplies the class from `e = 1`, as for the Frobenius.
  - *Prerequisites:*
    - `Layer 2: residue correspondence`;
    - `Layer 1: graded pieces`;
    - `Layer 1: the unit filtration as an object`;
    - `Layer 0: e and f, intrinsically`;
    - `Layer 0: finite extensions, III`.
  - *API:*
    - the norm group as a named subgroup of `Kˣ`;
    - surjectivity of the norm on units, in the filtration form above;
    - the norm-equation criterion, and the general valuation identity `TauCeti.normalizedValuation_norm`,
      which reads `v_K(N_{L/K} y) = f · v_L(y)` for every finite compatible extension;
    - the two worked `ℚ_2(√5)/ℚ_2` cases of the examples section, one solvable and one not.
  - *Source:* Serre LF V §2. The proof is surjectivity on each graded piece, plus completeness.
    *False generalization:* surjectivity on units can fail for ramified extensions.
    The condition `f ∣ v_K(x)` remains necessary for every norm, but need not be sufficient.
  - *Checks:*
    - For `L = ℚ_2(√2)`, `f = 1`, and the unit-norm image has index `2` in `ℤ_2ˣ`;
      `3` is not a norm, although the valuation condition is automatic. If a unit norm were `3`,
      the integral norm form `a² − 2b²` would be `3` modulo `8`, which is impossible.
    - For `L = ℚ_2(∛2)`, Eisenstein gives total ramification of degree `3`. Each
      `u ∈ ℤ_2ˣ` has a cube root `a ∈ ℤ_2ˣ` by Hensel, and the scalar norm `N(a) = a³ = u`:
      ramification does not force failure of unit-norm surjectivity.
    - For the unramified quadratic `ℚ_2(√5)/ℚ_2`, units are norms and `2` is not;
      the residue degree in the valuation identity is `2`.

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
- **Tame and wild.** Define `TauCeti.IsTamelyRamified K L` by `p ∤ e` and `TauCeti.IsWildlyRamified K L` by
  `p ∣ e`, where `p` is the residue characteristic. These are Tau Ceti's `TauCeti.IsTamelyRamified`
  and `TauCeti.IsWildlyRamified` (`TauCeti/NumberTheory/LocalField/RamificationIndex.lean`), with
  `TauCeti.not_isTamelyRamified_iff` and `TauCeti.isTamelyRamified_iff_natCast_ne_zero`, and are consumed directly. Reserve *totally wildly ramified* for the
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
  roadmap](../../Completed/NumberFieldArithmetic/README.md) consumes it only after passing to a completion.
  For an Eisenstein generator `ξ` of degree `n`, also prove the orthogonality of its power
  basis. If `c_i ∈ 𝒪[K]`, then

  ```text
  v_L(Σ_{i<n} c_i ξ^i) = min_{i<n} (e(L/K) v_K(c_i) + i)
                       = min_{i<n} (n v_K(c_i) + i).
  ```

  The second equality uses total ramification. The summands with nonzero coefficients have
  pairwise distinct values modulo `n`, so there is no cancellation. Export the formula in the
  canonical `IsDiscreteValuationRing.addVal` spelling. Counting Totally Ramified Extensions
  consumes it to derive the box/ball and coordinate-cube descriptions used by its measure
  argument; those family-level corollaries are not owned here.
  - *Prerequisites:*
    - `Layer 0: finite extensions, III`;
    - `Mathlib: Algebra.adjoin`, `Mathlib: IsIntegral`;
    - the primitive-element theorem for finite separable extensions.
  - *API:*
    - `TauCeti.exists_integerRing_adjoin_eq_top`;
    - the chosen-generator form, including integrality over `𝒪[K]` and generation of `L` over
      `K`;
    - `TauCeti.addVal_sum_eisenstein_powerBasis`, the exact minimum formula above;
    - the induced power basis;
    - compatibility with the comparison of `𝒪[L]` and the integral closure from Layer 0.III.
  - *Source:* Serre LF III §6, Proposition 12. Tau Ceti supplies local monogenicity in
    `Monogenic.lean`, the integral Eisenstein criterion in `Eisenstein/TotallyRamified.lean`,
    and the power-basis minimum in `Eisenstein/PowerBasis.lean`; the declarations here apply
    those theorems, transporting integral generation to field generation for the last formula.
  - *Checks:*
    - An unramified extension is generated integrally by the Teichmüller lift of a residue-field
      generator, although a base uniformizer alone cannot generate a nontrivial unramified field.
    - In a totally ramified Eisenstein extension, a root generates the integer ring and its power
      basis has terms with distinct normalized values modulo the degree.
    - For `ℚ_2(√2)`, the values of `a + b√2` are the minimum of `2v_2(a)` and `2v_2(b)+1`;
      allowing a zero coefficient gives the expected infinite value for that term.

- **The lower-numbering filtration.** For `L/K` finite Galois with group `G`, define `G_i = {σ | ∀
  x : 𝒪[L], v_L(σ x − x) ≥ i + 1}` for `i : ℤ`. The function is total, with `G_i = ⊤` for
  `i ≤ −1`. Equivalently, `σ` acts trivially on `𝒪[L]/𝓂[L]^{i+1}`. Prove that each `G_i` is a
  normal subgroup of `G`, and that the family is antitone. Prove that `G_0` is the inertia group,
  with one comparison lemma to `ValuationSubring.inertiaSubgroup` and one to `Ideal.inertia`.
  Prove that `G_i = 1` for large `i`. Extend to a real index by `G_u := G_{⌈u⌉}` for `u : ℝ` with
  `u ≥ −1`. This ceiling-indexed family is constant on `(i-1,i]`, hence left-continuous in the
  usual step-function sense; do not call it right-continuous. Pin the interval theorem
  `i - 1 < u → u ≤ i → TauCeti.LocalFieldsRamification.lowerRamificationGroupReal K L u = TauCeti.LocalFieldsRamification.lowerRamificationGroup K L i`, as
  well as agreement at integers. No topological `LeftContinuous` theorem is required before a
  topology on subgroup values is chosen. The Herbrand integral below needs `G_t` for real `t`.
  Prove compatibility with subgroups: `H_i = H ∩ G_i` for
  `H = Gal(L/K')`. Tau Ceti implements the filtration at integer and at real index, for every
  finite `L/K`, as `TauCeti.LocalFieldsRamification.lowerRamificationGroup` and
  `TauCeti.LocalFieldsRamification.lowerRamificationGroupReal` (`TauCeti/NumberTheory/LocalField/RamificationGroup.lean`), with
  normality, antitonicity, the negative-index convention, the two comparison lemmas at `0`, eventual
  triviality with the largest jump, the interval and integer-agreement lemmas, and compatibility
  with subgroups. This roadmap uses the native filtrations for `L/K` Galois.
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
  induced by `g` (`finiteTameCharacter_conj`). Hence `θ_0(gσg⁻¹) = θ_0(σ)^q` whenever `g` acts on
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
    - `finiteTameCharacter_conj` and `tameCharacter_conj_of_smul_eq_pow`, closed applications of
      Tau Ceti's `UnitFiltration/Conjugation.lean`;
    - naturality under passage to a subgroup `H ≤ G`.
  - *Source:* Serre LF IV §2.
- **Herbrand functions and the upper numbering.** Define `φ_{L/K}(u) = ∫_0^u dt/[G_0 : G_t]` for
  `u ≥ −1`, with the usual convention that the integrand is `[G_t : G_0]` on `[−1, 0]`. Prove the
  analytic facts as milestones: `φ` is continuous, piecewise linear with an explicit finite-sum
  formula, strictly increasing and concave, `φ(0) = 0`, and `φ(u) = u` for `−1 ≤ u ≤ 0`. Define
  `TauCeti.LocalFieldsRamification.RamificationIndexDomain := Set.Ici (-1 : ℝ)` and package the two functions as
  `TauCeti.LocalFieldsRamification.herbrandOrderIso : TauCeti.LocalFieldsRamification.RamificationIndexDomain ≃o TauCeti.LocalFieldsRamification.RamificationIndexDomain`; `TauCeti.LocalFieldsRamification.herbrand` is its
  forward map and `TauCeti.LocalFieldsRamification.inverseHerbrand` its inverse. Thus `φ ∘ ψ = id` and `ψ ∘ φ = id` are typed
  equalities on the mathematical domain, and no theorem makes an arbitrary claim below `-1`.
  A global wrapper may be added only after its value below `-1` is fixed explicitly. Prove that
  `ψ` carries the jumps of the upper filtration to the jumps of the lower one. The upper numbering
  is `G^u := G_{ψ(u)}`, with the real-index groups above. Tau Ceti implements the definitions and
  the analytic facts in `TauCeti/NumberTheory/LocalField/Herbrand/Basic.lean`, in the namespace
  `TauCeti.LocalFieldsRamification`: `TauCeti.LocalFieldsRamification.RamificationIndexDomain`, `TauCeti.LocalFieldsRamification.herbrandOrderIso`, `TauCeti.LocalFieldsRamification.herbrand` and
  `TauCeti.LocalFieldsRamification.inverseHerbrand`, with the integral formula `coe_herbrand`, the finite-sum formula
  (`coe_herbrand_of_mem_Icc`, `coe_herbrand_of_coe_eq_natCast`), continuity and strict
  monotonicity (`continuous_herbrand`, `TauCeti.LocalFieldsRamification.herbrand_strictMono` and
  their counterparts for `ψ`), concavity (`TauCeti.LocalFieldsRamification.herbrand_slope_anti_adjacent`),
  the identity on `[-1, 0]` (`TauCeti.LocalFieldsRamification.herbrand_of_coe_le_zero`,
  `TauCeti.LocalFieldsRamification.inverseHerbrand_of_coe_le_zero`), `TauCeti.LocalFieldsRamification.herbrand_inverseHerbrand` and
  `TauCeti.LocalFieldsRamification.inverseHerbrand_herbrand`; and the upper numbering `TauCeti.LocalFieldsRamification.upperRamificationGroup`, with
  `G^{φ(u)} = G_u` (`upperRamificationGroup_herbrand`), antitonicity and normality. These definitions and the inversion and tower theorems are consumed directly from Tau Ceti's
  `Herbrand/UpperQuotient.lean` and `Herbrand/Tower.lean`; the fixed-field quotient statement
  adapts the native quotient theorem. `TauCeti.LocalFieldsRamification.UpperJump` is the canonical strict-drop predicate from
  `Herbrand/Jump.lean`, equivalent by antitonicity to the inequality formulation below.
  Full Hasse–Arf and the general-residue contracts remain targets.

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
  need not agree in general. For `L = ℚ_2(√2)` and `M = L K_2`, with `K_2/ℚ_2` unramified
  quadratic, `M/L` is unramified, so its Herbrand functions are the identity and the two orders
  agree despite the wild step. These exports are consumed by
  `ClassFieldTheory.conductorExponent` and `characterConductorExp`.
  - *Prerequisites:*
    - `Layer 3: the lower-numbering filtration`;
    - `Mathlib: intervalIntegral` and the API for piecewise linear monotone functions.
  - *API:*
    - `TauCeti.LocalFieldsRamification.RamificationIndexDomain`, `TauCeti.LocalFieldsRamification.herbrandOrderIso`, `TauCeti.LocalFieldsRamification.herbrand`, and `TauCeti.LocalFieldsRamification.inverseHerbrand`;
    - continuity, monotonicity, concavity, and the values at `0`;
    - the finite-sum formula at integers;
    - `TauCeti.LocalFieldsRamification.herbrand_inverseHerbrand` and `TauCeti.LocalFieldsRamification.inverseHerbrand_herbrand`;
    - the image of a jump;
    - `TauCeti.LocalFieldsRamification.upperRamificationGroup` as a filtration, with normality and antitonicity;
    - `upperRamificationGroupQuotient`, `upperRamificationGroup_quotient`, and the field-theoretic
      `upperRamificationGroup_fixedField`, stated through Mathlib's actual
      `IsGalois.normalAutEquivQuotient` restriction equivalence;
    - `TauCeti.LocalFieldsRamification.herbrand_tower` and `TauCeti.LocalFieldsRamification.inverseHerbrand_tower`, with the finite-Galois and normality
      hypotheses above;
    - the computation for `ℚ_2(μ_8)/ℚ_2` in the examples section.
  - *Source:* Serre LF IV §3.
  - *Checks:*
    - On `ℚ_2(ζ_8)/ℚ_2`, `φ(2) = 3/2`, separating lower and upper indices.
    - For the wild `L = ℚ_2(√2)` and `M = L K_2` with `K_2/ℚ_2` unramified quadratic,
      the functions of `M/L` are the identity: the two compositions agree.
    - For `M = ℚ_2(ζ_8)` and `L = ℚ_2(√2)`, §3a.2 gives the noncommuting values
      `ψ_(M/L)(ψ_(L/K)(3)) = 7` and `ψ_(L/K)(ψ_(M/L)(3)) = 8`.

- **Herbrand values as unit depths.** `φ` takes non-integral values at integers: in `ℚ_2(μ_8)/ℚ_2`
  below, `φ(2) = 3/2`. Its inverse does not. Prove that `ψ_{L/K}(n)` is a natural number for every
  `n : ℕ`. The integral depth `ψℕ_{L/K} : ℕ → ℕ` (`TauCeti.LocalFieldsRamification.psiNat`) is `n ↦ ⌊ψ_{L/K}(n)⌋₊`, read on the
  canonical `TauCeti.LocalFieldsRamification.inverseHerbrand`, and the integrality is its characterizing lemma
  `(ψℕ_{L/K} n : ℝ) = ψ_{L/K} n` (`TauCeti.LocalFieldsRamification.coe_psiNat`): the floor rounds nothing. This is the only
  conversion from a Herbrand value to a unit depth in this roadmap. The native integral depth `TauCeti.LocalFieldsRamification.psiNat` and its theorems
  `TauCeti.LocalFieldsRamification.coe_psiNat` and `TauCeti.LocalFieldsRamification.psiNat_tower`
  come from `Herbrand/Basic.lean` and `Herbrand/Tower.lean`. Every index of `U(K, −)` and
  of `U(L, −)` below is a literal natural number or a value of `ψℕ`, and `φ` never indexes a unit
  group. The proof is the piecewise
  formula with Lagrange's theorem: write `g_i = #G_i`, and take `t` to be the largest jump with
  `φ(t) ≤ n`; then `ψ(n) = t + (g_0·n − ∑_{i=1}^{t} g_i) / g_{t+1}`, and `g_{t+1}` divides `g_0`
  and every `g_i` with `i ≤ t`, because the filtration is decreasing.
  - *Prerequisites:* `Layer 3: Herbrand functions and the upper numbering`.
  - *Source:* Serre LF IV §3, the piecewise formula and subgroup indices.
  - *API:*
    - `TauCeti.LocalFieldsRamification.psiNat`;
    - `TauCeti.LocalFieldsRamification.coe_psiNat`;
    - `ψℕ 0 = 0`;
    - monotonicity;
    - `n ≤ ψℕ n`;
    - `TauCeti.LocalFieldsRamification.psiNat_tower`, stating `ψℕ_{M/K} = ψℕ_{M/L} ∘ ψℕ_{L/K}`, under the same hypotheses as real-valued
      transitivity: `M/K` finite Galois and the intermediate extension `L/K` Galois, with the
      quotient/restriction equivalences fixed;
    - the closed form in the cyclic prime-degree case, which is `ψℕ v = v` for `v ≤ t` and
      `ψℕ v = t + ℓ(v − t)` for `v ≥ t`.
  - *Checks:*
    - In the identity extension, `ψℕ(n) = n`, including `ψℕ(0) = 0`.
    - For `ℚ_2(√2)/ℚ_2`, `ψℕ(3) = 4`, while `φ(3) = 5/2`; integral unit depths
      come from the inverse function.
    - A totally ramified tame Galois extension of degree `e` has `ψℕ(n) = en` for
      `n ≥ 0`, so every resulting unit depth is integral.

- **The norm on the unit filtration.** ⚠ `N_{L/K}(U(L,i)) ⊆ U(K,i)` is **false** for a ramified
  extension `L/K`. In a tame quadratic extension in residue characteristic `3`, the norm of an
  element of `U(L,2)` is outside `U(K,2)`; the examples section has the computation. The true
  inclusion carries a Herbrand shift, which no milestone may remove. Each item names its consumer.
  1. *The norm on valuations and on units, for any finite `L/K`.* `v_K(N_{L/K}(x)) = f · v_L(x)`
     for `x : Lˣ`. Therefore `N_{L/K}(𝒪[L]ˣ) ⊆ 𝒪[K]ˣ`, which is `N_{L/K}(U(L,0)) ⊆ U(K,0)`. If
     `L/K` is totally ramified, `N_{L/K}(π_L)` is a uniformizer of `K`. This is the basic API of
     the norm at a local field. The last part fixes the coordinate on the target of the graded
     maps in item 4. Tau Ceti implements this item: `TauCeti.normalizedValuation_norm`,
     `TauCeti.map_normUnits_unitFiltration_le` and, for the uniformizer,
     `TauCeti.isUniformizer_normUnits_iff` (`TauCeti/NumberTheory/LocalField/Norm/Basic.lean`).
  2. *The Herbrand-shifted inclusion, for `L/K` finite Galois.*
     `N_{L/K}(U(L, ψℕ_{L/K}(i))) ⊆ U(K, i)` for every `i : ℕ`. Both depths are natural numbers,
     because `ψℕ` is. The unshifted corollary is `N_{L/K}(U(L,i)) ⊆ U(K, ⌊φ_{L/K}(i)⌋)`, which
     follows from `ψ(⌊φ(i)⌋) ≤ i`. Name the shifted theorem
     `map_norm_unitFiltration_psiNat_le`. Also prove the successor-depth inclusion
     `N_{L/K}(U(L, ψℕ(i)+1)) ⊆ U(K,i+1)`, named
     `map_norm_unitFiltration_psiNat_add_one_le`. Together these inclusions make the graded norm
     well-defined; applying the first at `i+1` alone does not control this successor depth.
     Tau Ceti supplies both in `Norm/Herbrand.lean`. These are the forms consumed by
     `ClassFieldTheory.conductorExponent` and `characterConductorExp`.
  3. *Unramified `L/K`.* `N_{L/K}(U(L,i)) = U(K,i)` for every `i : ℕ`, an equality, and here `ψℕ`
     is the identity. The case `i = 0` is the norm surjectivity of Layer 2. The downstream
     cohomological formulation uses `ClassFieldTheory.tateH` on `ClassFieldTheory.unitsRep`.
  4. *Cyclic totally ramified of prime degree `ℓ`: the graded maps.* Write `G = ⟨σ⟩`, and let
     `t ≥ 0` be the unique jump, so that `G_i = G` for `i ≤ t` and `G_i = 1` for `i > t`. Then
     `t = 0` holds exactly in the tame case `ℓ ≠ p`, where the Galois hypothesis forces `μ_ℓ ⊆ K`
     and therefore `ℓ ∣ q − 1`. Coordinatize the graded pieces by a uniformizer `π_L` and by
     `π_K = N_{L/K}(π_L)`. The norm induces `gr_v N : U(L, ψℕ v)/U(L, ψℕ v + 1) → U(K, v)/U(K,
     v+1)`, with `[u] ↦ [N(u)]` (`TauCeti.normGradedMap_mk`). The map is Tau Ceti's native `TauCeti.normGradedMap` from `Norm/Graded.lean`. Compute all five regimes:
     - `v = t = 0`, the tame case: `y ↦ y^ℓ` on `𝓀ˣ`, with kernel and cokernel `μ_ℓ(𝓀)` of order
       `ℓ`, by `ℓ ∣ q − 1`;
     - `v = 0 < t`, so `ℓ = p`: `y ↦ y^p` on `𝓀ˣ`, the Frobenius of a finite field, bijective;
     - `0 < v < t`, which again forces `ℓ = p`: `y ↦ y^p` on `𝓀⁺`, Frobenius again, bijective;
     - `v = t > 0`: the additive map `y ↦ y^ℓ − c^{ℓ−1}·y` on `𝓀⁺`, where `c = θ_t(σ) ∈ 𝓀ˣ` is the
       value at a generator `σ` of `G` of the level-`t` embedding `θ_t` above. The map is
       `𝔽_ℓ`-linear, with kernel the line `𝔽_ℓ·c` and cokernel of order `ℓ`;
     - `v > t`, including the tame case `t = 0`: put `m = ψℕ(v) = t + ℓ(v − t)` and
       `d = (t+1)(ℓ−1)`. The trace ideal formula gives
       `Tr(𝓂[L]^m) = 𝓂[K]^v` and `Tr(𝓂[L]^(m+1)) = 𝓂[K]^(v+1)`.
       Moreover `N(1+x) ≡ 1 + Tr(x) mod 𝓂[K]^(v+1)` for `x ∈ 𝓂[L]^m`, since the
       higher norm terms have greater depth. Thus the graded norm is the induced trace map,
       surjective, and bijective because both graded pieces have `q` elements.
       This is `TauCeti.normGradedMap_after_break`, supplied by Tau Ceti's `Norm/AfterBreak.lean`.

     ⚠ The exponent on `c` is not a slip. The element `c` changes when the generator `σ` changes,
     and `c^{ℓ−1}` does not, because `λ^{ℓ−1} = 1` for `λ ∈ 𝔽_ℓˣ`. A version with a bare `c` would
     make the kernel depend on the choice of `σ`, which the norm map cannot see. In summary:
     `gr_v N` is bijective for `v ≠ t`, and at `v = t` its kernel and its cokernel both have order
     `ℓ`. The representative declarations keep these regimes separate:
     `TauCeti.normGradedMap_tame_break_zero` covers `v = t = 0`;
     `TauCeti.normGradedMap_zero_before_break` covers `v = 0 < t`;
     `TauCeti.normGradedMap_positive_before_break` covers `0 < v < t`;
     `TauCeti.normGradedMap_at_break` covers only `v = t > 0`; and
     `TauCeti.normGradedMap_after_break` covers `v > t`. The at-break theorem explicitly requires
     `IsTotallyRamified K L`, `0 < t`, and
     `TauCeti.LocalFieldsRamification.UpperJump K L ⟨(t : ℝ), _⟩`; prime-degree Galois hypotheses supply cyclicity. In particular,
     its kernel-and-cokernel conclusion is unavailable for an unramified extension or for the tame
     break at zero.
  5. *The consequences of item 4, for the same extensions.* `N_{L/K}(U(L, ψℕ v)) = U(K,v)` for
     every `v > t`, by successive approximation from item 4 and completeness.
     `[U(K,v) : N_{L/K}(U(L, ψℕ v)) · U(K,v+1)] = ℓ` for `v = t`, and `= 1` for `v ≠ t`.
     Multiplication up the filtration then gives `[𝒪[K]ˣ : N_{L/K}(𝒪[L]ˣ)] = ℓ`. The induction for
     Hasse–Arf consumes item 4 and these indices, and the conductor of a cyclic extension of prime
     degree is `c(L/K) = t + 1`.
  - *Prerequisites:*
    - `Layer 3: Herbrand values as unit depths`;
    - `Layer 3: the quotient embeddings`;
    - `Layer 1: graded pieces`;
    - `Layer 2: norms` (for item 3);
    - `Layer 0: e and f, intrinsically`.
  - *Source:* Serre LF V §2 for item 3, Serre LF V §3 for item 4, and Serre LF V §6 for item 2.
    *False generalization:* the unshifted inclusion in item 2, which the counterexample in the
    examples section refutes.
  - *Lean-facing exports:* `map_norm_unitFiltration_psiNat_le`,
    `map_norm_unitFiltration_psiNat_add_one_le`, `TauCeti.UnitFiltrationGraded`,
    `TauCeti.normGradedMap`, `TauCeti.normGradedMap_mk`, `TauCeti.normGradedMap_tame_break_zero`,
    `TauCeti.normGradedMap_zero_before_break`, `TauCeti.normGradedMap_positive_before_break`,
    `TauCeti.normGradedMap_at_break`, and `TauCeti.normGradedMap_after_break`.
  - *Checks:*
    - For `ℚ_2(√2)/ℚ_2`, `t = 2` and `ψℕ(3) = 4`; the two inclusions give
      `N(U(L,4)) ⊆ U(K,3)` and `N(U(L,5)) ⊆ U(K,4)`, so the graded map descends at depth `3`.
      The first inclusion at depth `4` instead starts at `ψℕ(4) = 6` and does not suffice.
    - For this extension `d = 3`, `Tr(𝓂[L]^4) = 𝓂[K]^3` and
      `Tr(𝓂[L]^5) = 𝓂[K]^4`; the above-break graded map is bijective.
    - For a totally ramified tame quadratic over `ℚ_3`, `t = 0`: the depth-zero map on
      `𝔽_3ˣ` is squaring with kernel and cokernel of order `2`, while every positive graded norm
      is bijective. Approximation starts strictly above the break.
- **Hasse–Arf.** For a finite abelian Galois extension `L/K`, the jumps of the upper-numbering
  filtration are integers. A jump is a `u` with `G^v ≠ G^u` for every `v > u` (Serre LF IV §3),
  defined as `TauCeti.LocalFieldsRamification.UpperJump K L u` on the upper filtration `TauCeti.LocalFieldsRamification.upperRamificationGroup` of the preceding
  milestone. The proof contract includes the induction chain, not merely the phrase
  “reduce to cyclic prime degree”:
  1. prove the unique-break and conductor calculation for cyclic extensions of prime degree;
  2. choose a prime-order normal quotient series for the finite abelian group;
  3. transport the filtration at every step using the abstract Herbrand quotient theorem and its
     fixed field-theoretic equivalence;
  4. compare conductors with norms using the five graded norm regimes and their kernel/cokernel
     calculation above;
  5. induct along the series, showing at each quotient that integrality of the upper breaks is
     preserved.
  - *Prerequisites:*
    - `Layer 3: the norm on the unit filtration` (items 4 and 5);
    - `Layer 3: Herbrand functions and the upper numbering` (normal-quotient compatibility and
      tower transitivity);
  - *Lean-facing exports:* `TauCeti.LocalFieldsRamification.UpperJump` and `hasseArf`.
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
  the induced integer-ring equivalence. Counting Totally Ramified Extensions consumes this
  invariance when regrouping its mass formula by `K`-isomorphism classes. Prove: `𝔡_{L/K} = 𝒪[L]` if and only if `L/K` is
  unramified; for `L/K` Galois,
  `d(L/K) = ∑_{i≥0} (#(TauCeti.LocalFieldsRamification.lowerRamificationGroup K L i) − 1)`; and generally
  `d(L/K) = e − 1` if and only if `L/K` is tamely ramified. Thus a wildly ramified extension has
  `e ≤ d(L/K)`. Given `he : (e : L) ≠ 0` (in particular in mixed characteristic), also prove the sharp
  upper bound `d(L/K) ≤ e − 1 + TauCeti.natCastValuation L e he`. Neither endpoint is forced in the wild case:
  `ℚ_2(i)/ℚ_2` has `d = e = 2`, while `ℚ_2(√2)/ℚ_2` has
  `d = 3 = e − 1 + TauCeti.natCastValuation L e he`. The trace-dual definition comes before the valuation formula, which
  needs `L/K` Galois; the bounds and tame equality criterion do not.

  Tau Ceti implements the discriminant ideal and both exponents, `TauCeti.discriminantIdeal`,
  `TauCeti.differentExponent` and `TauCeti.discriminantExponent`
  (`TauCeti/NumberTheory/LocalField/Different/Basic.lean`, `Discriminant/Basic.lean`), with
  `𝔡_{L/K} = 𝓂[L]^{d(L/K)}` (`TauCeti.differentIdeal_eq_maximalIdeal_pow`),
  `𝔩_{L/K} = 𝓂[K]^{δ(L/K)}` (`TauCeti.discriminantIdeal_eq_maximalIdeal_pow`), the product formula
  `TauCeti.discriminantExponent_eq_inertiaDegree_mul_differentExponent`, the unramified criteria
  `TauCeti.differentIdeal_eq_top_iff` and `TauCeti.discriminantIdeal_eq_top_iff`, the tame equality
  criterion `TauCeti.differentExponent_eq_ramificationIndex_sub_one_iff`, the wild lower bound
  `TauCeti.ramificationIndex_le_differentExponent_iff`, and multiplicativity in a tower,
  `TauCeti.differentExponent_tower` (`Different/Tower.lean`). The exponent definitions, product formula and tame criterion use the native declarations;
  `localDiscriminantIdeal` wraps `TauCeti.discriminantIdeal`. `TauCeti.differentExponent` is defined for
  every compatible extension and its theorems assume `Algebra.IsSeparable K L`;
  `TauCeti.discriminantExponent` takes separability as an argument of the definition. The
  invariance under `K`-isomorphism, the Hilbert formula and the wild bounds are supplied in
  `Different/AlgEquiv.lean`, `Different/Hilbert.lean`, `Different/Wild.lean` and
  `Discriminant/Basic.lean` and are consumed directly.
  - *Prerequisites:*
    - `Mathlib: differentIdeal`, `Mathlib/RingTheory/Trace/`;
    - `Layer 3: the lower-numbering filtration`;
    - `Layer 0: finite extensions, III`.
  - *API:*
    - the two ideals;
    - `TauCeti.discriminantExponent` and
      `TauCeti.discriminantExponent_eq_inertiaDegree_mul_differentExponent`;
    - `TauCeti.differentExponent_eq_of_algEquiv` and `TauCeti.discriminantExponent_eq_of_algEquiv`;
    - multiplicativity in a tower;
    - the unramified criterion;
    - `TauCeti.differentExponent` and the Hilbert valuation formula in the Galois case;
    - the tame equality criterion and the wild lower bound;
    - the mixed-characteristic upper bound;
    - the value for `ℚ_2(√2)/ℚ_2`, which is `3`.
  - *Source:* Serre LF III §§3–6 for the different and the discriminant, and Serre LF IV §1 for
    the valuation formula, which needs `L/K` Galois.
  - *Checks:*
    - For `ℚ_2(√2)/ℚ_2`, `e = 2`, `f = 1`, and `d = δ = 3`, attaining the wild upper bound.
    - For `ℚ_2(i)/ℚ_2`, `d = 2 = e`, attaining the wild lower bound.
    - A finite unramified extension has `d = δ = 0`; changing its `K`-isomorphic model preserves
      both exponents and transports the different and discriminant ideals.

### Consumer contract: Counting Totally Ramified Extensions

The governing rule is that this roadmap owns the arithmetic of one finite extension of a
nonarchimedean local field, while Counting Totally Ramified Extensions owns the construction and counting
of families of such extensions. The dependency is one-way:

```text
LocalFieldsRamification (this roadmap) → MassFormula
```

This roadmap owns the canonical induced local-field structure, `e` and `f`, total/tame/wild
ramification, Eisenstein generators and integral monogenicity, the different and local
discriminant exponents, their invariance under `K`-algebra equivalence, and the valuation formula
for an Eisenstein power basis.

Counting Totally Ramified Extensions consumes those declarations. It owns the family `σ_K(n)`, `totallyRamifiedOfDegree`,
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
roadmap a counting roadmap or introducing a dependency on Counting Totally Ramified Extensions.

| Consumer need in Counting Totally Ramified Extensions | Owner/export in this roadmap |
|---|---|
| local structure on a finite intermediate field | `TauCeti.finiteIntermediateFieldNormedField`, `TauCeti.finiteIntermediateFieldValuativeRel`, `TauCeti.finiteIntermediateFieldTopology`, `TauCeti.finiteIntermediateField_valuativeExtension`, `TauCeti.finiteIntermediateField_isValuativeTopology`, `TauCeti.finiteIntermediateField_isNonarchimedeanLocalField` |
| ramification index | `TauCeti.ramificationIndex` |
| residue degree | `TauCeti.inertiaDegree` |
| total ramification | `IsTotallyRamified`, `isTotallyRamified_iff_inertiaDegree_eq_one` |
| Eisenstein generator | `isTotallyRamified_iff_exists_eisenstein_generator` |
| integral monogenicity | `TauCeti.exists_integerRing_adjoin_eq_top` |
| local different exponent | `TauCeti.differentExponent` |
| local discriminant exponent | `TauCeti.discriminantExponent` |
| tame and wild bounds | `TauCeti.differentExponent_eq_ramificationIndex_sub_one_iff`, `TauCeti.differentExponent_bounds_of_wild` |
| invariance under `K`-equivalence | `TauCeti.differentExponent_eq_of_algEquiv`, `TauCeti.discriminantExponent_eq_of_algEquiv` |
| power-basis valuation orthogonality | `TauCeti.addVal_sum_eisenstein_powerBasis` |

Two results needed by the mass formula remain owned here:

1. `TauCeti.discriminantExponent_eq_of_algEquiv`, since invariance of a local arithmetic invariant is
   reusable outside counting;
2. `TauCeti.addVal_sum_eisenstein_powerBasis`, since it is a valuation theorem about one Eisenstein
   extension.

The counting roadmap owns only their family-level consequences: invariance of `wildExponent`,
coordinate-box and coordinate-cube descriptions, volume computations, and the resulting
integrals. Counting Totally Ramified Extensions installs this adapter contract and replaces its
temporary arithmetic declarations with the canonical exports above.

### Layer 3a: ramification over complete discretely valued fields

The congruence definitions of Layer 3 need neither local compactness nor a finite residue field.
This layer builds the finite ramification package over every field complete for a discrete
valuation, in equal and mixed characteristic. The setting, fixed for Layers 3a and 4a: `A` is a
complete discrete valuation ring (`IsDiscreteValuationRing A` and
`IsAdicComplete (IsLocalRing.maximalIdeal A) A`) with fraction field `K` and residue field
`k = IsLocalRing.ResidueField A`; `L/K` is a finite Galois extension with group `G`; and `B` is
the integral closure of `A` in `L`, on which `G` acts by `A`-algebra automorphisms with
`Algebra.IsInvariant A B G`. The residue extension `IsLocalRing.ResidueField B / k` is assumed
separable, which holds for every `L` when `k` is perfect. Valuations are normalized by
`v_K(Kˣ) = v_L(Lˣ) = ℤ`, and `e` and `f` are the ramification index and the residue degree.

The carriers are Tau Ceti's filtration of a group acting on a local ring, which uses no valuation
on a fraction field and no finiteness of the residue field:
`TauCeti.IsLocalRing.ramificationGroup G B i` for `i : ℤ`, which is
`Ideal.ramificationGroup G (IsLocalRing.maximalIdeal B) i` for `i ≥ 0`
(`TauCeti.IsLocalRing.ramificationGroup_natCast`); its real-indexed form
`TauCeti.IsLocalRing.ramificationGroupReal G B u`, the group `G_(⌈u⌉)`; and the lower index
`TauCeti.IsLocalRing.lowerIndex B σ = min_x v_L(σx − x)`. On a nonarchimedean local field these are
the groups of Layer 3 by definition: `TauCeti.LocalFieldsRamification.lowerRamificationGroup K L i`
is `TauCeti.IsLocalRing.ramificationGroup (L ≃ₐ[K] L) 𝒪[L] i`. Tau Ceti's Herbrand objects do not
extend as they stand: `TauCeti.LocalFieldsRamification.herbrandOrderIso`, `TauCeti.LocalFieldsRamification.herbrand`,
`TauCeti.LocalFieldsRamification.inverseHerbrand`, `TauCeti.LocalFieldsRamification.psiNat` and `TauCeti.LocalFieldsRamification.upperRamificationGroup` assume `IsNonarchimedeanLocalField` on
both `K` and `L`, which forces local compactness and a finite residue field, together with
`ValuativeExtension K L`, `Module.Finite K L` and `IsGalois K L`, although their definitions use
only the cardinalities of the lower groups. Section 3a.2 builds them on the local-ring filtration,
and the Layer 3 functions are its instance `G = L ≃ₐ[K] L`, `B = 𝒪[L]`.

<a id="perfect-residue-herbrand"></a>

**Perfect-residue Herbrand contract (`perfectResidueHerbrand`).** For complete DVR fraction
fields with perfect residue field, this is the package of §§3a.1–3a.3 and §§4a.1–4a.3, in both
characteristics, including their comparisons with the finite-local-field API. Its sources are
Serre, *Local Fields*, IV §§1–3 and V §7, Theorem 1; Serre 1961, n° 3.1 and n° 3.4–3.5; and
Brinon–Conrad, Exercise 1.4.4(3), with the equal-characteristic argument in §4a.3.
Its absolute group is Mathlib's `Field.absoluteGaloisGroup`. The section numbers specify the
named contract.

| Export | Sections |
|---|---|
| integer rings, lower filtration, lower index and different | §3a.1 |
| finite Herbrand functions, upper numbering, quotients and towers | §3a.2 |
| full Hasse–Arf | §3a.3 |
| absolute upper filtration, finite projections, inertia and wild inertia | §4a.1 |
| finite separable transition functions and open-subgroup identity | §4a.2 |
| completed maximal unramified comparison | §4a.3 |

**Checks.**

- Over `F̄_p((t))`, `y^p − y = t⁻¹` has lower and upper break `1` and different `2(p − 1)`.
- Over `Frac W(F̄_p)`, for odd `p`, adjoining `ζ_p` has degree `p − 1`, lower and upper break
  `0`, and different `p − 2`.
- On `ℚ_2(ζ_8)/ℚ_2`, the package gives lower jumps `1, 3` and upper jumps `1, 2`, agreeing with
  Layer 3 rather than identifying the two numberings.

#### 3a.1 Integer rings, the lower filtration and the different

`B` is a complete discrete valuation ring, free of rank `[L : K]` over `A`; the valuation of `L`
is the unique one extending that of `K`, `v_L = e·v_K` on `K`, and `[L : K] = ef`. There is
`x ∈ B` with `Algebra.adjoin A {x} = ⊤`, and for every such `x` and every `σ ∈ G`,
`lowerIndex B σ = v_L(σx − x)`. The groups `G_i` are normal in `G` and antitone in `i`,
`G_i = G` for `i ≤ −1`, `G_0` is the inertia group (the kernel of the action on
`IsLocalRing.ResidueField B`), and `G_i = 1` for all large `i`. For a subgroup `H = Gal(L/K′)`,
`H_i = H ∩ G_i`. For a uniformizer `π_L`, reduction of `σ(π_L)/π_L` embeds `G_0/G_1` in
`(IsLocalRing.ResidueField B)ˣ`. For `i ≥ 1`, reduction of
`(σ(π_L) − π_L)/π_L^(i+1)` embeds `G_i/G_(i+1)` in the additive residue field. The ratio first
gives a uniformizer-independent map to `U(L,i)/U(L,i+1)`, where `U(L,i) = 1 + 𝔪_B^i`;
identifying that quotient with the additive residue field uses `π_L`.
Hence `G_0/G_1` is cyclic of order prime to the residue
characteristic, `G_1` is the Sylow `p`-subgroup of `G_0` when the residue characteristic is
`p > 0`, and `G_1 = 1` when it is zero. Hilbert's formula holds: the different exponent `d(L/K)`,
the `v_L`-valuation of Mathlib's `differentIdeal A B`, is `Σ_(i ≥ 0) (#G_i − 1)`.
Its ideal-valued form, `differentIdeal A B = 𝔪_B^(Σ_(i ≥ 0) (#G_i − 1))`, is
`differentIdeal_eq_pow_maximalIdeal_of_separable_residue` in `Suggested.lean`.
Integral monogenicity and computation of the lower index at a generator are stated together as
`exists_generator_lowerIndex_eq_addVal`, for any finite faithful extension of DVRs with
separable residue extension, without completeness. It uses the pinned general-DVR
`TauCeti.IsDiscreteValuationRing.exists_adjoin_eq_top` and
`TauCeti.IsLocalRing.lowerIndex_eq_addVal_of_adjoin_singleton_eq_top`.

(Jean-Pierre Serre, [Local Fields](#reference-serre-local-fields), II §2, Proposition 3; III §6,
Proposition 12; IV §1, Propositions 2 and 4.) (Jean-Pierre Serre, [Sur les corps locaux à corps
résiduel algébriquement clos](#reference-serre-1961), n° 3.1, Proposition 1 with its Corollaries 1
and 2, and Proposition 2, printed pp. 126–127, for totally ramified `L/K`.)

*Proof.* Completeness of `A` gives the unique prolongation of the valuation and makes `B` a
complete discrete valuation ring, free over `A` because `L/K` is separable; computing the
dimension of `B/𝔪_A B = B/𝔪_B^e` over `k` gives `[L : K] = ef`. Monogenicity uses the
separability of the residue extension: a lift of a primitive element of the residue extension,
corrected by a uniformizer when needed, generates `B` over `A`. Tau Ceti's
`TauCeti.IsLocalRing.lowerIndex_eq_addVal_of_adjoin_singleton_eq_top` then computes the lower index
at `x`, and normality, antitonicity, the identification of `G_0` and eventual triviality are Tau
Ceti's `TauCeti.IsLocalRing.instNormalRamificationGroup`,
`TauCeti.IsLocalRing.ramificationGroup_antitone`,
`TauCeti.IsLocalRing.ramificationGroup_zero_eq_ker_toRingAut` and
`TauCeti.IsLocalRing.exists_forall_ramificationGroup_eq_bot`; the subgroup formula is
`TauCeti.IsLocalRing.subgroupOf_ramificationGroup`. The graded embeddings are the quotient
embeddings of Layer 3, whose proof uses only the residue field of `B`; a finite subgroup of
`(IsLocalRing.ResidueField B)ˣ` is cyclic of order prime to `p`, and the additive group is killed
by `p`, or torsion-free in residue characteristic zero. For Hilbert's formula, Mathlib's
`conductor_mul_differentIdeal` at a generator `x` (whose conductor is `⊤`) gives
`differentIdeal A B = (f′(x))` for the minimal polynomial `f` of `x`, and
`v_L(f′(x)) = Σ_(σ ≠ 1) v_L(σx − x) = Σ_(i ≥ 0) (#G_i − 1)` by Tau Ceti's counting identity
`TauCeti.IsLocalRing.sum_addVal_smul_sub_eq_finsum_card_ramificationGroup_sub_one`.

*Needs:* Mathlib `IsDiscreteValuationRing`, `IsAdicComplete`, `Algebra.IsInvariant`,
`differentIdeal` and `conductor_mul_differentIdeal`; Tau Ceti
`TauCeti.IsLocalRing.ramificationGroup`, `TauCeti.IsLocalRing.lowerIndex` and the counting
identity above; Layer 3 (local monogenicity, the quotient embeddings and the different, for the
local-field instance).

**Checks.**

- For every perfect `k` of characteristic `p`, including `k = F̄_p`, the Artin–Schreier extension
  `y^p − y = t⁻¹` of `k((t))` has `v_L(y) = −1`, the uniformizer `y⁻¹`, and a generator `σ` with
  `σ(y) = y + 1` moves it by `−1/(y(y + 1))`, of valuation `2`. So `G_0 = G_1 = G`, `G_2 = 1` and
  `d = 2(p − 1)`, over an infinite residue field when `k = F̄_p`. At level `1`, the additive
  graded character of this generator is `−1`, since
  `(σ(y⁻¹) − y⁻¹)/(y⁻¹)² = −y/(y + 1)`; the unscaled ratio instead reduces to `1`.
- For odd `p` and `K = Frac W(F̄_p)`, `((X + 1)^p − 1)/X` is Eisenstein, so `K(ζ_p)/K` is totally
  and tamely ramified of degree `p − 1`, with `G_0 = G`, `G_1 = 1` and `d = p − 2`.
- On `ℚ_2(ζ_8)/ℚ_2` the groups are those of Layer 3, `#G_0 = #G_1 = 4`, `#G_2 = #G_3 = 2`,
  `G_4 = 1`, and `d = 3 + 3 + 1 + 1 = 8`. A finite unramified `L/K` has `G_0 = 1` and `d = 0`.
- The separability hypothesis cannot be dropped. Over `K = F_p(s)((t))`, let `L = K(y)` with
  `y^p − y = s·t^(−p)` and put `z = ty`, so `z^p − t^(p−1) z = s`. The residue extension
  `F_p(s^(1/p))/F_p(s)` is purely inseparable of degree `p`, `e = 1`, `B = A[z]`, and the generator
  with `σ(z) = z + t` lies in `G_0` but not in `G_1`: `G_0/G_1` has order `p`, and `#G_0 ≠ e`.

#### 3a.2 Herbrand functions and the upper numbering

For a finite group `G` acting on a local ring `S`, define the Herbrand function
`φ(u) = ∫_0^u #G_t / #G_0 dt` for `u ≥ −1`, with `G_t = ramificationGroupReal G S t`, as an order
automorphism `IsLocalRing.herbrandOrderIso G S` of `TauCeti.LocalFieldsRamification.RamificationIndexDomain`, with forward map
`IsLocalRing.herbrand G S`, inverse `IsLocalRing.inverseHerbrand G S` (written `ψ`) and upper
groups `IsLocalRing.upperRamificationGroup G S v = G_(ψ(v))`. Prove that `φ` is continuous,
strictly increasing, piecewise linear and concave, the identity on `[−1, 0]`, with
`φ(m) = (#G_1 + ⋯ + #G_m)/#G_0` at every integer `m ≥ 0`; that `ψ(n)` is a natural number for
every natural number `n`; the two inverse identities; and `G^(φ(u)) = G_u`. In the setting of
3a.1, with `S = B` and `φ_(L/K)`, `ψ_(L/K)` for these functions, prove:

- Herbrand's theorem: for `H` normal in `G`, `(G/H)^v = G^v H/H`, and its field form through
  Mathlib's `IsGalois.normalAutEquivQuotient` for `K′ = L^H`;
- tower transitivity: for `M/K` finite Galois and `L` intermediate with `L/K` Galois,
  `φ_(M/K) = φ_(L/K) ∘ φ_(M/L)` and `ψ_(M/K) = ψ_(M/L) ∘ ψ_(L/K)`;
- for the same tower, `Gal(M/L) ∩ Gal(M/K)^v = Gal(M/L)^(ψ_(L/K)(v))` for `v ≥ −1`;
- `ψ` carries the jumps of the upper filtration to those of the lower one;
- agreement: for nonarchimedean local fields, `G = L ≃ₐ[K] L` and `S = 𝒪[L]`, these are
  `TauCeti.LocalFieldsRamification.herbrandOrderIso K L`, `TauCeti.LocalFieldsRamification.herbrand K L`, `TauCeti.LocalFieldsRamification.inverseHerbrand K L`, `TauCeti.LocalFieldsRamification.psiNat K L` and
  `TauCeti.LocalFieldsRamification.upperRamificationGroup K L` of Layer 3.

(Jean-Pierre Serre, [Local Fields](#reference-serre-local-fields), IV §3, Proposition 14.)
(Jean-Pierre Serre, [Sur les corps locaux à corps résiduel algébriquement
clos](#reference-serre-1961), n° 3.1, formula (5) with properties a–d′ of the functions φ and ψ,
printed p. 127, and Propositions 3 and 4, printed p. 128, for totally ramified `L/K`.)

*Proof.* The analytic facts are Tau Ceti's proofs in
`TauCeti/NumberTheory/LocalField/Herbrand/Basic.lean`: the integrand is the antitone step function
`#G_t/#G_0`, equal to `1` on `(−1, 0]` and bounded below by `1/#G_0`. This positive lower bound
makes the integral tend to infinity for every finite action. Eventual equality with `1/#G_0`
holds for the faithful separated DVR action of 3a.1. These arguments carry over to the
local-ring carrier, and agreement holds because
`TauCeti.LocalFieldsRamification.lowerRamificationGroup` is defined as the local-ring filtration.
Integrality of `ψ(n)` is the finite-sum formula together with Lagrange's theorem, as in Layer 3's
`TauCeti.LocalFieldsRamification.coe_psiNat`. For Herbrand's theorem, the lower index of a class `s ∈ G/H` is
`(1/e(L/K′)) Σ_(σ ∈ s) lowerIndex B σ`, computed at generators of `B` over `A` and of the integer
ring of `K′` over `A` (3a.1); the truncated count `TauCeti.IsLocalRing.sum_min_lowerIndex_natCast`
turns this into Herbrand's lemma `(G/H)_(φ_(L/K′)(u)) = G_u H/H`. Comparing the slopes of both
sides of the lemma gives tower transitivity, and the lemma with transitivity gives the theorem in
upper numbering. The intersection formula follows from `H_i = H ∩ G_i` of 3a.1 and transitivity.

*Needs:* 3a.1; Mathlib `intervalIntegral` and `IsGalois.normalAutEquivQuotient`; Tau Ceti
`TauCeti.IsLocalRing.ramificationGroupReal` and `TauCeti.IsLocalRing.sum_min_lowerIndex_natCast`;
Layer 3 (Herbrand functions and the upper numbering, for the local-field instance).

**Checks.**

- For the Artin–Schreier extension `y^p − y = t⁻¹` of `k((t))`, `k` perfect, `φ(u) = u` for
  `−1 ≤ u ≤ 1` and `φ(u) = 1 + (u − 1)/p` for `u ≥ 1`; the only upper jump is `1`, and
  `ψ(2) = p + 1`.
- For `K(ζ_p)/K` with `K = Frac W(F̄_p)` and `p` odd, `φ(u) = u/(p − 1)` for `u ≥ 0`, and
  `ψ(1) = p − 1` is an integer although `φ(1) = 1/(p − 1)` is not.
- If `G_0 = 1`, then `φ` and `ψ` are the identity and `G^v = 1` for every `v > −1`.
- For the trivial action of `C_2` on `ℤ_2`, all lower groups are `C_2` and the density is
  constantly `1`, not eventually `1/2`; nevertheless `φ` and `ψ` are the identity.
- For `M = ℚ_2(ζ_8)` and `L = ℚ_2(√2)` over `K = ℚ_2`, `ψ_(L/K)(3) = 4` and
  `ψ_(M/L)(4) = 7 = ψ_(M/K)(3)`, while `ψ_(L/K)(ψ_(M/L)(3)) = ψ_(L/K)(5) = 8`: composing in the
  other order is wrong.

#### 3a.3 Hasse–Arf over a separable residue extension

If `G` is abelian, every jump of the upper filtration `IsLocalRing.upperRamificationGroup G B`,
that is every `u` with `G^v ≠ G^u` for all `v > u`, is an integer. By the finite-sum formula of
3a.2 this says: whenever `G_j ≠ G_(j+1)` for an integer `j ≥ 0`, `#G_0` divides
`#G_1 + ⋯ + #G_j`. That lower-numbering form is stated in `Suggested.lean` as
`hasseArf_dvd_sum_card_ramificationGroup`, on Mathlib's discrete valuation rings with
`Algebra.IsInvariant A B G` and Tau Ceti's `TauCeti.IsLocalRing.ramificationGroup`. No
finiteness of the residue field is assumed; on nonarchimedean local fields the theorem is Layer 3's
`hasseArf`.

(Jean-Pierre Serre, [Local Fields](#reference-serre-local-fields), V §7, Theorem 1.)
(Jean-Pierre Serre, [Sur les corps locaux à corps résiduel algébriquement
clos](#reference-serre-1961), n° 3.4, Propositions 6 and 7, printed pp. 132–134, and n° 3.5,
Proposition 8 with its Corollary 1, printed pp. 135–136, for totally ramified abelian `L/K` with
algebraically closed residue field.) (Alexander Grothendieck, [Éléments de géométrie algébrique
III, première partie](#reference-ega-iii-1), Chapitre 0, (10.3.1) and the completion remark after
its proof, printed pp. 20–23, for the extension of the residue field.)

The following prerequisites are targets of this section.

**Residue enlargement and preservation of ramification.** For a complete DVR `R` with residue
field `κ` and a specified algebraic closure `κ̄/κ`, construct a faithfully flat local map
`R → R′` to a complete DVR with residue field `κ̄` and `𝔪_(R′) = 𝔪_R R′`. Every uniformizer of
`R` stays a uniformizer. For a totally ramified finite Galois extension `E/Frac R` with group
`H`, a uniformizer `π_E` with Eisenstein polynomial `f` gives a field
`E′ = (Frac R′)[X]/(f)` of the same degree, integral closure `R′[π_E]`, and the same Galois group.
Prove that the normalized values of `σπ_E − π_E`, the lower groups, and the Herbrand functions
are preserved: the Eisenstein generator remains a uniformizer, and expansion in its integral
power basis preserves the valuation of each displacement. Sources: EGA III, Chapitre 0,
(10.3.1), its associated-graded formula (10.3.1.5) and completion remark, printed pp. 20–23;
§3a.1's monogenic lower-index formula (Serre, *Local Fields*, IV §1, Proposition 1).

**Checks.**

- For algebraically closed `κ`, `R′ = R` satisfies the target.
- For `R = κ[[t]]`, the map to `κ̄[[t]]` keeps the uniformizer `t`; in characteristic `p`, the
  Artin–Schreier extension of §3a.1 keeps its lower break `1` and different `2(p − 1)`.
- A totally ramified tame extension of degree `e` retains `G_0` of order `e` and `G_1 = 1`;
  an unramified extension of degree greater than one splits after this base change, so the
  field-and-degree assertion requires total ramification.

**Proalgebraic units and norm-kernel components.** For a complete discretely valued field `F`
with algebraically closed residue field `κ`, construct the commutative proalgebraic unit group
`U_F` from the unit groups of its truncated valuation rings, using their perfect
quasialgebraic structures in positive residue characteristic. In residue characteristic zero,
construct a coefficient-field section `κ → 𝒪_F` and use its induced section in each finite
extension `E`. Construct closed principal-unit
subgroups, kernels, images, quotients and identity components `H⁰`, with component group
`π₀(H) = H/H⁰`. Supply right exactness of `π₀` and its compatibility with inverse limits.
The unit groups and all principal-unit subgroups are connected. For finite Galois `E/F` with
group `H`, the norm is a surjective proalgebraic morphism `U_E → U_F`. Put `V = ker N` and
`I_H U_E = ⟨σ(a)/a : σ ∈ H, a ∈ U_E⟩`. Prove `V⁰ = I_H U_E` and the canonical isomorphism
`H/[H,H] ≅ π₀(V)`, sending `σ` to the component of `σ(π_E)/π_E`, independently of `π_E`.
Sources: Serre 1961, §1, n° 1.1–1.6, printed pp. 106–113, and §2, n° 2.1–2.3, especially
Propositions 2–3 and their corollaries, printed pp. 118–120. This target includes the
specialized quasialgebraic and proalgebraic group and component-group theory used by those
statements. Use ReductiveGroups Layer 3 for finite-type closed subgroups, normal quotients and
identity components; SchemeAndStackFoundations §0.24 for perfection in characteristic `p`; and
AdicSpacesPartII §R0.19.9 for the generic pro-category and its limit–colimit Hom formula.
Identify perfect quasialgebraic groups with the perfections of the relevant smooth finite-type
groups, and realize the proalgebraic unit groups as pro-objects in that category. The
finite-stage subgroup, quotient and component constructions must agree with the supplied
ones, and the principal-unit filtration must agree with the kernels of the truncation maps.
The exactness and inverse-limit assertions for components above belong to this specialized
package. These comparisons do not require geometric reciprocity.
PadicPeriodRings uses these unit groups for its geometric reciprocity construction; its
finite-isogeny fundamental group, reciprocity map and Sen tower estimates belong there.

**Checks.**

- For `E = F`, `V = 1` and `π₀(V) = 1`; the constant pro-object has the supplied finite-type
  component group, and the identity perfection comparison is the identity.
- For `F = κ((t))`, `U_F/U_F¹ ≅ κˣ` and `U_Fⁿ/U_F^(n+1) ≅ (κ,+)` for `n ≥ 1` are connected,
  although a norm kernel can be disconnected.
- In characteristic `p`, for `E/F` given by `y^p − y = t⁻¹`, `π₀(V) ≅ C_p`: connectedness of
  `U_E` and `U_F` does not imply connectedness of the norm kernel.

**Graded norms and filtered norm-kernel components.** Keep the preceding algebraically closed
residue field and a finite Galois `E/F` with group `H`, without assuming `H` abelian. Write
`U_Eⁿ = 1 + 𝔪_Eⁿ` for `n ≥ 1` and `U_E⁰ = U_E`. For every integer `s ≥ 0`, prove
`N(U_E^(ψ(s))) = U_Fˢ` and `N(U_E^(ψ(s)+1)) = U_F^(s+1)`, and exactness as quasialgebraic groups of
`1 → H_(ψ(s))/H_(ψ(s)+1) → U_E^(ψ(s))/U_E^(ψ(s)+1) → U_Fˢ/U_F^(s+1) → 1`,
where the first map is the uniformizer ratio and the second is induced by the norm.
Put `V_s = V ∩ U_E^(ψ(s))`. Construct the exact sequence of quasialgebraic groups
`1 → U_E^(ψ(s)+1)/U_E^(ψ(s+1)) → V_s/V_(s+1) → H_(ψ(s))/H_(ψ(s)+1) → 1`:
the first map lifts a unit by multiplying by an element of `U_E^(ψ(s+1))` to make its norm
one, and the last map uses the preceding graded norm kernel. Prove
`π₀(V_s/V_(s+1)) ≅ H_(ψ(s))/H_(ψ(s)+1)`, the bound
`#π₀(V_s) ∣ ∏_(n ≥ s) [H_(ψ(n)) : H_(ψ(n)+1)]` (only finitely many factors differ from one),
and the surjection `δ_s : H_(ψ(s)) → π₀(V_s)` given by `σ(π_E)/π_E`.
For abelian `H`, prove `H_(ψ(s)+1) = H_(ψ(s+1))`, that `δ_s` is an isomorphism, and that
`π₀(V_s) → π₀(V)` is injective. Sources: Serre 1961, n° 3.4, Propositions 6–7 with their
corollaries, printed pp. 132–135, and n° 3.5, Proposition 8(i)–(iii), printed p. 135.

**Checks.**

- For `E = F`, every graded norm is the identity and all `V_s` are trivial.
- For a tame cyclic extension of degree `e`, the depth-zero norm has kernel `μ_e`, while every
  positive-depth graded norm is bijective; `π₀(V_0) ≅ C_e` and `π₀(V_s) = 1` for `s ≥ 1`.
- In characteristic `p`, for `y^p − y = t⁻¹`, the depth-one graded norm has kernel `C_p`;
  `π₀(V_1) ≅ C_p` and `π₀(V_2) = 1`. Its additive norm polynomial is surjective over `κ = F̄_p`, whereas over
  `F_p` an additive polynomial with kernel of order `p` is not surjective on residue points.

*Proof.* A jump at `−1` is an integer. For `v ≥ 0` the upper groups of `G` are those of its
inertia group `G_0 = Gal(L/K_0)`, where `K_0` is the maximal unramified subextension: both have
the same lower groups `G_i`, `i ≥ 0`, hence the same Herbrand function on `[0, ∞)`. Because the
residue extension is separable, `L/K_0` is totally ramified, so `L = K_0(π_L)` for a root `π_L` of
an Eisenstein polynomial. Let `A′` be the completion of a flat local `A_0`-algebra, `A_0` the integer
ring of `K_0`, whose maximal ideal is generated by `𝔪_(A_0)` and whose residue field is an
algebraic closure of `k`; it exists by EGA (10.3.1) and is a complete discrete valuation ring with
the same uniformizer. The Eisenstein polynomial stays Eisenstein over `A′`, so `L′ = K′(π_L)` is a
totally ramified Galois extension of `K′ = Frac A′` with group `G_0`, integer ring `A′[π_L]` and
the same values `v_L(σπ_L − π_L)`: the lower filtration, hence the upper one, is unchanged.
The proalgebraic and graded-norm targets give `π₀(V) ≅ G_0` in the abelian case. Its order,
together with the bound on `#π₀(V_0)`, forces `G_(ψ(s)+1) = G_(ψ(s+1))` for every integer
`s ≥ 0`: a strict inclusion would make the product of graded indices smaller than `#G_0`.
A lower jump `m` with nonintegral `φ(m)` would lie between `ψ(s)` and `ψ(s+1)` and contradict
that equality (Serre 1961, n° 3.5, Corollary 1 to Proposition 8). The finite-residue proof of
Layer 3 counts indices of norm groups and does not apply here.

*Needs:* 3a.1; 3a.2; this section's residue-enlargement, proalgebraic-unit and filtered
norm-kernel targets; Layer 3 (`hasseArf`, for agreement); Mathlib `Polynomial.IsEisensteinAt`
and its irreducibility criterion, and adic completion of a Noetherian local ring.

**Checks.**

- On `ℚ_2(ζ_8)/ℚ_2` the lower jumps are `1` and `3`, with `φ(1) = 4/4 = 1` and
  `φ(3) = (4 + 2 + 2)/4 = 2`. At the non-jump `j = 2` the quotient `(4 + 2)/4` is not an integer:
  divisibility is asserted only at jumps.
- For every perfect `k` of characteristic `p`, including `F̄_p`, the Artin–Schreier extension
  `y^p − y = t⁻¹` of `k((t))` has its single upper jump at the integer `1`.
- A tamely ramified `L/K` with `G_0 ≠ 1` has its only nonnegative jump at `0`, and `L = K` has none.
- Commutativity cannot be dropped: for the quaternion extension of Serre's *Local Fields*, IV §3,
  Exercise 3, cited in Layer 3, the upper jumps are not all integers.

### Layer 4: the tame quotient of the absolute Galois group

**Suppliers.** For the group theory of this layer, `Suggested.lean` imports Tau Ceti's
profinite Sylow, presentation and profinite-integer modules directly. These implement the
ProfiniteProPGroups contract; its roadmap-facing predicates are reducible aliases of the same
`TauCeti.IsProP` and `TauCeti.IsProPSylow`. No supplied group-theoretic
declaration is restated: there is no `Supplied.*` alias and no private replacement carrier for the
pro-`p`, Sylow, free-group or presentation API. For the Galois theory of the finite levels it uses
Mathlib's `FiniteGaloisIntermediateField` and `AlgEquiv.restrictNormalHom`, and Tau Ceti's Galois
correspondence for normal extensions, `TauCeti.fixingSubgroup_fixedField`
(`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean`), which covers the algebraic closure in
every characteristic.

The dependency is **type-checked, not promised**. Layer 1's `TauCeti.unitFiltration_one_isProP` is stated
against `TauCeti.IsProP` — the same statement as the inverse-limit description, not a
rephrasing of it — and Layer 4 consumes its suppliers with **closed** proofs: the uniqueness of
wild inertia as the pro-`p` Sylow subgroup of inertia is
`TauCeti.IsProPSylow.eq_of_normal` applied, and the uniqueness of the marked Iwasawa
presentation and of its coordinate is `TauCeti.presentedProfiniteGroup.hom_ext_of` applied. A
rename, a carrier change or a changed hypothesis in a supplier breaks this build rather than being
absorbed silently.

**Contract audit.** The group-theoretic and Galois-theoretic declarations this roadmap consumes
include the following canonical interfaces:

| Used in | Declaration |
| --- | --- |
| Layer 1, and inside `IsProPSylow` | `TauCeti.IsProP` |
| Layer 4, wild inertia | `TauCeti.exists_isProPSylow`, `TauCeti.IsProP.exists_le_isProPSylow`, `TauCeti.IsProPSylow.eq_of_normal`, `TauCeti.IsProPSylow.map_of_surjective` |
| Layer 4, the Iwasawa presentation | `TauCeti.freeProfiniteGroup` with `of` and `lift`; `TauCeti.presentedProfiniteGroup` with `of`, `lift`, `hom_ext_of` and `congr` |
| Layers 2 and 4, the unramified coordinate | `TauCeti.zHat`, `TauCeti.zHat.gen`, `TauCeti.maximalUnramifiedExtension`, `TauCeti.maximalUnramifiedFrobenius`, `TauCeti.maximalUnramifiedGaloisGroupEquivZHat` and `TauCeti.restrictMaximalUnramifiedHom` |
| Layer 4, inertia and Frobenius lifts | `TauCeti.inertiaSubgroup`, `TauCeti.IsArithFrobeniusLift`, `TauCeti.unramifiedQuotient`, `TauCeti.unramifiedDegree` and `TauCeti.quotientInertiaSubgroupEquiv` |
| Layer 4, the tame character | `TauCeti.inertiaTameCharacter` and `TauCeti.quotientWildInertiaSubgroupEquiv` |
| Layer 4, the marked presentation | `TauCeti.tameQuotientEquiv`, wrapped by `markedTameQuotientEquiv`; native `TauCeti.IwasawaGroup`, `TauCeti.iwasawaCoordinate` and `TauCeti.iwasawaGeometricEquiv` |
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
  Layer 0.III builds from that of `K` (`TauCeti.finiteIntermediateFieldValuativeRel`,
  `TauCeti.finiteIntermediateFieldTopology`), and `finiteGaloisLowerRamificationGroup K L i` is the lower
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
  (the coset description for arithmetic Frobenius lifts), and each of them generates `G_K`
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
  characterizing statement is `mem_wildInertia_iff`. The subgroup `wildInertia` is a reducible
  alias of `TauCeti.wildInertiaSubgroup`, and its finite-level characterization adapts the
  canonical normal-subextension characterization to finite Galois intermediate fields. `P_K` is a closed normal
  subgroup of `G_K` (`wildInertia_isClosed`, `wildInertia_normal`), by the native closedness
  and normality theorems: restriction is
  continuous into each finite discrete `Gal(L/K)`, and each `G_1(L/K)` is normal. Closedness is
  what makes the tame quotient `G_K/P_K` Hausdorff, hence profinite. Define the maximal tamely
  ramified extension `K^{t}` (`maximalTame`) as the separable part of the fixed field of `P_K`,
  that is, the fixed field intersected with `separableClosure K K^{al}`. This is the
  characterization of the canonical `TauCeti.maximalTameExtension`, of which `maximalTame`
  is a reducible alias. ⚠ The intersection is part
  of the definition: in characteristic `p` the fixed field of every subgroup of `G_K` contains the
  purely inseparable closure of `K`, while `K^{t}` is separable over `K`. Then
  `P_K = Gal(K^{al}/K^{t})` (`fixingSubgroup_maximalTame`) is the canonical fixing-subgroup
  characterization.
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
      `TauCeti.exists_isProPSylow`,
      `TauCeti.IsProP.exists_le_isProPSylow`,
      `TauCeti.IsProPSylow.eq_of_normal`, and
      `TauCeti.IsProPSylow.map_of_surjective`.
  - *API:*
    - the subgroup `P_K` with `mem_wildInertia_iff`, and the field `K^{t}`;
    - closedness, `wildInertia_isClosed`, and normality, `wildInertia_normal`;
    - `fixingSubgroup_maximalTame`, `le_maximalTame_iff` and
      `maximalTame_eq_maximalUnramified_sup_adjoin`;
    - the image of `P_K` in a finite quotient, which is `G_1` of Layer 3
      (`map_restrictNormalHom_wildInertia`);
    - `wildInertia_le_inertia`;
    - the pro-`p` property;
    - the Sylow identification and its uniqueness consequence `wildInertia_eq_of_isProPSylow`.
  - *Source:* Serre LF IV §2; Tau Ceti `WildInertia.lean`.
  - *Checks:*
    - At a finite unramified level the images of both inertia and wild inertia are trivial.
    - At a totally ramified tame level the wild image is trivial while the inertia image has
      order `e`; the two canonical subgroups must not be identified.
    - At `ℚ_2(√2)/ℚ_2`, the wild image is the whole cyclic group of order `2`.

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
  Layer 3. The canonical map is the native `TauCeti.inertiaTameCharacter`, with values in
  `TauCeti.PrimeToPTateModule`.
  Its component formula is `TauCeti.coe_proj_inertiaTameCharacter_apply`; the induced topological
  isomorphism is `TauCeti.quotientWildInertiaSubgroupEquiv`. These are supplied by
  `TauCeti/NumberTheory/LocalField/Tame/Character.lean`. The product-coordinate existence theorem
  `tameInertiaEquiv`, indexed by `PrimesAway p`, follows after choosing compatible generators
  of prime-power roots of unity; these coordinates are not part of the choice-independent
  character.
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
  - *Source:* Serre LF IV §2; NSW (7.5.2); Tau Ceti `Tame/Character.lean`.
  - *Checks:*
    - Replacing a uniformizer by a unit times that uniformizer leaves the character
      unchanged, because the prime-to-`p` Kummer characters of units vanish.
    - Two `m`-th roots differ by an `m`-th root of unity fixed by inertia, so both give
      the same component `σ(α)/α`.
    - For `K = ℚ_2`, the level-`3` character is sent to its square by arithmetic
      Frobenius; a choice of product coordinates does not change this intrinsic twist.

- **The Iwasawa presentation.** Prove that tame inertia is procyclic, topologically generated by
  the class of an element of inertia: `exists_topologicalClosure_zpowers_eq_tameInertia` gives a
  `τ` together with `τ ∈ I_K` and the equality of the closed subgroup generated by its class with
  `I_K/P_K`. The membership is part of that theorem. It holds because `I_K/P_K` is the image of
  `I_K`, so a generator has a lift in `I_K`, and two lifts of one class differ by an element of
  `P_K ≤ I_K` (`wildInertia_le_inertia`). No canonical `τ` is intended. For an arithmetic
  Frobenius lift `σ` and an element `τ : inertia K`, with
  `hτ : (Subgroup.zpowers (TauCeti.inertiaTameCharacter K τ)).topologicalClosure = ⊤`, the canonical
  `TauCeti.tameQuotientEquiv` gives the topological isomorphism
  `markedTameQuotientEquiv K σ τ hσ hτ` from `G_K/P_K` onto
  `TauCeti.IwasawaGroup K = presentedProfiniteGroup (ULift (Fin 2)) {σ τ σ⁻¹ τ^{−q}}`,
  the profinite presentation `⟨σ, τ | σ τ σ⁻¹ = τ^q⟩`,
  **marked** by its values `σ̄ ↦ of 0` and `τ̄ ↦ of 1`. These two values determine it, because the
  generators generate the presented group topologically
  (`TauCeti.presentedProfiniteGroup.hom_ext_of`, applied to the inverse), so it involves no choice
  beyond `σ` and `τ`. The coordinate `TauCeti.iwasawaCoordinate : TauCeti.IwasawaGroup K → Ẑ`, `of 0 ↦ zHat.gen`,
  `of 1 ↦ 1`, is the native coordinate with the matching universe for `TauCeti.zHat`. The coordinate descends from the free profinite group because
  `gen · 1 · gen⁻¹ · 1^{−q} = 1`. The uniqueness statements are `iwasawaCoordinate_unique` and
  `tameQuotientEquiv_unique`. Its kernel is `⟨⟨of 1⟩⟩`, the closed normal
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
    - `TauCeti.iwasawaRelator`, `TauCeti.IwasawaGroup` and its marked generators `TauCeti.iwasawaSigma`, `TauCeti.iwasawaTau`;
    - `markedTameQuotientEquiv` with its two computation rules;
    - the two choice-free consequences;
    - `TauCeti.iwasawaCoordinate`, its values and kernel, and
      its comparison with the unramified coordinate;
    - `tameQuotientPresentation`.
  - *Source:* NSW (7.5.2) and (7.5.3), after Iwasawa. The hypotheses are that `K` is a
    nonarchimedean local field with finite residue field of order `q`. *False generalization:* the
    analogous presentation of `G_K` itself is false. For a finite extension `K/ℚ_p`, the separate
    **Local Galois Groups** export `LocalGaloisGroups.rank_absoluteGaloisGroup` computes its rank
    as `[K:ℚ_p] + 2`. This roadmap makes no full-group rank claim in equal characteristic; a
    characteristic-`p` analogue requires a separately stated theorem and hypotheses.
  - *Implementation:* the relator, presentation, coordinate and geometric translation use
    the native declarations in Tau Ceti's `Tame/Presentation.lean` and `Tame/Geometric.lean`.
    `markedTameQuotientEquiv` wraps `TauCeti.tameQuotientEquiv` with explicit `K`, `σ` and `τ`;
    its computation rules and the coordinate comparisons apply the native theorems.
  - *Checks:*
    - The Frobenius and tame generators have coordinate values `zHat.gen` and `1`, respectively.
    - Changing the Frobenius lift multiplies its class by tame inertia and leaves its coordinate
      unchanged; both lifts land in the marked Frobenius coset.
    - The geometric generator has coordinate `zHat.gen⁻¹`, distinguishing the two markings of
      the same unmarked presentation.
- **Translation lemmas.** Define the geometric relator `σ⁻¹ τ σ τ^{−q}` (`TauCeti.iwasawaRelatorGeometric`)
  and the isomorphism of presented groups `σ ↦ σ⁻¹`, `τ ↦ τ` (`TauCeti.iwasawaGeometricEquiv`), built by
  `TauCeti.presentedProfiniteGroup.congr` from the involution of the free profinite group that
  inverts `of 0` and fixes `of 1`, with its two computation rules. Composed with
  `markedTameQuotientEquiv`, it sends the class of the geometric Frobenius `σ⁻¹` to the generator `of 0`
  of the geometric presentation, and `TauCeti.iwasawaCoordinate` gives that generator the value
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

### Layer 4a: the absolute upper filtration over a perfect residue field

Keep the setting of Layer 3a and assume the residue field `k` perfect, of characteristic `p ≥ 0`,
so that every finite extension of `K` has separable residue extension. `G_K` is
`Field.absoluteGaloisGroup K` with the Krull topology, the ambient model of Layer 4. Its finite
levels are the `M : FiniteGaloisIntermediateField K (AlgebraicClosure K)`, each with integer ring
the integral closure of `A` in `M` and with the filtrations of Layer 3a.

#### 4a.1 The absolute upper filtration, inertia and wild inertia

For real `u ≥ −1` let `G_K^u` (`absoluteUpperRamificationGroup K u`) be the set of `σ ∈ G_K`
whose restriction to every finite Galois `M/K` lies in `Gal(M/K)^u`, and put
`G_K^(u+) = closure(⋃_(w > u) G_K^w)`. Each `G_K^u` is a closed normal subgroup, the family is
antitone, restriction maps `G_K^u` onto `Gal(M/K)^u` for every `M`, `G_K^(−1) = G_K`, and the
intersection of all `G_K^u` is trivial. `G_K^0` is inertia `I_K`, the fixing subgroup of the
maximal unramified extension `K^ur` (the compositum of the finite subextensions with `e = 1`).
`G_K^(0+)` is wild inertia `P_K`, the inverse limit of the finite `G_1`; it is pro-`p` when
`p > 0` and trivial when `p = 0`. On a nonarchimedean local field, `G_K^0` and `G_K^(0+)` are
Layer 4's `inertia` and `wildInertia`.

(Jean-Pierre Serre, [Sur les corps locaux à corps résiduel algébriquement
clos](#reference-serre-1961), n° 3.1, the paragraph after Proposition 3, printed p. 128.)

*Proof.* By Herbrand's theorem (3a.2), restriction maps `Gal(M′/K)^u` onto `Gal(M/K)^u` for
`M ⊆ M′`, so `G_K^u` is the inverse limit of these nonempty finite sets along surjections; it is
closed, and it maps onto each of them. Normality and antitonicity hold at every finite level. A
`σ ≠ 1` moves an element of some finite `M`, and `Gal(M/K)^u = 1` for large `u`. `Gal(M/K)^0` is
the inertia group of `M/K`, whose fixed field is the maximal unramified subextension of `M`, so
`σ ∈ G_K^0` exactly when `σ` fixes every finite unramified subextension. For small `w > 0`,
`Gal(M/K)^w = G_1(M/K)`, so `G_K^(0+)` and `P_K` are closed subgroups with the same image `G_1` in
every finite quotient, hence equal; each `G_1` is a `p`-group by 3a.1. On a nonarchimedean local
field these are the definitions of Layer 4's `inertia` (Tau Ceti's `TauCeti.inertiaSubgroup`) and
`wildInertia`.

*Needs:* 3a.1; 3a.2; Layer 4 (the ambient model, `inertia` and `wildInertia`); Mathlib
`Field.absoluteGaloisGroup`, `FiniteGaloisIntermediateField`, `AlgEquiv.restrictNormalHom` and
`InfiniteGalois.restrictNormalHom_continuous`.

**Checks.**

- The image of `G_(ℚ_2)^u` in `Gal(ℚ_2(ζ_8)/ℚ_2) = (ℤ/8)ˣ` is everything for `u ≤ 1`, `{1, 5}` for
  `1 < u ≤ 2`, and trivial for `u > 2`.
- If `k` is algebraically closed, then `K^ur = K` and `G_K = G_K^0 = I_K`.
- For odd `p` and `K = Frac W(F̄_p)`, the tame extension `K(ζ_p)/K` shows `G_K^(0+) ≠ G_K^0`: `I_K`
  maps onto `Gal(K(ζ_p)/K)`, of order `p − 1`, while `P_K` maps to `G_1 = 1`.

#### 4a.2 Finite separable extensions: ψ_(L/K) and the open-subgroup identity

For a finite separable `L/K` inside `AlgebraicClosure K`, with `G_L ≤ G_K` the open subgroup
fixing `L`, and a finite Galois `M/K` containing `L`, define `ψ_(L/K) = φ_(M/L) ∘ ψ_(M/K)` on
`[−1, ∞)` and `φ_(L/K)` its inverse. Prove:

- `ψ_(L/K)` does not depend on `M`, agrees with 3a.2 when `L/K` is Galois, is continuous, strictly
  increasing, piecewise linear and the identity on `[−1, 0]`, and `ψ_(N/K) = ψ_(N/L) ∘ ψ_(L/K)` for
  every finite separable `N ⊇ L`;
- the open-subgroup identity `G_K^u ∩ G_L = G_L^(ψ_(L/K)(u))` for every `u ≥ −1`;
- `ψ_(L/K)(u) = (1/f) ∫_0^u [G_K : G_K^t G_L] dt` for `u ≥ 0`, with `f = f(L/K)`.

(Jean-Pierre Serre, [Sur les corps locaux à corps résiduel algébriquement
clos](#reference-serre-1961), n° 3.1, Proposition 4 and the Remarque after it, printed p. 128.)
(Jean-Pierre Serre, [Local Fields](#reference-serre-local-fields), IV §1, Proposition 2.)

*Proof.* For `M ⊆ M′` both Galois over `K`, tower transitivity (3a.2) for `M′ ⊇ M ⊇ L` and for
`M′ ⊇ M ⊇ K` gives
`φ_(M′/L) ∘ ψ_(M′/K) = φ_(M/L) ∘ φ_(M′/M) ∘ ψ_(M′/M) ∘ ψ_(M/K) = φ_(M/L) ∘ ψ_(M/K)`, and
any two choices of `M` lie in a common one; the other properties follow from those of the
Galois functions. At a finite level `M`, the subgroup formula of 3a.1 gives
`Gal(M/K)^u ∩ Gal(M/L) = Gal(M/L)_(ψ_(M/K)(u))`, which is `Gal(M/L)^(ψ_(L/K)(u))` by the
definition of `ψ_(L/K)`; the open-subgroup identity is its limit over `M`. For the integral
formula, write `G = Gal(M/K)` and `H = Gal(M/L)`: by the identity
`G^t ∩ H = H^(ψ_(L/K)(t))`, away from the finitely many jumps the derivative of
`φ_(M/L) ∘ ψ_(M/K)` at `t` is `[G^0 : G^t] · #H^(ψ_(L/K)(t)) / #H^0`, which equals
`[G : G^t H]/f` because `#G^0/#H^0 = e(L/K) = [L : K]/f`.

*Needs:* 4a.1; 3a.1; 3a.2; Mathlib `IntermediateField.fixingSubgroup`; Tau Ceti
`TauCeti.fixingSubgroup_fixedField`.

**Checks.**

- For finite unramified `L/K`, `ψ_(L/K)(u) = u` and `G_K^u ∩ G_L = G_L^u`.
- For totally tamely ramified `L/K` of degree `e`, `ψ_(L/K)(u) = eu` for `u ≥ 0`, so
  `G_K^u ∩ G_L = G_L^(eu)`; for `L = K` both sides are `G_K^u`.
- For `K = ℚ_3` and `L = ℚ_3(ζ_3)`, `ψ_(L/K)(u) = 2u` for `u ≥ 0`. The extension
  `ℚ_3(ζ_9)/ℚ_3(ζ_3)` is cyclic of order `3` with upper jump `2`, so the image of `G_K^(3/2) ∩ G_L`
  in its Galois group is trivial while that of `G_L^(3/2)` is the whole group: the identity needs the
  shifted index `G_L^3`.

#### 4a.3 Completed maximal unramified base change

Let `K′` be the completion of `K^ur` for the unique extension of the valuation. Then `K′` is
complete for a discrete valuation with `e(K′/K) = 1` and residue field an algebraic closure of
`k`. Prove that `L₀ ↦ L₀ ⊗_(K^ur) K′` is an equivalence from finite separable extensions of `K^ur`
to finite separable extensions of `K′`, so that restriction is a topological isomorphism
`G_(K′) ≅ I_K`. For a finite separable `L/K` and an embedding of `L` in a separable closure of `K′`,
put `L′ = LK′`; prove `e(L′/K′) = e(L/K)` and `d(L′/K′) = d(L/K)`, so the normalized differents
`d/e` agree. For `L/K` Galois, `Gal(L′/K′)` is identified with the inertia group `G_0(L/K)`, with
`G_i(L′/K′) = G_i(L/K)` for `i ≥ 0` and `G^v(L′/K′) = G^v(L/K)` for `v ≥ 0`; under `G_(K′) ≅ I_K`,
`G_(K′)^v` corresponds to `G_K^v` for every `v ≥ 0`. This holds in both characteristics. The
residue degree and the full Galois group of `L/K` are not preserved.

This section owns the completed field and its valuation and residue-field properties on the
general perfect-residue domain. ReductiveGroupsPartII §RG2.0.4 uses the finite-residue
specialization through its finite-residue adapter MaxUnramifiedCompletion.Breve. That adapter
identifies the field maps, valuation and uniformity, residue-field algebraic closure and
preserved uniformizers with this construction. ReductiveGroupsPartII owns the extended
arithmetic Frobenius and its fixed-field results on that domain.

(Olivier Brinon and Brian Conrad, [CMI summer school notes on p-adic Hodge
theory](#reference-brinon-conrad), Exercise 1.4.4(3), printed p. 10, and the proof of
Lemma 13.1.6, printed p. 201, in mixed characteristic.)

*Proof.* `K^ur` carries the unique prolongation of the valuation (3a.1), so it is henselian, and it
is dense in `K′`. Krasner's lemma (Mathlib's `IsKrasner.of_completeSpace`) shows that a finite
separable extension of `K′` is generated by a root of a separable polynomial over `K^ur` close to a
defining polynomial, so the functor is essentially surjective; henselianity makes `K^ur`
separably closed in `K′`, so it is fully faithful. The argument uses only separability and
completeness, so it applies in equal characteristic as well. For `L/K` Galois with
`K_0 = L ∩ K^ur`, `L/K_0` is totally ramified, `L = K_0(π_L)` for an Eisenstein `π_L`, and the
Eisenstein polynomial stays Eisenstein over the integer ring of `K′` because `e(K′/K_0) = 1`. Hence
the integer ring of `L′` is generated by `π_L`, the values `v_L(σπ_L − π_L)` are unchanged, and the
lower filtration of `G_0(L/K) = Gal(L/K_0) ≅ Gal(L′/K′)`, the Herbrand function on `[0, ∞)`, the
upper groups at `v ≥ 0` and, by Hilbert's formula, the different agree. A finite separable `L` is
handled through a Galois closure, and the absolute statement is the limit over `M`, by 4a.1.

*Needs:* 3a.1; 3a.2; 4a.1; Mathlib `UniformSpace.Completion`, `IsKrasner.of_completeSpace`,
`Polynomial.IsEisensteinAt` and `differentIdeal`.

**Checks.**

- Completed maximal unramified base change of `ℚ_3(ζ_9)/ℚ_3` keeps `e = 6`, the lower groups
  `#G_0 = 6`, `#G_1 = #G_2 = 3`, `G_3 = 1`, the different `d = 9`, the normalized different
  `d/e = 3/2` and the upper jumps `0` and `1`.
- A finite unramified `L/K` becomes trivial over `K′`, keeping `G_0 = 1` and `d = 0`, while its
  Galois group and its residue degree are lost.
- For a finite residue field `K^ur` is not complete (Brinon–Conrad, Exercise 1.4.4(2), printed
  p. 10), so the comparison is made with `K′`, not with `K^ur`.

## Worked examples

The acceptance suite includes `ℚ_2`, its unramified quadratic extension, the totally ramified
quadratic extension generated by `√2`, and the dyadic cyclotomic tower generated by `μ_8`.
The following finite-field controls use native theorems and named targets in `Suggested.lean`;
their sources and hypotheses are those of Layers 1–3.

| Target | Mathematical control |
| --- | --- |
| `TauCeti.card_squareClasses_padic_two` | `ℚ_2` has eight square classes. |
| `padicUnit_square_of_eight_dvd_sub_one` | Every `2`-adic unit congruent to `1` modulo `8` is a square. |
| `unramifiedQuadratic_finrank` | Adjoining the cube roots of unity to `ℚ_2` has degree `2`. |
| `unramifiedQuadratic_unit_norm` | Every `2`-adic unit is represented by `x² − 5y²` over `ℤ_2`. |
| `two_not_norm_unramifiedQuadratic` | The equation `x² − 5y² = 2` has no solution over `ℚ_2`. |
| `ramifiedQuadratic_finrank` | Adjoining the square roots of `2` to `ℚ_2` has degree `2`. |
| `dyadicCyclotomic_finrank` | Adjoining the eighth roots of unity to `ℚ_2` has degree `4`. |

These controls exercise normalization, norm groups, lower and upper numbering, and the
tame quotient; they are regression tests for conventions rather than substitutes for the
generic theorems. Layers 3a and 4a add two fields with infinite residue field `F̄_p`: the
Artin–Schreier extension `y^p − y = t⁻¹` of `F̄_p((t))`, with its break at `1` and different
exponent `2(p − 1)`, and the tame extension `Frac W(F̄_p)(ζ_p)` of `Frac W(F̄_p)`.

## Dependency order

The external abstract dependency order is **[Continuous Cohomology of Profinite
Groups](../ProfiniteCohomology/README.md) → [Profinite and Pro-`p`
Groups](../ProfiniteProPGroups/README.md), consumed through Tau Ceti's native predicates and
Sylow theorems → this roadmap**. Within this roadmap the intended order is
Layer 0 → Layer 1 → Layer 2 → Layer 3 → Layer 3a → Layer 4 → Layer 4a. Later work may proceed
against explicit hypotheses, but the accepted exports use the canonical objects produced by the
preceding layers.

## Material extracted from the former local-fields portfolio

Finite-group Tate cohomology, local class formations, reciprocity, and Tate duality now belong
to **Class Field Theory**. The maximal pro-`p` quotient `G_K(p)`, its generator rank, the
roots-of-unity dichotomy, and its Demushkin presentation now belong to **Local Galois Groups**.
This roadmap retains the local arithmetic and ramification inputs on which both depend.

## References

The mathematical spine is Serre, *Local Fields*; Neukirch, *Algebraic Number Theory*;
Neukirch–Schmidt–Wingberg, *Cohomology of Number Fields*; and Ribes–Zalesskii,
*Profinite Groups*. The sources cited by number in Layers 3a and 4a follow.

<a id="reference-serre-local-fields"></a>

### Source: Serre, *Local Fields*

Jean-Pierre Serre, *Local Fields*, Graduate Texts in Mathematics 67, Springer, 1979, the
translation of *Corps locaux*, Hermann, 1962. Located by chapter, section and statement number.

<a id="reference-serre-1961"></a>

### Source: Serre, *Sur les corps locaux à corps résiduel algébriquement clos*

Jean-Pierre Serre, [Sur les corps locaux à corps résiduel algébriquement
clos](http://www.numdam.org/item?id=BSMF_1961__89__105_0), Bulletin de la Société Mathématique de
France 89 (1961), 105–154. Located by numbered paragraph and printed page; its n° 3.1 treats
totally ramified extensions of an arbitrary complete discretely valued field, and from n° 3.2 on
it assumes an algebraically closed residue field.

<a id="reference-ega-iii-1"></a>

### Source: Grothendieck, *Éléments de géométrie algébrique III, première partie*

Alexander Grothendieck, [Éléments de géométrie algébrique : III. Étude cohomologique des faisceaux
cohérents, première partie](http://www.numdam.org/item?id=PMIHES_1961__11__5_0), Publications
mathématiques de l'IHÉS 11 (1961), 5–167. Located by the numbering of Chapitre 0 and printed page.

<a id="reference-brinon-conrad"></a>

### Source: Brinon–Conrad, *CMI summer school notes on p-adic Hodge theory*

Olivier Brinon and Brian Conrad, [CMI summer school notes on p-adic Hodge
theory](https://math.stanford.edu/~conrad/papers/notes.pdf), 2009, the authors' posted notes.
Located by exercise or lemma number and printed page.

## Existing implementation audit: `LRubia/LeanBridge`

The directory
[LeanBridge/PadicField](https://github.com/LRubia/LeanBridge)
was audited at revision `22c093c1c5de577acebe74cf76bb33d7d2734a6c`. At that revision the
repository is Apache-2.0 and the six files `Basic.lean`, `Ramification.lean`,
`Monogenicity.lean`, `TraceFiltration.lean`, `DiffExp.lean`, and `Test.lean` are sorry-free.

Porting proofs requires coordination with the authors and preservation of the Apache-2.0
notices and attribution. The mathematical targets use the canonical valuative carriers below.

The declaration-level overlap is:

| LeanBridge declarations at the audited revision | Roadmap destination and disposition |
|---|---|
| `PadicField.ringOfIntegers`, `PadicField.valuation`, `valuation_le_one_iff_isIntegral`, `ringEquiv_valuation_integer`, and the `ValuativeRel`, `IsValuativeTopology`, and `IsNonarchimedeanLocalField` instances | Adapt the proofs to the roadmap's `ValuativeRel`, `ValuativeExtension`, `𝒪[K]`, and `IsNonarchimedeanLocalField` carriers. The bespoke `PadicField` class is not exported. |
| `PadicField.Extension.ramificationIdx`, absoluteRamificationIndex, `inertiaDeg`, `PadicField.Extension.absoluteRamificationIndex_eq`, `ramificationIdx_mul_inertiaDeg`, and `map_maximalIdeal_eq_pow_ramificationIdx` | Tau Ceti implements these destinations on the valuative carriers (`TauCeti.ramificationIndex`, `TauCeti.absoluteRamificationIndex`, `TauCeti.inertiaDegree`, their tower laws, `TauCeti.ramificationIndex_mul_inertiaDegree` and `TauCeti.map_maximalIdeal_eq_maximalIdeal_pow`); nothing is ported. |
| `mono_exists_primitive` and its supporting Newton-lift declarations | Tau Ceti supplies monogenicity in `Monogenic.lean`; the native `TauCeti.exists_integerRing_adjoin_eq_top` applies to `𝒪[K] → 𝒪[L]`. No LeanBridge proof or second local-field API is needed. |
| `TraceFiltration.intTrace_residue_scaling` | Reuse or adapt as the residue-trace input to tame/wild different bounds, behind the public different theorems. |
| `PadicField.Extension.differentExponent`, `ramificationIdx_sub_one_le_differentExponent`, `ramificationIdx_le_differentExponent_of_dvd`, `PadicField.Extension.differentExponent_tame`, `discExponent_eq_inertiaDeg_mul_differentExponent`, and `discExponent_tame` | Tau Ceti implements these destinations (`TauCeti.differentExponent`, `TauCeti.ramificationIndex_sub_one_le_differentExponent`, `TauCeti.ramificationIndex_le_differentExponent_iff`, `TauCeti.differentExponent_eq_ramificationIndex_sub_one_iff`, `TauCeti.discriminantExponent_eq_inertiaDegree_mul_differentExponent` and `TauCeti.discriminantExponent_eq_inertiaDegree_mul_ramificationIndex_sub_one_iff`); nothing is ported. The global discriminant consequences stay in [the Number-Field Arithmetic roadmap](../../Completed/NumberFieldArithmetic/README.md). |

For every adapted proof, the implementation record must identify the LeanBridge declaration and
revision or say explicitly that the proof was replaced. Regardless of implementation source,
`ValuativeRel`, `ValuativeExtension`, and `IsNonarchimedeanLocalField` remain the only public
local-field carriers in this roadmap.
