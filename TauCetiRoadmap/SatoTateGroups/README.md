# Roadmap: Sato–Tate groups

A Sato–Tate group is the compact Lie group that is conjectured to govern the distribution of the
normalized Euler factors of an arithmetic L-function: a closed subgroup `G` of the unitary group
`U(d)` together with the pushforward of its Haar probability measure to the space of characteristic
polynomials. For an abelian variety `A` of dimension `g` over a number field `k` it is a closed
subgroup `ST(A)` of the unitary symplectic group `USp(2g)`, obtained from the `ℓ`-adic Galois
representation on the Tate module, and the Sato–Tate conjecture says that the normalized
characteristic polynomials of Frobenius at the primes of good reduction, ordered by norm, are
equidistributed for that pushforward. Fité, Kedlaya, Rotger and Sutherland isolated three axioms
that such a group satisfies — it is closed in `USp(d)` or `O(d)` according to the parity of the
weight, it contains a Hodge circle whose conjugates generate a dense subgroup of the identity
component, and every component has integral moments — and classified the groups satisfying them in
degree `4`: fifty-five, of which fifty-two are Sato–Tate groups of abelian surfaces and
thirty-four occur over `ℚ`. The LMFDB's `st_group` section stores these groups, their identity
components and component groups, their moment statistics and event probabilities, their generators
and their inclusion lattice, and the `ec`, `ecnf`, `g2c` and `cmf` sections each carry a Sato–Tate
column pointing into it.

This roadmap builds that theory in three parts. The **group-theoretic part** (Layers 0–7) defines
the ambient groups, the coefficient statistics of a closed subgroup of `U(d)`, the Fité–Kedlaya–
Rotger–Sutherland axioms, and the Weyl-integration engine that computes moments; it proves the
classification in degree `2`, proves the classification of the fifty-five groups in degree `4`
together with every stored invariant, and states the degree-`6` classification as a theorem whose
proof is a checked certificate against the stored list of `410` groups. The **arithmetic part**
(Layers 8–9) supplies the vocabulary the `g2c` endomorphism columns use — endomorphisms over `k`
and over `k̄`, the endomorphism field, the real geometric endomorphism algebra, the predicates
simple, geometrically simple, squarefree and primitive, the Galois endomorphism type — and
constructs `ST(A)` from the `ℓ`-adic image, with the dictionary between Galois endomorphism types
and the fifty-two groups in dimension `2` and the trichotomy `SU(2)`, `N(U(1))`, `U(1)` for
elliptic curves. The **equidistribution part** (Layer 10) states the Sato–Tate conjecture in
general, proves Serre's L-function criterion, and proves equidistribution for elliptic curves with
complex multiplication from the nonvanishing of Hecke L-functions.

**Carrier.** The primary object is a **closed subgroup of `U(d) = Matrix.unitaryGroup (Fin d) ℂ`**,
Mathlib's `ClosedSubgroup (Matrix.unitaryGroup (Fin d) ℂ)`, carrying the Borel σ-algebra and Tau
Ceti's Haar probability measure `TauCeti.haarProb`. Being a Sato–Tate group of given weight and
Hodge numbers is a **predicate** on that carrier, the conjunction of the three axioms, and the
LMFDB's `rational` flag is exactly the third axiom; the LMFDB's "irrational" groups (`μ(n)` for
`n > 2`, the degree-`2` families `SU(2)[C_n]` and `U(1)[D_n]` for `n > 2`) are closed subgroups of
`U(d)` with a Hodge circle that fail the first or third axiom, and they are first-class objects of
the carrier. Every statistic — moments, event probabilities, trace zero density — is defined for
every closed subgroup of `U(d)`, so that the comparison theorems of Layer 3 can say exactly which
of them the axioms make integral or rational.

Suggested home: `TauCeti/NumberTheory/SatoTate/`, with files for the ambient groups and the
coefficient map, identity components and Haar on components, the axioms, moments and event
probabilities, Weyl integration for `USp(2g)` and products, the degree-`2`, degree-`4` and
degree-`6` classifications, and — under `TauCeti/NumberTheory/SatoTate/Arithmetic/` — the
endomorphism vocabulary, the Sato–Tate group of an abelian variety and of a newform, and
equidistribution.

## Prerequisites

- **Compact groups** (Tau Ceti, built to [the compact-groups roadmap](../RepresentationTheory/CompactGroups/README.md)):
  the Haar probability measure `TauCeti.haarProb` with its bi-invariance and uniqueness, Haar
  averaging, matrix coefficients, characters and their orthogonality, the Peter–Weyl theorem and
  the character basis of the class functions, and the `SU(2)` engine: `TauCeti.SU2`, its torus
  `TauCeti.SU2.torusHom`/`torusExp`, torus conjugacy, the symmetric powers and their characters,
  and the Weyl integration formula `TauCeti.SU2.weyl_integration_formula`.
- **Lie groups** ([the Lie-groups roadmap](../RepresentationTheory/LieGroups/README.md)): the
  exponential map and its chart (Layer 0), the closed-subgroup theorem (Layer 2), maximal tori,
  the Weyl group and the general Weyl integration formula (Layer 6), maximal compact subgroups
  (Layer 9).
- **Classical groups** ([the classical-groups roadmap](../RepresentationTheory/ClassicalGroups/README.md)):
  the irreducible representations of `GL_d`, `Sp_{2g}` and `O_d` by highest weight and their
  characters as Schur and symplectic Schur polynomials (Layers 3–4), for the character form of the
  rationality axiom and for the moment matrix.
- **Root systems and Lie algebras** ([the root-systems roadmap](../RepresentationTheory/RootSystems/README.md)):
  the classification of compact Lie algebras of rank at most `3`, used to enumerate the identity
  components in degrees `4` and `6`.
- **Abelian varieties**: Tau Ceti's `TauCeti.AlgebraicGeometry.AbelianVariety K`, its
  endomorphism ring `AbelianVariety.End A`, base change `AbelianVariety.baseChange` and
  `AbelianVariety.End.baseChange`, isogenies `AbelianVariety.IsIsogeny`, built to
  [the Jacobian challenge](../JacobianChallenge/README.md) Layer E; and the arithmetic of `Hom`
  of the abelian-schemes roadmap *Abelian schemes and arithmetic moduli* (Layer A6: simple
  varieties, Poincaré reducibility, finite generation of `Hom`, semisimplicity of `End⁰`, the
  Rosati involution and its positivity, the real Rosati normal form), consumed as described
  below.
- **Elliptic curves** ([the elliptic-curves roadmap](../EllipticCurves/README.md)): Tau Ceti's
  Tate module and its continuous Galois representation
  `WeierstrassCurve.tateModuleGaloisRepresentation`, the Frobenius trace `frobeniusTrace` and the
  Hasse bound `hasse_bound`, and the CM vocabulary of its Layer 1 (`EndOver`, `GeometricEnd`,
  `HasGeometricCM`, `CMAction`).
- **Number fields and primes** ([the completed number-field roadmap](../../Completed/NumberFieldArithmetic/README.md),
  [Chebotarev](../Chebotarev/README.md)): Frobenius elements, Dirichlet and natural density, the
  Tauberian package `wienerIkehara` of Layer 12 and the natural-density Chebotarev theorem of
  Layer 14.
- **L-functions** (*L-functions — completions and functional equations*, Layers 6–7): Hecke
  L-functions of Grossencharacters and their nonvanishing on `Re s = 1`.
- **Complex multiplication** (*Complex multiplication and explicit reciprocity*, Layer 4): the
  Hecke character of a CM abelian variety and the decomposition of its Tate module into
  one-dimensional characters (Deuring's theorem).
- **Equidistribution** ([ProbabilisticAndMetricNumberTheory](../ProbabilisticAndMetricNumberTheory/README.md)
  §2.1): the predicate `AsympEquidistributed` on Tau Ceti's empirical measures, with its
  bounded-continuous criteria, uniqueness and frequency law.
- **Finite linear groups** (the sibling `FiniteGroupInvariants`, 10.5): Jordan's theorem, for the
  finiteness theorem 7.2.
- **Mathlib**: everything under *What Mathlib supplies*.

## Scope and ownership

Eight roadmaps border this one; the boundary with each is drawn below. The LMFDB boundary rule
applies throughout: a predicate invariant under conjugacy (for groups) or isomorphism and isogeny
(for abelian varieties) belongs here.

### Owned here

- The **ambient groups** `USp(d)` and `O(d)` as closed subgroups of `U(d)`, the standard
  symplectic form, torus conjugacy in `USp(2g)`, and the **coefficient map** `g ↦ (a_i(g))` to
  the coefficients of the reversed characteristic polynomial `det(1 − Tg)` (Layer 0).
- For a closed subgroup `G ≤ U(d)`: the **identity component** `G⁰`, the **component group**
  `G/G⁰` and its finiteness, the **real dimension**, the **Lie algebra**, Haar measure on each
  component, the pushforward laws of the coefficients and of the trace, and the measure on
  conjugacy classes (Layer 1).
- The **Sato–Tate axioms** — Hodge numbers, Hodge circles, the Hodge condition, the rationality
  condition in its moment and character forms, self-duality, and the Lefschetz condition — with
  their first consequences (Layer 2).
- The **statistics** the LMFDB stores: coefficient and trace moments, the moment simplex, the
  moment matrix and character diagonal, event probabilities `Pr[a_i = n]`, the trace zero density,
  the `z`-vectors, the component-counting theorem for event probabilities, and integrality (Layer 3).
- **Weyl integration for `USp(2g)`**, `U(1)^g`, `SU(2)^g` and their block products, the genus-one
  distributions (semicircle and arcsine), the `USp(4)` joint density and moment formulas, and the
  connected groups of degrees `4` and `6` with their dimensions, Hodge circles and moments
  (Layer 4).
- The **classifications**: degree `2` proved (`U(1)`, `N(U(1))`, `SU(2)`), the non-self-dual
  degree-`2` families and `μ(n)`; the **fifty-five groups of degree `4`** with explicit
  generators, the proof that they exhaust the groups satisfying the axioms, every stored
  invariant of each, their distinctness and their inclusion lattice (Layers 5–6); the
  finiteness theorem for the axioms, the fourteen connected groups of degree `6`, and the
  degree-`6` classification as checked data (Layer 7).
- The **arithmetic vocabulary**: endomorphisms over `k` and over `k̄`, the Galois action on
  `End(A_k̄)`, the **endomorphism field**, the **real geometric endomorphism algebra** and its
  finite lists of types in dimensions `≤ 3`, the predicates **geometrically simple**,
  **squarefree**, **primitive**, **isotypic**, the `g2c` classifications `end_alg`,
  `geom_end_alg`, `real_geom_end_alg`, the LMFDB's `GL₂`-type predicate for surfaces, and the
  **Galois endomorphism type** (Layer 8).
- **`ST(A)`** from the `ℓ`-adic image, the **algebraic Sato–Tate conjecture** and the
  **Mumford–Tate conjecture** as named hypotheses, the normalized Frobenius classes, the axioms
  for `ST(A)`, the component group as `Gal(K/k)`, the elliptic-curve trichotomy, the dimension-`2`
  dictionary between Galois endomorphism types and the fifty-two groups, the thirty-four groups
  over `ℚ`, **`ST(f)`** for a newform in terms of its CM status and the order of its character,
  and the **splitting field** and **endomorphism lattice** of a surface (Layer 9).
- **Equidistribution**: the pushforward and dense-subspace lemmas for the consumed predicate,
  the Weyl criterion on `Conj(G)`, **Serre's L-function criterion**, the Sato–Tate conjecture as
  a statement, Hecke's equidistribution of unitarized Grossencharacter values, and the
  **theorem for CM elliptic curves** over every number field (Layer 10).

### Consumed, not redefined

- From Tau Ceti's compact-group library (built to [CompactGroups](../RepresentationTheory/CompactGroups/README.md)):
  `TauCeti.haarProb` and `isProbabilityMeasure_haarProb`, `isMulLeftInvariant_haarProb`,
  `isMulRightInvariant_haarProb`, `isInvInvariant_haarProb`,
  `eq_haarProb_of_isHaarMeasure_of_isProbabilityMeasure` (Layer 0 of that roadmap); the
  character integral `TauCeti.integral_character_eq_finrank_invariants` (its Layer 6), the class
  functions `classFunctionLp` and the character basis `characterBasis` (Peter–Weyl, Layers 5–6);
  the engine `TauCeti.SU2` with `torusHom`, `torusExp`, `torus`, `exists_conj_mem_torus`,
  `isConj_iff_trace_eq`, `symPower`, `character_symPower_eq_chebyshevU_eval`,
  `weyl_integration_formula`, `weyl_integration_formula_normalized` and
  `integral_character_symPower_mul_conj` (its engine case). The compactness of `U(d)` and
  `SU(d)` is Tau Ceti's `TauCeti.Topology.Algebra.UnitaryGroup`, and torus conjugacy in `U(d)` is
  `TauCeti.exists_conj_mem_unitaryTorus`. None of these is restated; `USp(2)` is identified with
  `TauCeti.SU2` (0.2) and every degree-`2` statement is made on that identification.
- From [LieGroups](../RepresentationTheory/LieGroups/README.md): the exponential chart (Layer 0),
  the closed-subgroup theorem (Layer 2: a closed subgroup of a Lie group is an embedded Lie
  subgroup, with Lie algebra `{X | ∀ t, exp(tX) ∈ G}`), maximal tori, the Weyl group and the
  general Weyl integration formula `∫_G f = |W|⁻¹ ∫_T f |Δ|²` (Layer 6), and the existence and
  conjugacy of maximal compact subgroups of a complex reductive group (Layer 9). This roadmap
  specializes, never reproves.
- From [ClassicalGroups](../RepresentationTheory/ClassicalGroups/README.md): the dominant-weight
  parametrization of the irreducibles of `GL_d`, `Sp_{2g}` and `O_d` and their characters as
  (symplectic) Schur polynomials (Layers 3–4), for 2.3 and 3.3.
- From [RootSystems](../RepresentationTheory/RootSystems/README.md) and
  [LieHighestWeight](../RepresentationTheory/LieHighestWeight/README.md): the list of compact
  Lie algebras of rank `≤ 3` and the dimensions of their irreducible representations, for 6.6
  and 7.3.
- From Tau Ceti's abelian varieties (built to [JacobianChallenge](../JacobianChallenge/README.md)
  Layer E): `AbelianVariety K`, `AbelianVariety.dim`, `AbelianVariety.End A` with its ring
  structure and `mulBy`, `AbelianVariety.baseChange`, `AbelianVariety.End.baseChange`,
  `AbelianVariety.End.congr`, `AbelianVariety.IsIsogeny`, `AbelianVariety.prod`.
- From *Abelian schemes and arithmetic moduli*, Layer A6, cited by milestone number: `IsSimple`
  with `simpleEndDivision` (A6.4), Poincaré complete reducibility (A6.5), `homFreeFinite`
  (A6.7), `endQ_isSemisimple` (A6.8), `charpolyTate` (A6.11), `rosatiPositivity` (A6.14),
  `rosatiRegularRepresentation`, `realCentralDivisionAlgebra` and `realRosatiDecomposition`
  (A6.15), `reducedTraceComparison` (A6.17), the integral Tate module `T_ℓ(A)` with its Galois
  action (A4.1) and the complex uniformization of `A(ℂ)` (A5). Layer 8 below adds no second
  definition of simplicity, of `End⁰`, or of the Rosati involution.
- From *Siegel and PEL moduli problems*: `PositiveInvolution` and `PositiveInvolution.center_classification`
  (M0.1) and the Albert types `albertTypes` (M0.2), the inputs to the finite lists of real and
  rational endomorphism algebras (8.4–8.5).
- From *Abelian varieties of GL₂-type and modularity of ℚ-curves*: `GL2Type.End0 A = ℚ ⊗[ℤ] End A`
  as the rational endomorphism algebra, `GL2Type.IsSimpleOverQ`, the primitive/power dichotomy
  (GT.1/primitive), `GL2Type.endField` with `endField_finrank` and `totally-real-or-cm` (GT.1),
  and `EllipticCurve.IsQCurve` (GT.5). This roadmap's `endField` (8.2) is the general
  endomorphism field of any abelian variety over any field of characteristic zero; its
  restriction to a `ℚ`-simple `GL₂`-type variety is that roadmap's `GL2Type.endField`, and the
  agreement is a stated milestone, not an assumption.
- From *Modularity and Langlands extensions*: the group `TauCeti.SymmetricPower.SatoTateGroup a`
  `= {g ∈ U(2) : det(g)^a = 1}` with `SatoTateGroup.isCompact`, `orderOne`, `orderZero` and
  `satoTateClass` (§4.39), the Sato–Tate theorem for non-CM elliptic curves over `ℚ`
  `satoTate_elliptic` (§4.34), the conditional theorem over arbitrary number fields (§4.28) and
  the parallel-weight theorem over imaginary CM fields `bianchi_satoTate` (§4.42). This roadmap
  **states** no non-CM equidistribution theorem of its own; 9.9 and 10.7 cite those.
- From *L-functions — completions and functional equations*: `Grossencharacter K 𝔪`, its
  `unitaryWeight` and `infinityType` (Layer 6), and the nonvanishing of `L(χ, s)` on `Re s = 1`
  for every Grossencharacter outside the pure-norm-twist exception, with the continuous
  extension of the logarithmic derivative to `Re s ≥ 1` (Layer 7). Tau Ceti's
  `TauCeti.GlobalNumberFields.HeckeCharacter` is the underlying object.
- From *Complex multiplication and explicit reciprocity*, Layer 4: `cmHeckeCharacter` with
  `cmHeckeCharacter.frobenius`, `cmTateComponents` and `cmFrobeniusIdentities` (4.1): for a CM
  elliptic curve over a field containing the CM field, `V_ℓ(E) ⊗ ℚ̄_ℓ = ψ ⊕ ψ̄` and
  `a_𝔭 = ψ(𝔭) + ψ̄(𝔭)` with `|ψ(𝔭)| = N𝔭^{1/2}` (Deuring).
- From [Chebotarev](../Chebotarev/README.md): natural density of the primes with prescribed
  Frobenius in a quadratic extension (Layer 14) and the Tauberian theorem `wienerIkehara` it
  consumes from Arithmetic Dirichlet Series (Layer 12).
- From *Deligne weights, purity and the Weil bounds*: Zariski density of open subgroups of
  `Sp(V)(ℚ_ℓ)` (§2.2) and the semisimplicity criterion through the Zariski closure (§8.14), used
  in 9.2; and the finite-field equidistribution of §10.5, which is not reproved here.
- From [ReductiveGroups](../ReductiveGroups/README.md) Layer 3: identity components and component
  groups of affine algebraic groups, and the Zariski closure of a subgroup of the rational points
  as a closed subgroup scheme.
- From [ProbabilisticAndMetricNumberTheory](../ProbabilisticAndMetricNumberTheory/README.md)
  §2.1: the predicate `AsympEquidistributed x μ := Tendsto (TauCeti.Probability.empiricalMeasure x)
  atTop (𝓝 μ)` for a sequence `x : ℕ → X` in a topological space with measurable open sets and
  `μ : ProbabilityMeasure X`, with its bounded-continuous criteria
  `asympEquidistributed_iff_integral_tendsto` and `asympEquidistributed_iff_integral_tendsto_complex`,
  the index-shift law `asympEquidistributed_comp_add_iff`, uniqueness `AsympEquidistributed.unique`
  and the frequency law `AsympEquidistributed.tendsto_frequency` (portmanteau). Every
  equidistribution statement of Layer 10 is this predicate on `Conj(G)` (compact metrizable) or on
  `ℝ` (for eigenangle sequences in `[0, π]`), so the `HasOuterApproxClosed` and `BorelSpace`
  hypotheses of that API hold. `Suggested.lean` writes the predicate's defining `Tendsto` on Tau
  Ceti's `empiricalMeasure` and introduces no second notion of equidistribution.
- From the sibling drafts: Jordan's theorem over any field of characteristic zero, the bound
  `jordanBound` and the theorem `jordan_exists_abelian_normal_index_le` (`FiniteGroupInvariants`
  10.5, consumed in 7.1); the isomorphism invariants of component groups (`FiniteGroupInvariants`;
  their small-group identifiers are not targets),
  Serre's open image theorem for non-CM elliptic curves and the `GSp₄` images of abelian surfaces
  (`AdelicImagesAndModularCurves`), the image of a degree-one Artin representation
  (`ArtinRepresentations`), and the Igusa invariants, models and automorphism groups of genus-`2`
  curves (`HyperellipticCurves`).

### Not owned here

- **Labels, names and orderings.** The letter identifying the identity component within a weight
  and degree, the final letter distinguishing groups with equal invariants, the `name`/`pretty`
  strings, the ordering of the moment simplex rows in the stored `simplex` and of the irreducible
  characters in `character_matrix`, the `old_label` scheme and the GAP identifier of the component
  group are not targets. This roadmap states the **intrinsic label prefix**
  (weight, degree, conjugacy class of `G⁰`, number of components, isomorphism class of `G/G⁰`;
  8.8 of the label milestone below) and nothing enumerative. The stored trace-histogram image is
  not an invariant and is nobody's.
- **Non-CM equidistribution theorems**, potential automorphy and symmetric-power functoriality:
  *Modularity and Langlands extensions* §§4.28, 4.34, 4.39, 4.42 and its suppliers.
- **The analytic theory of Hecke L-functions** (continuation, functional equation, nonvanishing):
  *L-functions — completions and functional equations*. This roadmap consumes its boundary data.
- **Foundations of abelian varieties** — duals, polarizations, Poincaré reducibility, the Rosati
  involution, the Tate module of an abelian variety, the Néron–Ogg–Shafarevich criterion: *Abelian
  schemes and arithmetic moduli* and *Néron models and semistable abelian varieties*.
- **Albert's classification** of division algebras with positive involution: *Siegel and PEL
  moduli problems* M0.1–M0.2.
- **`GL₂`-type varieties, ℚ-curves, modularity**: *Abelian varieties of GL₂-type and modularity of
  ℚ-curves*; **CM forms and inner twists** of newforms: [ModularForms](../ModularForms/README.md).
- **Galois images**: Serre's open image theorem, adelic indices, mod-`ℓ` images, `GSp₄` images of
  abelian surfaces, `nonmax_primes`: the sibling `AdelicImagesAndModularCurves`.
- **Artin motives beyond the degree-one case**: images of Artin representations and their
  Sato–Tate groups (finite subgroups of `U(d)`): the sibling `ArtinRepresentations` (its 7.4 image
  group read inside `U(d)`; Layers 1–3 here supply the ambient group and the statistics).
- **Sato–Tate groups of even weight and degree `> 1`** (hypergeometric motives, K3 surfaces): no
  LMFDB page displays one (the `st_group` tables hold weight `0` in degree `1` and weight `1` in
  degrees `≤ 6` only), the sibling `HypergeometricMotives` names none, and no roadmap here owns
  them. Weight-`0` degree-`1` and the even-weight ambient `O(d)` are defined here; no even-weight
  classification is.
- **Abelian varieties over finite fields**, Weil polynomials and their Newton polygons: the
  siblings `AbelianVarietiesOverFiniteFields` and `CurvesOverFiniteFields`; the Weil bounds
  themselves are *Deligne weights, purity and the Weil bounds*.
- **General Lie theory**: the closed-subgroup theorem, maximal tori, the general Weyl integration
  formula, maximal compact subgroups: [LieGroups](../RepresentationTheory/LieGroups/README.md).
- **Peter–Weyl and compact-group character theory**: Tau Ceti, built to
  [CompactGroups](../RepresentationTheory/CompactGroups/README.md).

## Pinned conventions

