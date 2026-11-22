# Roadmap: Forcing, generic extensions, and Boolean-valued semantics

**Summary.** This roadmap develops set forcing from preordered sets of conditions to generic
extensions of transitive models, with a comparison to Boolean-valued semantics. It builds the
reusable theory of dense sets, filters, separative quotients, Boolean completions, names, and the
forcing relation. Its principal semantic theorem is the forcing theorem for a set forcing in a
transitive model of ZFC. A generic extension contains the ground and the generic filter, is
transitive, has the same ordinals, and satisfies ZFC. External countability is used to construct
generic filters; it is not a hypothesis of genericity or of preservation for an already supplied
generic filter.

The preservation theory explains how the ground model's chain conditions control names for
ground-set elements, how distributivity controls new sequences, and how automorphisms decide
sentences with invariant parameters. Cohen forcing, collapse forcing, and random forcing supply
contrasting applications. Products and two-step iterations provide the first composition theory,
including the precise distinction between separate genericity and mutual genericity.

The development builds on **Mathlib's order theory**, using its preorder filters and coinitiality,
and on **Mathlib's set theory and first-order model theory**, using its ground-set representations
and formula syntax. **Measure theory and probability** supply the measurable spaces and product
measures used to construct the random algebra. The countable generic-construction kernel is reusable
by **computability theory** without importing material set models.

Layers 0–1 develop the order kernel and finite conditions. Layers 2–3 construct the external Boolean
completion and the Boolean-valued universe of set theory. Layers 4–5 independently develop internal
names, the material forcing theorem, and ZFC preservation. Layer 6 proves the comparison theorems,
including the distinction between external and ground-internal completeness. Layers 7–9 develop
preservation mechanisms, the three main examples, and two-step composition. The Boolean and material
branches share the order kernel and meet through explicit comparison theorems; neither branch
requires the other's headline theorem as a definition.

## Conventions

- **Order.** Smaller conditions are stronger: `q ≤ p` means that `q` extends `p`. The kernel uses
  preorders, with antisymmetry only where needed. A greatest condition is a weakest condition; it is
  assumed only by statements using it. Boolean forcing uses the nonzero elements of a Boolean
  algebra: Boolean zero is not a condition.
- **Density and filters.** Density is Mathlib's `IsCoinitial`; density below a condition is
  coinitiality below that condition. Dense-open means dense and `IsLowerSet`. Predensity means
  compatibility with some member. A forcing filter is `Order.PFilter`, not a new structure and not a
  filter of subsets of the condition type.
- **Genericity.** For a specified family of tests, generic means meeting every test. Model-relative
  genericity restricts the tests to dense subsets coded in that model. A countability assumption
  belongs to an existence theorem. Meeting a predense set is not automatic: genericity normally
  meets its downward closure or a corresponding dense set.
- **Quantification scope.** Every infinite chain condition, closure property, distributivity
  statement, and cardinal comparison specifies whether it is external or interpreted in a ground
  model. The externally decoded conditions of a countable ground are externally countable; their
  external ccc does not establish the ground's ccc.
- **Grounds.** The material theorem concerns transitive sets with their inherited membership
  relation, represented using Mathlib's `ZFSet` and its small carriers. It does not assert the
  existence of a transitive model of ZFC. Transitivity, modelhood, and external countability remain
  distinct hypotheses.
- **Syntax.** Use Mathlib's `FirstOrder.Language`, terms, and bounded formulas. Pure set theory has
  logical equality and one binary membership relation. Formula coding inside a ground is an explicit
  construction with a correctness theorem. It does not introduce a competing public formula syntax.
- **Names.** Distinguish raw well-founded names, Boolean-valued equality, equality after taking a
  quotient, and equality of valuations. State the family over which formula quantifiers range. A
  selected family is closed under the subnames required by its semantics; additional closure needed
  for a theorem is proved for the canonical family.
- **Universes.** Keep the condition/coefficient universe separate from the universe of child indices
  in a name. State smallness hypotheses for mixing, maximum principles, and material coding at the
  theorem that uses them. Do not assume a universe contains itself.
- **Completeness.** `CompleteBooleanAlgebra B` means external completeness in Lean. A Boolean
  algebra that a transitive ground regards as complete supplies joins of its ground-coded families.
  Its decoded carrier is not silently given an external complete-Boolean-algebra instance.
- **Properties and effects.** Define closure, chain conditions, and distributivity intrinsically.
  Prove their extension consequences. Here `<κ`-distributive means that intersections of fewer than
  `κ` dense-open sets are dense, and countable distributivity refers to countable families, hence to
  `<ω₁`-distributivity. Countable closure likewise refers to countable descending sequences.
  Presentation-specific closure is distinguished from the existence of a dense closed presentation.
- **Assertions versus assumptions.** Abstract semantic interfaces may express explicitly stated
  equality, congruence, fullness, or coding laws. The corresponding canonical instances and their
  laws are targets. A structure carrying a forcing theorem or a preservation theorem as a field does
  not discharge that theorem.

## Layer 0: Conditions, tests, filters, and equivalence

**Dependencies:** Mathlib order, set, and countability APIs.

1. Develop compatibility and incompatibility, density, local density, predensity, and dense-open
   sets. Supply symmetry, strengthening, localization, finite intersection of dense-open sets, and
   downward-closure lemmas at the appropriate level of generality. In particular, prove that a
   filter meets a set exactly when it meets its downward closure, and that meeting a lower set can
   be localized below any condition in the filter.
2. Define family-relative genericity. Prove monotonicity in the family of tests, transport under
   equivalent presentations of tests, and the countable Rasiowa–Sikorski theorem through an
   arbitrary condition. Reuse the cofinal-ideal construction in the opposite order. Support both
   countable indexed families and countable sets of tests.
3. Develop incompatibility antichains, maximal antichains, and the correspondence between maximal
   antichains and predense antichains. Construct maximal antichain refinements of dense sets. Prove
   the precise equivalence of dense-test and maximal-antichain genericity when the test collections
   contain the required refinements and downward closures.
4. Develop dense order embeddings and their composition. Forward filter transport is the upward
   closure of the image. Reverse transport is available under the local range condition
   `∀ q ∈ H, ∃ p, e p ∈ H ∧ e p ≤ q`.
   Prove that the relevant genericity hypotheses imply this condition, and prove inverse transport
   and transport of genericity. Meeting the range once is insufficient.
