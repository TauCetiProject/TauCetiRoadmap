# Roadmap: totally distributive topoi and the infinitary exactness of sets

**Summary.** Characterize the Grothendieck topoi that share two infinitary exactness properties
of `Type u`: (A) a `u`-small product of epimorphisms is an epimorphism, and (B) `u`-small
products distribute over `u`-small coproducts. The carriers are complete lattices and frames
(`CompleteLattice L`, `Order.Frame L`), categories `E : Type v` with `[Category.{u} E]` and
`u`-small products and coproducts, the sheaf topoi `Sheaf J (Type u)` of small sites
`C : Type u`, and the topoi `Sh X` of sheaves on spaces `X : Type u` on Mathlib's
`Opens.grothendieckTopology X`. The end theorems are: on a frame, complete distributivity is the
closure of covers under arbitrary intersections, and local connectedness is complete
distributivity for disjoint families; a complete lattice is isomorphic to `LowerSet P` for a
partial order `P` exactly when every element is the join of the completely join-prime elements
below it, and a densely ordered complete chain has none; for every small site, (B) holds in
`Sheaf J (Type u)` exactly when the constant sheaf functor has a left adjoint, sheafification
has a left adjoint exactly when covering sieves are closed under `u`-small intersections, and
(A) and (B) together hold exactly when the topos is an essential subtopos of a presheaf topos,
exactly when it is totally distributive in the sense of Rosebrugh and Wood, and, on a
subcanonical site, exactly when covering sieves are closed under `u`-small intersections; for
every space `X`, `Sh X` satisfies (A) and (B) exactly when `Opens X` is completely distributive,
(B) exactly when `X` is locally connected, and is a presheaf topos exactly when every open set is
the union of the completely join-prime open sets it contains; sheaves on `[0, 1)` with the lower
topology satisfy (A) and (B), are not a presheaf topos and have no projective object but `0`;
sheaves on the Cantor space satisfy (A), not (B), and have enough projectives, and sheaves on `ℝ`
satisfy (B), not (A); and a sheaf topos is a presheaf topos exactly when it satisfies (B) and has
enough projectives.

Suggested homes: `TauCeti/Order/CompletelyDistributive/` for Layer 1 and
`TauCeti/CategoryTheory/Topos/TotallyDistributive/` for Layers 2–4.

## Scope and ownership

**Owned here.** The two exactness conditions as predicates on a category
(`ProductsPreserveEpis`, `ProductsDistribOverCoproducts`), total distributivity
(`IsTotallyDistributive`), the predicate `IsPresheafTopos`, and every theorem relating them on
sites, on spaces and on frames: completely distributive, locally connected and Alexandrov frames
(Layer 1), connected sheaves and the decomposition of a sheaf into connected components when the
constant sheaf functor has a left adjoint, with the site-level characterizations (Layer 2), the
spatial and localic forms with the counterexample and the independence of (A) and (B) (Layer 3),
and projectives (Layer 4). GrothendieckTopoi is the neighbouring owner; no other roadmap owns
these objects.

**Already in Mathlib.** A `CompletelyDistribLattice` satisfies the minimal axioms
(`CompletelyDistribLattice.MinimalAxioms.of`), and a complete lattice satisfying them carries a
`CompletelyDistribLattice` structure with the same order
(`CompletelyDistribLattice.ofMinimalAxioms`); 1.1 names these axioms and proves nothing about
them.

**Left to GrothendieckTopoi.** The predicate of a Grothendieck topos, geometric morphisms and
subtopoi (GrothendieckTopoi Layers 1–4), in particular the structure of `Sheaf J (Type u)`
(balanced, with a strict initial object, GrothendieckTopoi 1.2; disjoint and universal `u`-small
coproducts and a small separating family, the forward direction of
`isGrothendieckTopos_iff_giraudAxioms`, and every topos as sheaves on a small subcanonical site,
GrothendieckTopoi 1.4) and its global sections morphism (GrothendieckTopoi 2.3); locally
connected morphisms (GrothendieckTopoi 5.2) and
essential morphisms, with `GeometricMorphism.isEssential_iff_preservesProducts`
(GrothendieckTopoi 5.6); essential points and Roos's characterization of presheaf topoi,
`exists_equiv_presheaf_iff_essential_points`, with the presheaf instances of (A) and (B),
`epi_piMap_presheaf` and `isIso_sigma_pi_presheaf` (GrothendieckTopoi 6.5); and the canonical
site of a frame, `Frame.grothendieckTopology`, subcanonical and equal to
`Opens.grothendieckTopology X` on `Opens X` (GrothendieckTopoi 7.1). The canonical map of (B)
here is the map of `isIso_sigma_pi_presheaf`, written with `Limits.Pi.map`; this roadmap names
the two conditions as predicates and characterizes the topoi satisfying them, and states nothing
about presheaf topoi that GrothendieckTopoi 6.5 states.

**Out of scope.** Constructive complete distributivity and the forms of these statements without
the axiom of choice; lex totally distributive categories and injective topoi (Lucyshyn-Wright
2012, Theorem 1.5.3); the correspondence between essential subtopoi of a presheaf topos and
idempotent ideals of arrows (Kelly–Lawvere, as recalled in Lucyshyn-Wright 2012, Remark 1.5.6).

## Conventions

1. **Sizes.** Sites are `C : Type u` with `[SmallCategory C]`; a topos has `Category.{u}`, and
   (A), (B), complete distributivity, intersections of sieves and `IsPresheafTopos` quantify over
   index types and small categories in `Type u`. Witness: the empty family (`ι = PEmpty`) is
   allowed everywhere; in (B) both sides are then terminal, and in 1.1 both sides are `⊤`
   (1.1, Checks).
2. **The map of (B).** For `X : ∀ i, K i → E`, the map is `Sigma.desc` of the maps
   `Limits.Pi.map (fun i => Sigma.ι (X i) (k i))`, from `∐_{k : ∀ i, K i} ∏ᵢ X i (k i)` to
   `∏ᵢ ∐_{j : K i} X i j`. Witness: if one `K i₀` is empty, the source is initial and the target
   has an initial factor, so (B) says that a product with an initial factor is initial; this
   holds in `Type u` (`∅ × A = ∅`) and fails in pointed sets, where the initial object is the
   point and `{pt} × S ≅ S`.