- **The ambient unitary group.** `U(d) := Matrix.unitaryGroup (Fin d) ℂ`, with the subspace
  topology of `Matrix (Fin d) (Fin d) ℂ`; it is a compact Hausdorff topological group (Mathlib's
  `unitary` instances and Tau Ceti's `CompactSpace`). Every subgroup `G ≤ U(d)` carries
  `MeasurableSpace G := borel G` with `BorelSpace G`, declared once in the carrier file. A **closed
  subgroup** is Mathlib's `ClosedSubgroup (U(d))`; it is compact, and its Haar probability measure
  is `TauCeti.haarProb G`. Nothing in this roadmap is stated for a non-closed subgroup.
- **The symplectic form.** For even `d = 2g` the form is `Ω_d := [[0, I_g], [−I_g, 0]]`, as in
  Fité–Kedlaya–Rotger–Sutherland §3.4 and §3.6 (Remark 3.6) and Fité–Kedlaya–Sutherland (ST1), and
  `USp(d) := {g ∈ U(d) | gᵀ Ω_d g = Ω_d}`. The condition `gᵀ Ω g = Ω` is equivalent to Mathlib's
  `g Ω gᵀ = Ω` (`Matrix.symplecticGroup`), and for `d = 2g` the reindexing `Fin g ⊕ Fin g ≃ Fin 2g`
  (`finSumFinEquiv`) carries `Matrix.J (Fin g) ℂ = fromBlocks 0 (−1) 1 0` to `−Ω_d`, which cuts out
  the same group. For odd `d` the symbol `USp(d)` is not used. `USp(2) = SU(2)`, and the
  identification with `TauCeti.SU2 = Matrix.specialUnitaryGroup (Fin 2) ℂ` is 0.2.
- **The orthogonal group.** `O(d) := {g ∈ U(d) | ∀ i j, (g i j).im = 0}`, the real points of
  `U(d)`; it is the image of `Matrix.orthogonalGroup (Fin d) ℝ` under entrywise `Complex.ofReal`.
  `O(1) = {±1}`.
- **The ambient group of a weight.** `ambient w d := USp(d)` if `w` is odd and `O(d)` if `w` is
  even. For `w` odd the Hodge numbers force `d` even.
- **Coefficients.** For `g ∈ U(d)`, `a_i(g)` is the coefficient of `T^i` in the **reversed**
  characteristic polynomial `det(1 − T g) = ∏_j (1 − λ_j T)`, Mathlib's `Matrix.charpolyRev`; so
  `a_0 = 1`, `a_1 = −tr g` (`Matrix.coeff_charpolyRev_eq_neg_trace`), `a_i = (−1)^i e_i(λ)`, and
  `a_d = (−1)^d det g`. This is the LMFDB's normalized L-polynomial `L̄(T) = 1 + a_1 T + a_2 T² + ⋯`
  and FKRS's `T⁴ + a_1 T³ + a_2 T² + a_1 T + 1` read from the top. On `USp(d)` the sequence is
  palindromic, `a_{d−i} = a_i`, and real; on `O(d)` it is real and `a_{d−i} = (−1)^d det(g) a_i`.
- **Trace and the first moment row.** The trace random variable is `t = tr g = −a_1`. In odd
  weight `−1 ∈ G⁰` (2.5), so `t` and `a_1` have the same law and the stored first `moments` row
  (labelled `a_1`, equivalently `s_1`) is the trace moment sequence; in even weight the stored row
  is the trace moment sequence `E[t^n]` and `a_1`'s moments differ from it by the sign `(−1)^n`.
  Every moment sequence starts with the zeroth moment `1`.
- **Moments are Haar integrals**, `E[F] := ∫ F dμ_G` for `μ_G = haarProb G`, complex-valued;
  integrality statements are `∃ z : ℤ, E[F] = z`. The **component measure** `μ_H` of a component
  `H = hG⁰` is `c · μ_G|_H` with `c = [G : G⁰]`, so `μ_H(H) = 1` and `μ_G = c⁻¹ ∑_H μ_H`.
- **Event probabilities.** `Pr[a_i = n] := μ_G{g | a_i(g) = n}` (`Measure.real`), and the trace
  zero density is `Pr[t = 0]`. The stored `counts` are the pairs `(x, z)` with `z = zCount G i x`
  the number of components on which `a_i ≡ x` (`z ≠ 0`), displayed as `Pr[a_i = x] = z/c`; the
  stored `zvector` lists the numbers of components on which `a_1 = 0` and on which `a_2 = n`
  (`n = −2, …, 2` in degree `4`), per the component-counting theorem 3.5.
- **Hodge numbers.** `HodgeNumbers w d` is a function `h : Fin (w+1) → ℕ`, `h p = h^{p, w−p}`,
  with `∑ h = d` and, for `w` odd, `h p = h (w − p)`. A **Hodge circle** is a continuous
  homomorphism `θ : U(1) → G` with image in `G⁰` whose `θ(u)` has eigenvalues `u^{2p−w}` with
  multiplicity `h p`; `U(1)` is Mathlib's `Circle`. The abelian-variety Hodge numbers are
  `weightOne g := (h^{1,0}, h^{0,1}) = (g, g)`, the newform Hodge numbers of weight `k` are
  `(h^{k−1,0}, h^{0,k−1}) = (1, 1)` in weight `w = k − 1`, and the degree-one weight-`0` numbers
  are `h^{0,0} = 1`.
- **The identity component** is Mathlib's `Subgroup.connectedComponentOfOne G`; **components**
  are its cosets, `c := Nat.card (G ⧸ G⁰)`.
- **The axioms** are named `IsSelfDual w G` (ST1: `G ≤ ambient w d`), `HodgeCondition H G`
  (ST2: a Hodge circle exists and the subgroup generated by all Hodge circles is dense in `G⁰`),
  `IsRational G` (ST3: for every component `H` and every exponent vector `n`,
  `∫_H ∏ a_i^{n_i} dμ_H ∈ ℤ`), `IsLefschetz G` (ST4). **Sato–Tate group** for `H` means
  `IsSatoTateGroup H G := IsSelfDual ∧ HodgeCondition ∧ IsRational`; the LMFDB's `rational`
  column is `IsRational`. The Lefschetz condition is used only in degree `6` (Layer 7) and is
  never part of `IsSatoTateGroup`.
- **Block embeddings.** A product `G₁ × G₂ ≤ USp(2g₁) × USp(2g₂)` is embedded in `USp(2(g₁+g₂))`
  by interlacing coordinates so that `Ω` is preserved: in the basis
  `(x_1…x_{g₁}, x'_1…x'_{g₂}, y_1…y_{g₁}, y'_1…y'_{g₂})` the factors act on `(x, y)` and
  `(x', y')`. The diagonal copies
  `U(1)_g ≤ USp(2g)` and `SU(2)_g ≤ USp(2g)` are `u ↦ diag(u I_g, ū I_g)` and
  `[[a, b], [c, d]] ↦ [[a I_g, b I_g], [c I_g, d I_g]]`. This is FKS's convention; FKRS's §3.6
  coordinates differ from it by the permutation exchanging the second and third basis vectors,
  and the generators `a, b, c, J` of 6.3 are written in the convention above.
- **Generators** of `G` are a finite list `S` of matrices with `⟨G⁰, S⟩ = G`; the stored `gens`
  are such a list, and the choice of list is not an invariant.
- **Subgroups and supergroups** are taken up to conjugacy in the ambient group and only of finite
  index; a **maximal** group is one with no proper finite-index supergroup among the Sato–Tate
  groups realized in its weight and degree (the fifty-two in degree `4`, the `410` in degree
  `6`). The **multiplicity** of a maximal subgroup `H` of `G` is the number of `G`-conjugacy
  classes of subgroups of `G` that are ambient-conjugate to `H`.
- **Endomorphisms.** `End A` is Tau Ceti's `AbelianVariety.End A` (endomorphisms defined over the
  base field); `End⁰ A := ℚ ⊗[ℤ] End A`; `k̄ := AlgebraicClosure k`; `End(A_k̄) := End (A.baseChange k̄)`
  with `End⁰(A_k̄)` and `End(A_k̄)_ℝ := ℝ ⊗[ℤ] End(A_k̄)`. The LMFDB's `end_alg` is `End⁰ A`,
  `geom_end_alg` is `End⁰(A_k̄)`, `real_geom_end_alg` is `End(A_k̄)_ℝ`. The **endomorphism field**
  `K` is the fixed field of the kernel of the Galois action on `End(A_k̄)`.
- **Galois endomorphism type.** The pair `[Gal(K/k), End(A_K)_ℝ]` up to isomorphism of pairs (an
  isomorphism of groups together with an equivariant `ℝ`-algebra isomorphism), FKRS Definition 1.3.
- **`GL₂`-type for surfaces** follows the LMFDB knowl `g2c.gl2type`: `A` is of `GL₂`-type when it
  is isogenous over the base field to a product of pairwise non-isogenous simple factors each of
  which has commutative `End⁰` of `ℚ`-dimension equal to its dimension. Ribet's definition (a
  number field of degree `dim A` inside `End⁰ A`) differs on `E × E`; the knowl's is the one the
  column means.
- **The Sato–Tate group of `A`** (FKRS Definition 2.6): for a prime `ℓ` and a field embedding
  `ι : ℚ_ℓ ↪ ℂ`, `ST(A)` is a maximal compact subgroup of `G_ℓ^{1,Zar}(ℂ)`, the complex points of
  the Zariski closure of `ρ_{A,ℓ}(G_k^1)`, chosen inside `USp(2g)` for a symplectic basis of
  `V_ℓ(A)` adapted to a polarization. It is a closed subgroup of `U(2g)` determined up to
  conjugacy in `USp(2g)` by `(ℓ, ι)`; independence of `(ℓ, ι)` is the algebraic Sato–Tate
  conjecture, a named hypothesis. The **normalized Frobenius class** at a good prime `𝔭` of norm
  `q` is the conjugacy class in `ST(A)` of the semisimple part of `q^{−1/2} ι(ρ(Frob_𝔭))`, the
  square root taken in `ℂ`; its characteristic polynomial is the normalized L-polynomial
  `L_𝔭(q^{−1/2} T)`.
- **Equidistribution.** `AsympEquidistributed x μ` of ProbabilisticAndMetricNumberTheory §2.1:
  the empirical measures of `x : ℕ → X` converge weakly to `μ : ProbabilityMeasure X`; for the
  sequences used here this is `N⁻¹ ∑_{n<N} f(x_n) → ∫ f dμ` for every bounded continuous
  `f : X → ℝ`, by that roadmap's bounded-continuous criterion. Primes are ordered by norm, ties
  broken arbitrarily (the statement is insensitive to ties), and only the primes of good
  reduction are indexed.
- **Newforms.** The Sato–Tate group of a newform of weight `k ≥ 2` and nebentypus `χ` of order
  `n` has weight `w = k − 1` and degree `2`; it is `SU(2)[C_n] = {g ∈ U(2) | det(g)^n = 1}` when
  the form has no CM and a closed subgroup of `U(1)[D_n] = ⟨U(1), J, diag(1, ζ_n)⟩` containing
  `U(1)` when it has CM (9.9; with `U(1)[D_1] = N(U(1))`; `U(1)[D_n]` is the LMFDB's name, and
  the component group of this group is `C_n × C_2`, not dihedral, 5.5), where `J = [[0, 1], [−1, 0]]`,
  `ζ_n = e^{2πi/n}` and `U(1)` is the diagonal `diag(u, ū)`. The LMFDB's `cmf` column is the
  label of `SU(2)[C_n]` resp. `U(1)[D_n]` in both cases.

## What Mathlib supplies

- **Matrix groups.** `Matrix.unitaryGroup n α` (`= unitary (Matrix n n α)`),
  `Matrix.specialUnitaryGroup`, `Matrix.orthogonalGroup n R` (`= unitaryGroup n R` for a trivial
  star), `Matrix.symplecticGroup l R` on the index type `l ⊕ l` with `Matrix.J l R =
  fromBlocks 0 (−1) 1 0`, `SymplecticGroup.mem_iff` (`LinearAlgebra/UnitaryGroup.lean`,
  `LinearAlgebra/SymplecticGroup.lean`); the topology of `Matrix` (`Topology/Instances/Matrix.lean`)
  with `ContinuousStar`, and the topological-group structure of `unitary R`; `Matrix.GeneralLinearGroup`,
  `Matrix.unitaryGroup.toGL`.
- **Characteristic polynomials.** `Matrix.charpoly`, `Matrix.charpolyRev` with
  `reverse_charpoly`, `coeff_charpolyRev_eq_neg_trace`, `charpoly_coeff_eq_prod_coeff_of_le`,
  `charpoly_coeff_eq_sum_minors` (`LinearAlgebra/Matrix/Charpoly/Coeff.lean`); eigenvalues of
  normal and Hermitian matrices and the spectral theorem
  `Matrix.exists_mem_unitaryGroup_star_mul_mul_eq_diagonal` (`Analysis/Matrix/Spectrum.lean`).
- **Symmetric polynomials.** `MvPolynomial.esymm`, `psum`, `IsSymmetric`, the
  `symmetricSubalgebra`, Newton's identities (`RingTheory/MvPolynomial/NewtonIdentities.lean`)
  and the fundamental theorem `MvPolynomial.esymmAlgHom` is bijective
  (`RingTheory/MvPolynomial/Symmetric/FundamentalTheorem.lean`).
- **Topological groups.** `Subgroup.connectedComponentOfOne`, `mul_mem_connectedComponent_one`,
  `inv_mem_connectedComponent_one` (`Topology/Algebra/Group/Subgroup.lean`); `ClosedSubgroup`
  (`Topology/Algebra/Group/ClosedSubgroup.lean`); `IsClosed.isCompact`,
  `isCompact_iff_compactSpace`; `ConjClasses`; `Circle`, `Circle.exp`, `AddCircle`,
  `AddCircle.haarAddCircle`, `fourierBasis`; `ContinuousMonoidHom` (`→ₜ*`).
- **Measure theory.** `MeasureTheory.Measure.haar`, `IsHaarMeasure`,
  `isHaarMeasure_eq_of_isProbabilityMeasure`, `Measure.map`, `Measure.restrict`, `Measure.real`,
  `Measure.prod`, the Bochner integral, `ProbabilityTheory.moment`, `MeasureTheory.Measure.count`;
  the change-of-variables formula `MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul`;
  `intervalIntegral` with `integral_sin_pow`, `integral_cos_pow`.
- **Analysis.** `NormedSpace.exp` and `Matrix.exp`; the identity theorem
  `AnalyticOnNhd.eqOn_zero_of_preconnected_of_eventuallyEq_zero`; `Polynomial.Chebyshev.U`.
- **Lie groups.** `LieGroup I n G`, `LeftInvariantDerivation` (`Geometry/Manifold/Algebra/`),
  used only through [LieGroups](../RepresentationTheory/LieGroups/README.md).
- **Representations.** `ContRepresentation`, `Representation.character`, `FDRep.character`,
  `Representation.IsIrreducible`, `SymmetricPower`, `exteriorPower`.
- **Number fields and Galois theory.** `NumberField`, `NumberField.IsCMField` with
  `IsCMField.complexConj`, `NumberField.IsTotallyReal`, `AlgebraicClosure`,
  `Field.absoluteGaloisGroup` (`AlgebraicClosure K ≃ₐ[K] K`), `IntermediateField.fixedField`,
  `IsGalois`, `IsDedekindDomain.HeightOneSpectrum`, `Ideal.absNorm`; `Padic`/`ℚ_[ℓ]`;
  `WeierstrassCurve` with `IsElliptic`, `baseChange`, `Affine.Point`.
- **Combinatorics.** `Nat.centralBinom`, `catalan`, `Nat.Partition`, `YoungDiagram`.

## What Tau Ceti supplies

- **Compact groups** (`TauCeti.RepresentationTheory.Compact.*`): `haarProb` and its invariance
  and uniqueness lemmas (`Haar.lean`), `haarAverage` (`Averaging.lean`), `matrixCoeff`,
  `characterLp`, `character_orthonormal_self`/`_distinct` (`Character/Basic.lean`),
  `integral_character_eq_finrank_invariants` (`Invariants.lean`), `classFunctionLp` and
  `characterBasis`/`stdCharacterBasis` (`ClassFunctionLp.lean`, `Character/Basis.lean`),
  `peterWeylBasis`, `IrrepModel`, `IsIrrepSkeleton` (`PeterWeyl.lean`), the finite-group and
  circle specializations (`Finite.lean`, `Circle.lean`).
- **`SU(2)`** (`TauCeti.RepresentationTheory.SU2.*`): `SU2`, `torusMatrix`, `torusHom`, `torus`,
  `torusExp`, `SU2.trace_torusExp`, `torusContinuousMulEquiv : Circle ≃ₜ* torus` (`Basic.lean`);
  Borel structure (`Borel.lean`); `exists_conj_mem_torus`, `exists_isConj_torusExp`
  (`TorusConjugacy.lean`); `isConj_iff_trace_eq`, `norm_trace_le_two`,
  `exists_isConj_torusExp_mem_Icc` (`ConjugacyClasses.lean`); `symPower`, `finrank_symPower`,
  `character_symPower_torusExp` (`SymmetricPower.lean`); `isIrreducible_symPower`,
  `nonempty_equiv_symPower_iff`, exhaustion (`Irreducible.lean`, `Exhaustion.lean`);
  `character_symPower_eq_chebyshevU_eval`, `characterSpan` and its density in the class
  functions (`Completeness.lean`); the Weyl group of order `2` (`Weyl/Basic.lean`), the Weyl
  character formula (`Weyl/Character.lean`), `weyl_integration_formula`,
  `integral_character_symPower_mul_conj` (`Weyl/Integration.lean`),
  `weyl_integration_formula_normalized` (`Weyl/Orthogonality.lean`).
- **Unitary groups** (`TauCeti.Topology.Algebra.UnitaryGroup`, `TauCeti.Analysis.Matrix.UnitaryGroup.*`):
  `CompactSpace (unitaryGroup n 𝕜)`, `isClosed_specialUnitaryGroup`, `CompactSpace
  (specialUnitaryGroup n 𝕜)`; `Matrix.diagonal_mem_unitaryGroup_iff`,
  `Matrix.exists_circle_smul_mem_specialUnitaryGroup`; `unitaryTorusHom`, `unitaryTorus`,
  `exists_conj_mem_unitaryTorus`, `exists_isConj_unitaryTorusHom`;
  `TauCeti.Topology.Algebra.OrthogonalGroup`: `isClosed_orthogonalGroup`,
  `isClosed_specialOrthogonalGroup`.
- **Classical groups** (`TauCeti.RepresentationTheory.ClassicalGroups.*`): `stdRep`,
  `symplecticGroupToGL`, `stdSymplecticRep`, `stdSymplecticBilinForm`, dominant weights,
  `symPowerRep`, `extPowerRep`, characters as symmetric polynomials.
- **Abelian varieties** (`TauCeti.AlgebraicGeometry.AbelianVariety.*`): `AbelianVariety K`,
  `dim`, `TangentSpace`, `finrank_tangentSpace_eq_dim`, `Hom`, `prod`, `IsIsogeny`,
  `isIsogeny_mulBy_neg_one`, `End A` with `instRing`, `mulBy`, `End.congr`, `baseChange`,
  `baseChangeFunctor`, `Hom.baseChange`, `End.baseChange : End A →+* End (A.baseChange L)`,
  `baseChange_mulBy`.
- **Elliptic curves** (`TauCeti.AlgebraicGeometry.EllipticCurve.*`): `pointCount`,
  `frobeniusTrace` with `frobeniusTrace_eq_card_point` (`PointCount.lean`), `hasse_bound`
  (`HasseBound.lean`), the Tate module `TauCeti.TateModule` with `natCard_tateModuleLevel`,
  `finrank_tateModule` (`TateModule/Basic.lean`), `tateModuleGaloisRepresentation` with
  `continuous_tateModuleGaloisRepresentation_apply` (`TateModule/Galois.lean`),
  `det_tateModuleGaloisRepresentation` (`TateModule/Determinant.lean`), the Weil pairing,
  isogenies `TauCeti.Isogeny` with `[n]` (`Isogeny/*`), `GaloisDescent.lean`.
- **Number theory**: `TauCeti.GlobalNumberFields.HeckeCharacter` with `IsFiniteOrder`,
  `ofRayClassCharacter`, `infinityType`, `IsAlgebraic`, `normCharacter`, `shift`
  (`NumberTheory/NumberField/Global/HeckeCharacter/*`); `TauCeti.NumberField.complexConj_eq_complexConjugationAt`
  (`ComplexConjugation/CMField.lean`); Chebotarev density (`NumberTheory/Chebotarev/*`);
  `TauCeti.LFunctions.primeIdealVonMangoldtBoundary`.
- **Probability**: `TauCeti.Probability.HasLaw`, moments (`Probability/Moments`); the empirical
  measures `TauCeti.Probability.empiricalMeasure x n : ProbabilityMeasure α` of the first `n + 1`
  terms of a sequence, with `integral_empiricalMeasure` and `empiricalMeasure_apply_toReal`
  (`Probability/Process/EmpiricalMeasure.lean`).

## What is missing

Nothing between Haar measure and the Sato–Tate groups exists: there is no `USp(d)` or `O(d)` as a
closed subgroup of `U(d)`, no coefficient map or coefficient law, no identity component of a
closed subgroup of `U(d)` with its finiteness, real dimension or component measures, no Hodge
circle, no Sato–Tate axiom, no moment or event probability of a compact matrix group, no Weyl
integration formula beyond `SU(2)`, no classification of closed subgroups of `SU(2)` or `USp(4)`,
no finite-subgroup classification of `SO(3)`, no degree-`6` list, no Galois action on geometric
endomorphisms, no endomorphism field, no real geometric endomorphism algebra, no Galois
endomorphism type, no Sato–Tate group of an abelian variety or newform, no normalized Frobenius
class, no Weyl criterion on conjugacy classes, no Serre criterion, and no equidistribution
theorem for CM elliptic curves. Every one of these is a milestone below. Jordan's theorem is
`FiniteGroupInvariants` 10.5's and the equidistribution predicate is
ProbabilisticAndMetricNumberTheory §2.1's; neither is restated. The suppliers listed above are
consumed where named; where a supplier is a roadmap rather than library code, the README cites
the supplier's milestone, and a statement that needs the supplier's objects is a theorem with a
`sorry` proof in `Suggested.lean` when it can be stated over Mathlib and Tau Ceti, and is
specified in this README only otherwise.

## The build, in layers

Layers 0–4 are the group-theoretic foundation, Layers 5–7 the classifications, Layers 8–9 the
arithmetic, Layer 10 equidistribution. Milestones are numbered `N.M`; each rests only on Mathlib,
Tau Ceti, a milestone with a smaller number, or a cited supplier milestone.

`Suggested.lean` is not exhaustive and states only what can be stated over Mathlib and the pinned
Tau Ceti: the carriers and main theorems of Layers 0–5, the connected groups of degrees `4` and
`6` (4.6–4.7) with the identity-component theorems 6.4 and 7.3, the real-place condition 6.10, the finiteness theorem 7.2, the endomorphism algebras of
8.1, the enumerations of 8.4–8.5 and the structure of 8.7, and 10.1 with the law on conjugacy
classes (1.5). The computed record of a group (3.6), the fifty-five groups of degree `4` with
their stored data, classification and lattice (6.3, 6.6–6.9), the degree-`6` list (7.4), the
Galois action, the endomorphism field, the type classifiers and the Galois endomorphism type of a
variety (8.1–8.2, 8.4–8.5, 8.7), the Sato–Tate group of an abelian variety and all of Layer 9, and
the ordering of primes with the Sato–Tate conjecture (10.3, 10.5–10.6) need objects that neither
Mathlib nor Tau Ceti has, or the stored tables of FKRS and FKS; they are specified in this
README only, each definition with a **Checks** list of tests a formalisation must pass.

## Layer 0: ambient groups and the coefficient map

### 0.1 Closed subgroups of `U(d)` and their Haar measure

For `d : ℕ`, `U(d) = Matrix.unitaryGroup (Fin d) ℂ` is a compact Hausdorff topological group
(Mathlib's `unitary` instances, Tau Ceti's `CompactSpace`). Declare `MeasurableSpace G := borel G`
and `BorelSpace G` for every `G : Subgroup (U(d))`. For `G : ClosedSubgroup (U(d))` prove
`CompactSpace G` (`IsClosed.isCompact` and `isCompact_iff_compactSpace`) and set
`haar G := TauCeti.haarProb G`; record that it is the unique Haar probability measure on `G`
(`eq_haarProb_of_isHaarMeasure_of_isProbabilityMeasure`), bi-invariant and inversion-invariant.
Lemmas: continuous functions on `G` are integrable; the integral of a function of `g⁻¹` equals that
of `g`; for a closed subgroup `G' ≤ G` of finite index the restriction of `haar G` to `G'` is
`[G : G']⁻¹ • haar G'` (uniqueness). *Rests on:* Mathlib, Tau Ceti `Compact/Haar.lean`.

