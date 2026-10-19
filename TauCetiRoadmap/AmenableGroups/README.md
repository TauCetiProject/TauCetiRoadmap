# Roadmap: amenable groups

Amenability makes averaging possible when normalized counting is unavailable. Its
finitely additive form rules out paradoxical decompositions, the phenomenon behind
Banach–Tarski. This roadmap develops invariant means as a usable theory, then proves
the discrete Følner and non-paradoxicality characterizations.

The primary definition applies to arbitrary topological groups. The subgroup,
extension, directed-colimit, Følner and Tarski layers below concern discrete
groups. The locally compact characterization is a separate analytic branch.
Euclidean Banach–Tarski, Property (T), and constructions of nonamenable groups
without nonabelian free subgroups are outside scope.

The README is definitive. [Suggested.lean](Suggested.lean) gives suggested,
non-exhaustive signatures, with `sorry` for unproved targets. The suggested home is
`TauCeti/GroupTheory/Amenable/`, with general-purpose material under
`TauCeti/Topology/`, `TauCeti/MeasureTheory/` and `TauCeti/Algebra/Group/Action/`.

## Conventions and primary definition

Let `G` have `[Group G] [TopologicalSpace G] [IsTopologicalGroup G]`. No separation,
local compactness, countability or generation hypothesis is part of the definition.
Let `UCB(G)` be the bounded real-valued functions satisfying

```text
∀ ε > 0,  ∀ᶠ u in 𝓝 1,  ∀ x ∈ G,  |f(ux) - f(x)| < ε.
```