3. **Spaces.** `Sh X` is `Sheaf (Opens.grothendieckTopology X) (Type u)`: a sieve on `U` covers
   when every point of `U` lies in one of its members. Witness: the empty sieve covers `⊥`, so
   every sheaf is a one-point set on `∅`, and `Sh PEmpty` is the category with one object
   (3.1, Checks).
4. **Lower sets.** `LowerSet P` is ordered by inclusion, its joins are unions, and the principal
   lower sets `Set.Iic p` are its completely join-prime elements (1.4). `Sh` of the space whose
   open sets are the lower sets of `P` is presheaves on `P`, with `p ⟶ q` when `p ≤ q`. Witness:
   for `P = {0 < 1}` the open sets are `∅ ⊂ {0} ⊂ P`, and a sheaf is a map `F(P) ⟶ F({0})`,
   a presheaf on the arrow `0 ⟶ 1`.
5. **Connected elements.** A connected element is not `⊥` (Layer 1, `IsConnectedElem`), as a
   connected space is not empty. Witness: in `Opens` of the two-point discrete space `{a, b}`,
   `{a}` and `{b}` are connected and `⊤ = {a} ⊔ {b}` is not (1.3, Checks).
6. **Projectives.** `Projective P` is Mathlib's: every map from `P` lifts along every
   epimorphism. `EnoughProjectives E` asks for every object a projective with an epimorphism onto
   it. Witness: in `Type u` every object is projective (choice), and the empty type is projective
   and initial.

## Exact supplier contracts

**From Mathlib** (at the pins).

- Order: `CompleteLattice`, `Order.Frame`, `CompletelyDistribLattice`,
  `CompletelyDistribLattice.MinimalAxioms`, `CompletelyDistribLattice.MinimalAxioms.of`,
  `CompletelyDistribLattice.ofMinimalAxioms`, `CompleteLinearOrder.toCompletelyDistribLattice`,
  `LowerSet`, `LowerSet.completelyDistribLattice`, `IsLowerSet`, `Set.Iic`, `Set.Iio`,
  `OrderIso`, `DenselyOrdered`, `Disjoint`, `Pairwise`, `Set.PairwiseDisjoint`.
- Topology: `TopologicalSpace.Opens`, `Topology.WithLower`, `LocallyConnectedSpace`,
  `unitInterval`, `TopologicalSpace.IsTopologicalBasis`, and for the Checks of 4.2
  `ZeroDimensionalSpace`, `LindelofSpace`, `IsClosed.isLindelof`, `IsClopen.diff`,
  `AlexandrovDiscrete`.
- Sites: `GrothendieckTopology`, `Sieve` with its complete lattice, `Sheaf`, `presheafToSheaf`,
  `constantSheaf`, `GrothendieckTopology.Subcanonical`, `Opens.grothendieckTopology`,
  `Functor.IsDenseSubsite.sheafEquiv` (`Sites/DenseSubsite`), `Sheaf.instHasColimitsOfShape`
  (`Sites/Limits`, the `u`-small coproducts of sheaves).
- Categories: `HasProducts`, `HasCoproducts`, `Limits.Pi.map`, `Sigma.desc`, `Sigma.ι`, `Epi`,
  `IsIso`, `IsInitial`, `BinaryCofan`, `pullback`, `yoneda`, `Adjunction`, `Functor.IsRightAdjoint`,
  `Functor.Full`, `Functor.Faithful`, `PreservesFiniteLimits`, `PreservesLimitsOfShape`,
  `Equivalence`, `Projective`, `EnoughProjectives`,
  `isRightAdjoint_of_preservesLimits_of_isCoseparating` (`Adjunction/AdjointFunctorTheorems`),
  `SingleObj`.

**From Tau Ceti.** Nothing is consumed.

**From GrothendieckTopoi.** 1.1 (`IsGrothendieckTopos`, satisfied by `Sheaf J (Type u)` for every
small site and by `Type u`), 1.2 (`Sheaf J (Type u)` is balanced and every morphism into an initial
object is an isomorphism), 1.4 (`isGrothendieckTopos_iff_giraudAxioms`: `u`-small coproducts in
`Sheaf J (Type u)` are disjoint and universal and it has a small separating family; every
Grothendieck topos is equivalent to `Sheaf J (Type u)` for a small subcanonical site), 2.3 (the
global sections morphism of `Sheaf J (Type u)`, with inverse image `constantSheaf`), 5.2 (for
`F = Type u`, a geometric morphism to `Type u` is locally connected exactly when the constant
functor has a left adjoint; `Sh(X)` is locally connected exactly when `X` is), 5.6
(`GeometricMorphism.IsEssential`, `GeometricMorphism.isEssential_iff_preservesProducts`), 6.5
(`exists_equiv_presheaf_iff_essential_points`, `epi_piMap_presheaf`, `isIso_sigma_pi_presheaf`), 7.1
(`Frame.grothendieckTopology`: subcanonical, and equal to `Opens.grothendieckTopology X` for
`L = Opens X`; for targets 3.1 and 3.3–3.5).

## How to read the build

Layer 1 is order theory on Mathlib alone: complete distributivity as stability of covers under
intersections, connected elements and locally connected frames, completely join-prime elements and
the frames of lower sets. Layer 2 names (A), (B), total distributivity and presheaf topoi, and
proves the site-level characterizations: (B) is local connectedness, closure of covers under
intersections is the existence of a left adjoint of sheafification, and (A) with (B) is essentiality
in a presheaf topos and total distributivity; it first decomposes sheaves into connected components,
and consumes GrothendieckTopoi 1.1, 1.2, 1.4, 2.3, 5.2, 5.6 and 6.5. Layer 3 specializes Layer 2 to
spaces through Layer 1, states the localic forms that need GrothendieckTopoi 7.1, and ends with the
counterexample on `[0, 1)` and the independence of (A) and (B). Layer 4 characterizes presheaf topoi
among sheaf topoi by (B) and projectives, through Roos's theorem.

## Layer 1: completely distributive and locally connected frames

### 1.1 Complete distributivity

Define `IsCompletelyDistributive L` for a complete lattice `L : Type u` as Mathlib's
`CompletelyDistribLattice.MinimalAxioms L`: for all `ι : Type u`, `κ : ι → Type u` and
`f : ∀ i, κ i → L`, `⨅ i, ⨆ j, f i j = ⨆ g : (∀ i, κ i), ⨅ i, f i (g i)`. The passage to and
from the class `CompletelyDistribLattice` is Mathlib's (Scope); index types in `Type u` suffice,
since any family of elements of `L` can be reindexed by a subset of `L`. Complete chains and the
lattices `LowerSet P` are completely distributive (Mathlib's instances; Raney 1952, Theorem 1,
p. 678, for the equivalence of the two forms of complete distributivity, meets over joins and
joins over meets).
*Needs:* Mathlib `CompletelyDistribLattice.MinimalAxioms`, `CompletelyDistribLattice`,
`CompleteLinearOrder.toCompletelyDistribLattice`, `LowerSet.completelyDistribLattice`.