### 0.2 The unitary symplectic group

Define `Ω d : Matrix (Fin d) (Fin d) ℂ` by `Ω i j = 1` if `j = i + d/2`, `−1` if `i = j + d/2`,
`0` otherwise, and `USp d : Subgroup (U(d)) := {g | gᵀ Ω g = Ω}` for even `d`. Prove: it is closed;
for `d = 2g` it is the image of `Matrix.unitaryGroup (Fin g ⊕ Fin g) ℂ ⊓ Matrix.symplecticGroup
(Fin g) ℂ` under `Matrix.reindex finSumFinEquiv` (so `Matrix.SymplecticGroup.mem_iff` is the
membership test); `det g = 1` on `USp d`; `USp d` is closed under `g ↦ gᵀ` and `g ↦ ḡ`;
`USp 2 = {g ∈ U(2) | det g = 1}`, and the resulting group isomorphism
`USp 2 ≃ₜ* TauCeti.SU2` carrying Haar to Haar — every degree-`2` statement of Layers 4–5 is
transported along it. Real dimension `g(2g+1)` is 1.3. *Rests on:* Mathlib `SymplecticGroup`,
Tau Ceti `isClosed_specialUnitaryGroup`.

### 0.3 The orthogonal group and the ambient of a weight

`Od d : Subgroup (U(d)) := {g | ∀ i j, (g i j).im = 0}`; it is closed, equal to the image of
`Matrix.orthogonalGroup (Fin d) ℝ` under `Matrix.map Complex.ofReal`, with `det g ∈ {1, −1}`, and
`Od 1 = {1, −1}`. `ambient w d := if Odd w then USp d else Od d`. *Rests on:* Mathlib, Tau Ceti
`isClosed_orthogonalGroup`.

### 0.4 The coefficient map

`coeff g i := ((g : Matrix) .charpolyRev).coeff i` for `g ∈ U(d)`, written `a_i(g)`, and
`trace g := Matrix.trace g`. Prove: `a_0 = 1`, `a_1 = −trace` (`coeff_charpolyRev_eq_neg_trace`),
`a_i = (−1)^i e_i(λ_1, …, λ_d)` for the eigenvalue multiset (spectral theorem), `a_i = 0` for
`i > d`, `a_d = (−1)^d det g`; each `a_i` is a polynomial in the entries, hence **continuous** and
a class function `a_i(h g h⁻¹) = a_i(g)`; on `USp d` the coefficients are real and palindromic
`a_{d−i} = a_i`; on `Od d` they are real and `a_{d−i} = (−1)^d det(g) a_i`, i.e.
`(charpolyRev g).reverse = (−1)^d det(g) • charpolyRev g` (the eigenvalue multiset is closed
under inversion). The **Newton
identities**: the power sums `s_k(g) = trace (g^k)` are integer polynomials in `a_1, …, a_k` and
conversely (Mathlib `MvPolynomial` Newton identities). Define `coeffVec g : Fin (d+1) → ℂ`.
*Rests on:* Mathlib.

### 0.5 Torus conjugacy and conjugacy classes

The diagonal torus `uSpTorus g ≤ USp(2g)` is the image of `(Fin g → Circle) →* USp(2g)`,
`u ↦ diag(u_1, …, u_g, ū_1, …, ū_g)`. Prove: every element of `USp(2g)` is conjugate **in
`USp(2g)`** into `uSpTorus g` (unitary diagonalization `exists_conj_mem_unitaryTorus` gives a
unitary conjugator; the symplectic refinement pairs the eigenvalues `λ, λ̄` by the form and
produces a symplectic unitary conjugator); two elements of `USp(2g)` are conjugate in `USp(2g)` iff
they have the same characteristic polynomial; hence a class function on `USp(2g)` factors through
`coeffVec`. The same for `Od d` with the torus `SO(2)^{⌊d/2⌋} × {±1}^{d mod 2}`, where conjugacy
classes are determined by the characteristic polynomial together with the `±1` eigenspace
dimensions. For `g = 1` the statement is `TauCeti.SU2.exists_conj_mem_torus` and
`isConj_iff_trace_eq`. *Rests on:* 0.2, 0.4, Tau Ceti `UnitaryGroup/Torus.lean`.

## Layer 1: identity component, component group, real dimension, Haar on components

### 1.1 The identity component and the component group

For `G : ClosedSubgroup (U(d))`, `identityComponent G := Subgroup.connectedComponentOfOne G`,
written `G⁰`; prove it is closed in `G`, normal, characteristic, and connected; `componentGroup
G := G ⧸ G⁰`; `G` is connected iff `componentGroup G` is trivial. The coset `h G⁰` is the
connected component of `h`. *Rests on:* Mathlib.

### 1.2 Finiteness of the component group

`G⁰` is **open** in `G`, hence `Finite (G ⧸ G⁰)` by compactness. Proof route: by the closed-
subgroup theorem ([LieGroups](../RepresentationTheory/LieGroups/README.md) Layer 2, applied to
`G ≤ U(d) ≤ GL_d(ℂ)`) `G` is an embedded Lie subgroup, so it is locally connected (a chart at `1`
is a ball), so the connected component of `1` is open. Define `numComponents G := Nat.card
(componentGroup G)`, written `c`. Consequence: `G⁰` has finite index and
`haar G⁰ = c • (haar G)|_{G⁰}` (0.1). *Rests on:* 1.1, LieGroups Layer 2.

### 1.3 The Lie algebra and the real dimension

`lieAlgebra G : Submodule ℝ (Matrix (Fin d) (Fin d) ℂ)` with carrier `{X | ∀ t : ℝ, exp (t • X) ∈ G}`
(Mathlib `NormedSpace.exp`); closure under addition is the Lie–Trotter formula, which is the
content of the closed-subgroup theorem (LieGroups Layer 2) and is consumed from there; closure
under scalars and `0 ∈` are direct. Prove `lieAlgebra G ≤ lieAlgebra (U(d)) = {X | Xᴴ = −X}`,
`lieAlgebra G = lieAlgebra G⁰`, closure under the commutator, and `realDimension G :=
Module.finrank ℝ (lieAlgebra G)`. Values: `U(d)`: `d²`; `USp(2g)`: `g(2g+1)`; `Od d`:
`d(d−1)/2`; `uSpTorus g`: `g`; `USp 2 = SU(2)`: `3`. `realDimension G = 0` iff `G` is finite.
*Rests on:* 1.1, LieGroups Layer 2.

### 1.4 Haar measure on components

For `H : componentGroup G` with coset `C_H ⊆ G`, `componentMeasure G H := (c : ℝ≥0∞) • (haar G).restrict C_H`,
written `μ_H`. Prove `μ_H(C_H) = 1`, `haar G = c⁻¹ • ∑_H μ_H` (Mathlib `Measure.restrict` and the
finite partition into cosets), left translation by `h` carries `μ_{G⁰}` to `μ_{hG⁰}`, `μ_{G⁰}`
is the Haar probability measure of the closed subgroup `G⁰` (0.1) and is invariant under
conjugation by every element of `G` (uniqueness of Haar on `G⁰`). *Rests on:* 0.1, 1.2.

### 1.5 The coefficient and trace laws and the measure on conjugacy classes

`coeffLaw G := (haar G).map coeffVec : Measure (Fin (d+1) → ℂ)` and `traceLaw G := (haar G).map trace`,
both probability measures because the maps are continuous (0.4); `conjLaw G : ProbabilityMeasure
(ConjClasses G)`, the pushforward along the quotient map for the quotient topology and its Borel
σ-algebra, a `ProbabilityMeasure` because Layer 10 states equidistribution in
`ProbabilityMeasure (ConjClasses G)`. Prove: for a continuous class function `f : G → ℂ`, `∫ f dμ_G = ∫ f̄ d(conjLaw G)`; for `G ≤ USp(2g)` the map `ConjClasses G →
ConjClasses (USp(2g)) → (Fin (2g+1) → ℂ)` is injective on the second step (0.5), so `coeffLaw G`
determines `conjLaw (USp(2g))`-side statistics; `traceLaw G` is the image of `coeffLaw G` under
`a ↦ −a_1`. These are the measures the LMFDB's "pushforward of Haar measure to characteristic
polynomials" means. *Rests on:* 0.4, 0.5, 1.4.

## Layer 2: the Sato–Tate axioms

### 2.1 Hodge numbers

`structure HodgeNumbers (w d : ℕ)` with `h : Fin (w+1) → ℕ`, `sum_eq : ∑ p, h p = d`, and
`symm : Odd w → ∀ p, h p = h (Fin.rev p)`. Constructors `weightOne g : HodgeNumbers 1 (2g)`
(`h = ![g, g]`), `newform k : HodgeNumbers (k−1) 2` for `k ≥ 2` (`h^{k−1,0} = h^{0,k−1} = 1`,
`0` between), `artin d : HodgeNumbers 0 d` (`h^{0,0} = d`). Lemma: `Odd w → Even d`. *Rests on:*
Mathlib.

### 2.2 Hodge circles and the Hodge condition

`IsHodgeCircle H G (θ : Circle →ₜ* G)` : `∀ u, θ u ∈ G⁰` and `∀ u, charpoly (θ u) =
∏_p (X − C (u^(2p−w)))^(h p)` (the exponent `2p − w : ℤ`, `zpow` on `Circle`). `HodgeCondition H G`
: some Hodge circle exists, and `closure (Subgroup.closure (⋃_{θ Hodge} range θ)) = G⁰` as
subsets of `G`. Prove: conjugates of Hodge circles are Hodge circles, so the subgroup generated is
normal in `G`; the condition is invariant under conjugation of `G` in `U(d)`; a Hodge circle for
`weightOne g` is `u ↦ diag(u I_g, ū I_g)` up to conjugacy and lies in `USp(2g)` after conjugation;
a finite `G` fails the Hodge condition whenever some `p` with `h p ≠ 0` has `2p ≠ w` (`θ(u)` would
have the eigenvalue `u^{2p−w}` of infinite order for generic `u`), so in every odd weight with
`d ≥ 1` and for `weightOne g`; when every nonzero `h p` sits at `p = w/2` the trivial homomorphism
is a Hodge circle and finite groups pass (5.6). Under the former hypothesis `G⁰` is nontrivial. *Rests
on:* 1.1, Mathlib `Circle`.

### 2.3 The rationality condition, in moment and character form

`IsRational G : Prop := ∀ (H : componentGroup G) (n : Fin (d+1) → ℕ), ∃ z : ℤ,
∫ g, ∏ i, a_i(g)^(n i) ∂μ_H = z`. Prove the **character form**: `IsRational G` iff for every
component `H` and every irreducible character `χ` of a polynomial representation of `GL_d(ℂ)`
(the Schur functors `S_λ`, [ClassicalGroups](../RepresentationTheory/ClassicalGroups/README.md)
Layers 2–4), `∫_H χ dμ_H ∈ ℤ`; the two directions are the fundamental theorem of symmetric
polynomials over `ℤ` (`MvPolynomial.esymmAlgHom` bijective) and the fact that the Schur
polynomials are a `ℤ`-basis of the symmetric polynomials (ClassicalGroups Layer 4), using
`a_i = (−1)^i e_i`. Also the **exterior-power form** `∫_H (trace ∧^m g)^n dμ_H ∈ ℤ` as a
consequence. On `USp(d)` and `Od d` every rational character of `GL_d` restricts to a
polynomial one (`det = ±1`), so the character form with all rational irreducibles is
equivalent. *Rests on:* 0.4, 1.4, ClassicalGroups Layers 2–4.

### 2.4 Self-duality, the Sato–Tate predicate, the Lefschetz condition

`IsSelfDual w G := G.toSubgroup ≤ ambient w d`; `IsSatoTateGroup H G := IsSelfDual w G ∧
HodgeCondition H G ∧ IsRational G` (a `Prop`-valued structure with the three fields). `IsLefschetz
G` (for `G ≤ USp(d)`): the subgroup `{g ∈ USp(d) | ∀ X ∈ Matrix.centralizer G⁰, g X g⁻¹ = X}`
equals `G⁰`, where `Matrix.centralizer G⁰ = End(ℂ^d)^{G⁰}` is the commutant. Prove all four
predicates are invariant under conjugation by `ambient w d`, and that `IsSatoTateGroup` is
invariant under conjugation by `U(d)` only when the conjugate still lies in the ambient. *Rests
on:* 2.2, 2.3.

### 2.5 First consequences

(a) In odd weight, `−1 ∈ G⁰` for every `G` with the Hodge condition (`θ(−1)` has all eigenvalues
`(−1)^{2p−w} = −1`, and a unitary matrix with all eigenvalues `−1` is `−1`), so multiplication by
`−1` preserves `μ_{G⁰}` and each `μ_H`, and `a_i(−g) = (−1)^i a_i(g)`. (b) In even weight
`θ(−1) = 1`. (c) **Connected groups are rational**: if `G` is connected then `IsRational G`,
because `∫_G ∏ a_i^{n_i} dμ_G = ± ∫_G χ_V dμ_G = ± dim V^G` for the representation
`V = ⊗_i (∧^i ℂ^d)^{⊗ n_i}` (Tau Ceti `integral_character_eq_finrank_invariants`). (d) More
generally, for **every** closed `G`, `∫_G ∏ a_i^{n_i} dμ_G ∈ ℤ` by the same argument; the content
of ST3 is integrality **on each component**. (e) If `G` satisfies the axioms then so does every
closed subgroup `G' ≤ G` of finite index containing `G⁰`, with the same identity component
(rationality restricts to the components of `G'`). *Rests on:* 2.2–2.4, Tau Ceti
`Compact/Invariants.lean`.

## Layer 3: moments, event probabilities, and the stored statistics

### 3.1 Moments

`coeffMoment G (n : Fin (d+1) → ℕ) : ℂ := ∫ ∏ i, a_i^(n i) ∂haar G` (the **mixed moment**
`E[a_1^{n_1} ⋯ a_d^{n_d}]`), `aMoment G i m := coeffMoment G (Pi.single i m)` (the moment
sequence of `a_i`, `m ↦ E[a_i^m]`, starting with `E[a_i^0] = 1`), `traceMoment G m := ∫ (trace g)^m`.
Prove: every `coeffMoment` is an integer (2.5(d)), hence real; `aMoment G 0 m = 1`; moments are
conjugation-invariant and depend only on `coeffLaw G`. *Rests on:* 1.5, 2.5.

### 3.2 Trace moments equal `a_1` moments in odd weight

For `G` with the Hodge condition in odd weight, `traceMoment G m = aMoment G 1 m` and both vanish
for odd `m` (2.5(a): `g ↦ −g` preserves Haar and negates `a_1`). In even weight
`traceMoment G m = (−1)^m aMoment G 1 m`. The stored `second_trace_moment`,
`fourth_trace_moment` are `traceMoment G 2`, `traceMoment G 4`; `first_a2_moment` is
`aMoment G 2 1`. *Rests on:* 2.5, 3.1.

### 3.3 The moment simplex, the moment matrix and the character diagonal

For `G ≤ USp(2g)` the mixed moments with `∑ i·n_i` even are the **moment simplex**; prove the
vanishing `coeffMoment G n = 0` when `∑ i·n_i` is odd (from `−1 ∈ G⁰`, 2.5(a), since
`∏ a_i^{n_i}(−g) = (−1)^{∑ i n_i} ∏ a_i^{n_i}(g)`), so the simplex loses nothing. The row and entry
**ordering** of the stored `simplex` is a database convention, not a target. `momentMatrix G` : for an
enumeration `χ : ι → (irreducible characters of the ambient group)` (ClassicalGroups Layer 4,
indexed by dominant weights), the matrix `E[χ_i χ_j]`; `characterDiagonal G i := E[χ_i²]`. Prove
the entries are integers (2.5(d)), that `E[χ_i χ_j] = dim Hom_G(V_i, V_j)` when the `V_i` are
self-dual (the ambient's irreducibles are), and that `E[χ_i²] = 1` for all `i` iff the
restrictions to `G` are irreducible and pairwise inequivalent, which for `G` the whole ambient is
Schur orthogonality (Tau Ceti `character_orthonormal_self`). Each entry is an integer linear
combination of entries of the moment simplex (the characters are integer polynomials in the
`a_i`; ClassicalGroups Layer 4). *Rests on:* 2.5, 3.1, ClassicalGroups Layer 4, Tau Ceti
`Character/Basic.lean`.

### 3.4 Event probabilities and the trace zero density

`coeffProb G i (x : ℂ) : ℝ := (haar G).real {g | a_i g = x}`, `traceZeroDensity G :=
(haar G).real {g | trace g = 0}` (`= coeffProb G 1 0`), and `componentProb G H i x :=
μ_H.real {g | a_i g = x}`. Prove `coeffProb G i x = c⁻¹ ∑_H componentProb G H i x` (the finite
partition into cosets, 1.4). *Rests on:* 1.4.

### 3.5 The component-counting theorem (Serre)

On a component `C_H` of a closed subgroup `G ≤ U(d)`, each `a_i` is either **constant** or has
**null level sets**: `componentProb G H i x ∈ {0, 1}`, equal to `1` iff `a_i ≡ x` on `C_H`.
Hence, with `zCount G i x := #{H | a_i ≡ x on C_H}`, `coeffProb G i x = zCount G i x / c`, a
rational number with denominator dividing `c`, nonzero only for the finitely many `x` that are
the constant value of `a_i` on some component; the `counts` record of a group is the finite list
of pairs `(x, zCount G i x)` with `zCount ≠ 0`, and `zVector G` is `(z_1; z_{2,−2}, …, z_{2,2})`
with `z_1 = zCount G 1 0`, `z_{2,n} = zCount G 2 n`.
Proof route, in three pieces. (a) `null_zeroSet_of_analytic`: the zero set of a nonzero
real-analytic function on a connected open subset of `ℝ^n` is Lebesgue-null (induction on `n`
with Fubini; in one variable the zeros are isolated by the identity theorem
`AnalyticOnNhd.eqOn_zero_of_preconnected_of_eventuallyEq_zero`). (b) The chart comparison: in
the exponential chart of `G⁰` (LieGroups Layer 0) `μ_{G⁰}` is equivalent to Lebesgue measure on
the chart domain (Haar restricted to a chart neighbourhood has a continuous positive density by
the change-of-variables formula applied to left translations, and uniqueness of Haar). (c) The
function `X ↦ a_i(h · exp X)` is real-analytic on the chart (a polynomial in the entries of a
matrix exponential), so on the connected `G⁰` it is constant or its level sets are null by (a)
and (b). (Serre, *Lectures on N_X(p)*, §8.4, which draws this consequence for `a_p = 0`; the
LMFDB knowl `st_group.trace_zero_density` states it.) *Rests on:* 1.2, 1.4, LieGroups
Layer 0.

### 3.6 The record of a group

`structure STRecord` with fields `weight`, `degree`, `realDimension`, `components`,
`rational : Bool`, `traceZeroDensity : ℚ`, `traceMoments : List ℤ` (the `a_1`/trace row through
`m = 12`), `a2Moments : List ℤ`, `a3Moments : List ℤ`, `counts : List (ℕ × List (ℤ × ℚ))` (per
`i`, the pairs `(x, z/c)`), `zVector : List ℕ`, `characterDiagonal : List ℤ`; and
`record (H) (G) : STRecord` computed from the
definitions above: weight `w`, degree `d`, `realDimension G`, `numComponents G`, `IsRational G`
(decided classically), the rational number equal to `traceZeroDensity G` (it is `z_1/c` by 3.5),
the integers `traceMoment G m` for `m = 0, …, 12` and `aMoment G 2 m` for `m = 0, …, 6` (integral
by 3.1), the `a_3` moment sequence in degree `6` and the empty list below degree `6`, the
`counts` and `zVector` of 3.5, and the character diagonal of 3.3 (the isomorphism type of the component group is recorded by its
`FiniteGroupInvariants` invariants, not here). This is the LMFDB row minus the
label, name, generators, lattice and histogram; the certificates of 6.7 and 7.4 are equalities of
`record`s. *Rests on:* 1.3, 3.1–3.5.

**Checks.**

- (computation) `record (weightOne 1) su2`: weight `1`, degree `2`, real dimension `3`, one
  component, rational, trace zero density `0`, trace moments
  `1, 0, 1, 0, 2, 0, 5, 0, 14, 0, 42, 0, 132`, every `a_2` moment `1`, no `a_3` moments (5.4).
- (computation) `record (weightOne 1) nu1`: two components, real dimension `1`, trace zero
  density `1/2`, trace moments `1, 0, 1, 0, 3, 0, 10, 0, 35, 0, 126, 0, 462`, `zVector = [1]`.
- (non-example) `record (artin 1) (mu 3)`: the `rational` field is `false` (`E[a_1] = −ζ_3` on a
  component), three components, real dimension `0`, trace zero density `0` (5.6).
- (convention) `record (artin 1) (mu 1)` has trace moments `1, 1, 1, …`: the row is the trace row,
  while the `a_1` moments alternate in sign.

## Layer 4: Weyl integration for the connected groups

### 4.1 The torus and Weyl group of `USp(2g)`

`uSpTorus g` (0.5) is a maximal torus of `USp(2g)`; its normalizer modulo itself is the
hyperoctahedral group of signed permutations, of order `2^g g!`, acting on `(Fin g → Circle)` by
permuting coordinates and inverting them. For `g = 1` this is Tau Ceti's `SU2.weylGroup` of
order `2`. *Rests on:* 0.5, LieGroups Layer 6 (the general normalizer statement), Tau Ceti
`SU2/Weyl/Basic.lean`.

### 4.2 The Weyl integration formula for `USp(2g)`

For a continuous class function `f` on `USp(2g)`, with
`f̃(θ) := f(diag(e^{iθ_1}, …, e^{iθ_g}, e^{−iθ_1}, …, e^{−iθ_g}))`,
```
∫_{USp(2g)} f dμ = (2^{g²} / (g! π^g)) ∫_{[0,π]^g} f̃(θ) ∏_{j<k} (cos θ_j − cos θ_k)² ∏_j sin² θ_j dθ.
```
Proof: the general formula `∫_G f = |W|⁻¹ ∫_T f |Δ|²` of LieGroups Layer 6 with the positive
roots of `C_g` (`θ_j ± θ_k`, `2θ_j`), `|W| = 2^g g!`, and the evaluation
`∏_{α>0} |1 − α(t)⁻¹|² = 2^{2g} ∏_j sin²θ_j · 2^{g(g−1)} ∏_{j<k}(cos θ_j − cos θ_k)²` (the pair
`θ_j ± θ_k` contributes `16 sin²((θ_j+θ_k)/2) sin²((θ_j−θ_k)/2) = 4 (cos θ_j − cos θ_k)²`), then the
symmetry reducing `[−π,π]^g` to `[0,π]^g`. The **normalization test** `∫ 1 = 1` is a stated
lemma; for `g = 1` the density is `(2/π) sin²θ` and the formula is Tau Ceti's
`SU2.weyl_integration_formula` (whose constant `(1/2π) · 4 sin²θ` is the same); for `g = 2` the
density is `(8/π²)(cos θ_1 − cos θ_2)² sin²θ_1 sin²θ_2` (Katz–Sarnak 5.0.4). *Rests on:* 0.5,
4.1, LieGroups Layer 6.

### 4.3 Products, diagonal copies and independence

`blockProd g₁ g₂ : U(2g₁) × U(2g₂) →* U(2(g₁+g₂))` is the pinned interlacing embedding, carrying
`USp × USp` into `USp`, and `prodClosed G₁ G₂` the block product of two closed subgroups. Haar on
the block product `G₁ × G₂ ≤ USp(2g₁+2g₂)` is the pushforward of `haar G₁ ×ₘ haar G₂` (Mathlib
`Measure.prod`, uniqueness of Haar); the characteristic polynomial of a block product is the
product of the factors' characteristic polynomials, so the coefficient variables of the factors
are independent and `a_1 = a_1' + a_1''`, `a_2 = a_2' + a_1' a_1'' + a_2''`; hence the
**binomial-convolution law** `E[a_1^m] = ∑_j C(m, j) E[a_1'^j] E[a_1''^{m−j}]`. For the diagonal
copies `u1Diag g = U(1)_g` and `su2Diag g = SU(2)_g` (through `su2DiagHom g : SU(2) →* U(2g)`),
`charpolyRev (diag copy of h) = (charpolyRev h)^g`, so `a_1 = g a_1(h)`,
`a_2 = C(g,2) a_1(h)² + g a_2(h)`. Haar on `U(1)` is `Circle`'s Haar
probability measure, equal to Mathlib's `AddCircle.haarAddCircle` under `Circle.exp` (Tau Ceti
`Compact/Circle.lean`). *Rests on:* 0.4, 1.5.