5. Define the separative preorder by `p ≤* q` when every strengthening of `p` is compatible with
   `q`. Construct its antisymmetric quotient. Prove preservation and reflection of compatibility,
   its universal characterization by compatibility tests, and the generic-filter correspondence with
   the original presentation. Account explicitly for the extra dense tests needed to make that
   correspondence invertible.
6. Develop restriction below a condition, addition of a weakest condition, and order-isomorphism
   transport. Define atomlessness by incompatible extensions below every condition, and prove its
   invariance under the appropriate separative and dense-equivalence constructions.

**Checks.** On the usual order of the natural numbers, `{0}` is dense while `{1}` is predense but
not dense. A preorder with a genuine strongest condition has a filter meeting every dense set. A
principal filter on the integers need not meet a prescribed dense lower set. A dense inclusion may
have empty preimage on an arbitrary filter.

## Layer 1: Finite conditions and generic unions

**Dependencies:** Layer 0; Mathlib finite sets, finite maps, and partial functions.

1. Develop finite partial functions `Fn(I, A)` and the dependent-value variant, ordered by reverse
   extension. Choose a representation compatible with Mathlib's finite-map API; expose restriction,
   extension by a fresh coordinate, compatible union, reindexing, and finite-support lemmas.
   Compatibility is agreement on the common domain.
2. Construct the union of a filter and prove that it is a partial function. Establish the
   correspondence between filters of finite restrictions and partial functions, with the relevant
   upward and finite-directed closure theorems. State exactly which finite restrictions belong to
   the reconstructed filter.
3. For inhabited coordinate values, prove that the requirement to define a given coordinate is
   dense. A filter meets every coordinate requirement if and only if its union is total. For
   `Fn(ℕ, A)` with nonempty `A`, the requirement that a specified value occur in the range is dense;
   meeting all these requirements makes the union surjective.
4. For binary values, define the requirement to disagree with a specified total function at some
   coordinate. On an infinite coordinate set it is dense. Obtain a total function avoiding a
   prescribed countable family by Rasiowa–Sikorski. For uncountable `I` the coordinate-totality
   tests are indexed by all of `I`, too many for Rasiowa–Sikorski: meet the countably many
   disagreement tests, take the partial union, and fill the undefined coordinates with `0`; each
   witnessed disagreement survives, so the result is a total function on `I` avoiding the family.
   Keep this theorem independent of set-model semantics.
5. Relate finite binary partial functions on `ℕ` to finite binary sequences through dense
   embeddings. Prove the corresponding generic unions agree. Develop reindexing and coordinate
   projections for `Fn(I, 2)`; use these in the Cohen applications and product comparison.

**Checks.** Coordinate genericity implies totality, but totality alone does not imply genericity for
all dense sets. A finite condition is not a total real. Avoidance of a supplied countable family has
the stated family as its scope; it does not by itself prove a model-theoretic new-real theorem.

## Layer 2: Boolean completions

**Dependencies:** Layer 0; Mathlib lower sets, Heyting regular elements, and complete lattices. No
material-model or forcing-theorem dependency.

1. Extend the regular-element construction for a frame to its complete Boolean algebra. Infima are
   inherited from the frame; suprema are the double-negation regularizations of frame suprema. Reuse
   `Heyting.Regular`, its regularization map, and its Galois insertion. Prove agreement with the
   existing finite Boolean operations. Use `CompleteBooleanAlgebra`, without an atomicity
   assumption.
2. Define the completion of a preorder using regular lower sets:
   `RO(P) = Heyting.Regular (LowerSet P)`.
   Define `i(p)` as the double-negation regularization of the principal lower set of `p`. Prove
   nonzeroness, monotonicity, and
   `Compatible p q ↔ i(p) ⊓ i(q) ≠ ⊥`.
3. Prove `p ≤* q ↔ i(p) ≤ i(q)`. Deduce an order embedding of the separative quotient into the
   positive cone, with dense range. For a separative partial order this is an order embedding of the
   original poset.
4. Prove uniqueness of the completion: dense embeddings of the same separative order into positive
   cones of complete Boolean algebras induce a unique complete Boolean-algebra isomorphism agreeing
   on the embedded conditions. Specify preservation of arbitrary suprema explicitly when the
   available bundled morphism type only expresses finite operations.
5. Relate antichains, chain conditions, regular lower sets, and dense embeddings to this completion.
   Define forcing equivalence by isomorphism of completions and prove the expected consequences for
   the preceding dense-equivalence constructions.

**Checks.** The completion of the one-condition order is the two-element Boolean algebra. For empty
`P` the regular completion is the one-element algebra and the density condition is vacuous: the
completion is nontrivial exactly when `P` is nonempty, and that hypothesis belongs to the
nontriviality statement, not to the construction. Atomless forcing has an atomless completion. The
embedding lands in the positive cone; including zero would make all conditions compatible. Infimum
and supremum formulas must distinguish inherited meets from regularized joins.

## Layer 3: The Boolean-valued universe of set theory

**Dependencies:** Layer 2's general Boolean-algebra support, Mathlib first-order syntax, and Mathlib
ground pre-sets. The construction is parameterized by any complete Boolean algebra and does not
require that it be a forcing completion.

1. Construct well-founded Boolean-weighted names, with structural induction, recursion, rank or an
   equivalent well-founded measure, and an API for children and coefficients. Define Boolean
   membership by the weighted join of equality with children, and Boolean equality by mutual
   inclusion. Prove the recursive equations, reflexivity, symmetry, transitivity, and substitution
   in both membership arguments.
2. Interpret the language of set theory, with no function symbols and one binary membership symbol,
   over a stated domain of Boolean names: logical equality by Boolean equality, membership by
   Boolean membership, and each bounded formula of Mathlib's syntax by its recursive Boolean value,
   with the quantifiers ranging over that domain (`BName.truth` in `Suggested.lean`). The Boolean
   values of equality and membership between weighted names already take arbitrary meets and joins
   over children, so even atomic values need completeness, as do the quantifier values of the
   evaluator; a plain `BooleanAlgebra` suffices for forming the quotient once the atomic values and
   their congruence laws are supplied. Prove relabeling, lifting, capture-avoiding substitution, and
   extensionality under Boolean-equal assignments. Logical equality is interpreted by Boolean
   equality, not by an indicator of Lean equality.
3. Construct canonical names for Mathlib ground sets; prove preservation and, for a nontrivial
   coefficient algebra, reflection of membership and extensional equality. Prove agreement for the
   two-element algebra and Δ₀ absoluteness for canonical names, over a domain of names that contains
   the canonical names of the transitive closure of the parameters. Define the set-theoretic Δ₀
   fragment by quantifiers restricted to membership in a set, and prove its closure rules. Mathlib's
   type `BoundedFormula` records the number of bound variables; its name does not imply
   membership-bounded quantification.