**Checks.**

- Empty families: for `ι = PEmpty` both sides are `⊤` (one choice function, empty meet); if one
  `κ i` is empty both sides are `⊥`. A definition with nonempty index types would agree on
  nonempty families and lose the unit laws.
- `Opens ℝ` is not completely distributive: with `ι = ℕ`, `κ i = ℤ` and
  `f n k = (k/(2n + 2), k/(2n + 2) + 1/(n + 1))`, each `⨆ k, f n k` is `ℝ`, so the left side is
  `ℝ`, while each `⨅ n, f n (g n)` is the interior of an intersection of intervals of lengths
  `1/(n + 1)`, which is `∅`. Finite distributivity holds in `Opens ℝ`, so a definition with
  finite `ι` would not see this.
- The chain `unitInterval` is completely distributive (a complete linear order): for
  `f i j ∈ [0, 1]` and `d < ⨅ i, ⨆ j, f i j`, choosing `g i` with `f i (g i) > d` gives
  `⨅ i, f i (g i) ≥ d`.

### 1.2 Covers and intersections

Prove `isCompletelyDistributive_iff_le_sSup_iInter`: `L` is completely distributive exactly when,
for every `a : L` and every family `S : ι → Set L` (`ι : Type u`) of lower sets with
`a ≤ sSup (S i)` for each `i`, also `a ≤ sSup (⋂ i, S i)`. Route: for `⇒`, write
`sSup (S i) = ⨆ x : S i, x` and apply 1.1, each `⨅ i, g i` lying in every `S i` since these are
lower sets; for `⇐`, apply the condition to `a = ⨅ i, ⨆ j, f i j` and the lower closures of the
`f i ·`: an element of the intersection lies below some `f i (g i)` for every `i`, by choice.
*Needs:* 1.1; Mathlib `IsLowerSet`.

**Checks.**

- In `Opens ℝ`, with the family of 1.1, `S n` the lower closure of `{f n k | k : ℤ}`: each `S n`
  covers `ℝ`, and an open set in every `S n` lies in an interval of length `1/(n + 1)` for each
  `n`, so it is `∅` and `sSup (⋂ n, S n) = ∅`.
- The lower-set hypothesis is needed even in a chain: in `unitInterval`, `S 0 = {1}` and
  `S 1 = Set.Ioo (1/2) 1` both have supremum `1`, and their intersection is empty.
- For `ι = PEmpty` the intersection is `Set.univ`, whose supremum `⊤` is above every `a`.

### 1.3 Connected elements and locally connected frames

Define `IsConnectedElem a` in a frame (`a ≠ ⊥`, and `b ⊔ c = a` with `Disjoint b c` forces
`b = ⊥` or `c = ⊥`) and `IsLocallyConnected L` (every `a` is the `sSup` of the connected elements
below it). Prove `isLocallyConnected_iff`: `L` is locally connected exactly when the equation of
1.1 holds for every family whose `f i ·` are pairwise disjoint. Route: for `⇒`, a connected
`b ≤ ⨆ j, f i j` is the disjoint join of the `b ⊓ f i j`, so `b ≤ f i j` for exactly one `j`, and
`b ≤ ⨅ i, f i (g i)` for the resulting `g`; for `⇐`, index all disjoint decompositions of `b`,
apply the equation to them, and check that each nonzero meet e(g) of the common refinement is
connected (a splitting e(g) = c₁ ⊔ c₂, together with the other meets e(h), is a decomposition,
and e(g) lies below its member chosen by g). Prove also that a completely distributive frame is
locally connected (the case of disjoint families of 1.1).
*Needs:* 1.1; Mathlib `Order.Frame`, `Disjoint`, `Pairwise`.

**Checks.**

- In `Opens` of the two-point discrete space `{a, b}`, the connected elements are `{a}` and
  `{b}`; `⊤ = {a} ⊔ {b}` is not connected, and the frame is locally connected.
- `Opens ℝ` is locally connected (open intervals are connected) and not completely distributive
  (1.1, Checks): the disjointness hypothesis cannot be dropped from `isLocallyConnected_iff`.
- `Opens (ℕ → Bool)` (the Cantor space) has no connected element: a nonempty open `U` contains a
  cylinder `C = C₀ ⊔ C₁` (two nonempty clopen halves), and `U = C₀ ⊔ (U \ C₀)` with
  `U \ C₀ ⊇ C₁` open and nonempty. The `sSup` of the connected elements below `⊤` is `⊥ ≠ ⊤`, so
  it is not locally connected.

### 1.4 Completely join-prime elements and frames of lower sets

Define `IsCompletelySupPrime a`: `a ≤ sSup s` implies `a ≤ b` for some `b ∈ s`. Prove
`nonempty_orderIso_lowerSet_iff`: a complete lattice `L : Type u` is order-isomorphic to
`LowerSet P` for some partial order `P : Type u` exactly when every `a` is the `sSup` of the
completely join-prime elements below it. Route: in `LowerSet P` the completely join-prime
elements are the `Set.Iic p`, and every lower set is the union of those it contains; conversely
`P` is the subtype of completely join-prime elements and `a ↦ {p | p ≤ a}` is the isomorphism.
This is Raney's theorem (Raney 1952, Theorem 2, p. 678, stated for complete rings of sets; his
"completely join-irreducible", Definition 5, p. 678, is the completely join-prime condition
here; proof in §4, pp. 679–680). Prove
`not_isCompletelySupPrime`: a densely ordered complete linear order has no completely join-prime
element, since `a = sSup (Set.Iio a)` for `a ≠ ⊥` and `⊥ ≤ sSup ∅`.
*Needs:* 1.1; Mathlib `LowerSet`, `OrderIso`, `DenselyOrdered`.

**Checks.**

- `⊥` is never completely join-prime (take `s = ∅`). The finite form
  `a ≤ b ⊔ c → a ≤ b ∨ a ≤ c` holds for every element of a chain, `1` of `unitInterval`
  included, while `1 = sSup (Set.Iio 1)` lies below no element of `Set.Iio 1`: the definition
  sees infinite joins.