Equivalently, `sup_x |f(u*x) - f x| → 0` as `u → 1`. This implies continuity.
Use the closed real subspace of
[`BoundedContinuousFunction G ℝ`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/ContinuousMap/Bounded/Basic.html#BoundedContinuousFunction)
specified by this condition. Prove that it is exactly bounded uniform continuity
for Mathlib's
[`IsTopologicalGroup.rightUniformSpace`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/Algebra/IsUniformGroup/Defs.html#IsTopologicalGroup.rightUniformSpace).
Its entourages compare `(x,y)` through `y*x⁻¹`. Do not infer an `IsUniformGroup`
instance: the left and right uniformities of a general group can differ.

The action on functions is

```text
(L_g f)(x) = (g • f)(x) = f(g⁻¹x),        L_g L_h = L_(gh).
```

A **mean** is a real linear functional `m : UCB(G) →ₗ[ℝ] ℝ` such that
`f ≥ 0 ⇒ m(f) ≥ 0` and `m(1)=1`. A mean is left invariant if
`∀ g f, m(L_g f)=m(f)`. **Amenability** is existence of such a mean.
Continuity is a consequence, not an extra assumption. In discrete layers,
“amenable group” means this definition with the discrete topology; provide
equivalent topology-free statements through Layer 2.

Bekka–de la Harpe–Valette (BDHV), Appendix A.3 and Definition G.1.4, call this
function condition *left* uniform continuity and explicitly warn that the names
are reversed elsewhere. Their topological groups are Hausdorff by the convention
at the start of Appendix A. The definition here also makes sense without that
assumption; comparisons with their results retain their Hausdorff hypothesis.
BDHV use complex-valued functions, with `‖f(ux)-f(x)‖` in the same condition.
Layer 1 proves compatibility by `mℂ(f)=m(Re f)+i m(Im f)`; positivity for a
complex mean concerns real nonnegative functions.

## Existing foundations and design alignment

The roadmap builds on the following existing API.

| Existing API | Use and connecting work required here |
| --- | --- |
| [`BoundedContinuousFunction`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/ContinuousMap/Bounded/Basic.html), `Submodule`, `ContinuousLinearMap`, `WeakDual.isCompact_closedBall` | The UCB subspace, translation representation and compact space of means in Layer 1. |
| [`MeasureTheory.AddContent`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/MeasureTheory/Measure/AddContent.html#MeasureTheory.AddContent) | Finite additivity on a specified algebra of sets. Add normalization and invariance; do not use `Measure` for this purpose. |
| [`IsFoelner`, `maxFoelner`, `isFoelner_iff_tendsto`, `IsFoelner.amenable`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/MeasureTheory/Group/FoelnerFilter.html) | Existing filter theory and ultrafilter construction of an invariant set function. Supply counting-measure, finite-set, content and functional-mean bridges in Layers 2 and 5. The theorem named `amenable` does not supply the primary definition. |
| [`Equidecomp X G`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Group/Action/Equidecomp.html#Equidecomp) | Existing partial equivalence with a finite set of acting elements; reuse its restriction, composition and inverse API. Build the partition bridge, comparison theorem and paradoxicality API in Layer 3. |
| [`FreeGroup.toWord`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/GroupTheory/FreeGroup/Reduce.html#FreeGroup.toWord), `FreeGroup.isReduced_toWord` | Reduced-word prefix and cancellation lemmas for the early negative example. |
| [`GrpCat.FilteredColimits.colimitCoconeIsColimit`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Category/Grp/FilteredColimits.html#GrpCat.FilteredColimits.colimitCoconeIsColimit), [`Types.jointly_surjective_of_isColimit`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/CategoryTheory/Limits/Types/Colimits.html#CategoryTheory.Limits.Types.jointly_surjective_of_isColimit) | Existing filtered group colimits and representation by stages. Prove directedness and coverage of the image subgroups, then amenability in Layer 4. |
| [`Finset.all_card_le_biUnion_card_iff_exists_injective`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Hall/Basic.html#Finset.all_card_le_biUnion_card_iff_exists_injective) | Hall's theorem with arbitrary index type and finite neighbor sets. Layer 8 builds the expansion and equidecomposition connections. |
| [`geometric_hahn_banach_point_closed`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/LocallyConvex/Separation.html#geometric_hahn_banach_point_closed) | Separation input to Layer 5, which builds the finitely supported probability and dual-pairing argument. |
| [`Measure.haar`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/MeasureTheory/Measure/Haar/Basic.html#MeasureTheory.Measure.haar), `Lp`, Bochner integration, `MemLp.exists_hasCompactSupport_eLpNorm_sub_le` | Haar and approximation foundations for Layer 7. |
| [`Measure.modularCharacter`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/MeasureTheory/Group/ModularCharacter.html#MeasureTheory.Measure.modularCharacter) | The right-translation factor for Haar integrals. Layer 7 fixes its relationship to the inverse convention used by BDHV and supplies the integral and null-set bridges. |

The [amenability design discussion](https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Amenability.20of.20actions.2Fgroups.html)
distinguishes topological-group amenability from several inequivalent notions for
actions. The UCB definition here uses the right uniform structure described
there. A content on all subsets of the underlying group characterizes the
*discrete* specialization (Layer 2).

[Mathlib PR #30330](https://github.com/leanprover-community/mathlib4/pull/30330)
defines `Equidecomp.Equipartition`, a finite set of (source piece, group element,
target piece) triples with independent sources and targets, and the conversions
`Equipartition.to_equidecomp` and `Equidecomp.to_equipartition`. Build these as
Layer 3 targets with that PR's names and shapes, together with their source and
target laws and the `Finpartition`s they induce on source and target.

The neighbouring [compact-group representation roadmap, Layer 0](../RepresentationTheory/CompactGroups/README.md#layer-0-normalized-haar-measure-and-averaging)
owns normalized Haar probability and its left, right and inversion invariance.
Its implementation, [`TauCeti/RepresentationTheory/Compact/Haar.lean`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/RepresentationTheory/Compact/Haar.lean),
supplies `TauCeti.haarProb`; Layer 7 uses it for compact examples.
Peter–Weyl, unitary representation theory and the positive-definite-function
targets of [OneParameterSemigroups, Part C](../OneParameterSemigroups/README.md#part-c--positive-definite-functions-and-bochners-theorem)
are related subjects, not dependencies of this roadmap.

## Layer 1: UCB, means and transport

Develop the function space before defining invariant means on it.

1. Prove the equivalence of the neighborhood, supremum-norm and right-uniform-space
   conditions above. Give coercion and extensionality lemmas, constant functions,
   evaluation bounds, addition and scalar multiplication. Prove closure under
   pointwise multiplication, absolute value, `min` and `max`, and under uniform
   limits. Equip the space with the inherited supremum norm, order and complete
   real normed-space structure. The unital algebra and vector-lattice operations
   must agree with their pointwise interpretations.
2. Construct `L_g` as a real linear isometry equivalence. Prove its pointwise
   formula, identity, composition, inverse, order and constant preservation, and
   norm-continuity of `g ↦ L_g f` for each fixed `f`. Conjugation continuity is
   needed when checking that `L_g` preserves UCB. Prove that right translations
   preserve UCB and commute with `L_g`. Inversion identifies this space with the
   space defined using `f(xu)` and exchanges left and right translation.
3. Give means extensionality, evaluation on constants, monotonicity,
   `inf f ≤ m(f) ≤ sup f`, `|m(f)| ≤ ‖f‖∞`, `‖m‖=1`, and continuity.
   The infimum/supremum are over the nonempty group. Prove
   `|m(f)-m(h)| ≤ ‖f-h‖∞` and compatibility with uniform limits. Bundle the derived
   continuous linear functional using Mathlib's operator API. Prove convexity of
   means and of invariant means. State shared positivity and normalization lemmas
   for the ordered normed function spaces used again in Layers 2 and 7.
4. Put means in the weak-* dual unit ball. Prove that normalization, positivity
   and each equation `m(L_g f)=m(f)` define closed subsets. Evaluation at a point
   shows that the space of means is nonempty. Establish its compactness, the
   finite-intersection criterion for invariant means, and the criterion that any
   weak-* cluster point of approximately invariant means is invariant. Specify
   approximate invariance as `m_i(L_g f)-m_i(f) → 0` for every `g,f`, along a
   nontrivial filter.
5. For a continuous homomorphism `φ : G →* H`, prove that pullback
   `f ↦ f ∘ φ` maps `UCB(H)` to `UCB(G)`, preserves constants and positivity,
   is norm-contracting, and intertwines `L_g` with `L_(φ g)`. It is an isometry
   when `φ` is surjective. Deduce transport of amenability along surjective
   continuous homomorphisms and equivalence along a group isomorphism whose two
   directions are continuous. Provide identity and composition compatibility.
6. Prove the real/complex correspondence stated above, including restriction,
   complexification, inverse laws, normalization, invariance and operator norm
   one. Retain the real space as the primary API.

Reference: [BDHV](https://perso.univ-rennes1.fr/bachir.bekka/KazhdanTotal.pdf),
Appendix A.3 and G.1, especially Definition G.1.4.

## Layer 2: discrete means, contents and finite groups

For a discrete group prove that UCB is all bounded functions, with the same norm,
order, constants and translations. Use the discrete instance of bounded continuous
functions.

For a set `X`, use `AddContent ℝ≥0∞ (Set.univ : Set (Set X))` with total mass one
for a finitely additive probability on all subsets. Prove the bridge to a
real-valued nonnegative set function `ν` with `ν(∅)=0`, `ν(X)=1` and
`ν(A ∪ B)=ν(A)+ν(B)` for disjoint `A,B`. All values are at most one and finite,
so the conversions using `ENNReal.ofReal` and `toReal` are inverse. Supply finite
disjoint-union, complement, difference, monotonicity and finite subadditivity
lemmas, pushforward along a map, and invariance under a `MulAction G X`.

Prove the mutually inverse correspondence between means on bounded real functions
on `X` and these probabilities:

```text
ν(A) = m(1_A),        m(c₁·1_{A₁} + ⋯ + cᵣ·1_{Aᵣ}) = c₁·ν(A₁) + ⋯ + cᵣ·ν(Aᵣ).
```

The reverse construction must prove independence of the finite disjoint
presentation, positivity and the supremum-norm bound. Prove uniform approximation
of every bounded real function by finite-range functions, then construct and prove
uniqueness of the continuous extension. Prove naturality under
pullback/pushforward and equivariance, so left-invariant means correspond exactly
to left-invariant probabilities.

Conclude the discrete characterization of the primary definition. Also prove that
amenability of an underlying abstract group implies amenability with any group
topology, by restricting its mean to UCB.

For `[Finite G]`, normalized counting gives
`m(f) = (Nat.card G : ℝ)⁻¹ * ∑ x, f x`, using a `Fintype` instance to write the
sum. Prove positivity, normalization and invariance by the permutation `x ↦ g*x`.
Give the matching content `ν(A)=|A|/|G|`, independence of the chosen `Fintype`
instance, and the trivial-group case. Finite groups with any group topology then
follow from the restriction result.

References: [Garrido](https://www.math.uni-duesseldorf.de/~garrido/amenable.pdf),
Definitions 1.12–1.13 and Theorem 1.15, used here **in discrete scope**;
[BDHV](https://perso.univ-rennes1.fr/bachir.bekka/KazhdanTotal.pdf), G.1.
Neither finite additivity nor the domain of all subsets can be replaced by
countable additivity on a sigma-algebra.

## Layer 3: equidecompositions and the free-group obstruction

For `[Group G] [MulAction G X]`, say `A ∼_G B` when an `Equidecomp X G` has source
`A` and target `B`. Prove equivalence with finite families `A_i` partitioning `A`
and elements `g_i` such that the pairwise disjoint sets `g_i • A_i` partition `B`.
Use `Finpartition` and the `Equipartition` bridge described above, including
conversion laws for source, target and the induced bijection. Empty pieces may be
removed without changing the relation.

Develop reflexivity, symmetry, transitivity, restriction to subsets, disjoint
finite unions, transport by equivariant bijections and transport of the acting
group along an isomorphism. Define `A ≼_G B` by equidecomposability with a subset of
`B`; prove its preorder laws and the equidecomposition Schröder–Bernstein theorem
`A ≼_G B ∧ B ≼_G A ⇒ A ∼_G B`. Its proof must retain a finite set of acting
elements when constructing the bijection; an arbitrary set-theoretic bijection
does not suffice.

A **paradoxical** subset `S ⊆ X` is nonempty and admits disjoint `A,B` with
`A ∪ B=S` and `A ∼_G S ∼_G B`. Thus the empty set is not paradoxical in this API.
Prove equivalence with disjoint subcopies `A,B ⊆ S` each equidecomposable with `S`,
without requiring that they cover `S`; retain the nonemptiness hypothesis in that
version. Give invariance under equidecomposition and equivariant bijections.

An invariant content assigns equal values to equidecomposable sets, by finite
additivity. Prove that a finite-valued such content with `ν(S)>0` excludes a
paradoxical decomposition of `S`. In particular, an invariant probability rules
out paradoxicality of the whole space. Specialize using Layer 2 to prove the
easy implication for amenable discrete groups.

For `F₂ = FreeGroup (Fin 2)`, let `a,b` be the two generators and `W(c)` the
reduced words whose first letter is `c`, for `c=a,a⁻¹,b,b⁻¹`. Establish the
prefix, disjointness and cancellation API, including

```text
F₂ = {1} ⊔ W(a) ⊔ W(a⁻¹) ⊔ W(b) ⊔ W(b⁻¹),
F₂ = W(a) ⊔ a·W(a⁻¹) = W(b) ⊔ b·W(b⁻¹).
```

These exhibit two disjoint subcopies. Apply the subcopy-to-partition theorem to
obtain a paradoxical decomposition of the entire group, including its identity.
Conclude that `F₂` is not amenable.

Reference: [Garrido](https://www.math.uni-duesseldorf.de/~garrido/amenable.pdf),
Definition 1.1, Theorem 1.2, Corollary 1.3, Definition 1.4 and Proposition 1.5(1).

## Layer 4: discrete closure theory

All groups in this layer carry the discrete topology. Prove the following
using Layers 1–2, with formulas for the maps on means and their compatibility.

1. **Subgroups.** If `H ≤ G` and `G` is amenable, then `H` is amenable. Choose
   representatives for the right cosets `H*t`, choosing `1` for `H` itself, and
   an `H`-equivariant retraction `r : G → H`, satisfying `r(h*x)=h*r(x)`. Pull a
   bounded function on `H` back along `r`, and average using a mean on `G`. Prove
   the retraction construction, boundedness, positivity, normalization and
   invariance. This is not restriction of a probability to `H`, which can have
   mass zero.
2. **Quotients and images.** Prove amenability of `G/N` for every normal subgroup
   `N`, and of the range of every homomorphism out of an amenable group. Include
   the surjection formulation, the quotient-by-kernel isomorphism and transport
   compatibility, reusing `QuotientGroup` and `MonoidHom.range`.
3. **Extensions.** If `N ◁ G`, `N` and `G/N` are amenable, prove that `G` is
   amenable. For bounded `f`, define
   `q=xN ↦ m_N (n ↦ f(x*n))`, and average this function with `m_(G/N)`.
   Prove independence of the representative, the norm bound and the translation
   formula before applying the quotient mean. Give the equivalent
   surjective-homomorphism theorem with amenable kernel.
4. **Finite products.** Prove binary product closure, the iterated-mean formula,
   and closure for products over a finite index type, including the empty
   product. Identify subgroup and quotient maps used in the extension proof.
5. **Directed unions.** For a nonempty directed family `H_i ≤ G`, let
   `H = ⋃ i, H_i`. If every `H_i` is amenable, prove that the subgroup `H` is
   amenable; in particular `G` is amenable when the union is all of `G`.
   Restrict bounded functions on `H` to `H_i` and apply a mean there. For each
   finite family of invariance equations, directedness puts the finitely many
   acting elements in one `H_i`. Use Layer 1's compact space of means and
   finite-intersection theorem.
6. **Directed colimits.** For a nonempty directed preorder `I`, groups `G_i` and
   homomorphisms `φ_ij` satisfying identity and composition laws, prove that their
   group colimit is amenable when every `G_i` is. The maps need not be injective.
   Reuse `GrpCat.FilteredColimits.colimitCoconeIsColimit`, the forgetful functor's
   preservation of filtered colimits, and `Types.jointly_surjective_of_isColimit`
   to represent every element by a stage. Prove that the canonical images are a
   directed family of subgroups covering the colimit. Each image is a quotient
   of its stage, so image closure and directed unions apply. State and prove the
   same result for any small filtered diagram in `GrpCat` and any specified
   colimit cocone: a cocone over two objects contains both image subgroups.
   Supply transport along the unique colimit isomorphism. Relate the directed
   preorder specialization to Mathlib's `DirectLimit` group construction by its
   universal property.

Finite subsets of `G` lie in finitely generated subgroups; those subgroups form a
directed family with union `G`. Prove these connecting lemmas for Layer 6.
Using Layer 3, also deduce that a discrete group containing a subgroup isomorphic
to `F₂` is nonamenable.

References: [Garrido](https://www.math.uni-duesseldorf.de/~garrido/amenable.pdf),
Proposition 2.2; [BDHV](https://perso.univ-rennes1.fr/bachir.bekka/KazhdanTotal.pdf),
Proposition G.2.2 for quotient, extension and directed-union principles.
Subgroups of amenable topological groups need not be amenable; the subgroup
theorem here is for discrete groups.

## Layer 5: Følner criteria for arbitrary discrete groups

Use Mathlib's `IsFoelner` and `maxFoelner` as the Følner API. The abbreviation
`HasFoelnerSets G` directly names `NeBot (maxFoelner G Measure.count)` for the
left regular action on `G`. It installs the measurable space `⊤` locally, so
every subset is measurable even when `G` is uncountable. Prove the discrete
characterization `amenable_iff_hasFoelnerSets`:

```text
Amenable G ↔ HasFoelnerSets G.
```

Obtain the explicit filter characterization `amenable_iff_maxFoelner_neBot`
by unfolding the abbreviation.
Here `NeBot` excludes the bottom filter, for which all eventual conditions are
vacuous. Prove the counting-measure specialization `hasFoelnerSets_iff`
with only `[Group G]`, without topology or countability hypotheses. For a finite
set `F` write `gF={g*x | x∈F}`; the specialization states

```text
HasFoelnerSets G ↔
  ∀ K ⊆ G finite,  ∀ ε > 0,  ∃ F ⊆ G finite,  F ≠ ∅  ∧  ∀ g ∈ K,  |gF △ F| < ε·|F|.
```

Derive `amenable_iff_exists_finset` for discrete groups by composing
`amenable_iff_hasFoelnerSets` with `hasFoelnerSets_iff`.
Cardinalities in inequalities and ratios are coerced to `ℝ`. Use `Finset`, the
pointwise action and `symmDiff`; prove bridges to finite `Set`s and counting
measure. Develop preservation under group isomorphisms, monotonicity in the test
set and tolerance, the symmetric-difference triangle bound, and
`|gF \ F|=|F \ gF|`, hence `|gF △ F|=2|gF \ F|`.

### Amenability implies the finite-test condition

Build the following analytic and finite-combinatorial steps.

* For finite `K` and `δ>0`, construct a finitely supported function
  `p : G → ℝ` with `p≥0`, `∑ p=1`, and
  `∑_(g∈K) ‖L_g p-p‖₁ < δ`. Give the finite-support probability API, its
  inclusion in `ℓ¹(G)`, translation isometries and the pairing with bounded
  functions. Use `lp (fun _ : G ↦ ℝ) 1` for `ℓ¹(G)` and `lp.single` for point
  masses `δ_y`.
* Prove this approximation from a mean by separating zero from the norm closure
  of the convex set `{(L_g p-p)_(g∈K) : p is a finite-support probability}` in
  the finite product of `ℓ¹(G)` spaces, with the sum norm. For a continuous real
  linear functional `Λ` on that product, let `f_g(y)=Λ(ι_g δ_y)`, where `ι_g`
  is the inclusion of the `g`-th factor, and prove `|f_g(y)| ≤ ‖Λ‖`, so each
  `f_g` is bounded. Evaluating a putative strict separator at point masses gives
  a positive lower bound, uniform in `x`, for the finite sum
  `∑_(g∈K) (f_g(g*x)-f_g(x))`; an invariant mean gives that sum mean zero, a
  contradiction. Build the closure and separation connections explicitly.
* For `F_t={x : p(x)>t}`, prove the layer-cake identities
  `∫₀∞ |F_t| dt=1` and
  `∫₀∞ |gF_t △ F_t| dt=‖L_g p-p‖₁`. Since `p` has finite support, these are
  finite weighted sums over the breakpoints of its values; provide that finite
  formulation and the weighted-average argument. Taking `δ<ε` yields a level
  with `F_t` nonempty and total boundary less than `ε|F_t|`, hence the required
  bound for every `g∈K`. Handle `K=∅` by a singleton.

### Filters, nets and the converse

For the counting-measure specialization, prove that finite nonzero counting
measure means a finite nonempty set, and convert the `ℝ≥0∞` ratios of `IsFoelner`
to the real ratios above.

As a concrete directed net, index by pairs `(K,n)` with `K : Finset G` and
`n : ℕ`, ordered by inclusion and the usual order. Choose witnesses with error
`1/(n+1)`. Prove `IsFoelner G Measure.count atTop (fun i ↦ (F_i : Set G))`
and that this filter is nontrivial. Conversely a nontrivial Følner filter of
finite nonempty sets satisfies all finite tests, by intersecting finitely many
eventual conditions. Include reindexing along `Tendsto`, cofinal subnet and
eventual-equality compatibility using the existing filter API.

Use `IsFoelner.amenable` to obtain an invariant `ℝ≥0∞`-valued set function,
bundle it as the normalized `AddContent` of Layer 2, and then obtain a
functional mean. Spell out the analytic content: extend the nontrivial filter
to an ultrafilter, take limits of densities in the compact interval `[0,1]`, and
pass finite sums and the boundary estimate to these limits. For finite nonempty
`F`, let `m_F(f)=|F|⁻¹ ∑_(x∈F) f(x)`, and prove the functional estimate

```text
|m_F(L_g f) - m_F(f)| ≤ ‖f‖∞ · |g⁻¹F △ F| / |F|.
```

For each fixed ultrafilter refining the Følner filter, prove that the weak-* limit
of these averaging functionals corresponds to the density-limit content formed
using that same ultrafilter. Conclude the characterization by the nontrivial
counting-measure Følner filter and its finite-test corollary.

For `[Countable G]`, prove equivalence with a sequence of finite nonempty sets
`F_n` such that, for every `g`, `|gF_n △ F_n|/|F_n| → 0`. Construct an increasing
sequence of finite test sets covering `G`, without requiring an infinite group,
and use error `1/(n+1)`. The reverse implication uses finite intersections of
eventual conditions and needs no countability. The sets `F_n` need not be nested
or exhaustive.

References: [Garrido](https://www.math.uni-duesseldorf.de/~garrido/amenable.pdf),
Definition 3.1, Definition 3.3, Lemma 3.4 and Theorem 3.6;
[BDHV](https://perso.univ-rennes1.fr/bachir.bekka/KazhdanTotal.pdf),
Theorem G.3.1 for approximate invariance and G.5.1–G.5.2 for Følner sets and
the level-set argument.

## Layer 6: integers and abelian groups

For the additive group `ℤ`, take `F_n={0,…,n}` with cardinality `n+1`. Prove
`|(k+F_n) △ F_n| ≤ 2*|k|` for every integer `k` and natural `n`, and hence that
the ratio tends to zero. Use `IsAddFoelner` and the additive counterparts of the
discrete API, or transport through `Multiplicative ℤ` with explicit compatibility
lemmas. This proves amenability of `ℤ` by Layer 5.

For a finitely generated abelian group `A`, choose finitely many generators and
construct the surjective homomorphism from a finite product of copies of `ℤ`
sending the standard generators to them. Prove the universal-property,
surjectivity and additive/multiplicative transport lemmas needed for this map.
Finite-product and quotient closure then prove amenability of `A`.

Finally, apply the directed union of finitely generated subgroups from Layer 4
to prove amenability of every abelian discrete group, with no rank or torsion
restriction. Supply the additive API for `AddCommGroup` and its multiplicative
equivalent for `CommGroup`. The one-way topology bridge of Layer 2 also
gives the corresponding abelian topological-group example.

References: [Garrido](https://www.math.uni-duesseldorf.de/~garrido/amenable.pdf),
Example 3.5 and Proposition 2.3; [BDHV](https://perso.univ-rennes1.fr/bachir.bekka/KazhdanTotal.pdf),
Example G.5.4 for the integer intervals.

## Layer 7: locally compact Hausdorff groups and Haar L∞

Assume `[LocallyCompactSpace G] [T2Space G]`, in addition to the topological-group
hypotheses, and use the Borel measurable space and a regular left Haar measure
`μ`. The canonical `Measure.haar` is an allowed choice. No sigma-compactness,
second countability or sigma-finiteness is a standing hypothesis.

Here **Haar L∞** means Mathlib's `MeasureTheory.Lp ℝ ∞ μ`: equivalence classes
modulo global Haar-almost-everywhere equality, with the essential-supremum norm.
Prove that `L_g` descends to a positive unital linear isometry on this space and
that the canonical map `UCB(G) → L∞(G,μ)` is a positive unital equivariant linear
isometry. The latter uses positivity of Haar measure on nonempty open sets to
identify the supremum and essential supremum of a continuous function.

Prove

```text
G amenable  ⟺  ∃ M : L∞(G, μ) → ℝ linear, positive, unital and left invariant.
```

Restriction along the UCB inclusion proves the reverse implication. Build the
forward implication by the following smoothing theory.

1. Prove the measurability and Fubini statements needed for convolution without
   adding sigma-finiteness of all of `G`. As connecting targets, prove that a global
   `L¹` function is zero almost everywhere outside a sigma-compact set, using
   regularity and finite-measure level sets. Put any countable collection of
   such supports into a sigma-compact open subgroup, adjoin a compact identity
   neighborhood, and justify restricted integrals and translated-coset
   calculations there. Prove agreement with ambient integrals and independence
   of the subgroup chosen. Kernels can be chosen within one such open subgroup.
   Sigma-compactness does not imply second countability. On the chosen subgroup,
   prove for the restricted Haar measure that every Borel set differs from a
   Baire set by a subset of a Baire Haar-null set, using
   [Haar completion regularity (Fremlin, *Measure Theory*, §443M)](https://www1.essex.ac.uk/maths/people/fremlin/chap44.pdf#page=29).
   Here the Baire sigma-algebra is generated by continuous real-valued functions.
   Use these representatives and null envelopes, together with compact-support
   approximation, to prove almost-everywhere strong measurability and Fubini for
   the scalar integrands. Do not assume `Borel(G × G) = Borel(G) ⊗ Borel(G)` or
   install a product-measurable multiplication instance without proving it. For
   the UCB-valued orbit integral, prove essential separability using continuity
   on sigma-compact supports.
   Prove that inversion and right translation preserve Haar-null sets. Use
   `c(g)=(MeasureTheory.Measure.modularCharacter g : ℝ)` for right translation.
   Supply the Haar pushforward and integral formulas for regular measures; where
   the existing pushforward lemma assumes `InnerRegular`, derive the `Regular`
   version from `isMulLeftInvariant_eq_smul_of_regular` and regularity under a
   homeomorphism. Do not infer global `InnerRegular` merely from `Regular`.
   Record `c(g)>0` and `c(g⁻¹)=c(g)⁻¹`, and prove continuity of `c` using a
   nonzero nonnegative compactly supported continuous test function and the
   integral transformation formula.
   Prove the inversion formula
   `μ.map Inv.inv = μ.withDensity (fun x ↦ (Measure.modularCharacter x : ℝ≥0∞))`.
   Its strictly positive finite density gives the null-set equivalence needed
   for representatives in the smoothing construction.
2. Develop `L¹` convolution, with
   `(h*k)(x)=∫ y, h(y)*k(y⁻¹*x) ∂μ` almost everywhere, its associativity and norm
   bounds, and preservation of nonnegative integral-one functions. Prove `L¹`
   continuity of translations and construct nonnegative integral-one kernels
   `h_U` supported in shrinking identity neighborhoods with `‖h*h_U-h‖₁→0` for
   every `h∈L¹`. These are nets. Use compactly supported continuous approximation.
3. For `h∈L¹(G,μ)` and `φ∈L∞(G,μ)`, construct the actual bounded continuous
   function `C_h φ(x)=∫ y, h(y)*φ(y⁻¹*x) ∂μ`. Prove independence of
   representatives, membership in UCB, `‖C_h φ‖∞≤‖h‖₁‖φ‖∞`, linearity,
   positivity when `h≥0`, and `C_h 1=(∫h)1`. Prove the mixed associativity
   identity `C_h(C_k φ)=C_(h*k) φ`, viewing `C_k φ` in L∞ by the canonical inclusion.
4. For an invariant UCB mean `m` and nonnegative integral-one `h`, prove
   `m(C_h ψ)=m(ψ)` for `ψ∈UCB`, using a Bochner integral of the norm-continuous
   translation orbit. Associativity and the preceding approximate identity give
   `m(C_h φ)=lim_U m(C_(h*h_U) φ)=lim_U m(C_(h_U) φ)`. Thus this value is
   independent of the normalized `h`. Fix one `h₀` and define
   `M(φ)=m(C_(h₀) φ)`. Prove positivity, normalization, continuity and invariance.
   For the last property, use the integral formula
   `∫f(x*g)dμ(x)=c(g)∫f dμ` from the preceding Haar pushforward target.
   Thus BDHV's convention `Δ(g)` is `c(g)⁻¹`. Prove
   `C_(h₀)(L_g φ)=C_(q_g)φ`, where
   `q_g(z)=c(g)*h₀(z*g⁻¹)` is again nonnegative of integral one.
5. Prove independence of amenability from scaling `μ` by a positive real
   constant, and compatibility of the characterization with the discrete case.

Also prove the correspondence between these L∞ means and finitely additive
probabilities on the **Borel sets** satisfying

```text
ν(gA) = ν(A),        μ(A) = 0  ⟹  ν(A) = 0.
```

Use `AddContent` on `{A | MeasurableSet A}`. Its values on nonmeasurable sets are
not part of the specification or of the equivalence: restrict to the subtype of
measurable sets, or quotient extensions by agreement there. Define
`ν(A)=M([1_A])`; conversely integrate Borel simple functions, approximate bounded
measurable representatives uniformly, and use null annihilation to descend
through almost-everywhere equality. An essentially bounded representative can
be truncated on a null set. Prove inverse laws on the specified domains,
including naturality of translations. Completion of the Haar measurable space
gives the same correspondence by extension across null sets.

[BDHV](https://perso.univ-rennes1.fr/bachir.bekka/KazhdanTotal.pdf), Theorem G.3.1
(i) and (v), is the principal reference. Its Section C.5 calls `A` locally Borel
when `A ∩ B` is Borel for every Borel `B` of finite Haar measure, and locally null
when all those intersections have measure zero. A function is locally measurable
when inverse images of Borel sets are locally Borel. The book uses functions
bounded outside a locally null set, modulo equality outside a locally null set.
This is not definitionally Mathlib's global `Lp`, and `L∞=(L¹)*` needs
measure-theoretic hypotheses not assumed here; the smoothing targets above prove
the global version directly. Prove using a countable finite-measure exhaustion
that, for sigma-finite Haar measure, locally Borel sets are Borel and locally null
sets are null. This gives agreement of the function and quotient conventions in
that case; a separate local-L∞ carrier is not a target.

As an example, let `G` be a compact Hausdorff group and `μ = TauCeti.haarProb G`,
the compact-group roadmap's Layer 0 target. By `TauCeti.haarProb_def` it is a
positive multiple of `Measure.haar`, hence a regular left Haar measure. Prove that
`M(φ)=∫ φ dμ` is a left-invariant mean on `L∞(G,μ)`, and that its restriction
along the UCB inclusion is an invariant UCB mean, so `G` is amenable. Prove that
for a finite discrete group `M` restricts to Layer 2's normalized counting. This
example concerns the given compact topology, not the underlying discrete group.

## Layer 8: Tarski's alternative for the whole discrete group

Prove for every discrete group, without countability assumptions,

```text
G amenable  ⟺  G is not paradoxical for its left regular action.
```

This is the **whole-group, left-regular-action form of Tarski's alternative**:
exactly one of an invariant finitely additive probability on all subsets and a
finite paradoxical decomposition exists. The forward implication is Layer 3. The
converse is required work, with the following proof dependencies made explicit.

1. Negating the finite-test Følner condition gives finite `K` and `ε>0` such that
   each finite nonempty `F` has some `g∈K` with
   `|gF △ F|≥ε|F|`. Put `S={1}∪K`. By the difference identity of Layer 5,
   `|SF|≥(1+ε/2)|F|`. Prove this uniformly for all finite `F`, including the
   empty set.
2. Prove iteration of this expansion and choose a natural `n` with
   `(1+ε/2)^n≥2`. Thus the finite set `D=S^n` satisfies `|DF|≥2|F|` for every
   finite `F`. Supply the finite-set multiplication and cardinality lemmas.
3. Apply the existing infinite-index Hall theorem to the neighbor sets
   `N(x,i)=D*x`, indexed by `(x,i)∈G×Fin 2`. For a finite set of indices `A`,
   its projection `F` satisfies `|A|≤2|F|≤|DF|=|⋃_(a∈A) N(a)|`.
   Obtain an injection `j : G×Fin 2 → G` with `j(x,i)∈D*x`.
4. Choose a multiplier from the finite set `D` for each value of `j`. For each
   copy `i`, its multiplier fibers give a finite equidecomposition from `G` to
   the image of `j(-,i)`. Prove the two images disjoint, convert the resulting
   subcopies to a partition by Layer 3, and obtain paradoxicality. With
   Layer 5, this proves nonamenability implies paradoxicality.

The assertion concerns the whole group, not every nonempty subset. Reference:
[Garrido](https://www.math.uni-duesseldorf.de/~garrido/amenable.pdf),
Theorem 1.11 specialized to `X=E=G`, and Theorem 1.15(iii) in discrete scope.
A proof reference for this alternative is Ceccherini-Silberstein–Grigorchuk–de la
Harpe, [*Amenability and paradoxical decompositions for pseudogroups and for
discrete metric spaces*](https://people.tamu.edu/~grigorch/publications/zCGH.pdf),
Theorem 7, specialized to the left regular action; its relative-subset clause is
outside this target. Its §III.1, Theorem 35, gives the matching method; the
one-sided Hall theorem already in Mathlib suffices for the injection used here.

## Dependencies and completion

The dependency order is `1 → 2 → 3`, `1–3 → 4`, `1–2 → 5`, `4–5 → 6`,
`1–2 + compact-group roadmap Layer 0 → 7`, and `3 + 5 → 8`. Layer 7 does not
gate the discrete layers. Every connecting construction listed in a layer is
part of that layer's completion.

The completed theory is exercised by these targets: amenability of the trivial
group and of finite groups (Layer 2), nonamenability of `F₂` and of every
discrete group containing it (Layers 3 and 4), amenability of `ℤ` and of every
abelian discrete group (Layer 6), and amenability of every compact Hausdorff group
with its given topology (Layer 7); and the transport theorems for the real/complex
mean correspondence and group isomorphisms (Layer 1), the mean–content
correspondence (Layer 2), the counting-measure Følner filter (Layer 5) and the Haar
L∞ characterization (Layer 7).

The [Lean 3 invariant-mean development in mathlib PR #16574](https://github.com/leanprover-community/mathlib3/pull/16574),
its Lean 4 successor [mathlib4 PR #7395, *Amenable monoid actions*](https://github.com/leanprover-community/mathlib4/pull/7395),
and the associated [Amenable Groups discussion](https://leanprover-community.github.io/archive/stream/113489-new-members/topic/Amenable.20Groups.html)
are predecessor sources. Neither PR was merged. Both are by the same author; the
Lean 4 PR defines amenability of a monoid action through finitely additive
invariant set functions on measurable sets, rather than through functional means
on a group. Before copying or adapting their code, coordinate with the author and
obtain agreement. If coordination is impossible, verify that the licence permits
the intended reuse and discuss the plan on Lean Zulip.

## Principal references

* Alejandra Garrido, [*An introduction to amenable groups*](https://www.math.uni-duesseldorf.de/~garrido/amenable.pdf),
  especially §§1–3. Use the explicit discrete and null-set qualifications in this
  roadmap when applying its formulations.
* Bachir Bekka, Pierre de la Harpe and Alain Valette,
  [*Kazhdan's Property (T)*](https://perso.univ-rennes1.fr/bachir.bekka/KazhdanTotal.pdf),
  Cambridge University Press, 2008, Appendix G; also Appendix A.3 for uniformity
  and Haar conventions and C.5 for L∞. Definition and theorem numbers refer to the
  linked manuscript; its page numbers differ from the published edition.
* Tullio Ceccherini-Silberstein, Rostislav Grigorchuk and Pierre de la Harpe,
  [*Amenability and paradoxical decompositions for pseudogroups and for discrete
  metric spaces*](https://people.tamu.edu/~grigorch/publications/zCGH.pdf),
  Proceedings of the Steklov Institute of Mathematics **224** (1999), 57–97,
  especially Theorems 7, 25 and 35.