### 4.4 The genus-one engine: `U(1)` and `SU(2)`

For `U(1) = {diag(u, ū)} ≤ USp(2)`: `traceLaw` is the **arcsine law** `dz / (π √(4 − z²))` on
`[−2, 2]`, `E[t^{2n}] = C(2n, n)` (`Nat.centralBinom n`), odd moments `0`, `Pr[t = 0] = 0`. For
`SU(2) = USp(2)`: `traceLaw` is the **semicircle law** `√(4 − z²) dz / (2π)`,
`E[t^{2n}] = catalan n`, odd moments `0`, `Pr[t = 0] = 0`; proved through 4.2 for `g = 1` and the integrals
`(2/π)∫_0^π (2cos θ)^{2n} sin²θ dθ = catalan n` (`integral_cos_pow`); equivalently through the
Chebyshev characters `U_n(t/2)` of Tau Ceti and their orthonormality
`integral_character_symPower_mul_conj`, expressing `t^{2n}` in the `U_m` basis. The first
thirteen trace moments are `1,0,1,0,2,0,5,0,14,0,42,0,132` (`SU(2)`) and
`1,0,2,0,6,0,20,0,70,0,252,0,924` (`U(1)`). Define the FKRS sequences `bSeq n := [X^n](X²+1)^n`
(`= C(n, n/2)` for even `n`, `0` for odd) and `cSeq n := bSeq n / (n/2 + 1)`, and the
generalizations `b_{i,n} := [X^n](X² + iX + 1)^n`, `d_{i,n} := b_{i,n} − [X^{n+1}](X² + iX + 1)^n`,
with `E[a_{1,U(1)}^n] = bSeq n`, `E[a_{1,SU(2)}^n] = cSeq n`. *Rests on:* 0.2, 4.2, 4.3, Tau Ceti
`SU2/Weyl/*`, `SU2/Completeness.lean`.

### 4.5 `USp(4)`: the joint density and the moment formulas

The joint law of `(a_1, a_2)` on `USp(4)` has density `(4π²)⁻¹ √max{ρ(a_1, a_2), 0}` with
`ρ = (a_1² − 4a_2 + 8)(a_2 − 2a_1 + 2)(a_2 + 2a_1 + 2)`, supported on
`S = {a_2 ≥ 2a_1 − 2, a_2 ≥ −2a_1 − 2, a_2 ≤ a_1²/4 + 2}` (FKRS (5.1), the change of variables
`a_1 = −2(cos θ_1 + cos θ_2)`, `a_2 = 2 + 4 cos θ_1 cos θ_2` in 4.2: in the angles
`ρ = 64 (cos θ_1 − cos θ_2)² sin²θ_1 sin²θ_2`, the Jacobian of `(θ_1, θ_2) ↦ (a_1, a_2)` is
`8 |cos θ_1 − cos θ_2| sin θ_1 sin θ_2`, and the two orderings of the angles give the same point,
so the density `(8/π²)(cos θ_1 − cos θ_2)² sin²θ_1 sin²θ_2` becomes `(2/π²)|cos θ_1 − cos θ_2|
sin θ_1 sin θ_2 = (4π²)⁻¹ √ρ`). Moments:
`E[a_1^n] = c_n c_{n+4} − c_{n+2}²` and `E[a_2^n] = ∑_k C(n,k) 2^{n−k} (c_k c_{k+2} − c_{k+1}²)`
(FKRS Tables 9–10), so `E[a_1^{2n}] = 1, 3, 14, 84, 594` for `n = 1..5` and `E[a_2^n] = 1, 2, 4,
10, 27` for `n = 1..5`; `Pr[a_1 = 0] = Pr[a_2 = n] = 0`; `realDimension = 10`; the Hodge circle
is `u ↦ diag(u, u, ū, ū)`. The analogous joint densities for `U(1) × U(1)`, `U(1) × SU(2)`,
`SU(2) × SU(2)` are FKRS Table 5 and follow from 4.3–4.4. *Rests on:* 4.2–4.4.

### 4.6 The connected groups of degree `4`

Define the six closed subgroups of `USp(4)` in the pinned coordinates, `degree4Connected : Fin 6 →
Subgroup (U 4)` — `U(1)_2`, `SU(2)_2`, `U(1) × U(1)`, `U(1) × SU(2)`, `SU(2) × SU(2)`, `USp(4)`
(the diagonal copies of 4.3 and block products through `blockProd 1 1`) — prove each is connected, compute its
real dimension (`1, 3, 2, 4, 6, 10`), exhibit a Hodge circle in each, prove the Hodge condition
(the Hodge circles of a connected compact group generate a dense subgroup when the group is
generated by its conjugates of a torus containing a Hodge circle), and compute the `a_1` and
`a_2` moment sequences: `E[a_1^{2n}]`: `U(1)_2`: `8, 96, 1280`; `SU(2)_2`: `4, 32, 320`;
`U(1)×U(1)`: `4, 36, 400`; `U(1)×SU(2)`: `3, 20, 175`; `SU(2)×SU(2)`: `2, 10, 70`; `USp(4)`:
`1, 3, 14`; `E[a_2^n]`, `n = 1,2,3`: `4, 18, 88`; `3, 10, 37`; `2, 8, 32`; `2, 6, 20`; `2, 5, 14`;
`1, 2, 4` (FKRS Table 8; each is a Weyl-integration computation through 4.3–4.5). *Rests on:*
2.2, 4.3–4.5.

### 4.7 The connected groups of degree `6`

Define the fourteen connected subgroups of `USp(6)` of FKS Table 9 in the pinned coordinates,
`degree6Connected : Fin 14 → Subgroup (U 6)`: `U(1)_3`, `SU(2)_3`, `U(1) × U(1)_2`, `SU(2) × U(1)_2`, `U(1) × SU(2)_2`, `SU(2) × SU(2)_2`,
`U(1)³`, `U(1)² × SU(2)`, `U(1) × SU(2)²`, `SU(2)³`, `U(1) × USp(4)`, `SU(2) × USp(4)`, `U(3)`
(embedded `A ↦ diag(A, Ā)`), `USp(6)`; prove connectedness, the Hodge condition for `weightOne 3`,
compute real dimensions (`1, 3, 2, 4, 4, 6, 3, 5, 7, 9, 11, 13, 9, 21`) and the moment formulas
for `a_1, a_2, a_3` by 4.2–4.4 (the `U(3)` case by the Weyl formula for `U(3)` with torus
`U(1)³`, consumed from LieGroups Layer 6). Record that `SU(2) × U(1)_2` and `U(1) × SU(2)_2` are
isomorphic (both to `U(1) × SU(2)`) but not conjugate in `USp(6)` (different coefficient laws;
FKS §3.6). *Rests on:* 2.2, 4.2–4.4,
LieGroups Layer 6.

## Layer 5: degree `2`

### 5.1 The three groups

In `USp(2) = SU(2)` (transported from `TauCeti.SU2` by 0.2): `u1 : ClosedSubgroup (U 2)`, the
torus `{diag(u, ū)}` (Tau Ceti `SU2.torus`); `nu1`, its normalizer `U(1) ∪ J·U(1)` with
`J = [[0, 1], [−1, 0]]` (Tau Ceti `normalizer_torus`); `su2 := USp 2`. Prove: `u1⁰ = u1`,
`su2⁰ = su2`, `nu1⁰ = u1` (the torus is connected, `J ∉ u1`, and `[nu1 : u1] = 2`), so the
component groups are `C_1, C_1, C_2`; real dimensions `1, 1, 3`; generators `[]`, `[J]`, `[]`.
The LMFDB's stored `gens` for `1.2.B.2.1a` is the single matrix `[[0, 1], [1, 0]]`, of
determinant `−1`: it lies outside `SU(2)`, and with `U(1)` it generates a group conjugate to
`O(2)` on whose second component `a_2 ≡ −1`; the generator of `N(U(1))` inside `SU(2)` is `J`.
*Rests on:* 0.2, 1.1–1.3, Tau Ceti `SU2/Basic.lean`, `SU2/Weyl/Basic.lean`.

### 5.2 They are Sato–Tate groups for `weightOne 1`

`IsSatoTateGroup (weightOne 1) G` for `G ∈ {u1, nu1, su2}`: self-duality is 0.2; the Hodge
circle is `Circle ≃ₜ* torus` (Tau Ceti `torusContinuousMulEquiv`), dense in `u1`; for `su2`,
the conjugates of the torus cover `SU(2)` (`exists_conj_mem_torus`), so they generate it;
rationality: `u1`, `su2` by 2.5(c); for `nu1` the non-identity component `J·U(1)` has `a_1 ≡ 0`
and `a_2 ≡ 1` (every element of it has characteristic polynomial `T² + 1`), so all its mixed
moments are `0` or `1`. *Rests on:* 2.2–2.5, 5.1.

### 5.3 The classification in degree `2`

If `G : ClosedSubgroup (U 2)` satisfies `IsSelfDual 1 G` and `HodgeCondition (weightOne 1) G`,
then `G` is conjugate in `SU(2)` to `u1`, `nu1` or `su2`. Proof: `G⁰` is a closed connected
subgroup of `SU(2)` containing a circle; the closed connected subgroups of `SU(2)` are `{1}`,
the conjugates of `u1` (dimension `1`: `lieAlgebra G⁰` is a line `ℝX` with `X` skew-Hermitian
traceless, conjugate to a diagonal line, and `G⁰ = exp(ℝX)` is its closure) and `SU(2)`
(dimension `3`); dimension `2` is impossible because `su(2)` has no two-dimensional Lie
subalgebra; if `G⁰ = SU(2)` then `G = SU(2)`; if `G⁰ = u1` then `G ≤ N(u1) = nu1`, so `G = u1`
or `G = nu1`. Rationality plays no role (Sutherland, Proposition 4.4). *Rests on:* 1.3, 2.2,
5.1, LieGroups Layer 2.

### 5.4 The invariants of the three groups

Trace moments through `m = 12`: `su2`: `1,0,1,0,2,0,5,0,14,0,42,0,132`; `u1`:
`1,0,2,0,6,0,20,0,70,0,252,0,924`; `nu1`: `1,0,1,0,3,0,10,0,35,0,126,0,462` (half the `u1`
moments for `m ≥ 1`, since the second component contributes `0`). `a_2 ≡ 1` on all three, so
`E[a_2^n] = 1`. Trace zero densities `0, 0, 1/2`; `zVector`: `z_1 = 0, 0, 1`. The trace laws:
semicircle, arcsine, `½ δ_0 + ½ arcsine`. These three records are the degree-`2` certificate
(3.6). *Rests on:* 3.1–3.5, 4.4, 5.1–5.2.

### 5.5 The non-self-dual degree-`2` families

For `n ≥ 1` and weight `w ≥ 1` with Hodge numbers `newform (w+1)`, the group
`SU(2)[C_n] := {g ∈ U(2) | det(g)^n = 1}` is *Modularity and Langlands extensions*'
`TauCeti.SymmetricPower.SatoTateGroup n` and is not redeclared; prove here, against that
declaration's membership law: it is closed, `(SU(2)[C_n])⁰ = SU(2)` (the determinant kernel is
connected and open), the component group is `μ_n ≅ C_n` via `det`, generators `[diag(1, ζ_n)]`,
the Hodge circle `u ↦ diag(u^w, u^{−w})`, real dimension `3`, `IsSelfDual w` iff `w` is odd and
`n = 1` (in even weight the ambient is `Od 2`, of dimension `1 < 3`),
`IsRational` iff `n ≤ 2` (on the component `det = ζ`, `E[a_2] = E[det] = ζ`), trace moments
`E[t^m] = catalan (m/2)` if `2n ∣ m`, `0` otherwise (the component `det = ζ^j` is
`ζ^{j/2}·SU(2)`, whose `m`-th moment is `ζ^{jm/2}` times the `SU(2)` moment, and
`∑_j ζ^{jm/2} = n·[2n ∣ m]`; for `n = 2`, `E[t²] = 0`), `Pr[t = 0] = 0`. Define
`nu1Mu n : ClosedSubgroup (U 2) := ⟨U(1), J, diag(1, ζ_n)⟩` (with `zetaCircle n = e^{2πi/n}` and
`diagU a b = diag(a, b)`) and prove: identity component `u1`, `2n` components, component group
**abelian** — `J` and `diag(1, ζ_n)` commute modulo `U(1)`, since `J diag(1, ζ_n) J⁻¹ = diag(ζ_n, 1)
= diag(1, ζ_n) · diag(ζ_n, ζ̄_n)` — so `G/G⁰ ≅ C_n × C_2`: cyclic of order `2n` for odd `n`,
`C_2 × C_2` for `n = 2`, `C_2` for `n = 1` (`nu1Mu 1 = nu1`); it is never dihedral for `n ≥ 3`,
although the LMFDB's name `U(1)[D_n]` and its stored `component_group` (`D_n`, in the LMFDB's
generator for this family) say so: the stored `gens` `J, diag(1, ζ_n)` generate exactly the group defined here, and
`J·diag(1, ζ_n)` has order `2n` (`n` odd) or `n` (`n` even) modulo `U(1)`, not `2`. Real dimension
`1`, Hodge circle `u ↦ diag(u^w, u^{−w})`, rational iff `n ≤ 2`, self-dual iff `w` is odd and
`n = 1` (for even `w`, `nu1Mu 1` is `U(2)`-conjugate to `Od 2` but does not lie in it), trace
moments `E[t^m] = ½ C(m, m/2)` if `2n ∣ m`, `0` otherwise (the component `diag(1, ζ^j) U(1)` has `t = ζ^{j/2}·2cos`),
`Pr[t = 0] = 1/2` (the `n` components `diag(1,ζ^j) J U(1)` have `t ≡ 0`), `counts = [(0, n)]`,
`zVector = [n]`. These are the LMFDB's `w.2.3.cn` and `w.2.1.dn` (generated by the
`SU(2)[C_n]` and `U(1)[D_n]` families of `sato_tate_groups/main.py`), whose generated moment rows use the condition `n ∣ m` in place of
`2n ∣ m`: the two agree exactly when `n` is odd; for even `n` the LMFDB row of `w.2.1.dn` is the
moment sequence of the index-two subgroup `⟨U(1), diag(1, ζ_n²), J·diag(1, ζ_n)⟩` of `nu1Mu n`
(`n` components, component group cyclic `C_n` generated by `J·diag(1, ζ_n)`, whose square
`−ζ_n I ≡ diag(1, ζ_n²)` modulo `U(1)`), which is the group that arises for CM newforms with
`χ_F ∈ ⟨χ⟩` (9.9), and the
LMFDB row of `w.2.3.cn` (`E[t²] = 1` for `n = 2`) is not a Haar moment sequence of `SU(2)[C_n]`.
*Rests on:* 2.1–2.5, 3.1–3.5, 4.4, 5.1.

### 5.6 Weight `0`, degree `1`

`mu n : ClosedSubgroup (U 1)`, the `n`-th roots of unity: finite, so `G⁰ = 1` and the Hodge
condition for `artin 1` holds with the trivial circle (`h^{0,0} = 1`, eigenvalue `u^0 = 1`, and
the trivial subgroup is dense in `G⁰ = 1`); `IsSelfDual 0` iff `n ≤ 2` (`O(1) = {±1}`);
`IsRational` iff `n ≤ 2` (the component `{ζ}` has `E[a_1] = −ζ`); component group `C_n`; trace
moments `E[t^m] = [n ∣ m]`; `counts = [(1, 1), (−1, 1)]` for even `n`, `[(1, 1)]` for odd `n`
(one component each, so `Pr[t = ±1] = 1/n`); real dimension `0`; `Pr[t = 0] = 0`. The identification of `mu n` with the Sato–Tate group
of a degree-one Artin representation of order `n` is the sibling `ArtinRepresentations`'. *Rests
on:* 2.1–2.5, 3.1–3.5.

## Layer 6: degree `4` — the fifty-five groups and the fifty-two

### 6.1 Coordinates, `Z`, `N` and `J`

In the pinned coordinates on `USp(4)`, `U(1)_2 = {diag(u, u, ū, ū)}`, and in Layer 6 `SU(2)_2`
denotes FKRS's copy `{diag(A, Ā) | A ∈ SU(2)} ≤ Z` ((3.1) below): it is conjugate in `USp(4)` to
the diagonal copy `su2Diag 2 = {[[a I, b I], [c I, d I]]}` of 4.3 (both are the symplectic
representation `std ⊗ ℂ²` of `SU(2)`, so they have the same coefficient law and the moments of
4.6), and it meets `U(1)_2` in `{±1}`, whereas `su2Diag 2` contains `U(1)_2`. Prove: the
centralizer `Z` of `U(1)_2` in `USp(4)` is
`{[[A, 0], [0, Ā]] | A ∈ U(2)}` (FKRS (3.1)), its normalizer is `N = Z ∪ J Z` with
`J = [[0, J_2], [−J_2, 0]]`, `J_2 = [[0, 1], [−1, 0]]`, `J` centralizes `SU(2)_2`, and
`N/U(1)_2 ≅ SU(2)/{±1} × C_2 ≅ SO(3) × C_2` (FKRS (3.2)); the normalizer of `SU(2)_2` is the
same `N`, with `Z/SU(2)_2 ≅ U(1)/{±1}` and `J` acting by inversion; the normalizer of
`U(1) × U(1)` contains it with index `8`, the quotient dihedral and generated by the involutions
`a = diag(J_2, I_2)`, `b = diag(I_2, J_2)`, `c = [[0, I_2], [−I_2, 0]]` (FKRS §3.6, transported
to the pinned coordinates); the normalizer of `U(1) × SU(2)` is `N(U(1)) × SU(2)`; the
normalizer of `SU(2) × SU(2)` is `SU(2) × SU(2) ∪ J'(SU(2) × SU(2))` with `J'` swapping the
factors. The unit quaternions `a + bi + cj + dk ↦ [[a+bi, c+di], [−c+di, a−bi]]` identify
`SU(2)` with `Sp(1)` and embed into `Z` by (3.1). *Rests on:* 0.2, 0.5, 4.6.

### 6.2 Finite subgroups of `SO(3)` and of `SU(2)`

Every finite subgroup of `SO(3)` is conjugate to a cyclic group `C_n`, a dihedral group `D_n`
(order `2n`), `A_4`, `S_4` or `A_5` (proof by the orbit count of poles, Artin's *Algebra*
§6.12); every finite subgroup of `SU(2)` of even order is the preimage of one of these
(binary cyclic, dicyclic, binary tetrahedral `2T` of order `24`, binary octahedral `2O` of order
`48`, binary icosahedral), and the odd-order ones are cyclic. The explicit presentations:
`⟨ζ_{2n}⟩`, `⟨ζ_{2n}, j⟩`, `2T = {±1, ±i, ±j, ±k, ½(±1 ± i ± j ± k)}`, `2O = 2T ∪ {(√2/2)(±x ± y)
: x ≠ y ∈ {1,i,j,k}}` in the quaternion model. *Rests on:* Mathlib (finite group theory,
`Matrix.specialUnitaryGroup`).

### 6.3 The fifty-five groups, with generators

Define, as closed subgroups of `U 4` contained in `USp 4`, with `G⁰` as named and the listed
generators `S` (so `G = ⟨G⁰, S⟩`; FKRS §§3.4–3.6, with `ζ_m = e^{πi/m} = cos(π/m) + sin(π/m) i`
and the quaternion embedding of 6.1):

- `G⁰ = U(1)_2`: `C_n` (`n ∈ {1,2,3,4,6}`): `[ζ_n]`; `D_n` (`n ∈ {2,3,4,6}`): `[ζ_n, j]`; `T`:
  the generators of `2T`; `O`: those of `2O`; `J(G) := ⟨G, J⟩` for each of these eleven;
  `C_{n,1}` (`n ∈ {2,4,6}`): `[J ζ_n]`; `D_{n,1}` (`n ∈ {2,4,6}`): `[J ζ_n, j]`; `D_{n,2}`
  (`n ∈ {3,4,6}`): `[ζ_n, J j]`; `O_1`: the generators of `2T` together with `J x` for one
  `x ∈ 2O ∖ 2T`. Thirty-two groups.
- `G⁰ = SU(2)_2`: `E_n := ⟨SU(2)_2, e^{πi/n}⟩` and `J(E_n) := ⟨E_n, J⟩` for `n ∈ {1,2,3,4,6}`
  (the scalar `e^{πi/n}` in `Z ≅ U(2)` acting as `diag(e^{πi/n} I, e^{−πi/n} I) ∈ U(1)_2`, which
  lies in `SU(2)_2` only for `n = 1`, so `E_1 = SU(2)_2`; FKRS §3.5). Ten groups.
- `G⁰ = U(1) × U(1)`: `F := G⁰`, `F_a, F_c, F_{a,b}, F_{ab}, F_{ac}, F_{ab,c}, F_{a,b,c}`, the
  subscripts listing generators from `{a, b, c, ab, ac}` as products of 6.1's matrices. Eight
  groups.
- `G⁰ = U(1) × SU(2)`: `G_{1,3} := G⁰` and `N(G_{1,3}) := ⟨G⁰, diag(J_2, I_2)⟩`. Two groups.
- `G⁰ = SU(2) × SU(2)`: `G_{3,3} := G⁰` and `N(G_{3,3}) := ⟨G⁰, J'⟩`. Two groups.
- `USp(4)`. One group.

Prove for each: it is closed (a finite union of cosets of a closed subgroup), it lies in
`USp(4)`, its identity component is the named `G⁰`, and its component group is the group of the
`[G/G⁰]` column of FKRS Table 8. The index set is `Fin 55` with the order of FKRS Table 8;
`degree4Group : Fin 55 → ClosedSubgroup (U 4)`. That each satisfies the axioms is 6.7. *Rests
on:* 1.1–1.2, 4.6, 6.1, 6.2.

**Checks.**

- (count) thirty-two groups with `G⁰ = U(1)_2`, ten with `SU(2)_2`, eight with `U(1) × U(1)`,
  two each with `U(1) × SU(2)` and `SU(2) × SU(2)`, and `USp(4)`: fifty-five in all.
- (computation) `J(O)` has `48` components and component group `S_4 × C_2`; `F_{a,b}` has `4`
  components and component group `C_2²`; `N(G_{1,3})` has identity component `U(1) × SU(2)` and
  two components (FKRS Table 11).
- (convention) `E_1 = SU(2)_2`, since the scalar `e^{πi}` acts as `−1 ∈ SU(2)_2`; the index order
  is FKRS Table 8's, so `F_c, F_{ab,c}, F_{a,b,c}` are the indices `44, 48, 49`.
- (non-example) `C_5 := ⟨U(1)_2, diag(A, Ā)⟩` with `A = diag(e^{πi/5}, e^{−πi/5})` is closed, lies
  in `USp(4)` and satisfies the Hodge condition, but `E[a_1²] = 3 + √5` on a component, so it is
  not rational and is not one of the fifty-five (6.5).

### 6.4 The identity component is one of six

If `G ≤ USp(4)` is closed and satisfies `HodgeCondition (weightOne 2)`, then `G⁰` is conjugate
in `USp(4)` to one of the six groups of 4.6 (FKRS Lemma 3.7). Proof: `lieAlgebra G⁰` is a
compact Lie algebra of rank `≤ 2` with a faithful four-dimensional symplectic self-dual
representation containing a Hodge circle; by the rank-`≤ 2` classification (RootSystems; the
list `t_1, su_2, t_2, t_1 × su_2, su_2 × su_2, su_3, sp_4, g_2`) and the dimension bounds on
their irreducibles (LieHighestWeight), `su_3` and `g_2` are excluded (no four-dimensional
self-dual faithful representation; `su_3` fails already because its representations of dimension
`≤ 4` are not self-dual), `u(2)` is excluded by the Hodge condition (the Hodge circle `u ↦ diag(u,
u, ū, ū)` is not conjugate into any `U(2) ≤ USp(4)` with eigenvalues of multiplicity two —
FKS18, Remark 2.3), and the remaining algebras integrate to the six groups, each conjugate into
the pinned form by 0.5. *Rests on:* 1.3, 2.2, 4.6, RootSystems, LieHighestWeight, LieGroups
Layers 2–3.