- In the four-element Boolean algebra `Bool × Bool`, the completely join-prime elements are the
  atoms `(true, false)` and `(false, true)`; `⊤` is not (`⊤ = (true, false) ⊔ (false, true)`),
  and the lattice is `LowerSet` of the two-element antichain.
- `unitInterval` is completely distributive and has no completely join-prime element, so it is
  not isomorphic to any `LowerSet P` (Raney 1952, §5, p. 680).

### Examples

- `LowerSet P` for every partial order `P`, `Set α` (lower sets of the discrete order), and every
  complete chain are completely distributive, hence locally connected.
- `Opens ℝ` is locally connected and not completely distributive; `Opens (ℕ → Bool)` is neither.

### Dependencies

Mathlib only. Within the layer, 1.2–1.4 use 1.1.

## Layer 2: the two exactness conditions on a topos

### 2.1 The predicates

Define, for `E : Type v` with `[Category.{u} E]`, `[HasProducts.{u} E]` and (for (B))
`[HasCoproducts.{u} E]`: `ProductsPreserveEpis E` (condition (A): for `f : ∀ i, X i ⟶ Y i` with
`ι : Type u` and every `f i` an epimorphism, `Limits.Pi.map f` is an epimorphism);
`ProductsDistribOverCoproducts E` (condition (B): the map of Convention 2 is an isomorphism);
`IsTotallyDistributive E` (Rosebrugh–Wood, as recalled in Lucyshyn-Wright 2012, §1.1: a functor
`c : (Eᵒᵖ ⥤ Type u) ⥤ E` with `c ⊣ yoneda` and `c.IsRightAdjoint`); and `IsPresheafTopos E`
(`E ≌ (Dᵒᵖ ⥤ Type u)` for some small category `D : Type u`). GrothendieckTopoi 6.5 states (A)
and (B) for every presheaf topos.
*Needs:* GrothendieckTopoi 6.5; Mathlib `HasProducts`, `HasCoproducts`, `Limits.Pi.map`,
`Sigma.desc`, `Sigma.ι`, `Epi`, `IsIso`, `yoneda`, `Functor.IsRightAdjoint`, `Equivalence`.

**Checks.**

- (B) in `Type u` for `ι = Fin 2` and `K i = Fin 3`: the source is a coproduct over the nine
  maps `Fin 2 → Fin 3` of products of two sets, the target a product of two coproducts of three
  sets, both with `9 · |A|²` elements when every `X i j = A`. In `AddCommGrpCat` (B) fails: for
  `X i j = ℤ`, the source `⨁_{9} ℤ²` has rank 18 and the target `(ℤ³)²` rank 6.
- (B) is infinitary: in `Type u`, for `ι = ℕ`, `K i = Bool` and `X i j = PUnit`, both sides
  are `ℕ → Bool` and the map is the identity; on the Cantor space the same family breaks (B)
  (2.2, Checks), while every topos satisfies (B) for finite `ι` and finite `K i`.
- `IsPresheafTopos (Type u)` with `D = PUnit`; the category with one object and one morphism is a
  presheaf topos with `D` empty; `AddCommGrpCat` satisfies (A) and is not a presheaf topos of
  sets, since its initial and terminal objects coincide while in `Dᵒᵖ ⥤ Type u` the terminal
  presheaf is initial only for `D` empty.

### 2.2 Connected sheaves; (B) is local connectedness

Define a connected sheaf, for a small site: a sheaf `Q` that is not initial and such that, for
every binary coproduct `A ⟶ Q ⟵ B` (a colimiting `BinaryCofan`), `A` or `B` is initial. Prove:

- *decomposition*: when `constantSheaf J (Type u)` has a left adjoint `π₀`, with unit
  `η : F ⟶ Δ(π₀ F)`, every sheaf `F` is the coproduct over `x : π₀ F` of the connected sheaves
  `F_x`, the pullbacks of `η` along the coprojections `⊤ ⟶ Δ(π₀ F) ≅ ∐_{π₀ F} ⊤`;
- *maps out of a connected sheaf*: for a connected `Q`, `Hom(Q, −)` preserves
  `u`-small coproducts.

Route: universality of coproducts gives `F ≅ ∐ₓ F_x`; `π₀` preserves coproducts and the transpose
of `η` under `π₀ ⊣ Δ` is the identity, so `π₀` of each pullback projection `F_x ⟶ F` is constant
at `x`, and `π₀ F ≅ ∐ₓ π₀ F_x` makes each `π₀ F_x` a point; a decomposition `F_x ≅ A ⨿ B` gives
`π₀ A ⨿ π₀ B = 1`, and `π₀ A = ∅` makes `A ⟶ Δ ∅`, a map into an initial object, an
isomorphism. A map `Q ⟶ ∐ⱼ Xⱼ` pulls the coproduct back to `Q ≅ ∐ⱼ Qⱼ`, disjoint; connectedness
leaves one `Qⱼ` not initial, through which the map factors, uniquely by disjointness.

Prove `productsDistribOverCoproducts_sheaf_iff`: for a small site, `Sheaf J (Type u)` satisfies
(B) exactly when `constantSheaf J (Type u)` has a left adjoint. Route: for `⇒`, (B) with all
`X i j` terminal says that the constant sheaf functor preserves `u`-small products; it preserves
finite limits, hence all `u`-small limits, and GrothendieckTopoi 5.6
(`GeometricMorphism.isEssential_iff_preservesProducts`, for the global sections morphism of
GrothendieckTopoi 2.3) gives the left adjoint; for `⇐`, the connected components of the members of
a small separating family form a small separating family of connected sheaves `Q`, and `Hom(Q, −)`
preserves products and coproducts, so it carries the map of (B) to the bijection of `Type u`; a
map inverted by every `Hom(Q, −)` is a monomorphism and an epimorphism, hence an isomorphism. By
GrothendieckTopoi 5.2 (the case `F = Type u`) these topoi are the locally connected ones.
*Needs:* 2.1, GrothendieckTopoi 1.1, 1.2, 1.4, 2.3, 5.2, 5.6; Mathlib `constantSheaf`,
`Functor.IsRightAdjoint`, `BinaryCofan`, `pullback`, `IsInitial`.

**Checks.**