4. Prove mixing along disjoint coefficient families and partitions of unity. Prove refinement and
   uniqueness at the correct Boolean truth value. Establish the maximum principle for extensional
   predicates and existential formulas, with an explicit smallness hypothesis on coefficients
   relative to child-index size. The proof constructs witnesses; it does not assume them for the
   name universe.
5. Form the separated quotient by equality value one and descend atomic and formula semantics to it.
   Prove that Lean equality on separated names is equivalent to Boolean equality one. This quotient
   is still Boolean-valued.
6. For a full Boolean-valued model of set theory and an ultrafilter, form the ordinary quotient by
   equality value belonging to the ultrafilter. Construct its ordinary first-order structure and
   prove the formula-by-formula Łoś theorem. Fullness here means attainment of each existential
   Boolean value; give its precise definition and prove the weighted-name instance from the maximum
   principle. An arbitrary ultrafilter need not select a witness from an arbitrary infinite join.

Layer 3 builds only the Boolean-valued universe of set theory that the comparison of Layer 6 uses,
over Mathlib's syntax. Boolean-valued structures for arbitrary first-order languages, and
Boolean-valued analysis, are outside this roadmap (see Scope and ownership).

**Checks.** A zero-weight child has no semantic effect. Distinct raw presentations can have equality
value one. Passing to the separated quotient does not turn a nontrivial Boolean truth value into a
proposition. In the two-element coefficient algebra, the quotient recovers the ordinary
interpretation of ground sets at the specified universe.

## Layer 4: Material grounds, names, and the forcing theorem

**Dependencies:** Layers 0–1, Mathlib ground sets, well-founded recursion, and first-order
syntax/semantics. Layers 2–3 are not prerequisites.

1. Equip a transitive material carrier with its inherited first-order membership structure. State
   the conventional ZFC theory as actual first-order axiom sentences and schemas: Extensionality,
   Empty Set, Pairing, Union, Power Set, Infinity, Separation, Replacement, Foundation, and Choice.
   Relate equivalent formulations of the schema presentation where used. Supply finite tuple,
   function, and formula coding with proved interpretation lemmas.
2. For a poset coded in a ground, construct its external condition type and prove faithful
   interpretation of condition membership and order. Distinguish the external preorder from the
   ground's set and relation codes. Translate ground-coded dense subsets, antichains, and filters to
   their typed counterparts, proving absoluteness of the elementary order assertions used by
   genericity.
3. Construct raw poset names and valuation. Prove structural induction, subname closure, check-name
   valuation, and generic-name valuation. Define the canonical ground-name domain as the names coded
   hereditarily in the ground. Prove recognition, decoding, and representation, including canonical
   names, the generic-filter name, and the concrete names needed by the examples. Neither arbitrary
   ambient names nor a chosen incomplete family may stand in for all ground names.