### 6.5 Rationality bounds the component group

For `G⁰ = U(1)_2`: `G ≤ N`, and an element of `G ∩ Z` projecting to a rotation of order `n` in
`SO(3) = Z/G⁰` is `diag(A, Ā) g₀` with `A ∈ SU(2)` of eigenvalues `e^{±πi/n}` and `g₀ ∈ G⁰`; on
its component the trace is `2cos(π/n)(u + ū)`, so `E[a_1²] = 2(2cos(π/n))² = 4 + 4cos(2π/n)`, an
integer iff `2cos(2π/n) ∈ ℤ` (an algebraic integer in `½ℤ` is an integer), i.e.
`n ∈ {1,2,3,4,6}` (FKRS §3.4);
hence the image of `G/G⁰` in `SO(3)` is a finite subgroup with element orders in `{1,2,3,4,6}`,
i.e. by 6.2 one of `C_n, D_n (n ∈ {1,2,3,4,6}), A_4, S_4`, and `A_5` is excluded. For `G⁰ =
SU(2)_2`: `G/G⁰` is a finite subgroup of `O(2) = N/G⁰`, cyclic or dihedral, and rationality
forces the cyclic part to have order in `{1,2,3,4,6}` (FKRS §3.5). For the split `G⁰`: `G/G⁰`
is a subgroup of the finite quotients `D_4`, `C_2`, `C_2` of 6.1. *Rests on:* 2.3, 3.1, 6.1, 6.2.

### 6.6 The classification theorem in degree `4`

If `G : ClosedSubgroup (U 4)` satisfies `IsSatoTateGroup (weightOne 2) G`, then `G` is conjugate
in `USp(4)` to `degree4Group i` for some `i : Fin 55` (FKRS Theorem 3.4); that `i` is unique is 6.8.
Proof: 6.4 fixes `G⁰` up to conjugacy; 6.5 bounds `G/G⁰` inside `N/G⁰`; the enumeration of
subgroups of `N/G⁰` with the given image (two-to-one or graph of a homomorphism to `C_2`, FKRS
§3.4; finite subgroups of `O(2)`, §3.5; subgroups of `⟨a, b, c⟩`, §3.6) lists exactly the groups
of 6.3 up to conjugacy in `N`. *Rests on:* 6.3–6.5.

### 6.7 The invariants of the fifty-five groups: the component engine and the certificate

**The component engine.** For `G⁰ ∈ {U(1)_2, SU(2)_2}` and a component `h G⁰`, let
`s(h) = ±1` according to whether `h ∈ Z`, and `r(h) = 2cos(π/k) = ζ_k + ζ_k^{−1} ∈ {−2, 0, 1, √2, √3}`
(in the convention `ζ_m = e^{πi/m}` of 6.3; FKRS write `ζ_{2k} + ζ_{2k}^{−1}` with `ζ_m = e^{2πi/m}`)
where `k` is the order of `hG⁰` in `G/G⁰` (if `s = 1`) or of `J h G⁰` in `⟨h, J⟩G⁰/G⁰` (if
`s = −1`). Then on `h G⁰` the law of `(a_1, a_2)` is that of `(r · a, a² + r² − 2)` for `s = 1`
and `(0, 2 − r²)` (`G⁰ = U(1)_2`) or `(0, 2 − a²)` (`G⁰ = SU(2)_2`) for `s = −1`, where `a` is
`a_{1,U(1)}` resp. `a_{1,SU(2)}` of 4.4 (FKRS Table 6, derived from the explicit matrices of 6.3
and the Haar invariance of 1.4). For the split `G⁰`, the component laws are the rows of FKRS
Table 6 (`a_1 ∈ {a + a', a, 0}`, `a_2 ∈ {aa' + 2, 2, a, 0}` with independent genus-one
variables). **The axioms.** `IsSatoTateGroup (weightOne 2) (degree4Group i)` for every `i`: the
Hodge condition from 4.6 and `G⁰ ≤ G`, self-duality from 6.3, rationality by the engine — every
component law above has integral moments exactly because `r² = (2 cos(π/k))² ∈ ℤ` for
`k ∈ {1,2,3,4,6}` (FKRS §3.4). **The certificate.** Define `degree4Record : Fin 55 → STRecord` as stored data
(FKRS Table 8: `d`, `c`, `z_1`, `z_2`, `E[a_1²], E[a_1⁴], E[a_1⁶]`, `E[a_2], E[a_2²], E[a_2³]`,
extended by Tables 9–10 to the twelfth trace moment and sixth `a_2` moment, the isomorphism type
of `G/G⁰`, and the character diagonal) and prove `record (weightOne 2) (degree4Group i) =
degree4Record i` for every `i`, each row by the engine and 3.1–3.5; the proof is a finite
computation per row, and the statement is the theorem. Sample rows: `J(O)`: `d = 1`, `c = 48`,
`G/G⁰ ≅ S_4 × C_2`, `z_1 = 33`, `z_2 = (1, 0, 6, 8, 9)`, `E[a_1^{2n}] = 1, 6, 50, 525, 6426`,
`E[a_2^n] = 1, 3, 7, 26, 96`; `N(G_{1,3})`: `d = 4`, `c = 2`, `z_1 = 0`, `z_2 = (0,0,0,0,1)`,
`E[a_1^{2n}] = 2, 11, 90`, `E[a_2^n] = 2, 5, 14`; `F_{a,b}`: `d = 2`, `c = 4`, `z_1 = 1`,
`E[a_1^{2n}] = 2, 12, 110`, `E[a_2^n] = 2, 5, 14`; `E_1`: `4, 32, 320` and `3, 10, 37`; `J(E_1)`:
`2, 16, 160` and `2, 6, 20`; `C_{2,1}`: `4, 48, 640` and `3, 11, 48`. *Rests on:* 3.1–3.6, 4.4,
4.6, 6.3.

**Checks.**

- (computation) `J(O)`: `d = 1`, `c = 48`, `z_1 = 33`, `z_2 = (1, 0, 6, 8, 9)`,
  `E[a_1^{2n}] = 1, 6, 50, 525, 6426`, `E[a_2^n] = 1, 3, 7, 26, 96`.
- (computation) `N(G_{1,3})`: `d = 4`, `c = 2`, `z_1 = 0`, `z_2 = (0, 0, 0, 0, 1)`,
  `E[a_1^{2n}] = 2, 11, 90`, `E[a_2^n] = 2, 5, 14`.
- (computation) `C_{2,1}`: `E[a_1^{2n}] = 4, 48, 640`, `E[a_2^n] = 3, 11, 48`, `Pr[a_1 = 0] = 1/2`.
- (degenerate) `USp(4)`: `c = 1`, `d = 10`, `E[a_1^{2n}] = 1, 3, 14, 84, 594`,
  `E[a_2^n] = 1, 2, 4, 10, 27`, every event probability `0` (4.5).

### 6.8 Distinctness

No two of the fifty-five groups are conjugate in `U(4)`: the tuple `(d, c, z_1, z_2, E[a_2])` of
`degree4Record` separates them (a check on FKRS Table 8: the only pairs with equal
`(d, c, z_1, z_2)` are `E_2` and `J(E_1)`, with `E[a_2] = 1` and `2`), and each entry is a
conjugacy invariant (1.3, 3.5, 3.1). Neither the first three `a_1` moments nor the first three
`a_2` moments separate on their own (`C_4`, `C_6` share `4, 36, 400` and `2, 8, 32` with `F`;
`D_4`, `D_6`, `J(C_4)`, `J(C_6)`, `D_{4,2}`, `D_{6,2}` share `2, 18, 200`). *Rests on:* 6.7.

### 6.9 The inclusion lattice

For `i, j : Fin 55`, `degree4Le i j` means some `USp(4)`-conjugate of `degree4Group i` is a
finite-index subgroup of `degree4Group j`; `degree4Realized : Finset (Fin 55)` is the index set
with `F_c, F_{ab,c}, F_{a,b,c}` (indices `44, 48, 49`) removed, of cardinality `52`. Prove the
stored relation (maximal subgroups with multiplicities, minimal supergroups) is exactly
`degree4Le` on `degree4Realized`, and that `maximal` holds exactly for the groups with no proper
finite-index supergroup among the fifty-two. A containment `H ≤ G` forces
`H⁰ = G⁰`; the lattice therefore splits by identity component, and within `G⁰ = U(1)_2` it is
the lattice of the finite groups of 6.3 inside `N/G⁰`. The verification is a finite computation
on generators (membership of each generator of `H` in `G` after a conjugation listed in the
certificate). *Rests on:* 6.3, 6.7.

**Checks.**

- (count) `degree4Realized` has `52` elements and omits exactly `F_c`, `F_{ab,c}`, `F_{a,b,c}`.
- (computation) `degree4Le` holds from `J(C_1)` and from `C_2` to `J(C_2)`, each of index `2`: the
  Jacobian of `y² = x⁵ − x` has `ST = J(C_2)` over `ℚ`, `J(C_1)` over `ℚ(i)` and `C_2` over
  `ℚ(√−2)`, and base change gives finite-index subgroups (9.5).
- (characterisation) `G_{1,3} ≤ N(G_{1,3})` with index `2`; every containment preserves the
  identity component.
- (non-example) `C_1 = U(1)_2` lies in `USp(4)` but not with finite index, so `degree4Le` does not
  relate them.

### 6.10 The real-place condition

`HasRealPlaceCondition H G`: there is `γ ∈ G` with `γ² = −1`, `trace γ = 0`, and `γ θ(u) γ⁻¹ =
θ(u⁻¹)` for a Hodge circle `θ` (FKRS Remark 3.5, from Serre §8.3.4). Prove that exactly fifteen
of the fifty-five fail it: `C_n` (five), `D_n` (four), `T`, `O`, `F`, `F_a`, `F_c`, `U(1) × SU(2)`.
Its arithmetic meaning (a real place of `k` forces it) is 9.8. *Rests on:* 6.3.

## Layer 7: finiteness, Jordan's theorem, and degree `6` as checked data

### 7.1 Jordan's theorem, consumed

Jordan's theorem is `FiniteGroupInvariants` 10.5: `jordanBound : ℕ → ℕ` and
`jordan_exists_abelian_normal_index_le`, every finite subgroup of `GL (Fin n) F`, for `F` any
field of characteristic zero, has an abelian normal subgroup of index at most `jordanBound n`;
that milestone also carries Schur's explicit bound and the corollary for subgroups finite modulo
scalars. Nothing is restated here: 7.2 applies the theorem with `F = ℂ` to the image of `G/G⁰` in
a representation of `N` on which `G⁰` acts trivially and `N/G⁰` faithfully. *Rests on:*
`FiniteGroupInvariants` 10.5.

### 7.2 Finiteness of the groups satisfying the axioms

For fixed `H : HodgeNumbers w d`, the set of `U(d)`-conjugacy classes of `G` with
`IsSatoTateGroup H G` is finite (FKRS Remark 3.3; Sutherland Theorem 4.3). Proof: ST1–ST2 bound
`G⁰` to finitely many conjugacy classes (a compact connected subgroup is determined up to
conjugacy by its Lie algebra and its representation, and only finitely many `(𝔤, ρ)` of
dimension `≤ d²` admit a Hodge circle — RootSystems, LieHighestWeight); fix `G⁰` and its
normalizer `N`; the character form 2.3 applied to a representation of `N` on which `G⁰` acts
trivially and `N/G⁰` faithfully bounds the exponent of `G/G⁰` (a sum of `k` roots of unity that
is an integer for all powers forces bounded order), Jordan's theorem 7.1 bounds `|G/G⁰|`, and a
compact Lie group contains finitely many conjugacy classes of finite subgroups of bounded order.
*Rests on:* 2.3, 6.4 (its method), 7.1, LieGroups Layer 6.

### 7.3 The connected groups of degree `6`

If `G ≤ USp(6)` is closed and satisfies `HodgeCondition (weightOne 3)` and `IsLefschetz G`, then
`G⁰` is conjugate to one of the fourteen groups of 4.7 (FKS §3.6); `SO(3)` (via `Sym²`) and
`SU(3)` (via `U(3)`) satisfy ST1–ST3 but fail ST4, and `U(2)` fails ST2. Proof as in 6.4 with the
rank-`≤ 3` list (FKS §3.6 table) and the six-dimensional symplectic representation. The
dictionary `G⁰ ↔ End(A_K)_ℝ` of FKS Table 9 (types A–N) is 8.4. *Rests on:* 2.2, 2.4, 4.7,
RootSystems, LieHighestWeight.

### 7.4 The degree-`6` classification as checked data