- For the trivial topology on `PUnit`, the topos is `Type u`, the left adjoint is the identity,
  the connected sheaves are the one-point types and `S ≅ ∐_{s : S} {s}`. For the empty site the
  topos has one object, which is initial: there is no connected sheaf, `π₀` sends it to `∅`, and
  the decomposition is the empty coproduct. Without "not initial" the initial object would be
  connected, and `Hom(0, −)` would not preserve the empty coproduct (`Hom(0, 0)` is a point).
- In `Sh ℝ`, `Δ Bool = ⊤ ⨿ ⊤` with both summands connected (`ℝ` is connected). In
  `Sh (ℕ → Bool)` the constant sheaf functor has no left adjoint (below), and `⊤` is not a
  coproduct of connected sheaves: its summands would be open sets, and no open set of the Cantor
  space is connected (1.3, Checks). The hypothesis that `π₀` exists is needed.
- For a space `X`, (B) for `Sh X` is local connectedness of `X` (3.2): it holds for `ℝ` and fails
  for the Cantor space, where `∏ₙ` of the constant sheaf `Bool` has the identity of `ℕ → Bool` as
  a global section, which is not locally constant, while the coproduct over `ℕ → Bool` of copies
  of the terminal sheaf has only locally constant global sections.
- The condition is on the constant sheaf functor, not on global sections: global sections are a
  right adjoint in every topos and preserve all products, on the Cantor space included, while the
  constant sheaf functor does not preserve `∏ₙ Bool` there.

### 2.3 Essential sheafification and intersections of covers

Prove `isRightAdjoint_presheafToSheaf_iff`: for a small site, `presheafToSheaf J (Type u)` has a
left adjoint exactly when, for every `c : C`, the `J`-covering sieves of `c` are closed under
`u`-small intersections (`⨅ i, S i ∈ J c`). Route: for `⇐`, the plus construction
`F⁺(c) = colim_{S ∈ J c} Hom(S, F)` commutes with `u`-small products, since a family of
representatives on sieves `S i` restricts to `⨅ i, S i ∈ J c` (choice) and two families equal on
each factor are equal on the intersection; sheafification `(−)⁺⁺` is then left exact and
preserves products, hence all `u`-small limits, and the special adjoint functor theorem
(`isRightAdjoint_of_preservesLimits_of_isCoseparating`) applies on the presheaf topos; for `⇒`,
sheafification preserves the wide pullback of the `S i ⟶ yoneda.obj c`, whose sheafifications are
isomorphisms.
*Needs:* 2.1; Mathlib `presheafToSheaf`, `Sieve`,
`isRightAdjoint_of_preservesLimits_of_isCoseparating`.

**Checks.**

- For the coarsest topology (only maximal sieves cover), the condition holds and
  `presheafToSheaf` is an equivalence.
- For `Opens.grothendieckTopology ℝ`, the sieves `S n` of 1.2 cover `ℝ` and their intersection
  is the sieve of `∅`, which does not cover: sheafification on `ℝ` has no left adjoint.
- On `SingleObj (Multiplicative ℕ)` (one object, endomorphism monoid `(ℕ, +)`), the sieves are
  `∅` and the ideals `{m | m ≥ n}`; the nonempty sieves form a topology, the ideals `{m ≥ n}` all
  cover and their intersection `∅` does not, so this sheafification has no left adjoint either.

### 2.4 (A) and (B): covers, essential subtopoi