4. Define atomic forcing by a well-founded recursion with the standard density clauses. Define
   formula forcing on Mathlib syntax relative to an arbitrary stated family `N` of poset names, with
   the quantifiers ranging over `N` (as the source's `ForcesFormula` does), and specialize it to the
   canonical ground-name domain. Prove persistence,
   equality substitution, density regularity, the Boolean connective rules, and density of deciding
   conditions. The existential rule is formulated using densely available witnesses, so it does not
   erroneously require a single witness before the maximum principle is established.
5. Construct an effective syntactic translation sending each fixed formula `φ` to a formula
   `Force(φ)` and prove its realization-correctness theorem over the ground, formula by formula.
   This is a definability schema, not a single internal truth/forcing predicate correct for all
   formula codes. Build the internal recursion/coding needed for names and atomic forcing, and the
   induction on each fixed formula or fixed complexity fragment. State and prove the ground theory
   used. The principal interface specializes to ZFC grounds; useful weaker assumptions may be
   exposed only as named, explicitly proved corollaries.
6. For a ground-generic filter, construct the extension as valuations of ground names. Prove atomic
   soundness/truth and then the full truth lemma:
   `M[G] ⊨ φ(val_G(τ⃗)) ↔ ∃ p ∈ G, p ⊩_M φ(τ⃗)`.
   Quantifiers on the two sides range over the matching ground-name valuation image. Prove the
   parameter representation and assignment-transport lemmas needed for this statement.
7. Prove that an externally countable ground admits a generic filter through each condition. Keep
   this construction separate from the forcing theorem for an already supplied generic filter.

**Checks.** Formula truth is invariant under different names with equal valuation in the generic
extension. The unrestricted ambient name universe must not be mistaken for the ground-name universe.
Definitions of genericity and modelhood typecheck without a countability instance. Definability is
object-language definability over the selected ground, not a representation-level predicate with a
stronger metatheoretic meaning.

## Layer 5: The generic extension and preservation of ZFC

**Dependencies:** Layer 4. No Boolean-valued transfer theorem is assumed.

1. Prove ground inclusion, membership of the generic filter in the extension, transitivity, and
   equality of the ground and extension ordinals. Develop rank bounds and the basic absoluteness
   lemmas needed by the name constructions. Prove the minimality characterization: every transitive
   ZFC model containing the ground and generic filter contains the extension.
2. Construct names for the empty set, pairs, unions, and an inductive set. Prove their exact
   valuation equations and resulting axioms. Theorems that only require a filter and particular
   ground axioms retain those weaker hypotheses.
3. Construct separation names for arbitrary formulas. Prove the boundedness and ground-membership of
   the defining set of name-condition pairs using Layer 4's definability theorem. Derive the full
   Separation schema in the extension.
4. Prove the name-bounding and collection lemmas needed for Replacement. Given a forced functional
   relation on a named set, collect a ground set of candidate names, construct the image name, and
   verify the Replacement schema. Make the witness selection, rank bound, and use of ground
   Collection/Replacement explicit.
5. Construct the Power Set name using a ground-bounded family of names for subsets. Prove both
   membership directions. This requires a set of candidate subset names in the ground, not an
   unrestricted collection of all ambient names.
6. Prove Foundation from the well-founded/transitive interpretation. Prove Choice by a ground-coded
   well-order/surjection construction for the relevant name family, with all ground-set and size
   obligations discharged. Package the axiom-by-axiom development into preservation of the concrete
   ZFC sentence theory.

The public endpoint is conditional on a supplied transitive ZFC ground and its set forcing. A
theorem constructing such a ground from mere consistency is not part of this endpoint. Preserve an
axiom-use ledger in theorem documentation, separating the strongest public theorem from
independently useful weaker-base lemmas.

**Checks.** Trivial forcing yields the ground itself. Names witnessing Pairing and Union have the
claimed valuation for an arbitrary filter under their stated construction hypotheses. Power Set and
Replacement are verified as schemas/constructions, not inferred from the preservation of the easier
axioms.

## Layer 6: Poset, Boolean, and generic-quotient comparisons

**Dependencies:** Layers 2–5. The external comparison uses Layers 2–4's name constructions without
assuming a countable ground.

1. Translate a poset name to a Boolean name by replacing each condition label with its image in the
   completion. For the reverse translation, construct for each nonzero coefficient `b` a small
   refining family of conditions below `b` whose embedded values have supremum `b`; a maximal
   antichain is one such family. State a sufficient size hypothesis, such as smallness of the
   coefficient algebra or condition type relative to child-index size, and the choice used to select
   the family. Replace a coefficient by this entire family and discard zero-weight branches. Prove
   well-foundedness, check-name compatibility, and Boolean equality of the resulting round trips; on
   the poset side compare after translation to Boolean names. Expose an adequacy theorem for the
   selected quantifier domains.
2. Prove atomic and formula comparison for matching name domains:
   `p ⊩_N φ(τ⃗) ↔ i(p) ≤ ⟦φ(τ̂⃗)⟧`.
   First state the right-hand quantifier domain as the translated domain. Replacing it by all
   Boolean names requires a proved density/equivalence theorem for names and formula semantics. Do
   not substitute the full host name universe for a ground's names. With
   `e : CompletionMap P B` into a complete Boolean algebra `B`, `N` the stated family of poset
   names, `D = PName.relabel e.toFun '' N`, and `r : N → D` the map sending each name to its
   relabelling (with the proof that it lies in the image), the statement reads, for a formula with
   free-variable assignment `v : α → N` and bound-variable assignment `xs : Fin n → N`,

   `p ⊩_N φ(v, xs) ↔ e.toFun p ≤ BName.truth D φ (r ∘ v) (r ∘ xs)`,

   so the quantifiers range over `N` on the left and over `D` on the right. For `∀`, choosing
   `τ ∈ N` appends `τ` to `xs` on the left and `r τ` to `r ∘ xs` on the right, while `v` stays
   fixed; every member of `D` arises this way because `D` is the image of `N`, so the induction
   needs no injectivity of `r`.
   `PName.val_relabel` in `Suggested.lean` fixes the name types, universes, translation and
   valuations in which it is stated: valuing a relabelled name at a set `U` of Boolean values is
   valuing the name at `e⁻¹' U`, because a child labelled `p` is kept on the left exactly when the
   child labelled `e p` is kept on the right. That preimage is not in general a filter of
   conditions: for the two atoms of the power set of `{0, 1}`, included in it, the proper filter
   `{⊤}` has empty preimage. For the Boolean filter `U_G` of item 3 generated by a filter `G`, the
   preimage is `G` itself when `P` is separative, and also when `G` meets every dense set
   `{r | r ≤ q} ∪ {r | ¬ Compatible r q}`, as every ground-generic filter does; then
   `(τ.relabel e.toFun).val U_G = τ.val G`. The local range condition alone does not suffice for a
   non-separative `P`, because `e r ≤ e p` gives only `r ≤* p` (see the Checks).
3. For a filter `G`, define the generated Boolean filter by
   `U_G = {b | ∃ p ∈ G, i(p) ≤ b}`.
   Prove properness. For a ground-generic `G`, prove that `U_G` is
   an ultrafilter on the image `j(RO(P)^M)` of the ground-internal completion of item 4, from
   meeting the ground-coded Boolean decision dense sets; on the external completion it need not be
   an ultrafilter (Hamkins–Seabold, Theorem 41, and the Checks). Conversely, prove the filter
   correspondence for suitable generic filters on the Boolean side: for a separative partial order
   `P`, where `e` is an order embedding (Layer 2 item 3), with the local range condition of Layer 0
   item 4; in general, through the separative quotient. State which Boolean elements and tests are
   quantified over.
4. Construct the **ground-internal** regular completion by coding the regular lower sets and
   operations inside a ZFC ground. Prove that each ground-coded family has its required join and
   meet. Decode the finite Boolean operations externally, but do not assert external completeness.
   Define the map `j` from the internal completion to the external regular completion of the decoded
   poset by decoding its regular lower sets. Prove injectivity, preservation of finite Boolean
   operations, and preservation of joins/meets of ground-coded families.
5. For each fixed formula, construct its ground-internal Boolean value as the regular cut
   `{p | p ⊩_M φ}`. Its ground code comes from Layer 4's per-formula definability theorem;
   regularity comes from density regularity. Form the ground set of attained truth values by
   Separation in the internal Boolean algebra, and use Collection to bound witnesses where required.
   Prove the recursive Boolean equations and internal mixing/witness principles. Under `j`, identify
   these values with Layer 3's external evaluator over the explicitly translated ground-name domain,
   as a corollary of item 2: for a regular cut `b`, `b = {p | i(p) ≤ b}`, so item 2 gives
   `j{p | p ⊩_M φ} = BName.truth D φ` when `N` is the full canonical ground-name domain and `B` is
   the external regular completion of the decoded poset (or, through Layer 2 item 4, a completion
   isomorphic to it). The preservation of ground-coded joins in item 4 is then not needed for this
   identification.
   This is the chosen comparison route: it shares the evaluator without imposing external
   completeness on the decoded internal algebra or constructing a universal internal truth
   predicate.
6. For a ground-generic filter `G`, form the quotient of the translated ground-name domain `D` by
   `eqVal ∈ U_G` and identify it with the material extension by valuation. Its truth comes from
   item 2 and the material truth lemma of Layer 4, for which the filter `U_G` suffices; no
   ultrafilter on the external completion is used (alternatively, extend `U_G` to an ultrafilter and
   prove that it agrees with `U_G` on the values of formulas over `D`). Prove both directions of the
   truth comparison, injectivity modulo `U_G`-equality, surjectivity onto the extension, and
   preservation of membership.
   Distinguish this quotient from the separated quotient at equality value one and from the external
   set of elements with membership value one.

**Checks.** An arbitrary ultrafilter quotient of a full Boolean-valued model is an ordinary model by
Łoś; well-founded material realization requires the additional ground-generic hypotheses. For
`P = Fn(ℕ, 2)` and `G` the finite restrictions of a real `x`, let `sₙ = x↾n ∪ {(n, 1 − x(n))}` and
`b` the regularization of the lower set generated by `{sₙ | n even}`: every member of `G` extends to
some `sₙ` with `n` even and to some with `n` odd, so neither `b` nor its complement lies in `U_G`,
which is therefore not an ultrafilter on the external completion. For the non-separative preorder
`{p, q, r₀, r₁}` with `rᵢ ≤ p, q`, mapped to `⊤, ⊤, {0}, {1}` in the power set of `{0, 1}`, the
proper filter `{⊤}` meets the image locally (through `p`) yet has preimage `{p, q}`, which is not a
filter. A ground-internal complete algebra can fail external completeness. Agreement on atomic
formulas alone does not establish agreement of quantified formulas with different name domains.

## Layer 7: Structural properties and preservation mechanisms

**Dependencies:** Layers 0–2 for order properties; Layers 4–6 for model-internal and extension
consequences.

1. Define linked and centered subsets, their countable-cover versions, the Knaster property, and
   ccc. Centered means every nonempty finite subfamily has a common strengthening. Prove the
   implication diagram: countably centered implies countably linked, which implies Knaster, which
   implies ccc. Supply order-isomorphism, separative-quotient, and dense-equivalence results where
   valid, stating separately those properties that concern a chosen presentation.
2. For regular infinite cardinals, define the corresponding chain conditions using the ground's
   cardinal computation. Prove the deciding-antichain theorem for a name forced to belong to a
   specified checked ground set. Under ground ccc, obtain a ground-countable set of possible ground
   values, densely decided below the original condition. Use these bounds to prove preservation of
   all ground cardinals and cofinalities by ccc forcing. For ground-regular infinite `κ`, prove that
   internal `κ`-cc preserves every ground cardinal at least `κ` and the cofinality of every ordinal
   whose ground cofinality is at least `κ`.
3. Define closure under decreasing sequences of length less than a cardinal and distributivity for
   intersections of fewer than that many dense-open sets. Include the countable-closure case
   explicitly. Prove closure implies distributivity by transfinite construction, with the choice and
   regularity assumptions actually used. Prove the Boolean-algebra characterization of
   distributivity for a separative `P` (or for the separative quotient of an arbitrary preorder):
   the completion cannot see dense-open distributivity of a non-separative preorder (see the
   Checks).
4. Over a ZFC ground, prove that internal distributivity prevents new ordinal-valued sequences of
   the stated lengths, for an arbitrary preorder. Prove the converse, from no new sequences to
   distributivity, for a separative `P` (`SepLE p q → p ≤ q`; antisymmetry is not needed) or for
   the separative quotient of an arbitrary preorder, by the precise name/antichain argument:
   separativity is where a condition deciding the selected antichain members lies below each of
   them. Derive the
   no-new-reals consequence for countable distributivity. Localize the proof to a specified family
   of coordinate-decision tests, so consumers can use the weaker theorem without assuming universal
   distributivity.
5. Lift order automorphisms recursively to names and prove forcing equivariance by induction. Prove
   that canonical ground names are fixed. Define weak homogeneity by the existence, for each pair of
   conditions, of an automorphism moving one to compatibility with the other. With a weakest
   condition, prove that every sentence with invariant parameters is decided there. Supply the
   corresponding condition-local theorem without requiring a weakest condition.
6. Expose the reusable intermediate arguments: a small cover of possible values for a ground-valued
   name, a simultaneous resolution of specified tests, and equivariance with fixed parameters and
   dense deciders. Each has a concrete consumer above; no universal structure called a certificate
   or shadow is required.

**Checks.** On `ℕ` with larger numbers stronger, the tails `{m | m ≥ n}` are dense open with empty
intersection, yet any two conditions are compatible, the separative quotient has one condition, and
the forcing adds no sets: without separativity, no new sequences does not give distributivity.
External countability gives external countable-centeredness, so it is not the
cardinal-preservation hypothesis for a countable ground. The generic Cohen real is not covered by
any countable set of checked ground reals. Homogeneity does not decide a formula with arbitrary
moving name parameters. Raw closure is not asserted to be invariant under every dense presentation.

## Layer 8: Cohen, collapse, and random forcing

**Dependencies:** Layers 1 and 7 for the finite-condition examples; for random forcing, Layers
2–7, VonNeumannAlgebras Layer 2 (the measure algebra of a finite measure) and the constructions
below.

### Cohen forcing

1. For `Fn(I, 2)` with arbitrary coordinate set `I`, prove the Knaster property, hence ccc, using a
   full Δ-system lemma for uncountable families of finite sets and thinning to compatible root
   assignments. Build any required Δ-system theorem absent from the supplied combinatorics API as an
   explicit target of this item. The countability of one-real Cohen forcing does not replace this
   proof. For a transitive ZFC ground `M` and `I ∈ M`, prove also that `M ⊨ "Fn(I, 2) is ccc"`, by
   the same argument run inside `M` with a ground-internal Δ-system lemma: the external Knaster
   property of the decoded forcing is not the ground's ccc (Conventions), and item 3's preservation
   of cardinals uses the internal statement.
2. Prove atomlessness for infinite `I`, the coordinate-flip and coordinate-permutation actions, and
   weak homogeneity. Prove the top-decision consequence for sentences with ground parameters.
3. For a transitive ZFC ground, construct its canonical finite binary forcing presentation and its
   generic-real names. Prove that an `M`-generic real on `ℕ` is not in `M`, while the extension
   satisfies ZFC and has the same cardinals and cofinalities. For `Fn(κ × ℕ, 2)`, prove that the
   coordinate reals are distinct and that the extension has at least the ground cardinal `κ` many
   reals.
4. Give the conditional model-existence corollary: an externally countable transitive ZFC ground has
   a generic extension satisfying failure of CH by taking its own second uncountable cardinal as
   `κ`. This is a theorem about supplied transitive grounds, not the proof-theoretic statement
   `Con(ZFC) → Con(ZFC + ¬CH)`.

### Collapse forcing

1. For an infinite ordinal `λ` in a ground, use the ground's finite partial functions from `ℕ` to
   `λ`. Prove density of the domain and range requirements and obtain a surjection from `ℕ` onto the
   ground `λ` in the extension. Exhibit a cardinal collapse when `λ` is uncountable in the ground.
2. For a ground-regular infinite cardinal `κ` and a ground ordinal `λ ≥ κ`, define partial functions
   from `κ` to `λ` with domain size less than `κ`, ordered by reverse extension. Prove internal
   `<κ`-closure, the generic surjection onto `λ`, and preservation of sequences of ordinals of
   length less than `κ`. State the convention for this collapse explicitly; no identification with a
   different standard collapse presentation is assumed.

### Measure algebra and random forcing

1. For a finite measure space, consume the measure algebra of VonNeumannAlgebras Layer 2: the
   measurable sets modulo null sets, with metric `d(A, B) = μ(A △ B)`, and its finite Boolean
   operations. On that quotient, define `μ̄(a) = d(a, 0)` and prove that it is strictly positive on
   nonzero classes. Construct arbitrary joins by essential suprema, including the
   countable-subfamily reduction used for finite measures, so that the quotient is a complete
   Boolean algebra. Prove ccc from the finiteness of the measure, not from an assumption that the
   algebra is atomic.
2. Instantiate the construction with fair-coin product measure on Cantor space, using Mathlib's
   probability-product measure and proving its cylinder probabilities. Use the nonzero measure
   classes as conditions. Prove that the separative quotient of positive Borel sets ordered by
   inclusion is the corresponding positive measure algebra, and compare the Borel and
   completed-measurable quotients. The raw quotient map is not asserted to be an injective order
   embedding.
3. Construct well-founded, countably branching Borel descriptions generated by cylinders,
   complement, and countable union, their external evaluator in Mathlib's measurable/Borel spaces,
   and their material ground-code adapter. Include rank certificates and the coding of countable
   families needed for the ground interpretation. Prove decoding/evaluation, absoluteness of
   membership for reals in both models, and absoluteness of coded measure/nullity and the rational
   inequalities needed to compare codes modulo null sets. Construct the ground's code quotient, its
   internally indexed joins, and its internal ccc theorem. These coding and correctness
   constructions are owned here. In the ground's code quotient, prove `[⋃ₙ cₙ] = ⋁ₙ [cₙ]` for every
   ground-coded sequence `⟨cₙ⟩`, from the absoluteness of coded measure, the closure of ground codes
   under finite meets, and countable additivity of the host measure.
4. Fix the forcing: the positive part of the ground's code quotient of item 3, with `G` an
   `M`-generic filter on it. Construct the random real from the decisions of `G` on coordinate
   cylinders. For each ground Borel code `c`, prove by code induction that the real belongs to the
   interpretation of `c` in the extension exactly when `[c] ∈ G`. At a complement use the decision
   sets `{q | q ≤ [c] ∨ q ≤ [c]ᶜ}`. At a countable union `⋃ₙ cₙ` use the dense set
   `{q | ∃ n, q ≤ [cₙ]} ∪ {q | q ⊓ [⋃ₙ cₙ] = 0}`: it is coded in the ground from `⟨cₙ⟩ ∈ M`, and its
   density is the equation `[⋃ₙ cₙ] = ⋁ₙ [cₙ]` of item 3. Conditions taken from the host measure
   algebra would not give a ground-coded dense set. Deduce avoidance of
   every ground-coded Borel null set, newness, and cardinal/cofinality preservation by internal ccc.
   An old code can describe a set containing new reals: its interpretation is not identified with
   the ground's old point set. No atomless probability measure on the externally countable set of
   old reals is asserted. Distinguish the host Cantor measure algebra from the external regular
   completion of the decoded ground forcing; the ground algebra's code-evaluation image need not be
   dense in the former.

These examples serve different tests: Cohen forcing exercises finite conditions, symmetry, and
nontrivial chain conditions; collapse forcing separates closure from cardinal preservation; random
forcing exercises measure quotients and the Boolean branch.

## Layer 9: Products, projections, and two-step iterations

**Dependencies:** Layers 0–8, except that the general construction does not depend on random
forcing.

1. Develop products of forcing preorders and the coordinate projections. Prove the
   product-genericity theorem: a generic for the product yields a generic for the first forcing and
   a generic for the second over the first extension; conversely such a mutually generic pair gives
   a product generic. Explain the extra genericity over the intermediate model in the formal
   hypotheses.
2. Define a projection from `P` to `Q` by its order and lifting properties, and prove the induced
   generic-filter and quotient-forcing theorems. Develop complete Boolean embeddings, the
   corresponding quotient algebra/forcing in an extension, and their compatibility with the
   completion construction.
3. For a ground name `Q̇` for a forcing notion that the first forcing forces to have a weakest
   condition `1̇`, construct the two-step iteration; for a merely nonempty `Q̇`, first adjoin a
   weakest condition by Layer 0. Bound and collect the required names to obtain an actual ground set
   of conditions. Prove its ordering, the canonical first-stage embedding `p ↦ (p, 1̇)`, the
   projection to the first stage, name evaluation, and the generic factorization theorem.
4. Prove the extension identity `M[G * H] = M[G][H]` in the chosen material representation, with the
   corresponding isomorphism statement when carriers are only canonically equivalent. Prove
   invariance under the permitted name presentations.
5. Prove two-step preservation of ccc when the first forcing is ccc in the ground and forces the
   second to be ccc. Include the standard finite-product consequences under sufficient hypotheses
   such as Knaster, and the decomposition of Cohen forcing over disjoint coordinate sets. Do not
   infer that every product of two ccc forcings is ccc.

**Checks.** Separately ground-generic filters need not be mutually generic. The trivial second stage
gives the original forcing. A product agrees with a two-step iteration by a checked second forcing,
but its preservation theorem still requires the correct statement about that forcing in the first
extension.

## Downstream consumers

- A countable family of dense tests on a preorder produces a filter through a chosen condition. This
  result is available without ground models, names, Boolean completions, or ZFC preservation.
- Finite partial functions produce total generic objects; range requirements produce surjections,
  and disagreement requirements produce diagonalization. Their semantic model-theory interpretation
  is supplied by separate representation theorems.
- The canonical-name and valuation APIs provide the ground/new-set boundary needed by
  potential-isomorphism and coded-structure applications. This roadmap supplies forcing tools, not
  new proofs of the Scott, Silver, or López–Escobar theorems owned by the corresponding model-theory
  roadmaps.
- The Boolean-valued universe, with its mixing, maximum, separation and quotient results, is usable
  without the Cohen, collapse and random applications.
- The preservation proofs expose exactly the antichains, decision families, and invariant parameters
  they use. This makes their restricted hypotheses available to independently specified applications
  in weaker theories.

## Scope and ownership

This roadmap owns the order/genericity adapters not already supplied by Mathlib; separative and
Boolean completion theory; poset names and the required Boolean-valued semantic kernel; material
generic extensions and their forcing theorem; preservation of ZFC; the stated chain-condition,
closure, distributivity, and homogeneity results; the three worked forcing families; and
finite/two-step composition. Its implementation should keep general order, generic first-order
semantics, and set-specific constructions in separate modules.

General transfinite iteration theory, proper and semiproper forcing, fusion and Sacks forcing,
forcing axioms, symmetric extensions, class forcing, admissible/KP/KPU forcing, arithmetic forcing,
potential probability measures, and a proof-theoretic independence calculus are outside this
roadmap. They require their own mathematical specifications and supplier contracts. The conditional
failure-of-CH model theorem above is in scope.

The Boolean-valued universe of set theory (Layer 3) is an explicit construction here, because the
comparison of Layer 6 needs it; it is not an assumed dependency. Boolean-valued structures for
arbitrary first-order languages and Boolean-valued analysis are outside this roadmap, which
specifies and owns neither. External work is credited before its code is integrated; its
representation and module boundaries do not prescribe this roadmap.

The source repository `cameronfreer/forcing` (at `5d77761d`) proves the material truth lemma for its
maximal family of internal names, `MaterialGround.truth_lemma_maximal`. Its inputs are a transitive
`ZFSet` carrier modelling an explicit theory `T` (`MaterialGround T`), a coded copy of the forcing
notion inside that carrier (`InternalForcingPresentation`), each axiom instance its proof uses as a
named sentence assumed to belong to `T`, the formula's test sentences for the constructed
recognizer, and a filter generic over the presentation's derived context. For a ZFC ground this
roadmap still owes the presentation of a ground-coded poset, the derivation of each of those
instances from ZFC, and the identification of the maximal family with the canonical ground names of
Layer 4; the comparison of Layer 6 is then proved against that forcing relation.

The source repository `cameronfreer/forcing` and Flypitch with its Lean 4 port provide proofs,
examples, and interface experience. This specification states the mathematics independently; a
conditional source theorem is reused only after its presentation hypotheses are matched to the
constructed canonical objects.

## Exact supplier contracts

### From Mathlib order theory

Consume `Preorder`, `Order.PFilter`, `Order.Ideal`, `Order.Cofinal`, `Order.idealOfCofinals`,
`IsCoinitial`, `IsCoinitialFor`, `IsLowerSet`, `LowerSet`, and standard order maps/embeddings.
Consume `Heyting.Regular`, its regularization/Galois insertion, and its finite Boolean-algebra
structure. Layer 2 owns the required complete regular-element construction and forcing-completion
theorems. Relevant modules include `Mathlib.Order.PFilter`, `Mathlib.Order.Ideal`,
`Mathlib.Order.Bounds.Defs`, `Mathlib.Order.UpperLower.CompleteLattice`,
`Mathlib.Order.Heyting.Regular`, and `Mathlib.Order.CompleteBooleanAlgebra`.

### From Mathlib set theory and recursion

Consume `PSet`, its extensional equivalence and membership, `ZFSet`, its membership
well-foundedness, set constructors, small carriers, ordinals, and cardinals. Relevant modules
include `Mathlib.SetTheory.ZFC.PSet`, `Basic`, `Ordinal`, `Rank`, and `Cardinal`. Layers 4–6 own
transitive-ground satisfaction, the concrete sentence theory, internal syntax/name codes,
definability, and generic extensions. Representation-level definability is not supplied as a
substitute for object-language definability over a ground.

### From Mathlib first-order model theory

Consume the language, term, bounded-formula, relabeling, lifting, substitution, ordinary
realization, and ordinary quotient infrastructure in `Mathlib.ModelTheory.Syntax`, `Semantics`, and
`Quotients`. Layer 3 owns Boolean-valued interpretation and its equality laws; Layer 4 owns the
pure-membership language adapter and the ground-code correctness theorem. Neither a full forcing
theorem nor Boolean-valued set semantics is presumed to be an existing supplier.

### From Mathlib finite combinatorics and countability

Consume finite sets/maps, partial functions, countability, and the available cardinal and
finite-subset lemmas. Layer 1 owns finite-condition adapters and generic-union theory. Layer 8 owns
any additional Δ-system and root-assignment thinning theorem needed for the arbitrary-coordinate
Cohen chain-condition proof.

### From Mathlib measure theory and probability

Consume measurable spaces, measures, almost-everywhere equality, null sets, finite/probability
measure classes, Borel spaces, and `MeasureTheory.Measure.infinitePi` from
`Mathlib.Probability.ProductMeasure`, including the cylinder/product characterization of that
measure. The measure algebra itself comes from VonNeumannAlgebras (below); on it Layer 8 owns the
descended measure, the complete Boolean structure by essential suprema, ccc, the fair-coin/cylinder
specialization, and the ground-coded random-forcing interpretation. The existence of a probability
measure is not treated as the existence of a complete measure algebra.

### From VonNeumannAlgebras

[VonNeumannAlgebras](../VonNeumannAlgebras/README.md), Layer 2 (the paragraph after
V2.RectangularL2), on `main`: for a finite measure, the measure algebra of measurable sets modulo
null sets, with metric `μ(A △ B)`. Layer 8 consumes this quotient and its finite Boolean operations
and builds on it the strictly positive measure `μ̄(a) = d(a, 0)`, arbitrary joins by essential
suprema, and ccc.

### Relations with other Tau Ceti areas

Infinitary logic, countable structure spaces, Borel equivalence relations, and computability theory
are consumers or coordination boundaries, not unstated suppliers of the forcing theorem. The roadmap
does not require infinitary logic to construct finitary set forcing. This roadmap owns the specific
Borel descriptions, evaluator, and material-code adapter used for random forcing; the ordinary
pointclass, reducibility, and dichotomy theory stays with the descriptive-set-theory roadmaps.

## References

The following locators identify the mathematical sources for the substantial targets. The
internal/external adapter and specified-test interfaces are derived targets with explicit inputs,
not claims that a source already supplies their exact Lean packaging.

| Targets | Source and locator |
| --- | --- |
| Layer 4 forcing theorem; Layer 5 ZFC preservation, including Power Set and Replacement | Karagila, §2.2, Theorems 2.20 and 2.22, especially the Power Set and Replacement arguments in the proof of 2.22 |
| Layer 5 Separation | Hamkins–Seabold, §1, the separation name in the proof sketch of Theorem 3 (p. 3); Karagila's proof of 2.22 does not treat Separation, Pairing or Empty Set |
| Layer 7 general chain-condition preservation | Karagila, §3.1, Definition 3.5 and Theorem 3.7 (the deciding-antichain argument), and §3.3, Definition 3.20 and Theorem 3.22, whose proof is that of 3.7 |
| Layer 7 closure, distributivity, and no-new-sequences | Karagila, §4.1, Definition 4.1, Theorem 4.2 and Exercise 4.3; §4.2, Definition 4.14, Theorem 4.16 and Corollary 4.17 (stated without proof). Karagila's κ-closed and κ-distributive are the `<κ` notions here, with no index shift. Theorem 4.16 states the converse, from no new short sequences to distributivity, for every forcing notion; it needs separativity (the Checks of Layer 7). The Boolean-algebra characterization of distributivity is not from this source |
| Layer 7 the converse, from no new sequences to distributivity, for separative orders | Eskew, *Forcing and Large Cardinals*, Lemma 2.7, whose proof uses separativity to place the deciding condition below the selected antichain members |
| Layer 9 products and mutual genericity | Karagila, §5.1, Theorems 5.3 and 5.6, Definition 5.5 and Corollary 5.4 |
| Layer 9 two-step construction, factorization, quotients and ccc | Karagila, §6.1, Definition 6.1 and the Remark on set-sized names after it, Theorem 6.4 (generic factorization), Theorem 6.6 (quotient forcing) and Theorem 6.9 (κ-cc of the iteration); the extension identity `M[G * H] = M[G][H]` is not stated there as a theorem |
| Layer 3 mixing, maximum/fullness, and ordinary quotient truth | Hamkins–Seabold, §1, Lemmas 1–2; §2, Lemma 10 |
| Layer 4 formula-indexed definability | Hamkins–Seabold, §1, the passage following Theorem 3 |
| Layer 6 generated ultrafilters | Hamkins–Seabold, §8, Theorems 40–41: when an ultrafilter on `P` generates one on its completion |
| Layer 6 poset/Boolean formula comparison | A derived target here, proved by the induction of Layer 6 item 2 over matching name domains. The start of Hamkins–Seabold §8 (p. 19) asserts the correspondence of generic filters on `P` and on its completion, not the formula comparison |
| Layer 8 measure algebra, completeness, and ccc | Fremlin, *Measure Theory* Volume 3, 321H, 322A(e), 322B(e) (essential suprema and suprema), 322C(a–c) and 322G; the essential-supremum construction itself is in Volume 2 (211L, 215B) or 316Fa, to which 322C(c) points; 322D(a) for comparing the Borel and completed quotients |
| Layer 8 random forcing | Fremlin, Volume 5, 552A |
| Layer 8 tree codes and their operations | Fremlin, Volume 5, 562A–C; specialize the basic-set codes to Cantor cylinders |
| Layer 8 random-real names and the reinterpretation of Baire sets | Fremlin, Volume 5, 551C–E and 551K(a–d), for a measurable space with negligibles whose quotient algebra is Dedekind complete. Fremlin reinterprets Baire sets (`H ↦ H̃`), not codes; the code-level adapter of Layer 8 is derived by combining 551K with 562. On Cantor space the Baire sets in this presentation are Borel |
| Layer 6 internal regular-cut adapter | A derived interface built from Layer 4's per-formula definability and density regularity, Layer 2's completion, and Layer 3's formula induction; its preservation of ground-coded joins and matching-domain theorem are new proof obligations |
| Layer 7 specified-test and ground-value-cover interfaces | The deciding-antichain and coordinate-decision arguments of the preceding preservation targets, localized to their actual name/domain/test inputs |

- Kenneth Kunen, *Set Theory*, 2011: set forcing, names, the forcing theorem, preservation, and
  iterations.
- Thomas Jech, *Set Theory*, third millennium edition, 2003: Boolean-valued models, forcing, chain
  conditions, and distributivity.
- John L. Bell, *Set Theory: Boolean-Valued Models and Independence Proofs*, third edition, 2005:
  Boolean-valued semantics, mixing, and quotient interpretations.
- [Asaf Karagila, *Forcing and Symmetric Extensions*](https://karagila.org/files/Forcing-2023.pdf),
  version of 24 August 2026 (the numbering above refers to it), Part I, especially Chapters 2–6:
  generic extensions, examples, closure/distributivity, products, and iterations.
- [Monroe Eskew, *Forcing and Large Cardinals*](https://www.logic.univie.ac.at/~meskew/forcing%20notes.pdf),
  lecture notes: Lemma 2.7, distributivity and new sequences for separative orders.
- [Joel David Hamkins and Daniel E. Seabold, *Well-founded Boolean ultrapowers as large cardinal
  embeddings*](https://arxiv.org/abs/1206.6075v1), 2012 manuscript: fullness, ultrafilter quotients,
  and the relation to generic extensions.
- D. H. Fremlin, *Measure Theory*: Volume 3, [Chapter 32, Measure
  algebras](https://www1.essex.ac.uk/maths/people/fremlin/chap32.pdf) (version of 21.7.11), and
  Volume 5, [Chapter 55, Possible worlds](https://www1.essex.ac.uk/maths/people/fremlin/chap55.pdf)
  (7.1.15) and [Chapter 56, Choice and
  determinacy](https://www1.essex.ac.uk/maths/people/fremlin/chap56.pdf) (3.1.15). Use the numbered
  items above as the locators; the relevant code/evaluation interfaces must still be constructed in
  Lean.
- [Jesse Michael Han and Floris van Doorn, *A Formalization of Forcing and the Unprovability of the
  Continuum Hypothesis*](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ITP.2019.19),
  ITP 2019: formal Boolean-valued forcing and the distinction between semantic constructions and
  proof-theoretic independence.
- [Cameron Freer, `forcing`](https://github.com/cameronfreer/forcing): poset-first order/genericity,
  names, and material forcing; Apache-2.0 implementation source.
- [Flypitch](https://github.com/flypitch/flypitch) and [its Lean 4
  port](https://github.com/zhangjunphy/flypitch-lean4): Boolean-valued models and independence
  constructions. Reuse mathematical constructions while respecting Mathlib's syntax and current
  APIs.
- [Steven Sabean, `boolean-valued-analysis`](https://github.com/SteveWmoc/boolean-valued-analysis):
  Boolean-valued structures over Mathlib's first-order syntax, weighted names, mixing, the maximum
  principle and separated semantics.
- [Isabelle/AFP, Forcing](https://www.isa-afp.org/entries/Forcing.html) and [Independence of
  CH](https://www.isa-afp.org/entries/Independence_CH.html): complementary material-model
  developments and axiom-preservation organization.