`degree6Record : Fin 410 → STRecord` and `degree6Gens : Fin 410 → (Fin 14 × List (Matrix (Fin 6)
(Fin 6) ℂ))` (the index of the identity component in 4.7 and the generators) are stored data
(FKS §§8–9 and the LMFDB's `gps_st` rows of weight `1` and degree `6`), and `degree6Group :
Fin 410 → ClosedSubgroup (U 6)` is the closure of the subgroup generated by the stored identity
component and generators. The **checker theorem** `degree6_checked i` asserts: `degree6Group i`
satisfies `IsSatoTateGroup (weightOne 3)` and `IsLefschetz`, and `record (weightOne 3)
(degree6Group i) = degree6Record i` (so in particular the generators lie in `USp(6)`, normalize
the identity component, and give the stored number of components); it is proved by the component
engine (the analogue of 6.7 for the four `G⁰` of positive dimension at most `3` and the Weyl
formulas of 4.7) and finite computation. **Distinctness** `degree6_pairwise_nonConj` by the
`3`-diagonal and record tuple (FKS §6, Definition 6.2). **Completeness** `degree6_classification`:
every closed `G ≤ USp(6)` with `IsSatoTateGroup (weightOne 3) ∧ IsLefschetz` is conjugate to one
of the `433` groups `degree6Candidate : Fin 433 → ClosedSubgroup (U 6)`, of which the `410` are
those realized by abelian threefolds (FKS Theorem 1.1); the proof of the upper bound is FKS §§4–5
(enumeration of finite subgroups of the normalizers `N/G⁰` with the rationality constraint, a
Magma computation in the source) and is stated here as a theorem whose proof is a checked
certificate of that enumeration: the stored list of the `433` candidate presentations and a
verification that every subgroup of `N/G⁰` meeting the rationality bound of 7.2 is conjugate to
one of them. The exclusion of the `23` non-realized groups is arithmetic (FKS §7) and is 9.8.
Maximal groups: `33` (FKS Table 12); the component orders maximal for divisibility are `192`,
`432`, `336`. Where a stored LMFDB value disagrees with Layer 4 the certificate carries the
computed value: the `real_dimension` of every row with identity component `U(1) × U(1)_2` (the
LMFDB's `1.6.L.*`) is `2` (4.7), while the stored rows say `6`. *Rests on:* 2.3–2.4, 3.6, 4.7,
7.2, 7.3.

**Checks.**

- (count) `410` rows, `33` of them maximal, with maximal component orders `192`, `432`, `336`;
  `433` candidates, `23` of them not realized.
- (computation) `USp(6)`: real dimension `21`, `E[a_1^{2n}] = 1, 3, 15, 104, 909`,
  `E[a_2^n] = 1, 2, 5, 16, 62`, `E[a_3²] = 2`, `E[a_3⁴] = 23`.
- (computation) `U(3)` has real dimension `9`; `N(U(3))` has two components and
  `Pr[a_1 = 0] = Pr[a_3 = 0] = 1/2`.
- (convention) every row with identity component `U(1) × U(1)_2` has real dimension `2` in
  `degree6Record`, where the LMFDB's stored `1.6.L.*` rows say `6`.

## Layer 8: endomorphism algebras, the endomorphism field, Galois endomorphism types

Throughout, `k` is a field of characteristic zero (a number field where primes are mentioned),
`k̄ = AlgebraicClosure k`, `A : AbelianVariety k` (Tau Ceti), `g := dim A`.

### 8.1 Endomorphisms over `k` and over `k̄`, and the Galois action

`End⁰ A := ℚ ⊗[ℤ] End A`, `geomEnd A := End (A.baseChange k̄)`, `geomEnd⁰ A := ℚ ⊗[ℤ] geomEnd A`,
`realGeomEnd A := ℝ ⊗[ℤ] geomEnd A`, and the injection `End.baseChange : End A →+* geomEnd A`
(Tau Ceti; injectivity is *Abelian schemes* A6.3). Construct `galoisAction A : (k̄ ≃ₐ[k] k̄) →* RingAut (geomEnd A)`:
`σ` acts by transporting an endomorphism of `A_k̄` along the canonical isomorphism
`(A_k̄).baseChange_σ k̄ ≅ A_k̄` (base change of `A` along `σ`, which is `A_k̄` again because `A` is
defined over `k`; Tau Ceti `baseChangeFunctor`, `End.congr`, `End.baseChange`). Prove: the action
is continuous for the Krull topology and the discrete topology on the finitely generated
`geomEnd A` (A6.7: `Hom` is free of finite rank, so the action factors through a finite
quotient), it fixes the image of `End A`, and **Galois descent**: for an intermediate field
`L`, the fixed points of `Gal(k̄/L)` are exactly the image of `End (A.baseChange L)`
(a `Gal(k̄/L)`-invariant morphism `A_k̄ → A_k̄` descends to `A_L`; Milne, *Abelian Varieties*,
§I.1 and the descent of morphisms along `k̄/L`, proved here for the finitely many coefficients of
the graph). *Rests on:* Tau Ceti `AbelianVariety.*`, A6.3, A6.7.

**Checks.**

- (degenerate) for `11.a` over `ℚ` (no CM) `geomEnd A = ℤ` and the action is trivial.
- (computation) for `27.a` over `ℚ`, `geomEnd A ≅ ℤ[ζ_3]` and `σ` acts by complex conjugation
  exactly when `σ` is nontrivial on `ℚ(√−3)`, so the kernel is `Gal(ℚ̄/ℚ(√−3))`.
- (characterisation) Galois descent for `27.a`: the fixed points of `Gal(ℚ̄/L)` are all of
  `geomEnd A` for `L = ℚ(√−3)` and the image `ℤ` of `End A` for `L = ℚ`.
- (compatibility) the action fixes the image of `End A` under `End.baseChange`.

### 8.2 The endomorphism field

`endField A : IntermediateField k k̄ := IntermediateField.fixedField (galoisAction A).ker`,
written `K`. Prove: `K/k` is finite Galois with `Gal(K/k) ≅ range (galoisAction A)`; `K` is the
**minimal** intermediate field with `End (A.baseChange K) = geomEnd A` (image equality under
`End.baseChange`), and `L ⊇ K` iff `End (A_L) = End (A_k̄)`; isogeny invariance `endField A =
endField B` for `k`-isogenous `A, B`; base change `endField (A.baseChange F) = F·K` inside `k̄`
for `F ⊆ k̄` finite over `k`, so `Gal(FK/F) ≅ Gal(K/K ∩ F)`; `endField (A × B) = endField A ·
endField B`; for an elliptic curve `E`, `K = k` unless `E` has CM not defined over `k`, in which
case `K = k·(CM field)`. **Silverberg's bound**: `K ⊆ k(A[n])` for every `n ≥ 3` (Silverberg
1992, Theorem 2.4: an automorphism of `A_k̄` acting trivially on `A[n]` fixes every endomorphism;
proof through the finiteness of the torsion kernel and rigidity), so `K/k` is unramified at
every prime of good reduction, with the Néron–Ogg–Shafarevich criterion consumed from *Néron
models and semistable abelian varieties* Layer 5. For a `ℚ`-simple `GL₂`-type variety this is
*Abelian varieties of GL₂-type* `GL2Type.endField`; prove the two agree. *Rests on:* 8.1, A6.7,
A3.2 (torsion), Néron models Layer 5.

**Checks.**

- (computation) `endField A` is `ℚ` for `11.a` and for the Jacobian of `y² = x⁵ − x + 1`,
  `ℚ(√−3)` for `27.a` and for the Jacobian of `y² = x⁶ + 1`, and `ℚ(i)` for `32.a`.
- (base change) over `ℚ(√−3)` the endomorphism field of `27.a` is the base field, `⊥` as an
  intermediate field.
- (characterisation) `L ⊇ K` iff `End (A.baseChange L) = geomEnd A`: for `27.a`, true for
  `L = ℚ(√−3)` and false for `L = ℚ`.
- (compatibility) on a `ℚ`-simple `GL₂`-type variety it is *GL₂-type*'s `GL2Type.endField`.

### 8.3 Simple, geometrically simple, squarefree, primitive, isotypic

With `IsSimple` consumed from *Abelian schemes* A6.4: `IsGeomSimple A := IsSimple (A.baseChange k̄)`;
`IsSquarefree A`: `A` is `k`-isogenous to a product `∏ A_i` of simple `A_i` pairwise
non-isogenous over `k` (equivalently `End⁰ A` is a product of division algebras, by A6.4–A6.5);
`IsGeomSquarefree A := IsSquarefree (A.baseChange k̄)`; `IsIsotypic A`: `k`-isogenous to `B^n`
with `B` simple; `IsPrimitive A`: not `k`-isogenous to `B^n` with `n ≥ 2` (Ribet's sense; the
`GL₂`-type refinement is *GL₂-type* GT.1/primitive). Prove: Poincaré reducibility (A6.5) makes
every `A` isogenous to `∏ B_i^{n_i}` with the `B_i` simple and pairwise non-isogenous, unique up
to isogeny and order; `End⁰ A ≅ ∏ M_{n_i}(End⁰ B_i)`; `IsGeomSimple → IsSimple`; the LMFDB
columns `is_simple_base = IsSimple`, `is_simple_geom = IsGeomSimple`; geometric simplicity is
decided over `K`: `IsGeomSimple A ↔ IsSimple (A.baseChange K)`. *Rests on:* A6.4, A6.5, 8.2.

### 8.4 The real geometric endomorphism algebra and its finite lists

`realGeomEnd A` is a finite-dimensional semisimple `ℝ`-algebra with the positive involution
induced by a Rosati involution (A6.14), hence by `realRosatiDecomposition` (A6.15) isomorphic to
`∏ M_{r_i}(ℝ) × ∏ M_{c_j}(ℂ) × ∏ M_{h_k}(ℍ)`; its isomorphism type is an isogeny invariant and
is invariant under base change beyond `K`. Enumerate the possibilities: for `g = 1`, `ℝ` or `ℂ`;
for `g = 2`, exactly one of `ℝ, ℝ×ℝ, ℂ×ℝ, ℂ×ℂ, M_2(ℝ), M_2(ℂ)` (FKRS §4.1 (A)–(F), from the
Albert types M0.2 for the simple factors and the product decomposition 8.3; `ℍ` cannot occur
because a definite quaternion algebra is not the endomorphism algebra of an abelian surface in
characteristic zero — type III with `g = 2` is excluded by the Albert–Shimura restrictions
consumed from M0.2 and A6.17); for `g = 3` exactly one of the fourteen algebras of FKS Table 9
(`ℝ, ℂ, ℝ², ℂ×ℝ, ℝ³, ℂ×ℝ², ℂ²×ℝ, ℂ³, ℝ×M_2(ℝ), ℂ×M_2(ℝ), ℝ×M_2(ℂ), ℂ×M_2(ℂ), M_3(ℝ), M_3(ℂ)`).
Define the enumerations `RealEndTypeSurface` (six constructors named `M2C, M2R, CxC, CxR, RxR,
R`, the LMFDB's `real_geom_end_alg` strings) and `RealEndTypeThreefold` (fourteen), with
`realEndTypeSurface A : RealEndTypeSurface` for `g = 2` the unique `t` with
`Nonempty (realGeomEnd A ≃ₐ[ℝ] model t)`, where the models of `M2C, M2R, CxC, CxR, RxR, R` are
`M_2(ℂ)`, `M_2(ℝ)`, `ℂ × ℂ`, `ℂ × ℝ`, `ℝ × ℝ`, `ℝ` (existence and uniqueness are the enumeration
above), and the geometric description of each case (square of a CM curve; square of a non-CM
curve or QM surface; product of non-isogenous CM curves or simple quartic CM; CM times non-CM;
product of non-isogenous non-CM curves or RM; generic). *Rests on:* 8.3, A6.14–A6.15, A6.17,
M0.1–M0.2.

**Checks.**

- (computation) `R` for the Jacobian of `y² = x⁵ − x + 1`, `M2C` for that of `y² = x⁶ + 1`,
  `RxR` for `11.a × 37.a`, `M2R` for `11.a × 11.a`, `CxR` for `11.a × 27.a`, `CxC` for
  `27.a × 32.a`.
- (convention) the type reads `End(A_k̄)`, not `End(A)`: `27.a × 27.a` is `M2C` although
  `End(A) ⊗ ℝ = M_2(ℝ)` over `ℚ`.
- (non-example) `ℍ` is never `realGeomEnd A` of an abelian surface in characteristic zero, so no
  seventh constructor is needed.

### 8.5 The rational types: `geom_end_alg` and `end_alg`

For `g = 2`: `geomEnd⁰ A` is isomorphic to exactly one of the nine `ℚ`-algebras of the knowl
`g2c.geom_end_alg` — `ℚ`; a real quadratic field (`RM`); a quartic CM field (`CM`); a
non-split indefinite quaternion algebra over `ℚ` (`QM`); `ℚ × ℚ`; `F × ℚ` with `F` imaginary
quadratic (`CM × ℚ`); `F_1 × F_2` with `F_1 ≠ F_2` imaginary quadratic (`CM × CM`); `M_2(ℚ)`;
`M_2(F)` with `F` imaginary quadratic (`M_2(CM)`) — with `GeomEndAlgSurface` the nine-constructor
enumeration and `geomEndAlgSurface A` characterized up to `ℚ`-algebra isomorphism; the proof is
Albert's list for simple surfaces (`ℚ`, real quadratic, indefinite quaternion, quartic CM; M0.2
and Shimura's exclusion of the definite and the type-III cases) together with 8.3 for the split
cases and the elliptic-curve endomorphism algebras (`ℚ` or imaginary quadratic; EllipticCurves
Layer 1). For `k = ℚ`: `End⁰ A` is one of the five algebras of the knowl `g2c.end_alg` — `ℚ`,
real quadratic (`RM`), imaginary quadratic (`CM`), `ℚ × ℚ`, `M_2(ℚ)` — the enumeration
`EndAlgSurfaceQ` with `endAlgSurfaceQ A`; the exclusions are: an elliptic curve over `ℚ` has `End = ℤ`, so split cases give `ℚ × ℚ` or
`M_2(ℚ)`; a `ℚ`-simple surface with `End⁰ A` a quaternion division algebra `B` does not exist over
a field `k` with a real place: if `B` is definite then `End(A)_ℝ ≅ ℍ`, which by FKRS Table 8
happens only for `J(C_1)`, excluded by FKRS Proposition 4.11; if `B` is indefinite then `A_ℝ`
would carry an action of `B` by endomorphisms defined over `ℝ`, which Shimura's theorem that the
Shimura curve of `B` has no real points forbids (Shimura 1975), so `End(A)_ℝ ≅ M_2(ℝ)` forces
`End⁰ A ≅ M_2(ℚ)` — the Galois type alone (`E[C_1]` or `F[C_2, C_1, M_2(ℝ)]`) does not decide
between `M_2(ℚ)` and `B`; and a
`ℚ`-simple CM surface over `ℚ` has `End⁰` imaginary quadratic at most, never the quartic CM
field, because the CM type is not defined over `ℚ` (FKRS §4.3 case D). *Rests on:* 8.3–8.4,
M0.2, A6.17, EllipticCurves Layer 1.

**Checks.**

- (computation) the Jacobian of `y² = x⁵ − x + 1` has `end_alg = Q` and `geom_end_alg = Q`; that
  of `y² = x⁶ + 1` over `ℚ` has `end_alg = M2Q` and `geom_end_alg = M2CM`.
- (computation) `11.a × 37.a` has `end_alg = QxQ`, `11.a × 11.a` has `end_alg = M2Q`, and
  `27.a × 32.a` has `end_alg = QxQ` and `geom_end_alg = CMxCM`.
- (non-example) a quartic CM field is never `End⁰ A` of a surface over `ℚ`, which is why
  `EndAlgSurfaceQ` has five constructors where `GeomEndAlgSurface` has nine.

### 8.6 The LMFDB `GL₂`-type predicate for surfaces, and ℚ-curves

`IsGL2TypeLMFDB A` per the pinned convention. Prove for `g = 2` over `ℚ`: `IsGL2TypeLMFDB A ↔
endAlgSurfaceQ A ∈ {RM, CM, QxQ}` (simple with quadratic `End⁰`, or `E_1 × E_2` non-isogenous with
`End = ℤ`; `M_2(ℚ)` is excluded by the pairwise non-isogeny clause and `ℚ` by the dimension
clause), and over a general `k` the clause-by-clause characterization with CM elliptic factors
excluded. Record the comparison with Ribet's definition (*GL₂-type* GT.1): the two agree except
on varieties isogenous to `E^2` with `End⁰(E) = ℚ`, which are Ribet-`GL₂`-type and not
LMFDB-`GL₂`-type. `ℚ`-curves are `EllipticCurve.IsQCurve` (GT.5), consumed and not redefined.
*Rests on:* 8.3, 8.5, GT.1, GT.5.

### 8.7 The Galois endomorphism type

`structure GaloisEndType` : a finite group `Γ`, a finite-dimensional `ℝ`-algebra `E`, and an
action `Γ →* (E ≃ₐ[ℝ] E)`; isomorphism of two such pairs (`GaloisEndType.IsIsomorphic`) is an
isomorphism of groups with an equivariant algebra isomorphism; `galoisEndType A := [Gal(K/k),
End(A_K)_ℝ]`, with `K = endField A`, `Γ = Gal(K/k)`, `E = ℝ ⊗[ℤ] End (A.baseChange K)`, and `σ`
acting through any lift to `Gal(k̄/k)` by the action of 8.1 (well defined because the kernel of
that action fixes `K`) (FKRS Definition 1.3, Sutherland Definition 4.10). Prove it
is an isogeny invariant, that the real algebra is `realGeomEnd A`, that the action is faithful,
and the three elliptic cases `[C_1, ℝ]`, `[C_1, ℂ]`, `[C_2, ℂ]` (complex conjugation) according
to no CM, CM over `k`, CM not over `k`. *Rests on:* 8.1–8.4.

**Checks.**

- (computation) `[C_1, ℝ]` for `11.a`; `[C_2, ℂ]` for `27.a` over `ℚ`, the nontrivial element
  acting by complex conjugation; `[C_1, ℂ]` for `27.a` over `ℚ(√−3)`.
- (computation) `11.a × 11.a^{(d)}` with `d` not a square: `Gal(K/ℚ) = C_2` and
  `End(A_K)_ℝ = M_2(ℝ)`; `27.a × 32.a`: `Gal(K/ℚ) = C_2²` and `End(A_K)_ℝ = ℂ × ℂ`.
- (convention) the algebra is `End(A_K)_ℝ ≅ realGeomEnd A`, not `End(A)_ℝ`: for `27.a × 27.a` over
  `ℚ` it is `M_2(ℂ)`, while `End(A)_ℝ = M_2(ℝ)`.

### 8.8 The intrinsic label prefix

`stPrefix H G := (w, d, [G⁰]_{conj}, c, [G/G⁰]_{iso})`, the invariants from which the LMFDB
label `w.d.A.c.n s` is built: weight, degree, the conjugacy class of the identity component, the
number of components, the isomorphism class of the component group. Prove it is a conjugacy
invariant and that in degree `2` it is injective on the three groups; in degree `4` it is **not**
injective (the suffix letter `s` separates groups with the same prefix, e.g. `1.4.F.2.1a, b, c`
for `J(C_1)`, `C_2`, `C_{2,1}`), and the assignment of the letters `A` and `s` is not a target.
*Rests on:* 1.1–1.3.

## Layer 9: the Sato–Tate group of an abelian variety and of a newform

Here `k` is a number field, `ℓ` a prime, `ι : ℚ_ℓ ↪ ℂ` a field embedding.

### 9.1 The `ℓ`-adic representation and its image

`V_ℓ(A) := ℚ_ℓ ⊗ T_ℓ(A)` with the continuous `ρ_{A,ℓ} : Gal(k̄/k) → GL(V_ℓ(A))` (*Abelian
schemes* A4.1; for an elliptic curve Tau Ceti's `tateModuleGaloisRepresentation` with
`continuous_tateModuleGaloisRepresentation_apply`), preserving the Weil pairing up to the
cyclotomic character (A3.5, A3.7; for elliptic curves `det_tateModuleGaloisRepresentation`), so
that `ρ` lands in `GSp(V_ℓ, ψ)` for a polarization-adapted symplectic basis; `G_k^1 := ker
(cyclotomic character)` and the image `ρ(G_k^1) ≤ Sp(V_ℓ)`. Faltings' theorem
`End⁰(A) ⊗ ℚ_ℓ = End_{G_k}(V_ℓ)` is consumed from *Faltings finiteness and isogeny theorems*. *Rests on:*
A4.1, A3.5–A3.7, Tau Ceti `TateModule/*`.

### 9.2 Zariski closures and the complex points

`G_ℓ^{Zar}`, the Zariski closure of `ρ(Gal(k̄/k))` in `GL(V_ℓ)` as an algebraic group over `ℚ_ℓ`
(ReductiveGroups Layer 3), and `G_ℓ^{1,Zar}`, the closure of `ρ(G_k^1)`; prove
`G_ℓ^{1,Zar} = ker(G_ℓ^{Zar} → 𝔾_m)` (Bogomolov's theorem: `ρ(Gal)` is open in `G_ℓ^{Zar}(ℚ_ℓ)`;
FKRS Definition 2.4, consumed as the openness statement of *Deligne weights* §2.2 in the
symplectic case and stated here as a milestone in general), that `G_ℓ^{1,Zar}` is reductive
(semisimplicity of `V_ℓ`, Faltings, and *Deligne weights* §8.14), and that its component group
is finite and canonically isomorphic to that of `G_ℓ^{Zar}` (FKRS Lemma 2.8). Base change:
`G_ℓ^{1,Zar}(A_{k'}) ≤ G_ℓ^{1,Zar}(A)` with the same identity component, open of finite index.
Via `ι`, `G¹ := G_ℓ^{1,Zar} ×_{ι} ℂ` is a complex reductive group whose complex points form a
closed subgroup of `Sp_{2g}(ℂ)`. *Rests on:* 9.1, ReductiveGroups Layer 3, Deligne weights
§§2.2, 8.14, Faltings.

### 9.3 The Sato–Tate group

`satoTateGroup A g hg ℓ ι : ClosedSubgroup (U (2g))`: a maximal compact subgroup of `G¹(ℂ)`
contained in `USp(2g)` (LieGroups Layer 9: maximal compact subgroups of a complex reductive
group exist, are conjugate, and one is `G¹(ℂ) ∩ U(2g)` for a basis in which `G¹` is
self-adjoint; `USp(2g)` is a maximal compact subgroup of `Sp_{2g}(ℂ)`). Prove: `ST(A) ≤ USp(2g)`;
its conjugacy class in `USp(2g)` does not depend on the choices (basis, maximal compact); its
component group is canonically the component group of `G_ℓ^{Zar}` (FKRS Lemma 2.8, Cartan's
theorem that a maximal compact subgroup of a connected complex Lie group is connected); it is
an isogeny invariant and `ST(A_{k'})` is the inverse image of `π_0(G^{Zar}(A_{k'}))` under
`ST(A) → π_0`. For `g = 1` and `W : WeierstrassCurve k` elliptic, `ellipticSatoTate W ℓ ι` is
the same construction on Tau Ceti's representation. *Rests on:* 9.2, LieGroups Layer 9.

**Checks.**

- (computation) `ellipticSatoTate` is conjugate in `SU(2)` to `su2` for `11.a`, to `nu1` for
  `27.a` and `32.a` over `ℚ`, and to `u1` for `27.a` over `ℚ(√−3)` (labels `1.2.A.1.1a`,
  `1.2.B.2.1a`, `1.2.B.1.1a`; 9.9).
- (computation) `satoTateGroup` is conjugate to `USp(4)` for the Jacobian of `y² = x⁵ − x + 1`, to
  `C_{2,1}` for that of `y² = x⁶ + 1` over `ℚ`, and to `C_1 = U(1)_2` for the latter over `ℚ(√−3)`.
- (compatibility) `ST(A) ≤ USp(2g)`, and for an elliptic curve the two constructions agree.
- (independence) for `g ≤ 3` the `USp(2g)`-conjugacy class does not depend on `ℓ` or `ι` (9.10).

### 9.4 The named hypotheses: Mumford–Tate and algebraic Sato–Tate

`MumfordTate A`: for every `ℓ`, the identity component of `G_ℓ^{Zar}` equals `MT(A) ⊗ ℚ_ℓ`, the
Mumford–Tate group of the rational Hodge structure `H_1(A(ℂ), ℚ)` (defined here as the smallest
`ℚ`-algebraic subgroup of `GL(H_1(A(ℂ),ℚ))` whose real points contain `h(ℂ^×)`, with the
complex uniformization of A5 and the comparison `V_ℓ ≅ H_1 ⊗ ℚ_ℓ` of A4–A5). `AlgebraicSatoTate A`:
there is a `ℚ`-algebraic subgroup `AST(A) ≤ Sp_{2g}` with `G_ℓ^{1,Zar} = AST(A) ⊗ ℚ_ℓ` for
every `ℓ`. The **Lefschetz groups** are `L(A)`, the identity component of the centralizer of
`End⁰(A_k̄)` in `Sp_{2g}`, and `TL(A) := ⋃_τ {γ ∈ Sp_{2g} | γ⁻¹ α γ = τ(α) ∀ α}` (FKRS
2.14–2.15). Theorems, each an
implication from the named hypotheses: under `AlgebraicSatoTate A`, the conjugacy class of
`ST(A)` is independent of `ℓ` and `ι`; under `MumfordTate A` and `Hg(A) = L(A)`, `AlgebraicSatoTate
A` holds with `AST(A) = TL(A)` (Banaszak–Kedlaya, Theorem 6.1; FKRS Theorem 2.16(a)). The
theorem that these hypotheses hold for `g ≤ 3` (FKRS 2.16(b), Banaszak–Kedlaya Theorem 6.10,
resting on Deligne's `G_ℓ^{Zar,0} ⊆ MT(A) ⊗ ℚ_ℓ`, on the Mumford–Tate conjecture for `g ≤ 3`
and on Faltings) is 9.10. *Rests on:* 9.2–9.3, A4–A5.

### 9.5 The axioms for `ST(A)` and the component group

Under `MumfordTate A ∧ AlgebraicSatoTate A`: `IsSatoTateGroup (weightOne g) (ST(A))` (FKRS
Proposition 3.2: ST1 by construction, ST2 from the Hodge circle `h|_{U(1)}` of the Mumford–Tate
group through the comparison, ST3 by the argument through `AST(A)`: on each component the
expectation of a character is a sum of roots of unity lying in `ℚ_ℓ` for every `ℓ`, hence in
`ℤ` by Minkowski); `IsLefschetz (ST(A))` when `Hg(A) = L(A)`. The **component group**: there is
a canonical surjection `ST(A)/ST(A)⁰ → Gal(K/k)` onto the Galois group of the endomorphism field
(8.2), an isomorphism when `AST(A) = TL(A)` (FKRS Proposition 2.17; FKS Lemma 3.7), compatible
with base change: `ST(A_{k'})` is the inverse image of `Gal(Kk'/k')`; and `K` is the minimal
field over which `ST(A_K)` is connected (Sutherland Theorem 3.12, unconditional: the component
group of `G_ℓ^{Zar}` is `ℓ`-independent by Serre). `ST(A)` is connected iff `End(A) = End(A_k̄)`
when `AST = TL`. The LMFDB's `g2c` columns `st_label`, `st_group` and `real_geom_end_alg` are
`ST(A)` and `ST(A)⁰` through 9.7. *Rests on:* 2.2–2.5, 8.2, 9.3–9.4.

### 9.6 The normalized Frobenius classes

For a prime `𝔭` of `k` of good reduction for `A` and residue cardinality `q`, `g_𝔭 :=
ι(ρ(Frob_𝔭))` has characteristic polynomial the Frobenius polynomial of `A_𝔭` (A6.11
`charpolyTate`; for elliptic curves `T² − a_𝔭 T + q` with `a_𝔭 = frobeniusTrace`), whose roots
have absolute value `q^{1/2}` (the Weil bound, *Deligne weights*; for elliptic curves Tau Ceti's
`hasse_bound`); `q^{−1/2} g_𝔭 ∈ G¹(ℂ)` and the semisimple part of its Jordan decomposition is
conjugate in `G¹(ℂ)` into `ST(A)`, uniquely up to `ST(A)`-conjugacy (every semisimple element
with unimodular eigenvalues lies in a maximal compact subgroup, and two elements of a compact
group conjugate in the complexification are conjugate in the group);
`frobeniusClass A 𝔭 : ConjClasses (ST(A))`, with characteristic polynomial `L_𝔭(q^{−1/2} T)` = the normalized
L-polynomial, hence `a_1(frobeniusClass) = −tr(g_𝔭)/q^{1/2}` and for elliptic curves the
eigenangle `θ_𝔭 = arccos(a_𝔭 / (2√q)) ∈ [0, π]`. (FKRS Definition 2.9; Remark 2.10 records that
`g_𝔭` is expected to be semisimple.) *Rests on:* 9.3, A6.11, Deligne weights, Tau Ceti
`HasseBound.lean`.

**Checks.**

- (computation) for `11.a` at `p = 2`, `a_2 = −2`: the class has characteristic polynomial
  `1 + √2 T + T²`, so `a_1 = √2`, trace `−√2` and eigenangle `3π/4`.
- (computation) for `27.a` at the inert `p = 5`, `a_5 = 0` and the class lies in the coset `J·U(1)`
  of `nu1`, with characteristic polynomial `1 + T²`; at the split `p = 7`, `a_7 = −1` and the
  class lies in `u1`, with trace `−1/√7`.
- (boundary) `p = 11` is bad for `11.a` and carries no class.

### 9.7 The dictionary in dimension `2`

For `A` of dimension `2` (under the hypotheses of 9.5: `MumfordTate A`, `AlgebraicSatoTate A` and `AST(A) = TL(A)`):
`ST(A)` is conjugate to one of the fifty-two groups of 6.3 other than `F_c, F_{ab,c}, F_{a,b,c}`,
and the conjugacy class of `ST(A)` determines and is determined by the Galois endomorphism type
`galoisEndType A`, under the explicit correspondence of FKRS Theorem 4.3 (`A[C_1] ↔ USp(4)`,
`B[C_1], B[C_2] ↔ G_{3,3}, N(G_{3,3})`, `C[C_1], C[C_2] ↔ G_{1,3}, N(G_{1,3})`,
`D[·] ↔ F, F_a, F_{ab}, F_{ac}, F_{a,b}`, `E[·] ↔ E_n, J(E_n)`, `F[·] ↔` the thirty-two groups with `G⁰ = U(1)_2`);
equivalently, `ST(A)` is determined by the isomorphism class of `Gal(K/k)` together with the
function `H ↦ End(A_K)_ℝ^H` on its subgroup lattice (Theorem 4.3(c)). Proof: `ST(A)⁰` determines
`End(A_K)_ℝ = (End(ℂ^4))^{ST(A)⁰}`'s real form (FKRS Proposition 2.19, from `AST = TL`), the
action of `ST(A)/ST(A)⁰ = Gal(K/k)` on it is conjugation, and the fifty-five fixed-algebra
computations of FKRS §§4.2–4.5 (recorded as the column `End(A)_ℝ` of Table 8 and its subgroup
refinements) are pairwise distinct except that `F_c, F_{ab,c}, F_{a,b,c}` yield pairs not
realizable (their fixed algebras would require `kM_1 = kM_2` for distinct imaginary quadratic
`M_1 ≠ M_2` contained in `k`, impossible; §4.4). The identity-component dictionary
`ST(A)⁰ ↔ End(A_k̄)_ℝ` is the six-row table of 8.4 (`U(1)_2 ↔ M_2(ℂ)`, `SU(2)_2 ↔ M_2(ℝ)`,
`U(1)×U(1) ↔ ℂ×ℂ`, `U(1)×SU(2) ↔ ℂ×ℝ`, `SU(2)×SU(2) ↔ ℝ×ℝ`, `USp(4) ↔ ℝ`), and for `g = 3`
the fourteen-row table of FKS Table 9 (9.10). *Rests on:* 6.3, 6.7–6.8, 8.4, 8.7, 9.5.

### 9.8 Realizability: over number fields, over fields with a real place, over `ℚ`

Each of the fifty-two groups is `ST(Jac C)` for an explicit genus-`2` curve `C` over a number
field (FKRS Table 11), the thirty-four with a `⋆` in Theorem 4.3 over `ℚ`; the proofs of the
assignments are the automorphism arguments of FKRS §4.8 and are consumed as **worked examples**
(below) rather than reproved for all fifty-two; the roadmap proves the assignments for the
product and square constructions (`E_1 × E_2`, `E × E^d`, `E_{CM} × E'`) from 8.3–8.5, 9.5 and
9.7. Exclusions: if `k` has a real place then `ST(A)` satisfies the real-place condition 6.10
(complex conjugation at the real place gives `γ`; Serre §8.3.4), which excludes fourteen of the
fifty-two (the fifteen groups of 6.10 less `F_c`; FKRS §4.7), and FKRS Proposition 4.11 excludes `J(C_1), C_{4,1}, J(C_3)` over such fields
(`End(A_ℝ)_ℝ` would be `ℍ` or too small), leaving thirty-five; over `ℚ`, `F_{ab}` is also
excluded (it needs two distinct imaginary quadratic fields with `kM_1 = kM_2`), leaving
thirty-four. In degree `6`, the `23` groups satisfying the axioms but not realized are excluded
by the arguments of FKS §7, stated here as the theorem that `ST(A)` for a threefold lies in the
`410` of 7.4 (its proof is the cited analysis of Galois types of threefolds together with the
certificate). *Rests on:* 6.10, 7.4, 9.5, 9.7.

### 9.9 Elliptic curves and newforms

**Elliptic curves** (`W : WeierstrassCurve k` elliptic, `E := ellipticSatoTate W ℓ ι`): `E` is
conjugate in `SU(2)` to `u1` if `W` has CM defined over `k`, to `nu1` if `W` has CM not defined
over `k`, to `su2` if `W` has no CM (Sutherland Theorem 3.2), for the CM predicates of
EllipticCurves Layer 1 (`HasGeometricCM`, and "defined over `k`" meaning `EndOver k ≠ ℤ`). Proof:
in the CM-over-`k` case the image is abelian (the Tate module splits as `ψ ⊕ ψ̄` by
*Complex multiplication* 4.1 `cmTateComponents`), hence lies in a Cartan subgroup whose Zariski
closure is a torus, and the maximal compact subgroup is a circle conjugate to `u1`; in the
CM-not-over-`k` case the image lies in the normalizer of a Cartan with index-two image in the
quotient (the action on `End(E_k̄)` factors through `Gal(kF/k) = C_2`), giving `nu1`; in the
non-CM case Serre's open image theorem (`AdelicImagesAndModularCurves`) gives
`G_ℓ^{1,Zar} = SL_2` and `ST = su2`. Consequences: the `ec`/`ecnf` Sato–Tate column is a function of the CM
data `(cm, cm_type)`, `ST(E)` is an isogeny invariant, and `ST(E) = N(U(1))` exactly for the CM
curves over `ℚ`.
**Newforms** (`f` a newform of weight `k ≥ 2`, level `N`, nebentypus `χ` of order `n`;
ModularForms roadmap objects): `ST(f)`, the Sato–Tate group of the compatible system `ρ_{f,λ}`
normalized by `q^{−(k−1)/2}`, is `SU(2)[C_n] = TauCeti.SymmetricPower.SatoTateGroup n` when `f`
has no CM (*Modularity and Langlands extensions* §4.39, whose definition this is, together with
Ribet's theorem that the image of `ρ_{f,λ}` is open in `{g ∈ GL_2 | det g ∈ (ℚ_λ^×)^{k−1} μ_n}`,
cited to Ribet 1985, Theorem 3.1, and consumed from that roadmap's Layer 1 residual-image
targets), and, when `f` has CM by the imaginary quadratic field `F` (`ρ_f = Ind_F^ℚ ψ` for a
Hecke character `ψ` of `F` of infinity type `(k−1, 0)`, ModularForms CM forms), the closed
subgroup of `nu1Mu n` generated by `U(1)`, the elements `diag(1, χ(σ))` for `σ ∈ Gal(ℚ̄/F)` and
the elements `J·diag(1, χ(σ))` for `σ ∉ Gal(ℚ̄/F)`: the normalized Frobenius at a prime `p`
split in `F` is `diag(α, χ(p) ᾱ) ∈ diag(1, χ(p))·U(1)` with `α = ψ(𝔭)/p^{(k−1)/2}`, at an inert
`p` it has trace `0` and determinant `χ(p)`, so lies in `J·diag(1, χ(p))·U(1)`, and the infinite
order of `ψ_u` on the split primes together with Chebotarev for the values of `χ` makes the image
dense in each of these cosets. This group is `nu1Mu n` itself when `χ_F ∉ ⟨χ⟩` (then
`χ(Gal(ℚ̄/F)) = μ_n`), and when `χ_F ∈ ⟨χ⟩` (so `n` is even and `χ(Gal(ℚ̄/F)) = μ_{n/2}`) it is
the index-two subgroup `⟨U(1), diag(1, ζ_n²), J·diag(1, ζ_n)⟩` with `n` components, whose trace
moments are the LMFDB's row for `w.2.1.dn` (5.5). In both cases the component group is abelian,
the image of `σ ↦ (χ(σ), χ_F(σ))` in `μ_n × {±1}`: `C_n × C_2` when `χ_F ∉ ⟨χ⟩` and cyclic `C_n`
when `χ_F ∈ ⟨χ⟩` (5.5); the LMFDB's stored `component_group` `D_n` for `w.2.1.dn` describes
neither. The `cmf` column `sato_tate_group` is the label
`(k−1).2.3.c n` or `(k−1).2.1.d n` of 5.5 with `n` the order of `χ` (`1.2.A.1.1a` and
`1.2.B.2.1a` for `k = 2`, `n = 1`), so in the case `χ_F ∈ ⟨χ⟩` the labelled record has twice as
many components as `ST(f)`; for weight `1` the group is finite and is `ArtinRepresentations`'.
ℚ-curves (`EllipticCurve.IsQCurve`, GT.5) are elliptic curves, so the ℚ-curve column of `ecnf`
is Sato–Tate-neutral. *Rests on:* 5.1,
5.5, 9.3, *Complex multiplication* 4.1, *Modularity and Langlands extensions* §4.39,
`AdelicImagesAndModularCurves`, ModularForms.

### 9.10 The Banaszak–Kedlaya theorem for `g ≤ 3`

For `dim A ≤ 3`: `MumfordTate A`, `Hg(A) = L(A)` and `AlgebraicSatoTate A` with `AST(A) = TL(A)`
hold (FKRS Theorem 2.16(b); Banaszak–Kedlaya Theorem 6.10; FKS Propositions 3.3, 3.5).
Inputs, each a named milestone: Deligne's inclusion `G_ℓ^{Zar,0} ⊆ MT(A) ⊗ ℚ_ℓ` (Deligne–Milne,
*Hodge cycles*, I.6.2, through the comparison isomorphism of A4–A5 and absolute Hodge cycles —
consumed from *Motives and algebraic cycles* where it states it, and otherwise a milestone here
with that reference); the equality `Hg(A) = L(A)` for `g ≤ 3` (a Hodge-theoretic computation
from the classification of the Hodge group of a simple abelian variety of dimension `≤ 3`:
Moonen–Zarhin 1999, §§2–4, Theorem 0.1 for `g ≤ 3`); the Mumford–Tate conjecture for `g ≤ 3`
(Moonen–Zarhin, same source, using Faltings for the semisimplicity and the commutant); and the
twisted-Lefschetz construction. Consequences for `g ≤ 3`: every theorem of 9.5–9.8 stated under
the hypotheses holds unconditionally, `ST(A)/ST(A)⁰ ≅ Gal(K/k)`, and `ST(A)⁰` is determined by
`End(A_k̄)_ℝ` through 8.4. *Rests on:* 9.4, A4–A5, Faltings, Motives and algebraic cycles.

### 9.11 The splitting field and the geometric factors

For `g = 2` and `¬ IsGeomSimple A`: `splittingField A : IntermediateField k k̄`, the minimal
`L ⊆ K` such that `A_L` is `L`-isogenous to a product of two elliptic curves. Prove existence
and uniqueness of the minimum: the fields `L ⊆ K` over which `A_L` splits are the fixed fields
of the subgroups `H ≤ Gal(K/k)` for which `End⁰(A_K)^H` is not a division algebra; by the
dictionary 9.7 this is a condition on the subgroup lattice of the component group of `ST(A)`,
and for each of the fifty-two Galois types the set of such `H` has a unique maximal element
(FKRS Theorem 4.3(c) and Table 8, a check over the certificate of 6.7). The **factors** `spl_facs`
are elliptic curves `E_1, E_2` over `splittingField A` with `A_L ∼ E_1 × E_2`, unique up to
`L`-isogeny and order; the labels `spl_facs_labels` are not targets, and `condnorms` are the
elliptic-curve roadmaps'. *Rests on:* 8.2–8.3, 9.7.

### 9.12 The endomorphism lattice

`endLattice A : IntermediateField k K → (GeomEndAlgSurface × RealEndTypeSurface × …)`: for each intermediate
field `F` of `K/k`, the isomorphism types of `End⁰(A_F)` and `End(A_F)_ℝ`, whether `A_F` is
simple, whether it is of `GL₂`-type (8.6), and (9.5) the Sato–Tate group of `A_F`. Prove it is
the function on the subgroup lattice of `Gal(K/k)` sending `H` to the fixed algebra of `H` on
`End(A_K)_ℝ` (FKRS Theorem 4.3(c)), that it is determined by the Galois endomorphism type, and
that for `g ≤ 2` it determines `ST(A)` (9.7). This is the `g2c` `end_lattice` record. *Rests
on:* 8.1–8.7, 9.5, 9.7.

## Layer 10: equidistribution

### 10.1 Pushforward, test functions and the Weyl criterion

The notion of equidistribution is `AsympEquidistributed x μ` of
ProbabilisticAndMetricNumberTheory §2.1 (weak convergence of the empirical measures of
`x : ℕ → X` to `μ : ProbabilityMeasure X`), with that roadmap's bounded-continuous criteria
(`N⁻¹ ∑_{n<N} f(x n) → ∫ f dμ` for every bounded continuous `f`, real or complex), its
uniqueness theorem (`μ` is determined by the sequence) and its frequency law (for every
`μ`-continuity set `S`, `#{n < N | x n ∈ S}/N → μ(S)`); none of these is restated. Prove here,
for a compact metrizable `X`: it suffices to test `f` in a dense subspace of `C(X, ℂ)` (uniform
approximation); the predicate is preserved by a continuous `φ : X → Y`
(`AsympEquidistributed x μ → AsympEquidistributed (φ ∘ x) (μ.map φ)`, pushforward); for a
sequence in `Conj(G)` for a compact `G` with `conjLaw G`: equidistribution iff
`N⁻¹ ∑_{n<N} χ(x n) → 0` for every nontrivial irreducible character `χ` of `G` (Peter–Weyl: the
irreducible characters span a dense subspace of the class functions, Tau Ceti `characterBasis`
and the uniform density of `𝓡(G)`; Sutherland Proposition 2.9, Corollary 2.10); for a sequence
of eigenangles in `[0, π]` of `SU(2)`, equidistribution for `(2/π) sin²θ dθ` iff for every
`m ≥ 1`, `N⁻¹ ∑ U_m(cos θ_n) → 0` (Tau Ceti's Chebyshev characters). *Rests on:* 1.5,
ProbabilisticAndMetricNumberTheory §2.1, Tau Ceti `Compact/Character/Basis.lean`,
`SU2/Completeness.lean`.

### 10.2 Serre's L-function criterion

Let `G` be a compact group, `P` the primes of `k` outside a finite set ordered by norm, `x :
P → Conj(G)`, and for each irreducible representation `ρ` of `G` the Euler product
`L(ρ, s) := ∏_𝔭 det(1 − ρ(x_𝔭) N𝔭^{−s})⁻¹`, absolutely convergent on `Re s > 1`. **Theorem**: if for every
nontrivial irreducible `ρ`, `L(ρ, s)` extends to a holomorphic nonvanishing function on
`Re s ≥ 1`, then `(x_𝔭)` is equidistributed in `Conj(G)` for the pushforward of Haar (Serre,
*Abelian ℓ-adic representations*, I.A.2, Theorem 2 and its corollary; Sutherland Theorem 2.12).
Proof: by 10.1 it suffices that `∑_{N𝔭 ≤ x} χ_ρ(x_𝔭) = o(π_k(x))`; the logarithmic derivative
`−L'/L(ρ, s) = ∑ χ_ρ(x_𝔭) log N𝔭 · N𝔭^{−s} + (holomorphic on Re s > 1/2)` has a continuous
extension to `Re s ≥ 1` with no pole, so the Tauberian theorem `wienerIkehara` (Arithmetic
Dirichlet Series, consumed as in Chebotarev Layer 12, in the form with a continuous boundary
function and a nonnegative comparison series) gives `∑_{N𝔭 ≤ x} χ_ρ(x_𝔭) log N𝔭 = o(x)`, and
partial summation together with the prime ideal theorem (Arithmetic Dirichlet Series) removes
the logarithm. The converse (equidistribution implies nonvanishing) is also stated. Specialized
to a finite `G = Gal(L/k)` and Artin L-functions this is Chebotarev's theorem in natural-density
form (Chebotarev Layer 14), which is the acceptance check. *Rests on:* 10.1, Chebotarev Layer
12, Arithmetic Dirichlet Series.

### 10.3 The Sato–Tate conjecture, as a statement

`SatoTateConjecture A ℓ ι : Prop`: the sequence `frobeniusClass A 𝔭_n`, where `n ↦ 𝔭_n` is a
bijection from `ℕ` onto the primes of good reduction with `Ideal.absNorm 𝔭_n` nondecreasing, is equidistributed in `ConjClasses (ST(A))` for `conjLaw (ST(A))` (FKRS Conjecture 1.1).
Prove it is independent of the ordering among primes of equal norm, invariant under isogeny,
implied for `A_{k'}` by the statement for `A` only when `ST(A_{k'}) = ST(A)` (otherwise the
subsequence of primes of `k'` splitting completely in `K` has a different limit, which is the
component-group refinement), and that it implies the **moment convergence**
`N⁻¹ ∑_{n<N} a_i(𝔭_n)^m → aMoment (ST(A)) i m` and the **density** statements
`#{n < N | a_i(𝔭_n) = x}/N → coeffProb (ST(A)) i x` (3.5 and the frequency law
`AsympEquidistributed.tendsto_frequency`: `{a_i = x}` is a continuity set because its boundary
has measure zero by 3.5); in particular the density of primes with `a_𝔭 = 0` is the trace zero
density. The same statement for a newform
(`frobeniusClass f p ∈ Conj(ST(f))`, the class of the normalized Satake parameters,
`satakeParameters` of Tau Ceti's `HeckeRing.GL2.Newform.Satake` with the normalization `p^{−(k−1)/2}`).
*Rests on:* 3.1–3.5, 9.6, 9.9, 10.1.

**Checks.**

- (convention) over `ℚ` the good primes of `11.a` come in the order `2, 3, 5, 7, 13, 17, …`; over
  `ℚ(i)` the two primes of norm `5` may come in either order, and the statement does not change.
- (moments) for `11.a` the conjecture implies that the Cesàro means of `(a_p/√p)²` and `(a_p/√p)⁴`
  tend to `1` and `2`, the `SU(2)` trace moments of 5.4.
- (density) for `27.a` it implies that the primes with `a_p = 0` have density `1/2`, the trace zero
  density of `nu1`, in agreement with `a_p = 0` for every good `p ≡ 2 (mod 3)`.
- (known case) it holds for `27.a` over `ℚ` (10.6) and over `ℚ(√−3)` (10.5).

### 10.4 Hecke equidistribution

For a Grossencharacter `ψ` of `k` of infinite order with unitary part `ψ_u` and ideal values
`ψ_u(𝔭) ∈ U(1)` at the primes `𝔭 ∤ 𝔪` (*L-functions* Layer 6 `unitaryWeight`), the sequence
`(ψ_u(𝔭))` ordered by norm is equidistributed in `U(1)` for Haar measure (Sutherland Lemma 2.15;
Hecke). Proof: the irreducible characters of `U(1)` are `z ↦ z^a`, `L(z^a ∘ ψ_u, s) = L(ψ_u^a, s)`,
and for `a ≠ 0` the character `ψ_u^a` is a unitary Grossencharacter which is not a norm twist
(infinite order), so *L-functions* Layer 7 gives holomorphy and nonvanishing on `Re s ≥ 1`;
apply 10.2 with `G = U(1)`. Corollary: `(ψ_u(𝔭) + ψ̄_u(𝔭))` is equidistributed on `[−2, 2]` for
the arcsine law (4.4). *Rests on:* 4.4, 10.2, L-functions Layers 6–7.

### 10.5 CM elliptic curves over a field containing the CM field

Let `F` be imaginary quadratic, `k ⊇ F`, `E/k` with CM by (an order of) `F` defined over `k`
(every endomorphism is defined over `k`, since `k ⊇ F`). Then `SatoTateConjecture E` holds with
`ST(E) = u1`: by *Complex multiplication* 4.1 (`cmHeckeCharacter`, `cmFrobeniusIdentities`,
Deuring) there is a Grossencharacter `ψ_E` of `k` of infinity type `(1, 0)` at the embedding
corresponding to the CM type with `a_𝔭 = ψ_E(𝔭) + ψ̄_E(𝔭)` and `|ψ_E(𝔭)| = N𝔭^{1/2}` at every
good `𝔭`, so the normalized Frobenius class in `u1 = U(1)` is `diag(ψ_u(𝔭), ψ̄_u(𝔭))` with
`ψ_u = ψ_E / |ψ_E|` of infinite order, and 10.4 applies (Sutherland Proposition 2.16). The trace
law is the arcsine law; `a_𝔭/N𝔭^{1/2}` has moments `C(2n, n)`. *Rests on:* 5.1, 9.9, 10.4,
Complex multiplication 4.1.

### 10.6 CM elliptic curves over a field not containing the CM field

Let `E/k` have CM by `F ⊄ k`, so `ST(E) = nu1` and `K = kF` is quadratic over `k`. Then
`SatoTateConjecture E` holds: the primes `𝔭` of `k` split in `kF/k` have natural density `1/2`
(Chebotarev Layer 14), and along them `frobeniusClass` lies in the identity component with the
law of 10.5 for `E_{kF}` (the classes of a split `𝔭` and of a prime above it coincide, and
10.5 applied to `E_{kF}` restricted to the degree-one primes — the subsequence of primes of `kF`
of degree one over `k` has density one among the primes of `kF`, so equidistribution passes to
it); along the inert `𝔭` the Frobenius lies in the non-identity coset `J·U(1)`, whose elements
all have trace `0` and characteristic polynomial `T² + 1`, so `a_𝔭 = 0` for **every** good
inert `𝔭` (Galois-theoretically: `ρ(Frob_𝔭)` acts on `End(E_k̄) ⊗ ℚ_ℓ = F ⊗ ℚ_ℓ` by the
nontrivial automorphism, so it is anti-diagonal in a Cartan basis). The two halves assemble to
equidistribution for `conjLaw nu1 = ½ (pushforward of Haar on u1) + ½ δ_{[J]}`; the trace law is
`½ δ_0 + ½ arcsine`, the trace zero density `1/2` is the density of primes with `a_𝔭 = 0`, and
`a_𝔭/N𝔭^{1/2}` has moments `1, 0, 1, 0, 3, 0, 10, …` (Sutherland §2.4). For `k = ℚ` this is
the classical statement: `a_p = 0` for every good `p` inert in `F`. *Rests on:* 5.1, 5.4, 9.9,
10.5, Chebotarev Layer 14.

### 10.7 The non-CM theorems, cited

For `E/ℚ` without CM, `SatoTateConjecture E` with `ST(E) = su2` is `satoTate_elliptic`
(*Modularity and Langlands extensions* §4.34, the pushforward `(2/π) sin²θ dθ` being 4.4); for
non-CM `E` over a totally real field (Barnet-Lamb–Gee–Geraghty 2011) and over an imaginary CM
field (§4.42 with Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne) the
statements are cited; §4.28 is the conditional statement over arbitrary number fields. For
newforms of weight `k ≥ 2` without CM over `ℚ`, `SatoTateConjecture f` is Barnet-Lamb–Geraghty–
Harris–Taylor 2011, Theorem B, cited; with CM it follows from 10.5–10.6 applied to the Hecke
character (the normalized Satake parameters at split `p` are `ψ_u(𝔭), ψ̄_u(𝔭)` and the classes
at inert `p` lie in the trace-zero coset). This roadmap proves nothing in this milestone; it
records the exact statements its consumers (the `ec`, `ecnf`, `cmf` pages' "known" annotations)
rely on. *Rests on:* 9.9, 10.3, Modularity and Langlands extensions §§4.28, 4.34, 4.42.

### 10.8 Products and the degree-`4` CM cases

For `A = E_1 × E_2` over `k` with both curves CM (defined over `k` or not), or one CM and one
non-CM with the Sato–Tate conjecture known for the non-CM factor, `SatoTateConjecture A` holds
with `ST(A)` the product or normalizer group of 9.7: the Frobenius class of the product is the
pair of classes, independence of the two coordinate laws under equidistribution of the joint
sequence follows from the joint Hecke equidistribution of `(ψ_1, ψ_2)` in `U(1)²` (10.4 for the
characters `ψ_1^a ψ_2^b`, `(a,b) ≠ 0`, which are of infinite order exactly when the CM fields
`M_1 ≠ M_2` differ — the infinity types of `ψ_1, ψ_2` are then independent; when `M_1 = M_2` the
curves are geometrically isogenous, `ψ_2 ∈ {ψ_1 ε, ψ̄_1 ε}` for a finite-order `ε`, `ST(A)` lies
in the `U(1)_2` family of 9.7, and equidistribution is 10.4 for `ψ_1` together with Chebotarev
for `ε`) and, for the mixed case, from the equidistribution of the pairs
`(ψ_u(𝔭), θ_𝔭)` which is Fité–Sutherland's and Johansson's theorem (cited; its proof uses the
automorphy of `ψ^a ⊗ Sym^m`). The complete list of nongeneric abelian surfaces over `ℚ` with
known Sato–Tate (Fité–Sutherland 2014, Johansson 2017, Taylor 2020) is recorded as cited
theorems, with the generic case `USp(4)` stated as an open conjecture in 10.3. *Rests on:* 9.7,
10.4–10.7.

## Explicit scope exclusions

- Label components beyond the intrinsic prefix, orderings and normal forms fixed by convention,
  stored lists, and the completeness of database tables are not targets: the letters, suffixes,
  names, `old_label`s, stored orderings of the moment simplex and of the character matrix, and GAP
  identifiers of component groups (the isomorphism invariants behind an identifier are
  `FiniteGroupInvariants`'). The stored trace-histogram images: nobody's.
- Proofs of equidistribution for non-CM elliptic curves, Hilbert and Bianchi forms, symmetric
  powers, potential automorphy: *Modularity and Langlands extensions* and its suppliers (10.7
  only cites).
- The analytic continuation, functional equation and nonvanishing of Hecke L-functions:
  *L-functions — completions and functional equations*.
- Deuring's theorem and the Hecke character of a CM abelian variety: *Complex multiplication and
  explicit reciprocity* Layer 4.
- Foundations of abelian varieties, the Tate module of an abelian variety, polarizations, the
  Rosati involution, Poincaré reducibility, Néron–Ogg–Shafarevich: *Abelian schemes and
  arithmetic moduli*, *Néron models and semistable abelian varieties*; Faltings' isogeny theorem:
  *Faltings finiteness and isogeny theorems*.
- Albert's classification and positive involutions: *Siegel and PEL moduli problems* M0.1–M0.2.
- `GL₂`-type varieties in Ribet's sense, ℚ-curves, modularity: *Abelian varieties of GL₂-type and
  modularity of ℚ-curves*. CM newforms, inner twists, Satake parameters: ModularForms.
- Galois images (open image theorem, adelic index, `GSp₄` images, `nonmax_primes`), isogeny
  classes and graphs: `AdelicImagesAndModularCurves`.
- Sato–Tate groups of Artin representations of degree `> 1`: `ArtinRepresentations`.
- Sato–Tate groups of even weight and degree `> 1` (hypergeometric motives, K3 surfaces): no LMFDB
  page displays one and no roadmap here owns them. No even-weight classification beyond `O(1)`.
- Models, Igusa–Clebsch invariants, automorphism groups and `2`-Selmer data of genus-`2` curves:
  `HyperellipticCurves`; the `g2c` endomorphism **columns** are owned here, the **curves** there.
- Abelian varieties over finite fields: `AbelianVarietiesOverFiniteFields`; the Weil bounds:
  *Deligne weights, purity and the Weil bounds*; Deligne's finite-field equidistribution (§10.5
  there) is not reproved.
- The general Lie theory (closed-subgroup theorem, Weyl integration in general, maximal compact
  subgroups): LieGroups; Peter–Weyl and compact characters: Tau Ceti via CompactGroups.
- Sato–Tate groups of abelian varieties of dimension `≥ 4` beyond the definitions of Layer 9
  (Mumford's examples, the motivic Sato–Tate group): named in 9.4 as the reason the hypotheses
  are hypotheses, not developed.
- Half-integral weight, Siegel, Hilbert and Bianchi forms' own Sato–Tate groups: their roadmaps.

## Worked examples (acceptance criteria)

Every number below is from FKRS Tables 8–10, the Weyl integrations of Layer 4 (checked by
symbolic integration), or the stated elliptic-curve data; a milestone is accepted when it
reproduces the value shown.

### `11.a` — `SU(2)`, label `1.2.A.1.1a`

The isogeny class of `y² + y = x³ − x² − 10x − 20` has no CM. 9.9: `ST(E) = su2`; 5.4:
`c = 1`, real dimension `3`, trace moments `1, 0, 1, 0, 2, 0, 5, 0, 14, 0, 42, 0, 132`,
`E[a_2^n] = 1`, `Pr[t = 0] = 0`; Galois endomorphism type `[C_1, ℝ]` (8.7). Frobenius traces
`a_p` for `p = 2, 3, 5, 7, 11, 13, 17, 19, 23, 29`: `−2, −1, 1, −2, 1, 4, −2, 0, −1, 0` (`11` is
bad); each normalized trace `a_p/√p` lies in `[−2, 2]` (Hasse), and 10.7 (cited) says the
eigenangles are equidistributed for `(2/π) sin²θ dθ`.

### `27.a` and `32.a` — `N(U(1))` over `ℚ`, `U(1)` over the CM field

`y² + y = x³ − 7` (class `27.a`) has CM by `ℤ[ζ_3]`, discriminant `−3`; `y² = x³ + 4x`
(class `32.a`) has CM by `ℤ[i]`, discriminant `−4`; neither CM is defined over `ℚ`. 9.9:
`ST = nu1`, label `1.2.B.2.1a`; 5.4: `c = 2`, component group `C_2`, real dimension `1`, trace
moments `1, 0, 1, 0, 3, 0, 10, 0, 35, 0, 126, 0, 462`, `Pr[t = 0] = 1/2`, `zVector = [1]`; 10.6:
`a_p = 0` for every good `p ≡ 2 (mod 3)` (`27.a`: `a_2 = a_5 = a_{11} = a_{17} = a_{23} = a_{29} = 0`,
`a_7 = −1`, `a_{13} = 5`, `a_{19} = −7`, `a_{31} = −4`, `a_{37} = 11`) resp. `p ≡ 3 (mod 4)`
(`32.a`: `a_3 = a_7 = a_{11} = a_{19} = a_{23} = a_{31} = 0`, `a_5 = −2`, `a_{13} = 6`,
`a_{17} = 2`, `a_{29} = −10`, `a_{37} = −2`). Over `ℚ(√−3)` resp. `ℚ(i)` the base change has
`ST = u1`, label `1.2.B.1.1a`, trace moments `1, 0, 2, 0, 6, 0, 20, 0, 70, 0, 252, 0, 924`,
`Pr[t = 0] = 0`, and 10.5 proves equidistribution. The endomorphism field (8.2) is `ℚ(√−3)`
resp. `ℚ(i)` over `ℚ` and the base field itself over it; Galois endomorphism types `[C_2, ℂ]`
and `[C_1, ℂ]`.

### Genus-`2` Jacobians over `ℚ` (FKRS Table 11)

| curve `y² = f(x)` | `ST(Jac)` | label | `c` | `G/G⁰` | `d` | `Pr[a_1=0]` | `E[a_1^{2,4,6}]` | `E[a_2^{1,2,3}]` | `End(J)_ℝ` |
|---|---|---|---|---|---|---|---|---|---|
| `x⁵ − x + 1` | `USp(4)` | `1.4.A.1.1a` | 1 | `C_1` | 10 | 0 | `1, 3, 14` | `1, 2, 4` | `ℝ` |
| `x⁶ + x² + 1` | `SU(2)×SU(2)` | `1.4.B.1.1a` | 1 | `C_1` | 6 | 0 | `2, 10, 70` | `2, 5, 14` | `ℝ×ℝ` |
| `x⁶ + x⁵ + x − 1` | `N(SU(2)×SU(2))` | `1.4.B.2.1a` | 2 | `C_2` | 6 | 1/2 | `1, 5, 35` | `1, 3, 7` | `ℝ` |
| `x⁶ + 3x⁴ − 2` | `N(U(1)×SU(2))` | `1.4.C.2.1a` | 2 | `C_2` | 4 | 0 | `2, 11, 90` | `2, 5, 14` | `ℝ×ℝ` |
| `x⁵ + 1` | `F_{ac}` | `1.4.D.4.1a` | 4 | `C_4` | 2 | 3/4 | `1, 9, 100` | `1, 3, 10` | `ℝ` |
| `x⁶ + 3x⁴ + x² − 1` | `F_{a,b}` | `1.4.D.4.2a` | 4 | `C_2²` | 2 | 1/4 | `2, 12, 110` | `2, 5, 14` | `ℝ×ℝ` |
| `x⁶ + x⁴ + x² + 1` | `E_1 = SU(2)_2` | `1.4.E.1.1a` | 1 | `C_1` | 3 | 0 | `4, 32, 320` | `3, 10, 37` | `M_2(ℝ)` |
| `x⁵ + x³ + x` | `J(E_1)` | `1.4.E.2.1b` | 2 | `C_2` | 3 | 1/2 | `2, 16, 160` | `2, 6, 20` | `ℝ×ℝ` |
| `x⁶ + 1` | `C_{2,1}` | `1.4.F.2.1c` | 2 | `C_2` | 1 | 1/2 | `4, 48, 640` | `3, 11, 48` | `M_2(ℝ)` |
| `x⁵ − x` | `J(C_2)` | `1.4.F.4.2b` | 4 | `C_2²` | 1 | 3/4 | `2, 24, 320` | `1, 7, 22` | `ℂ` |
| `x⁶ − 5x⁴ + 10x³ − 5x² + 2x − 1` | `J(O)` | `1.4.F.48.48a` | 48 | `S_4×C_2` | 1 | 11/16 | `1, 6, 50` | `1, 3, 7` | `ℝ` |

`J(O)` has the largest component group in degree `4`; its `zVector` is `(33; 1, 0, 6, 8, 9)`,
so `Pr[a_2 = −2] = 1/48`, `Pr[a_2 = 0] = 1/8`, `Pr[a_2 = 1] = 1/6`, `Pr[a_2 = 2] = 3/16` (3.5).
Base change moves along the lattice (9.5): `y² = x⁵ − x` has `ST = J(C_1)` (`1.4.F.2.1a`,
`End(J)_ℝ = ℍ`) over `ℚ(i)` and `C_2` (`1.4.F.2.1b`, `ℂ×ℂ`) over `ℚ(√−2)`; `y² = x⁶ + 1` has
`ST = C_1 = U(1)_2` (`1.4.F.1.1a`, `M_2(ℂ)`, moments `8, 96, 1280` and `4, 18, 88`) over
`ℚ(√−3)`; `y² = x⁶ + 3x⁴ + x² − 1` has `F = U(1)×U(1)` (`1.4.D.1.1a`) over `ℚ(i, √2)`, `F_a`
over `ℚ(i)` and `F_{ab}` over `ℚ(√2)`. The `g2c` columns for `y² = x⁵ − x + 1`: `end_alg = Q`,
`geom_end_alg = Q`, `real_geom_end_alg = R`, `is_simple_geom = true`, `is_gl2_type = false`,
endomorphism field `ℚ`; for `y² = x⁶ + 1` over `ℚ`: `end_alg = M_2(Q)`, `geom_end_alg = M_2(CM)`,
`real_geom_end_alg = M_2(C)`, `is_simple_geom = false`, `is_gl2_type = false` (8.6: `E²`),
endomorphism field `ℚ(√−3)`, splitting field `ℚ`.

### Products of elliptic curves over `ℚ` (8.3–8.5, 9.7)

| `A` | `End(A_ℚ̄)⊗ℝ` | `End(A)⊗ℝ` | `Gal(K/ℚ)` | `ST(A)` | label | `E[a_1^{2,4}]` | `E[a_2]` | `Pr[a_1=0]` |
|---|---|---|---|---|---|---|---|---|
| `11.a × 37.a` | `ℝ×ℝ` | `ℝ×ℝ` | `C_1` | `SU(2)×SU(2)` | `1.4.B.1.1a` | `2, 10` | 2 | 0 |
| `11.a × 11.a` | `M_2(ℝ)` | `M_2(ℝ)` | `C_1` | `E_1` | `1.4.E.1.1a` | `4, 32` | 3 | 0 |
| `11.a × 11.a^{(d)}` (`d` non-square) | `M_2(ℝ)` | `ℝ×ℝ` | `C_2` | `J(E_1)` | `1.4.E.2.1b` | `2, 16` | 2 | 1/2 |
| `11.a × 27.a` | `ℂ×ℝ` | `ℝ×ℝ` | `C_2` | `N(U(1)×SU(2))` | `1.4.C.2.1a` | `2, 11` | 2 | 0 |
| `27.a × 32.a` | `ℂ×ℂ` | `ℝ×ℝ` | `C_2²` | `F_{a,b}` | `1.4.D.4.2a` | `2, 12` | 2 | 1/4 |
| `27.a × 27.a` | `M_2(ℂ)` | `M_2(ℝ)` | `C_2` | `C_{2,1}` | `1.4.F.2.1c` | `4, 48` | 3 | 1/2 |

Check the first row by the binomial convolution 4.3: `E[(a' + a'')²] = 1 + 1 = 2`,
`E[(a'+a'')⁴] = 2 + 6·1·1 + 2 = 10`; the second by the diagonal copy 4.3: `a_1 = 2a_1(E)`,
`E[a_1²] = 4·1`, `E[a_1⁴] = 16·2 = 32`; the fourth row's `E[a_1²] = ½(2 + 1) + ½·1`… precisely
`E[a_1²] = ½ E_{G_{1,3}}[a_1²] + ½ E_{aG_{1,3}}[a_1²] = ½·3 + ½·1 = 2` (component laws 6.7,
Table 6: on `aG_{1,3}`, `a_1 = a_{1,U(1)}`). `GL₂`-type (8.6): rows 1 and 4–5 are `ℚ×ℚ`, hence
`GL₂`-type in the LMFDB's sense; rows 2 and 6 (`M_2(ℚ)`) are not.

### Newforms (`cmf`, 5.5, 9.9)

`11.2.a.a` (weight `2`, trivial character, no CM): `ST = SU(2)`, `1.2.A.1.1a`. `27.2.a.a`
(CM by `ℚ(√−3)`): `N(U(1))`, `1.2.B.2.1a`. `7.3.b.a = η(z)³η(7z)³ = q − 3q² + 5q⁴ − 7q⁷ − 3q⁸
+ 9q⁹ − 6q¹¹ + ⋯` (weight `3`, quadratic character of conductor `7`, CM by `ℚ(√−7)`, `a_p = 0`
for `p = 3, 5, 13, 17, 19` inert in `ℚ(√−7)`; here `χ = χ_F`, so `χ_F ∈ ⟨χ⟩`): `ST(f) =
⟨U(1), J·diag(1, −1)⟩`, the index-two subgroup of `nu1Mu 2 = U(1)[D_2]` (9.9), weight `2`, two
components (`det = ±1`), component group `C_2`, `Pr[t = 0] = 1/2`, trace moments
`1, 0, 1, 0, 3, 0, 10, …` (those of `N(U(1))`, the reflection coset having `t ≡ 0`), rational,
and self-dual for weight `2` (conjugate in `U(2)` to `Od 2`); the LMFDB labels it `2.2.1.d2`,
the record of `nu1Mu 2` (four components, Haar trace moments `1, 0, 0, 0, 3, 0, 0, 0, 35`),
whose stored moment row `1, 0, 1, 0, 3, 0, 10, …` is that of `ST(f)` (5.5). A non-CM newform of weight `2` with a character of order
`3` has `ST(f) = SU(2)[C_3]`, label `1.2.3.c3`, **not** rational (`E[det] = ζ_3` on a component),
three components, trace moments `1, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 132` (Catalan numbers on
the multiples of `6 = 2·3`).

### Degree `6` (7.4)

`USp(6)` (`1.6.A.1.1a`): real dimension `21`, `E[a_1^{2n}] = 1, 3, 15, 104, 909` for
`n = 1, …, 5` (the `2n`-th trace moment of `USp(2g)` is `(2n−1)!!` for `n ≤ g` and smaller
beyond it, Sutherland §4.3: `7!! = 105 > 104`), `E[a_2^n] = 1, 2, 5, 16, 62`, `E[a_3²] = 2`,
`E[a_3⁴] = 23`, odd moments `0`, `Pr[a_i = n] = 0`, all by the Weyl formula 4.2 for `g = 3`. `U(3)` (`1.6.B.1.1a`): real dimension `9`,
`End(A_K)_ℝ = ℂ`; `N(U(3))` (`1.6.B.2.1a`) has two components and `Pr[a_1 = 0] = Pr[a_3 = 0] = 1/2`.
The fourteen identity components have real dimensions `1, 3, 2, 4, 4, 6, 3, 5, 7, 9, 11, 13, 9,
21` in the order of 4.7; the LMFDB's `1.6.L.*` rows (identity component `U(1) × U(1)_2`) store
`real_dimension = 6`, and 7.4 records `2`. The stored list has `410` rows, `33` of them maximal,
with maximal component orders `192`, `432`, `336`.

### Boundary and off-hypothesis checks

- `μ(3) ≤ U(1)` (5.6): the Hodge condition for `artin 1` holds, `IsSelfDual 0` fails
  (`ζ_3 ∉ O(1)`), `IsRational` fails (`E[a_1] = −ζ_3` on a component). It is an LMFDB
  "irrational" group, label `0.1.3`.
- `C_5 := ⟨U(1)_2, diag(A, Ā)⟩ ≤ USp(4)` with `A = diag(e^{πi/5}, e^{−πi/5})` (FKRS §3.4 with
  `n = 5`; Sutherland §4.1 writes the same family as `U(1) × U(1)[n]` embedded diagonally):
  `G⁰ = U(1)_2`, five components, self-dual, the Hodge condition holds, but on the component of
  `diag(A, Ā)` the trace is `2cos(π/5)(u + ū)`, so `E[a_1²] = 2(2cos(π/5))² = 3 + √5 ∉ ℤ` and
  `E[a_2] = (2cos(π/5))² = (3 + √5)/2 ∉ ℤ`; `IsRational` fails. This is why 6.5 has only
  `n ∈ {1,2,3,4,6}`, and why ST1–ST2 alone admit infinitely many groups (one for each `n`).
- `U(2) ≤ USp(4)` (embedded `A ↦ diag(A, Ā)`): connected, self-dual, rational (2.5(c)), but fails
  the Hodge condition for `weightOne 2` (no element has eigenvalues `u, u, ū, ū` for all `u` with
  the circle inside `U(2)` acting with the same multiplicities, FKS18 Remark 2.3); it does satisfy
  the Hodge condition for weight `3` with `h = (1,1,1,1)`.
- A finite subgroup of `USp(2g)` fails the Hodge condition in every odd weight (2.2); in weight
  `2` with Hodge numbers `(0, 2g, 0)` the trivial homomorphism is a Hodge circle and `{1}`
  satisfies it, which is why 2.2 asks for some `h p ≠ 0` with `2p ≠ w`.
- `F_c`, `F_{ab,c}`, `F_{a,b,c}` satisfy `IsSatoTateGroup (weightOne 2)` (6.3) and are not
  `ST(A)` for any abelian surface over any number field (9.7–9.8): the predicate and the
  realization are different theorems.
- `SO(3) ≤ USp(6)` (via `Sym²` of `SU(2)`, suitably embedded): satisfies ST1–ST3 for `weightOne 3`
  and fails `IsLefschetz` (7.3); it is not an identity component of any degree-`6` Sato–Tate group.
- `Pr[a_1 = 0] = 0` for `U(1)` although `a_1 = 0` at `u = ±i`: the level set is nonempty and
  null (3.5); for `N(U(1))` the same set has measure `1/2` because it contains a component.
- Over `ℚ`, `F_{ab}` (`1.4.D.2.1a`) is not realized (9.8) although it is realized over `ℚ(√2)`
  by `y² = x⁶ + 3x⁴ + x² − 1`: realizability depends on the base field through the real-place
  condition and the field containment `kM_1 = kM_2`.
- `11.a × 11.a` is **not** `GL₂`-type in the LMFDB's sense though `End⁰ = M_2(ℚ) ⊇ ℚ(√2)` makes
  it `GL₂`-type in Ribet's (8.6).
- The normalization `a_1 = −t`: for `μ(1) = {1}`, `E[t] = 1` and `E[a_1] = −1`; the stored
  trace-moment row `1, 1, 1, …` of `0.1.1` is the trace row, not the `a_1` row (3.2).

## Ordering

```text
Layer 0 (ambient groups, coefficients, torus conjugacy)
  └─ Layer 1 (identity component, components, Haar on components, coefficient laws)
        ├─ Layer 2 (Hodge numbers, Hodge circles, the axioms, first consequences)
        │     ├─ Layer 3 (moments, event probabilities, component counting, records)
        │     │     ├─ Layer 4 (Weyl integration: USp(2g), products, genus one, USp(4), degree-6 connected)
        │     │     │     ├─ Layer 5 (degree 2: the three groups, the non-self-dual families, μ(n))
        │     │     │     ├─ Layer 6 (degree 4: the fifty-five, classification, certificate, lattice)
        │     │     │     └─ Layer 7 (finiteness, degree-6 connected classification, degree-6 data)
        │     │     └─ Layer 10.1–10.2 (equidistribution, Weyl criterion, Serre's criterion)
        └─ Layer 8 (endomorphisms, endomorphism field, types, Galois endomorphism type)   [independent of 2–7]
              └─ Layer 9 (ST(A), hypotheses, Frobenius classes, dictionary ← Layers 5–6, ST(f), splitting field, lattice)
                    └─ Layer 10.3–10.8 (the conjecture, Hecke, CM curves, citations, products)
```

Layers 0–1 come first. Layers 2 and 3 are sequential; Layer 4 needs Layer 3 only for the names
of the statistics it computes. Layers 5, 6 and 7 are independent of one another given Layer 4
(Layer 7's finiteness 7.2 reuses the method, not the result, of 6.4, and applies
`FiniteGroupInvariants` 10.5 through 7.1). Layer 8 depends only on
Tau Ceti's abelian varieties and the cited suppliers and can be built in parallel with Layers
2–7. Layer 9 needs Layers 5–6 for the dictionary 9.7 and the trichotomy 9.9 and Layer 8
throughout. Layer 10.1–10.2 needs only Layer 1, the compact-group library and
ProbabilisticAndMetricNumberTheory §2.1; 10.3–10.8 need Layer 9. A first deliverable is Layers
0–5 with 10.1–10.2 (the whole degree-`2` theory with Serre's criterion); a second is Layer 6; a
third is Layers 8–9 with 10.3–10.6.

## References

- F. Fité, K. S. Kedlaya, V. Rotger, A. V. Sutherland, *Sato–Tate distributions and Galois
  endomorphism modules in genus 2*, Compositio Math. 148 (2012), 1390–1442; arXiv:1110.6638
  (on disk: `references/Fite-Kedlaya-Rotger-Sutherland -- Sato-Tate distributions in genus 2.pdf`).
  Definitions 1.3, 2.4, 2.6, 2.9, 2.11, 2.14–2.15, 3.1; Lemma 2.8, 3.7; Propositions 2.17,
  2.19, 3.2, 4.1, 4.5, 4.11; Theorems 1.2, 1.4–1.6, 2.16, 3.4, 4.3; Remarks 3.3, 3.5, 3.6;
  §§3.4–3.6 (presentations), §4.1 (types A–F), §§4.2–4.8, §5.1 (component engine, (5.1));
  Tables 1, 5, 6, 8, 9, 10, 11.
- F. Fité, K. S. Kedlaya, A. V. Sutherland, *Sato–Tate groups of abelian threefolds*, Mem. Amer.
  Math. Soc. (2023); arXiv:2106.13759 (on disk: `references/Fite-Kedlaya-Sutherland -- Sato-Tate
  groups of abelian threefolds.pdf`). Theorem 1.1; Definitions 3.1–3.2, 3.4, 3.6, 3.12, 6.2;
  Propositions 3.3, 3.5, 3.13; Lemma 3.7; §3.5 (types A–N), §3.6; §§4–5 (upper bound), §7
  (exclusions), §8 (realizations); Tables 9, 10, 12.
- A. V. Sutherland, *Sato–Tate distributions*, in *Analytic methods in arithmetic geometry*,
  Contemp. Math. 740 (2019), 197–248; arXiv:1604.01256 (on disk: `references/Sutherland --
  Sato-Tate distributions.pdf`). Definitions 2.1, 2.3, 2.14, 3.8, 4.1, 4.10; Propositions 2.9,
  2.11, 2.16, 4.4, 4.9; Corollary 2.10, 2.13, 4.5; Lemma 2.15; Theorems 1.9, 2.12, 3.2, 3.9,
  3.12, 4.3, 4.6, 4.8, 4.12; Conjectures 3.6, 3.10, 3.11; Remarks 4.2, 4.7, 4.13; §§2.4–2.5,
  §4.3; Tables 1–2.
- J.-P. Serre, *Lectures on N_X(p)*, Research Notes in Mathematics 11, CRC Press (2012). §8.2
  (the axioms), §8.2.3.4, §8.3.3–8.3.4 (component groups, the real-place condition),
  §8.4 (event probabilities).
- J.-P. Serre, *Abelian ℓ-adic representations and elliptic curves*, Benjamin (1968); Appendix
  to Chapter I, §A.2, Theorem 2 and its corollary (the L-function criterion).
- G. Banaszak, K. S. Kedlaya, *An algebraic Sato–Tate group and Sato–Tate conjecture*, Indiana
  Univ. Math. J. 64 (2015), 245–274; arXiv:1109.4449. Theorems 3.4, 6.1, 6.10 (the numbering
  FKRS Lemma 2.8 and Theorem 2.16 cite).
- N. M. Katz, P. Sarnak, *Random matrices, Frobenius eigenvalues, and monodromy*, AMS Colloquium
  Publications 45 (1999). §5.0.4 (Weyl integration for `USp(2g)`), Chapter 5.
- A. Silverberg, *Fields of definition for homomorphisms of abelian varieties*, J. Pure Appl.
  Algebra 77 (1992), 253–262. Theorem 2.4 (endomorphisms defined over `k(A[n])`, `n ≥ 3`),
  Theorem 4.1.
- B. Moonen, Yu. Zarhin, *Hodge classes on abelian varieties of low dimension*, Math. Ann. 315
  (1999), 711–733. Theorem 0.1 (Hodge and Mumford–Tate groups for `g ≤ 3`).
- P. Deligne, J. S. Milne, *Tannakian categories* and *Hodge cycles on abelian varieties*, in
  LNM 900 (1982); I, Proposition 6.2 (`G_ℓ^{Zar,0} ⊆ MT(A) ⊗ ℚ_ℓ`).
- J. S. Milne, *Abelian varieties* (course notes, v2.0, 2008), §§1, 10, 20–21 (endomorphism
  algebras, Rosati, the field of definition of endomorphisms).
- D. Mumford, *Abelian varieties*, Tata Institute / Oxford (1974), §21 (Rosati positivity, Albert).
- G. Shimura, *On the real points of an arithmetic quotient of a bounded symmetric domain*, Math.
  Ann. 215 (1975), 135–164 (the Shimura curve of an indefinite quaternion division algebra over
  `ℚ` has no real points; used in 8.5).
- K. A. Ribet, *On ℓ-adic representations attached to modular forms II*, Glasgow Math. J. 27
  (1985), 185–194, Theorem 3.1 (image of `ρ_{f,λ}` for non-CM `f`).
- K. A. Ribet, *Abelian varieties over ℚ and modular forms*, in *Modular curves and abelian
  varieties*, Progr. Math. 224 (2004), 241–261 (first published 1992); §§1–3 (`GL₂`-type,
  primitive varieties, endomorphism fields).
- M. Artin, *Algebra*, 2nd ed., Pearson (2011), §6.12 (finite subgroups of the rotation
  group).
- D. Bump, *Lie groups*, 2nd ed., GTM 225, Springer (2013), Chapters 17–18 (Weyl integration),
  Chapter 23 (`USp`); T. Bröcker, T. tom Dieck, *Representations of compact Lie groups*, GTM 98,
  Springer (1985), Chapter IV (maximal tori, Weyl integration), Chapter II §5 (finite subgroups
  of `SU(2)`).
- F. Fité, A. V. Sutherland, *Sato–Tate distributions of twists of y² = x⁵ − x and y² = x⁶ + 1*,
  Algebra Number Theory 8 (2014), 543–585; C. Johansson, *On the Sato–Tate conjecture for
  non-generic abelian surfaces*, Trans. Amer. Math. Soc. 369 (2017), 6303–6325; N. Taylor,
  *Sato–Tate distributions on abelian surfaces*, Trans. Amer. Math. Soc. 373 (2020), 3541–3559
  (equidistribution for nongeneric abelian surfaces, cited in 10.8).
- T. Barnet-Lamb, D. Geraghty, M. Harris, R. Taylor, *A family of Calabi–Yau varieties and
  potential automorphy II*, Publ. RIMS 47 (2011), 29–98, Theorem B (Sato–Tate for newforms,
  cited in 10.7); G. Boxer, F. Calegari, T. Gee, J. Newton, J. A. Thorne, *The Ramanujan and
  Sato–Tate conjectures for Bianchi modular forms*, Forum Math. Pi (2025) (cited in 10.7).
- K. S. Kedlaya, A. V. Sutherland, *Hyperelliptic curves, L-polynomials, and random matrices*,
  Contemp. Math. 487 (2009), 119–162 (the genus-`2` moment methodology; Proposition 2:
  integrality of moments).
- The LMFDB, `lmfdb/sato_tate_groups/main.py` and the knowls `st_group.*`, `g2c.end_alg`,
  `g2c.geom_end_alg`, `g2c.st_group_identity_component`, `g2c.gl2type`, `cmf.sato_tate`,
  `ag.sato_tate_group`, `av.endomorphism_field`: the stored invariants and the definitions this
  roadmap formalizes as the knowls state them.