Prove `productsPreserveEpis_and_distrib_iff`: on a subcanonical small site, `Sheaf J (Type u)`
satisfies (A) and (B) exactly when the covering sieves of every object are closed under
`u`-small intersections. Route: for `⇐`, 2.3 makes the topos an essential subtopos of
`Cᵒᵖ ⥤ Type u` with inclusion `i`, and `i_! ⊣ i^* ⊣ i_*` with `i_*` fully faithful makes `i_!`
fully faithful; (A) and (B) hold in the presheaf topos (GrothendieckTopoi 6.5) and `i^*`
preserves products, coproducts and epimorphisms, so `∏ f i ≅ i^*(∏ i_! f i)` and the map of (B)
is `i^*` of the presheaf map; for `⇒`, given covering sieves `S i` on `c`, (A) makes
`∏ᵢ (∐_{s ∈ S i} yoneda s) ⟶ ∏ᵢ c` an epimorphism, (B) rewrites its source as a coproduct over
choice functions `φ` of products, pulling back along the diagonal of `c` gives an epimorphism
onto `c` from the wide pullbacks `P_φ` of the `φ i`, and covering each `P_φ` by representables
gives maps into `c` that lie in every `S i`, because on a subcanonical site the Yoneda embedding
into sheaves is fully faithful and `J`-covering means jointly epimorphic in the topos. Prove
`productsPreserveEpis_and_distrib_iff_exists_essential`: for every small site, (A) and (B) hold
exactly when there are a small category `D`, a fully faithful `i` from the topos to
`Dᵒᵖ ⥤ Type u` and a left adjoint `r ⊣ i` preserving finite limits and having a left adjoint.
Route: `⇐` as above; for `⇒`, the topos is sheaves on a small subcanonical site
(GrothendieckTopoi 1.4, through a small full separating subcategory with the induced topology and
Mathlib's `Functor.IsDenseSubsite.sheafEquiv`), and the first statement with 2.3 applies there.
*Needs:* 2.1, 2.3, GrothendieckTopoi 1.4, 6.5; Mathlib `GrothendieckTopology.Subcanonical`,
`Functor.IsDenseSubsite.sheafEquiv`, `Functor.Full`, `Functor.Faithful`, `PreservesFiniteLimits`.

**Checks.**

- The subcanonical hypothesis is needed in the first statement: on
  `SingleObj (Multiplicative ℕ)` with the
  topology of 2.3, Checks, a presheaf is a set with an endomorphism `T`, the sheaf condition for
  `{m ≥ n}` says that `T^n` is bijective, and the sheaves are the sets with an automorphism,
  presheaves on `SingleObj ℤ`, which satisfy (A) and (B), while the covering ideals `{m ≥ n}`
  have empty intersection. The representable `ℕ` with `T = (· + 1)` is not a sheaf.
- `Opens.grothendieckTopology ℝ` (subcanonical): intersections fail (2.3, Checks) and (A) fails
  (3.6).
- `Sh LowerIco` (3.5): every covering sieve of `[0, a)` contains every `[0, b)` with `b < a`,
  so intersections of covering sieves cover, and the topos is an essential subtopos of presheaves
  on the chain `Opens LowerIco` without being a presheaf topos (3.5).

### 2.5 Total distributivity

Prove `isTotallyDistributive_sheaf_iff`: for a small site, `Sheaf J (Type u)` is totally
distributive exactly when it satisfies (A) and (B). Route: a Grothendieck topos has a small
dense generator, and the totally distributive categories with a small dense generator are
exactly the essential subtopoi of presheaf topoi (Lucyshyn-Wright 2012, Theorem 1.5.5, proved
through Propositions 5.1 and 5.3); combine with 2.4. A direct proof of `⇒`: `c` preserves
limits and `c ∘ yoneda ≅ 𝟭`; (B) follows from distributivity in presheaves on the topos, and (A)
from `c` of the sieve generated by `f i` being the image of `f i`, the product of these sieves
being, by choice, the sieve generated by `∏ f i`.
*Needs:* 2.1, 2.4; Mathlib `yoneda`, `Adjunction`.

**Checks.**

- `Type u` is totally distributive (it satisfies (A) and (B)); `c`, the colimit over the
  elements of a presheaf `F` on `Type u`, is `F(PUnit)`.
- `Sh ℝ` is not totally distributive, since (A) fails (3.6); `Sh LowerIco` is (3.5), without
  being a presheaf topos.
- Totally distributive is stronger than total: `Sh ℝ` is total (`c` exists: the Grothendieck
  topoi are the lex total categories with a small set of generators, Lucyshyn-Wright 2012, §1.1,
  after Street and Walters) and `c` has no left adjoint there.

### Examples

- Presheaf topoi satisfy (A) and (B) (GrothendieckTopoi 6.5) and are totally distributive
  (Lucyshyn-Wright 2012, Proposition 2.2).
- `Sh LowerIco` (3.5) is totally distributive and not a presheaf topos.

### Dependencies

Layer 1 is not used; GrothendieckTopoi 1.1, 1.2, 1.4, 2.3, 5.2, 5.6 and 6.5, and Mathlib. Within
the layer, 2.2–2.5 use 2.1, 2.4 uses 2.3, and 2.5 uses 2.4.

## Layer 3: spaces, frames, the counterexample and independence

### 3.1 Sheaves on a space: (A) and (B)

Define `Sh X` (Convention 3). Prove `productsPreserveEpis_and_distrib_sh_iff`: `Sh X` satisfies
(A) and (B) exactly when `Opens X` is completely distributive. Route: the site of open sets is
subcanonical (GrothendieckTopoi 7.1, `Opens.grothendieckTopology X` being
`Frame.grothendieckTopology (Opens X)`); a sieve on `U` covers exactly when the lower set of its
members has supremum `U`, so 2.4 and 1.2 give the equivalence.
*Needs:* 1.2, 2.4, GrothendieckTopoi 7.1; Mathlib `Opens.grothendieckTopology`.

**Checks.**

- `X = PEmpty`: `Opens X` has one element and is completely distributive, and `Sh X` has one
  object (Convention 3) and satisfies (A) and (B).
- `X = ℝ`: neither side holds (1.1, Checks; 3.6).
- `X` discrete: `Opens X = Set X` is completely distributive and `Sh X ≌ (X → Type u)`
  satisfies (A) and (B) pointwise.

### 3.2 Sheaves on a space: (B)

Prove `productsDistribOverCoproducts_sh_iff`: `Sh X` satisfies (B) exactly when `X` is locally
connected. Route: 2.2 and GrothendieckTopoi 5.2 (`Sh(X)` is locally connected exactly when `X`
is); equivalently, connected elements of `Opens X` are the nonempty connected open sets and 1.3
applies. Hence `Sh ℝ` satisfies (B), by Mathlib's `LocallyConnectedSpace ℝ`.
*Needs:* 2.2, GrothendieckTopoi 5.2; Mathlib `LocallyConnectedSpace`.

**Checks.**

- `ℝ` and every discrete space satisfy (B).
- The Cantor space `ℕ → Bool` does not (1.3, Checks; 2.2, Checks).
- `ℚ` does not: its connected open sets are empty.

### 3.3 Sheaves on a space: presheaf topoi

Prove `isPresheafTopos_sh_iff`: `Sh X` is a presheaf topos exactly when every open set is the
union of the completely join-prime open sets it contains. Route: for `⇒`, the representables
are connected (2.2) projective objects that separate; each is covered by open sets, the cover splits
and, being connected, factors through one of them, so it is an open set, and connected and
projective it is completely join-prime; for `⇐`, 1.4 gives `Opens X ≃o LowerSet P` and the
dense subsite of principal lower sets carries the topology with only maximal covering sieves
(Mathlib's `Functor.IsDenseSubsite.sheafEquiv`), so `Sh X` is presheaves on `P`.
*Needs:* 1.4, 2.1, 2.2, GrothendieckTopoi 7.1 (open sets are sheaves); Mathlib
`Functor.IsDenseSubsite.sheafEquiv`, `Projective`.

**Checks.**

- A finite `T0` space: the smallest open neighbourhood of each point is completely join-prime and
  every open set is their union, so `Sh X` is presheaves on the specialization order; for the
  Sierpiński space this is the arrow category of Convention 4.
- `ℝ`: no nonempty open set is completely join-prime (`(a, b)` is the union of the
  `(a + ε, b − ε)`), so `Sh ℝ` is not a presheaf topos.
- `X = PEmpty`: the only open set is `∅ = sSup ∅`, and `Sh X` is presheaves on the empty
  category.

### 3.4 The localic forms

For a frame `L` and `Sh(L) = Sheaf (Frame.grothendieckTopology L) (Type u)`
(GrothendieckTopoi 7.1), prove: `Sh(L)` satisfies (A) and (B) exactly when `L` is completely
distributive, exactly when the inclusion of `Sh(L)` into presheaves on `L` is essential; `Sh(L)`
satisfies (B) exactly when `L` is locally connected; and `Sh(L)` is a presheaf topos exactly
when every element of `L` is the join of the completely join-prime elements below it, that is,
when `L` is isomorphic to some `LowerSet P` (1.4). Route: the proofs of 3.1–3.3 with
`Frame.grothendieckTopology` in place of `Opens.grothendieckTopology`; for (B), the subterminal
connected sheaves (2.2) are the connected elements of `L`, so 1.3 applies.
*Needs:* 1.2, 1.3, 1.4, 2.2–2.4, GrothendieckTopoi 7.1.

**Checks.**

- `L = unitInterval`: completely distributive, no completely join-prime element; `Sh(L)` is
  `Sh LowerIco` (3.5).
- `L = LowerSet P`: `Sh(L)` is presheaves on `P` (Convention 4).
- The two-element frame: `Sh(L) ≌ Type u`, with `⊤` completely join-prime.

### 3.5 The counterexample

Define `LowerIco`, the interval `Set.Ico (0 : ℝ) 1` with the lower topology
(`Topology.WithLower`): its open sets are the `[0, a)` for `0 ≤ a ≤ 1`, so `Opens LowerIco` is
the complete chain `[0, 1]`. Prove `productsPreserveEpis_and_distrib_sh_lowerIco` (by 3.1, a
complete chain being completely distributive), `not_isPresheafTopos_sh_lowerIco` (by 3.3 and
`not_isCompletelySupPrime`, the chain being dense), and
`nonempty_isInitial_of_projective_sh_lowerIco`: a projective sheaf `P` is initial. Route for the
last: the epimorphism onto `P` from the coproduct of the `[0, c′)` over the sections `z` of `P`
on `[0, c)` and the `c′ < c` splits; a section of `P` over a nonempty `[0, v)`, connected, goes
into one summand `(c, z, c′)` with `v ≤ c′ < c`, and so does `z` itself by naturality, which
forces `c ≤ c′`.
*Needs:* 1.4, 3.1, 3.3, GrothendieckTopoi 7.1 (open sets are sheaves); Mathlib
`Topology.WithLower`, `Projective`, `IsInitial`.

**Checks.**

- The open sets: in the lower topology of a linear order the subbasic open sets are the
  `Set.Iio a`; a union of `Set.Iio aₙ` is `Set.Iio (sup aₙ)` or the whole interval, so the map
  `[0, 1] → Opens LowerIco`, `a ↦ [0, a)`, is an order isomorphism (`1 ↦ ⊤`, `0 ↦ ⊥`).
- A sheaf is a functor on the chain `(0, 1]` with `F(a) = lim_{b < a} F(b)` and a point at `0`,
  coproducts being computed pointwise on `(0, 1]`; the terminal sheaf is not projective: the
  epimorphism `∐_{c < 1} [0, c) ⟶ ⊤` has no section, a global section being in one summand.
- With the usual topology on `[0, 1)` instead, (A) fails as on `ℝ` (3.6): the lower topology is
  what makes the frame a chain.

### 3.6 Independence of (A) and (B)

Prove `productsPreserveEpis_sh_cantor` and `not_productsDistribOverCoproducts_sh_cantor`: sheaves
on the Cantor space `ℕ → Bool` satisfy (A) and not (B). Route: every cover of a clopen set has a
finite refinement by disjoint clopen sets, on which lifts glue, so a product of epimorphisms is
surjective on sections over clopen sets, which form a basis; (B) fails by 3.2. Prove
`not_productsPreserveEpis_sh_real`: sheaves on `ℝ` do not satisfy (A); they satisfy (B) by 3.2.
Route: with `U n k = (k/(2n + 2), k/(2n + 2) + 1/(n + 1))`, each `∐ₖ U n k ⟶ ⊤` is an
epimorphism, and a section of `∏ₙ ∐ₖ U n k` over a nonempty connected open set `W` puts `W`
inside an interval of length `1/(n + 1)` for every `n`, so the product has no section over any
nonempty open set and is not an epimorphism onto `⊤`.
*Needs:* 2.1, 3.2; Mathlib `LocallyConnectedSpace`.

**Checks.**

- Cantor space, (A) on a clopen set `V`: the cover of `V` by the cylinders of length `n` is finite
  and disjoint, and a lift on each cylinder glues to a lift on `V`.
- Finite products of epimorphisms are epimorphisms in every topos (`f × g` is
  `(f × 𝟙) ≫ (𝟙 × g)`, and epimorphisms are stable under pullback), so the failure on `ℝ` needs
  infinitely many factors.
- A discrete space `X`: `Sh X ≌ (X → Type u)` and a product of epimorphisms is computed pointwise,
  so (A) holds; the family of `ℝ` fails because its intervals shrink around non-isolated points.

### Examples

- Discrete spaces and finite `T0` spaces give presheaf topoi; `LowerIco` gives a totally
  distributive topos that is not one.
- (A) without (B): the Cantor space; (B) without (A): `ℝ`.

### Dependencies

Layers 1 and 2, GrothendieckTopoi 5.2 and 7.1, and Mathlib. Within the layer, 3.4 uses 3.1–3.3,
3.5 uses 3.1 and 3.3, and 3.6 uses 3.2.

## Layer 4: projective objects

### 4.1 Presheaf topoi by projectives

Prove `isPresheafTopos_sheaf_iff`: for a small site, `Sheaf J (Type u)` is a presheaf topos exactly
when it satisfies (B) and has enough projectives. Route: for `⇒`, GrothendieckTopoi 6.5 and the
representables, which are projective; for `⇐`, by 2.2 the constant sheaf functor has a left adjoint,
so every object is the coproduct of its connected components (2.2, decomposition), a coproduct
summand of a projective object is projective (coproducts are disjoint), and the connected projective
objects cover every object; each is a retract of a member of a small separating family, so a small
family of them separates, and Roos's theorem (GrothendieckTopoi 6.5,
`exists_equiv_presheaf_iff_essential_points`, through the essential points they represent)
concludes.
*Needs:* 2.1, 2.2, GrothendieckTopoi 1.1, 6.5; Mathlib `EnoughProjectives`, `Projective`.

**Checks.**

- `Type u`: (B) and enough projectives, `D = PUnit`.
- `Sh LowerIco`: (B) holds and the only projective object is initial (3.5), so there are not
  enough projectives.
- `Sh (ℕ → Bool)` has enough projectives (4.2) and not (B) (3.6).

### 4.2 Projectives without (B)

Prove that `Sh X` has enough projectives when `X : Type u` has a basis `𝔅`
(`TopologicalSpace.IsTopologicalBasis`) such that every cover of a member `U ∈ 𝔅` by open sets has
a refinement by pairwise disjoint (`Set.PairwiseDisjoint`) open sets with union `U` (own argument).
Route: for `U ∈ 𝔅` the open set `U` is projective: given an epimorphism `F ⟶ G` and a section `t`
of `G` over `U`, lift `t` on an open cover of `U`, refine that cover to a disjoint one with union
`U` and glue the restricted lifts, which are compatible since the overlaps are empty; coproducts of
projective objects are projective, and the coproduct of the members of `𝔅` over the sections of a
sheaf on them covers it. Then prove `enoughProjectives_sh_cantor`, sheaves on the Cantor space have
enough projectives, as the instance where `𝔅` is the set of clopen sets, whose covers have finite
refinements by disjoint clopen sets (3.6, route). With 3.5, neither hypothesis of 4.1 can be
dropped.
*Needs:* 3.6; Mathlib `EnoughProjectives`, `TopologicalSpace.IsTopologicalBasis`,
`Set.PairwiseDisjoint`.

**Checks.**

- The terminal sheaf on the Cantor space is projective: an epimorphism onto it has local
  sections on a cover, refined to a finite disjoint clopen partition, which glue.
- Every open set of the Cantor space is a disjoint union of countably many clopen sets (take a
  countable cover by cylinders and remove from each the earlier ones), hence projective; the
  complement of a point is not clopen and is projective.
- A Lindelöf (`LindelofSpace`) zero-dimensional (`ZeroDimensionalSpace`) space qualifies, with `𝔅`
  the clopen sets: a clopen `B` is Lindelöf (`IsClosed.isLindelof`), so an open cover of `B` is
  refined by countably many clopen sets `Bₖ`, and the `Bₖ ∖ ⋃_{j<k} Bⱼ` are clopen
  (`IsClopen.diff`), pairwise disjoint and cover `B`. Examples: `ℚ`, the Baire space `ℕ → ℕ` and
  the Sorgenfrey line, where `[0, 2)` covered by `[0, 1)` and `[1/2, 2)` is refined by `[0, 1)` and
  `[1, 2)`. None of them is locally connected, so by 3.2 and 4.1 none is a presheaf topos.
- An Alexandrov space (`AlexandrovDiscrete`) qualifies, with `𝔅` the smallest open neighbourhoods
  `Uₓ`: a member of a cover of `Uₓ` that contains `x` contains `Uₓ`, so `{Uₓ}` refines it. On the
  Sierpiński space, every open cover of `X = U_c` contains `X`.
- `ℝ` and `LowerIco` admit no such basis. In `ℝ`, a basic set containing `x` contains an interval
  `(a, b)`, covered by `(a, (a + 2b)/3)` and `((2a + b)/3, b)`; a disjoint open refinement
  partitions the connected `(a, b)`, so one member contains it and lies in neither. In `LowerIco`,
  nonempty open sets pairwise meet, so the cover of a nonempty basic set `[0, a)` by the `[0, b)`
  with `b < a` has no disjoint refinement. Both agree with 3.5 and with the next Check.
- `Sh ℝ` satisfies (B) (3.2) and is not a presheaf topos (3.3), so by 4.1 it does not have enough
  projectives.

### Examples

- Presheaf topoi are exactly the (B) topoi with enough projectives, and among them all satisfy
  (A).

### Dependencies

Layers 2 and 3, GrothendieckTopoi 1.1 and 6.5, and Mathlib. Within the layer, 4.2 uses 3.6.

## Downstream consumers

None. GrothendieckTopoi, the supplier, names this roadmap in its Scope as the owner of the
characterization of the topoi satisfying (A) and (B), and consumes nothing from it.

## Research context

In his 1973 lectures on topoi at Buffalo, Grothendieck asked whether the presheaf topoi are
exactly the topoi with the infinitary exactness properties of sets, products of epimorphisms
being epimorphisms and products distributing over sums, and later in the course whether these
were the topoi he then called essential, at least with generators (recording, video 2 of the
topos course: https://www.youtube.com/watch?v=PqCQM3Pcl6Q&t=5182s at 1:26:22, and
https://www.youtube.com/watch?v=PqCQM3Pcl6Q&t=27083s at 7:31:23). The answer here is negative
(3.5), and the class the two conditions define is that of the essential subtopoi of presheaf
topoi (2.4), which are the totally distributive Grothendieck topoi by Lucyshyn-Wright's theorem
(2.5). His word "essential" is not the essential geometric morphism of later usage.

The statements are classical in spirit and their parts have authors: total distributivity is
Rosebrugh and Wood's, the identification with essential subtopoi of presheaf topoi is
Lucyshyn-Wright's, complete distributivity and the representation by sets are Raney's, and the
characterization of presheaf topoi by essential points is Roos's. The site-level equivalences of
2.3–2.4 and the localic forms of 3.4 are stated here with proofs; whether they are stated in the
literature, for instance by Kelly and Lawvere, is not settled by the sources cited. Constructive
versions, and whether (B) with an arbitrary isomorphism in place of the canonical map suffices,
are not addressed here.

## References

- [Lucyshyn-Wright 2012] R. B. B. Lucyshyn-Wright, « Totally distributive toposes », *Journal of
  Pure and Applied Algebra* 216 (2012), 2425–2431. doi:10.1016/j.jpaa.2012.03.018; arXiv:1108.4032.
  The locators follow the numbering of arXiv:1108.4032v3: §1.1 (total and totally distributive
  categories after Rosebrugh–Wood; the Grothendieck topoi as lex total categories with a small set
  of generators), §1.5 (every Grothendieck topos has a small dense generator), Proposition 2.2
  (presheaf topoi), Theorem 1.5.3, Theorem 1.5.5 (proved by Propositions 5.1 and 5.3), Remark 1.5.6.
- [Raney 1952] G. N. Raney, « Completely distributive complete lattices », *Proceedings of the
  American Mathematical Society* 3 (1952), 677–680. doi:10.2307/2032165; Zbl 0049.30304.
  Theorem 1 (p. 678, equivalent forms of complete distributivity), Definition 5 (p. 678,
  completely join-irreducible elements), Theorem 2 (p. 678, complete rings of sets, with no
  distributivity hypothesis; proof in §4, pp. 679–680), §5 (p. 680, the unit interval).
- [GrothendieckTopoi] The Tau Ceti roadmap GrothendieckTopoi, §§1.1, 1.2, 1.4, 2.3, 5.2, 5.6, 6.5,
  7.1, and its references for SGA 4, Exposé IV, Exercice 7.6 (essential morphisms and Roos's
  theorem).
- [Buffalo 1973] A. Grothendieck, lectures on topoi, State University of New York at Buffalo,
  1973, video 2 of the topos course, https://www.youtube.com/watch?v=PqCQM3Pcl6Q, at 1:26:22 and
  7:31:23.
