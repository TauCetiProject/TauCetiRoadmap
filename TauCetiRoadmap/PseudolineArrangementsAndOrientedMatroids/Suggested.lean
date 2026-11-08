module

public import Mathlib
public import TauCeti.GroupTheory.Coxeter.Geometric

/-!
# Pseudoline arrangements, oriented matroids, and combinatorial maps: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`, together with the definitions their statements need, all with real bodies on
native carriers. The API around each target, the special cases and the Checks stay in the README.

Operations whose result is a chirotope only by a theorem (realization, reorientation,
relabelling, the chirotope of an arrangement, the non-Pappus chirotope, a triangle flip) are
defined as functions `(Fin r → E) → SignType`; that they are chirotopes is a headline, stated
with `IsChirotope`. Covectors are likewise a set of sign vectors, `Chirotope.covectorsOf`, and
that this set is an `OrientedMatroid` is a headline. A wiring diagram on `n + 1` wires is a word
in `Fin n`, so that `Fin.castSucc` and `Fin.succ` name the two swapped positions.

Headlines stated here (README target, Lean name):

* 0.4, `GMap.isOrientable_orientationDoubleCover`, `GMap.isConnected_orientationDoubleCover_iff`,
  `GMap.natCard_cell_orientationDoubleCover` (on `GMap`, `GMap2`, `GMap.monodromy`,
  `GMap.residueRel`, `GMap.Cell`, `GMap.Components`, `GMap.IsConnected`, `GMap.Iso`,
  `GMap.cellNumbers`, `GMap.eulerChar`, `GMap.IsClosedSurface`, `GMap.flagGraph`,
  `GMap.IsOrientable`, `GMap.orientationDoubleCover`, the flag systems of 0.3).
* 1.4, `Chirotope.isChirotope_ofVectorsFun` (on `Chirotope`, `GP3`, `permSign`, `IsChirotope`,
  `Chirotope.ofVectorsFun`, `Chirotope.IsRealizable`).
* 1.5, `Chirotope.isChirotope_reorientFun`, `Chirotope.isChirotope_relabelFun` (on
  `Chirotope.reorientFun`, `Chirotope.relabelFun`).
* 2.2, `Chirotope.exists_orientedMatroid_covectorsOf`, `Chirotope.exists_chirotope_covectorsOf`
  (on `OrientedMatroid`,
  `SignVector.compose`, `SignVector.sep`, `Chirotope.cocircuitVec`, `Chirotope.covectorsOf`).
* 2.3, `Chirotope.three_le_ncard_walls` (on `SignVector.ConfLE`, `SignVector.IsTope`,
  `SignVector.walls`, `Chirotope.IsSimple`, `Chirotope.matroid`).
* 2.7, `Chirotope.exists_unique_circularOrder`.
* 3.3, `MonotoneArrangement.exists_chirotope_chiFun`, `MonotoneArrangement.isUniform_chiFun_iff`
  (on `MonotoneArrangement`, `MonotoneArrangement.crossX`, `MonotoneArrangement.IsSimple`,
  `MonotoneArrangement.tripleSign`, `MonotoneArrangement.chiFun`, `ltSign`, `tupleSign`,
  `Chirotope.IsUniform`).
* 3.4, `MonotoneArrangement.chiFun_ofLines` (on `MonotoneArrangement.ofLines`).
* 3.5 (i)–(ii), `MonotoneArrangement.range_signAt`, `MonotoneArrangement.isPathConnected_cell`
  (on `MonotoneArrangement.signAt`).
* 3.6, `exists_monotoneArrangement`.
* 3.8 (a), `Chirotope.exists_isFlat_ncard_eq_two` (Sylvester–Gallai for pseudolines).
* 4.2–4.3, `Wiring.reflTransGen_of_isWiringDiagram` (on `Wiring.wordProd`,
  `Wiring.IsWiringDiagram`, `Wiring.CommutationStep`, `Wiring.BraidStep`).
* 4.4, `Wiring.isSignotope_iff_exists_monotoneArrangement` (Felsner–Weil, on
  `Wiring.AtMostOneSignChange`, `Wiring.IsSignotope`).
* 4.5, `Chirotope.isChirotope_flipFun`, `Chirotope.exists_triangle_of_flipFun`,
  `Chirotope.reflTransGen_mutationStep` (on `Chirotope.flipFun`, `Chirotope.Triangle`,
  `Chirotope.MutationStep`).
* 5.3, `Chirotope.levi_enlargement` (on `Chirotope.IsExtension`).
* 6.1, `isRealizable_iff_exists_ofLines`.
* 6.3, `isChirotope_nonPappusFun`, `not_isRealizable_nonPappusFun`,
  `exists_monotoneArrangement_nonPappus` (on `pappusPoints`, `nonPappusFun`).
* 7.1, `stringCoxeterMatrix`, `cartographicGroup` (definitions, with
  `stringCoxeterMatrix_of_far` and `commute_simple_of_eq_two`).
* 7.2, `GMap.exists_monoidHom_stringCoxeterMatrix_iff` (on `GMap.isLiftable_adj`,
  `GMap.monodromyHom`, `GMap.ofMonodromyHom`).
* 7.3, `GMap.surjective_of_map_adj`, `GMap.eq_of_mem_aut_of_apply_eq`, `GMap.natCard_aut_le` (on
  `GMap.aut`).
* 7.4, `GMap.isConnected_iff_preconnected_flagGraph`.
* 7.5, `GMap.exists_iso_cosetGMap`, `GMap.nonempty_iso_cosetGMap_iff` (on `GMap.cosetGMap`).
* 8.1, `GMap.isOrientable_iff_not_isPretransitive_evenMonodromy` (on `GMap.evenMonodromy`).
* 9.1, `GMap.isRegular_iff_isPretransitive_aut`, `GMap.isRegular_iff_natCard_aut`,
  `GMap.exists_normal_iso_cosetGMap`, `GMap.nonempty_mulEquiv_aut_cosetGMap` (on
  `GMap.IsRegular`).
* 9.2, `GMap.isConnected_ofGroup_iff`, `GMap.isRegular_ofGroup`, `GMap.nonempty_iso_ofMonodromy`
  (on `GMap.ofGroup`, `GMap.monodromyGen`, `GMap.monodromyGen_mul_self`,
  `GMap.commute_monodromyGen`, `GMap.ofMonodromy`).
* 9.4, `natCard_platonicGroups`, `cellNumbers_platonic`, `isClosedSurface_isOrientable_platonic`
  (on `coxeterGMap`, `tetrahedronGMap`, `octahedronGMap`, `cubeGMap`, `icosahedronGMap`,
  `dodecahedronGMap`).
* 9.5, `center_eq_zpowers_hemiW₀`, `nonempty_mulEquiv_alternatingGroup`,
  `cellNumbers_hemiIcosahedronGMap`, `nonempty_iso_orientationDoubleCover_hemiIcosahedronGMap` (on
  `hemiW₀`, `hemiIcosahedronGMap`).
* 9.6, `card_torusGroup`, `cellNumbers_torusGMap` (on `torusInvolution`, `torusGroup`,
  `torusInvolution_involutive`, `torusGMap`).
* 10.1–10.2, `geometricRepresentationFun_cartographic_injective` (on
  `geometricRepresentationFun`).

Not stated here, with the carrier each lacks:

* 2.2, the uniqueness up to sign and the equality of ranks in BLSWZ Theorem 3.5.5; 2.4–2.6, the
  face lattice, the projective face poset and the Euler relation: they lack the rank of a covector
  and of an `OrientedMatroid`, which are not defined here.
* 3.7, 8.2, 8.4 (i)–(ii), the map of a projective arrangement and its comparisons: they lack the
  projective face poset of 2.5, which needs the rank of a covector.
* 8.3 and the skeleton clauses of 8.4 (ii), 9.4–9.6: the skeleton is a `Graph (G.Cell 0)
  (G.Cell 1)` whose connectivity and isomorphisms are GraphConnectivityAndFlows Target 1.1's,
  which are not at the pins.
* 4.2–4.3, the arrangement drawn from a wiring diagram, its simplicity, the invariance of its
  chirotope under commutations and the braid move as a legal mutation: they lack the
  piecewise-linear arrangement drawn from a word, which this file does not build.
* 5.1 (localizations), 5.4, 5.5, the poset of positions and the unmarked topological
  representation: they lack the localization of a single-element extension as a function on
  cocircuits, which this file does not build.
* 9.3, and the string C-group clauses of 9.4–9.5: there is no abstract polytope at the pins.

The inverse bijection of 7.2, the incidence of residues in 7.4, the pointed and finite-index forms
of 7.5, the two orbits of 8.1 and the types of 9.4–9.6 are API around the stated headlines; the
README keeps them.

The proof of 10.1–10.2 consumes the faithfulness of `CoxeterSystem.geometricRepresentation` for
every Coxeter system, RootSystems §1.3 (`geometric_faithfulness`), which is not at the pins.
-/

@[expose] public section

namespace TauCetiRoadmap.PseudolineArrangementsAndOrientedMatroids

open Equiv

noncomputable section

/-! ## Layer 0: sign vectors and flag systems -/

namespace SignVector

variable {E : Type*}

/-- Composition `X ∘ Y`: `X` where it is nonzero, `Y` elsewhere. -/
def compose (X Y : E → SignType) : E → SignType := fun e => if X e = 0 then Y e else X e

/-- The separation set `{e | X e ≠ 0 ∧ Y e = -X e}` of two sign vectors. -/
def sep (X Y : E → SignType) : Set E := {e | X e ≠ 0 ∧ Y e = -X e}

/-- The conformal order: `X` agrees with `Y` wherever `X` is nonzero. Not the pointwise order. -/
def ConfLE (X Y : E → SignType) : Prop := ∀ e, X e = 0 ∨ X e = Y e

end SignVector

/-- A flag system of rank `n` (Grothendieck's `n`-carte, Layer 0.3): involutions `adj i` of an
arbitrary dart type, `adj i` and `adj j` commuting when `i + 2 ≤ j`. -/
structure GMap (n : ℕ) (D : Type*) where
  /-- The involution changing the member of rank `i` of a flag. -/
  adj : Fin (n + 1) → Perm D
  /-- Each `adj i` is an involution. -/
  involutive : ∀ i, Function.Involutive (adj i)
  /-- Distant involutions commute. -/
  commute_of_far : ∀ i j : Fin (n + 1), (i : ℕ) + 2 ≤ j → Commute (adj i) (adj j)

/-- Flag systems of rank 2, the carrier of maps. -/
abbrev GMap2 (D : Type*) := GMap 2 D

namespace GMap

variable {n : ℕ} {D D' : Type*} (G : GMap n D)

/-- The monodromy group: the subgroup of `Perm D` generated by the `adj i`. -/
def monodromy : Subgroup (Perm D) := Subgroup.closure (Set.range G.adj)

/-- The `J`-residue relation: lying in one orbit of the subgroup generated by the `adj j`,
`j ∈ J`. -/
def residueRel (J : Set (Fin (n + 1))) : Setoid D :=
  MulAction.orbitRel (Subgroup.closure (G.adj '' J)) D

/-- The `i`-cells: the residues of `{j | j ≠ i}`. -/
def Cell (i : Fin (n + 1)) : Type _ := Quotient (G.residueRel {j | j ≠ i})

/-- The components: the residues of all the indices. -/
def Components : Type _ := Quotient (G.residueRel Set.univ)

/-- Connected: the monodromy group acts transitively (the empty flag system is connected). -/
def IsConnected : Prop := MulAction.IsPretransitive G.monodromy D

/-- An isomorphism of flag systems: a bijection of darts commuting with every `adj i`. -/
structure Iso (G : GMap n D) (G' : GMap n D') where
  /-- The bijection of darts. -/
  toEquiv : D ≃ D'
  /-- It commutes with every `adj i`. -/
  map_adj : ∀ i d, toEquiv (G.adj i d) = G'.adj i (toEquiv d)

/-- The numbers of `0`-, `1`- and `2`-cells (vertices, edges, faces). -/
def cellNumbers (G : GMap2 D) : ℕ × ℕ × ℕ :=
  (Nat.card (G.Cell 0), Nat.card (G.Cell 1), Nat.card (G.Cell 2))

/-- The Euler characteristic of a finite flag system of rank 2: vertices minus edges plus faces. -/
def eulerChar [Finite D] (G : GMap2 D) : ℤ :=
  Nat.card (G.Cell 0) - Nat.card (G.Cell 1) + Nat.card (G.Cell 2)

/-- The closed-surface predicate: no dart is fixed by `adj 0`, `adj 1` or `adj 2`, and
`adj 2 d ≠ adj 0 d`. -/
def IsClosedSurface (G : GMap2 D) : Prop :=
  (∀ i d, G.adj i d ≠ d) ∧ ∀ d, G.adj 2 d ≠ G.adj 0 d

/-- The flag graph: two distinct flags are adjacent when some `adj i` exchanges them. -/
def flagGraph : SimpleGraph D where
  Adj d e := d ≠ e ∧ ∃ i, G.adj i d = e
  symm := ⟨fun d e h => ⟨h.1.symm, h.2.imp fun i hi => by rw [← hi, G.involutive i d]⟩⟩
  loopless := ⟨fun _ h => h.1 rfl⟩

/-- Orientable: the flag graph is bipartite. -/
def IsOrientable : Prop := G.flagGraph.Colorable 2

/-- The orientation double cover (Layer 0.4): darts `D × Bool`, with
`adj i (d, b) = (adj i d, !b)`. -/
def orientationDoubleCover : GMap n (D × Bool) where
  adj i := (G.adj i).prodCongr (Function.Involutive.toPerm not Bool.not_not)
  involutive i p := Prod.ext (G.involutive i p.1) (Bool.not_not p.2)
  commute_of_far i j h := by
    unfold Commute SemiconjBy
    refine Equiv.ext fun p => Prod.ext ?_ rfl
    exact congrArg (fun σ : Perm D => σ p.1) (G.commute_of_far i j h).eq

/-- The orientation double cover is orientable (Layer 0.4). -/
theorem isOrientable_orientationDoubleCover : G.orientationDoubleCover.IsOrientable := sorry

/-- A nonempty flag system with no fixed dart has a connected orientation double cover exactly
when it is connected and not orientable (Layer 0.4). -/
theorem isConnected_orientationDoubleCover_iff [Nonempty D] (hfix : ∀ i d, G.adj i d ≠ d) :
    G.orientationDoubleCover.IsConnected ↔ G.IsConnected ∧ ¬ G.IsOrientable := sorry

/-- The orientation double cover of a finite closed-surface flag system doubles every cell count,
hence the Euler characteristic (Layer 0.4). -/
theorem natCard_cell_orientationDoubleCover [Finite D] (G : GMap2 D) (hS : G.IsClosedSurface)
    (i : Fin 3) : Nat.card (G.orientationDoubleCover.Cell i) = 2 * Nat.card (G.Cell i) := sorry

end GMap

/-! ## Layer 1: chirotopes -/

/-- `Equiv.Perm.sign` read in `SignType`. -/
def permSign {r : ℕ} (σ : Perm (Fin r)) : SignType := SignType.sign ((Perm.sign σ : ℤˣ) : ℤ)

/-- The three-term Grassmann–Plücker condition on three products: all zero, or both signs occur. -/
def GP3 (s t u : SignType) : Prop :=
  (s = 0 ∧ t = 0 ∧ u = 0) ∨ ((s = 1 ∨ t = 1 ∨ u = 1) ∧ (s = -1 ∨ t = -1 ∨ u = -1))

/-- A chirotope of rank `r` on `E` (BLSWZ Definition 3.5.3, in the form of Lemma 3.5.4). -/
structure Chirotope (r : ℕ) (E : Type*) where
  /-- The value on an ordered `r`-tuple. -/
  toFun : (Fin r → E) → SignType
  /-- Not identically zero. -/
  exists_ne_zero : ∃ b, toFun b ≠ 0
  /-- Zero on tuples with a repeated entry. -/
  eq_zero_of_not_injective : ∀ b, ¬ Function.Injective b → toFun b = 0
  /-- Alternating. -/
  comp_perm : ∀ (b : Fin r → E) (σ : Perm (Fin r)), toFun (b ∘ σ) = permSign σ * toFun b
  /-- The supports of nonzero values are the bases of a matroid. -/
  isBase_exchange :
    Matroid.ExchangeProperty (fun B : Set E => ∃ b, toFun b ≠ 0 ∧ Set.range b = B)
  /-- The three-term Grassmann–Plücker relations. -/
  grassmannPlucker : ∀ (x : Fin r → E) (i j : Fin r), i ≠ j → ∀ a b c d : E,
    let s := fun u v => toFun (Function.update (Function.update x i u) j v)
    GP3 (s a b * s c d) (-(s a c * s b d)) (s a d * s b c)

/-- A function on ordered `r`-tuples is a chirotope function when some chirotope has it as its
values. -/
def IsChirotope {r : ℕ} {E : Type*} (c : (Fin r → E) → SignType) : Prop :=
  ∃ χ : Chirotope r E, χ.toFun = c

namespace Chirotope

variable {r : ℕ} {E E' : Type*}

/-- A chirotope is read as its function on ordered tuples. -/
instance : CoeFun (Chirotope r E) (fun _ => (Fin r → E) → SignType) := ⟨Chirotope.toFun⟩

/-- The matroid of bases of a chirotope on a finite type. -/
def matroid [Finite E] (χ : Chirotope r E) : Matroid E :=
  Matroid.ofIsBaseOfFinite Set.finite_univ (fun B => ∃ b, χ b ≠ 0 ∧ Set.range b = B)
    (by obtain ⟨b, hb⟩ := χ.exists_ne_zero; exact ⟨_, b, hb, rfl⟩) χ.isBase_exchange
    (fun _ _ => Set.subset_univ _)

/-- Simple: every element, and every pair of distinct elements, lies in a basis (no loops and no
parallel pairs). In rank `1` this forces at most one element, in rank `0` an empty ground type. -/
def IsSimple (χ : Chirotope r E) : Prop :=
  (∀ e, ∃ b, χ b ≠ 0 ∧ e ∈ Set.range b) ∧
    ∀ e f, e ≠ f → ∃ b, χ b ≠ 0 ∧ e ∈ Set.range b ∧ f ∈ Set.range b

/-- Uniform: nonzero on every injective tuple. -/
def IsUniform (c : (Fin r → E) → SignType) : Prop := ∀ b, Function.Injective b → c b ≠ 0

/-- The function of a family of vectors: the sign of the determinant whose rows are the vectors
of the tuple. Only a linear order is needed to take signs. -/
def ofVectorsFun {𝕜 : Type*} [Field 𝕜] [LinearOrder 𝕜] (v : E → Fin r → 𝕜) :
    (Fin r → E) → SignType :=
  fun b => SignType.sign (Matrix.of fun i j => v (b i) j).det

/-- A spanning family of vectors over an ordered field has a chirotope (Layer 1.4). -/
theorem isChirotope_ofVectorsFun {𝕜 : Type*} [Field 𝕜] [LinearOrder 𝕜] [IsStrictOrderedRing 𝕜]
    (v : E → Fin r → 𝕜) (hv : Submodule.span 𝕜 (Set.range v) = ⊤) :
    IsChirotope (ofVectorsFun v) := sorry

/-- Realizable over an ordered field `𝕜`: the function of some family of vectors. -/
def IsRealizable (c : (Fin r → E) → SignType) (𝕜 : Type*) [Field 𝕜] [LinearOrder 𝕜]
    [IsStrictOrderedRing 𝕜] : Prop :=
  ∃ v : E → Fin r → 𝕜, c = ofVectorsFun v

open scoped Classical in
/-- Reorientation on `A`: one factor `-1` for each entry of the tuple lying in `A`. -/
def reorientFun (c : (Fin r → E) → SignType) (A : Set E) : (Fin r → E) → SignType :=
  fun b => (∏ i, if b i ∈ A then (-1 : SignType) else 1) * c b

/-- Relabelling along `E ≃ E'`. -/
def relabelFun (e : E ≃ E') (c : (Fin r → E) → SignType) : (Fin r → E') → SignType :=
  fun b => c (e.symm ∘ b)

/-- The reorientation of a chirotope is a chirotope (Layer 1.5). -/
theorem isChirotope_reorientFun (χ : Chirotope r E) (A : Set E) :
    IsChirotope (reorientFun χ A) := sorry

/-- The relabelling of a chirotope is a chirotope (Layer 1.5). -/
theorem isChirotope_relabelFun (e : E ≃ E') (χ : Chirotope r E) :
    IsChirotope (relabelFun e χ) := sorry

end Chirotope

/-! ## Layer 2: covectors -/

/-- An oriented matroid in covector form (BLSWZ Definition 4.1.1). -/
structure OrientedMatroid (E : Type*) where
  /-- The covectors. -/
  covectors : Set (E → SignType)
  /-- (L0) -/
  zero_mem : 0 ∈ covectors
  /-- (L1) -/
  neg_mem : ∀ X ∈ covectors, -X ∈ covectors
  /-- (L2) -/
  compose_mem : ∀ X ∈ covectors, ∀ Y ∈ covectors, SignVector.compose X Y ∈ covectors
  /-- (L3), elimination. -/
  elim : ∀ X ∈ covectors, ∀ Y ∈ covectors, ∀ e ∈ SignVector.sep X Y, ∃ Z ∈ covectors,
    Z e = 0 ∧ ∀ f ∉ SignVector.sep X Y, Z f = SignVector.compose X Y f

namespace SignVector

variable {E : Type*}

/-- A tope of a set of sign vectors: a member that is maximal for the conformal order. -/
def IsTope (L : Set (E → SignType)) (T : E → SignType) : Prop :=
  T ∈ L ∧ ∀ Y ∈ L, ConfLE T Y → Y = T

open scoped Classical in
/-- The walls of a tope: the coordinates whose negation gives another tope. -/
def walls (L : Set (E → SignType)) (T : E → SignType) : Set E :=
  {e | T e ≠ 0 ∧ IsTope L (Function.update T e (-T e))}

end SignVector

namespace Chirotope

variable {r : ℕ} {E : Type*}

/-- The cocircuit vector `e ↦ c (update x i e)`. -/
def cocircuitVec (c : (Fin r → E) → SignType) (x : Fin r → E) (i : Fin r) : E → SignType :=
  fun e => c (Function.update x i e)

/-- The covectors of a chirotope function: compositions of finite lists of cocircuit vectors and
of their negatives. -/
def covectorsOf (c : (Fin r → E) → SignType) : Set (E → SignType) :=
  {X | ∃ l : List (Bool × (Fin r → E) × Fin r),
    X = (l.map fun p => if p.1 then -cocircuitVec c p.2.1 p.2.2 else cocircuitVec c p.2.1 p.2.2
      ).foldr SignVector.compose 0}

/-- The covectors of a chirotope on a finite set form an oriented matroid (Layer 2.2; BLSWZ §3.5,
§3.7). -/
theorem exists_orientedMatroid_covectorsOf [Finite E] (χ : Chirotope r E) :
    ∃ L : OrientedMatroid E, L.covectors = covectorsOf χ := sorry

/-- Every oriented matroid on a finite set is the covector set of a chirotope (Layer 2.2; BLSWZ
Theorem 3.5.5 with Proposition 3.7.2). -/
theorem exists_chirotope_covectorsOf [Finite E] (L : OrientedMatroid E) :
    ∃ (r : ℕ) (χ : Chirotope r E), L.covectors = covectorsOf χ := sorry

/-- No bigons (Layer 2.3): in a simple rank-3 chirotope every tope has at least three walls. -/
theorem three_le_ncard_walls [Finite E] (χ : Chirotope 3 E) (hχ : χ.IsSimple)
    {T : E → SignType} (hT : SignVector.IsTope (covectorsOf χ) T) :
    3 ≤ (SignVector.walls (covectorsOf χ) T).ncard := sorry

/-- Rank 2 and cyclic orders (Layer 2.7): signed elements carry a unique circular order in which
`χ a b = 1` means that `b` lies strictly between `a` and `-a`. -/
theorem exists_unique_circularOrder [Finite E] (χ : Chirotope 2 E) (hχ : χ.IsSimple) :
    ∃! c : CircularOrder (E × ℤˣ), ∀ a b : E × ℤˣ, a.1 ≠ b.1 →
      (SignType.sign (a.2 : ℤ) * SignType.sign (b.2 : ℤ) * χ ![a.1, b.1] = 1 ↔
        @SBtw.sbtw _ c.toSBtw a b (a.1, -a.2)) := sorry

end Chirotope

/-! ## Layer 3: monotone arrangements -/

/-- The comparison sign in a linear order: `1` when `x < y`, `-1` when `y < x`, `0` when equal. -/
def ltSign {α : Type*} [LinearOrder α] (x y : α) : SignType :=
  if x < y then 1 else if y < x then -1 else 0

/-- The sign of the permutation sorting a triple of distinct elements, and `0` on a triple with a
repeated entry. -/
def tupleSign {α : Type*} [LinearOrder α] (t : Fin 3 → α) : SignType :=
  ltSign (t 0) (t 1) * ltSign (t 0) (t 2) * ltSign (t 1) (t 2)

/-- A monotone (x-monotone) arrangement of `n` pseudolines: indices increase upward at the far
left, and each pair crosses exactly once. -/
structure MonotoneArrangement (n : ℕ) where
  /-- The pseudolines, as graphs of functions. -/
  f : Fin n → ℝ → ℝ
  /-- Each pseudoline is continuous. -/
  continuous : ∀ i, Continuous (f i)
  /-- The abscissa where `i` and `j` cross. -/
  crossX : Fin n → Fin n → ℝ
  /-- The crossing abscissa is symmetric. -/
  crossX_comm : ∀ i j, crossX i j = crossX j i
  /-- The value on the diagonal is fixed, so that the data are determined by `f`. -/
  crossX_self : ∀ i, crossX i i = 0
  /-- Two pseudolines cross exactly once, at `crossX i j`, `i` below `j` on the left. -/
  cross : ∀ i j, i < j → (∀ x < crossX i j, f i x < f j x) ∧
    f i (crossX i j) = f j (crossX i j) ∧ ∀ x, crossX i j < x → f j x < f i x

namespace MonotoneArrangement

variable {n : ℕ} (A : MonotoneArrangement n)

/-- Simple: no three pseudolines through a common point. -/
def IsSimple : Prop :=
  ∀ i j k : Fin n, i < j → j < k → A.crossX i j ≠ A.crossX j k

/-- The sign vector of a point: `none` is the line at infinity, on whose positive side every point
of the plane lies, and the positive side of a pseudoline is the side below it. -/
def signAt (p : ℝ × ℝ) : Option (Fin n) → SignType
  | none => 1
  | some i => SignType.sign (A.f i p.1 - p.2)

/-- The value on the increasing enumeration `i < j < k` of `{i, j, k}`:
`sign (crossX j k - crossX i j)`. -/
def tripleSign (i j k : Fin n) : SignType :=
  SignType.sign (A.crossX (max (min i j) (min (max i j) k)) (max (max i j) k) -
    A.crossX (min (min i j) k) (max (min i j) (min (max i j) k)))

/-- The chirotope function: `sign (crossX j k - crossX i j)` on `some i, some j, some k` with
`i < j < k`, `1` on `some i, some j, none` with `i < j`, extended alternatingly (`none` is last in
`WithTop (Fin n)`). -/
def chiFun (t : Fin 3 → Option (Fin n)) : SignType :=
  tupleSign (α := WithTop (Fin n)) t *
    match t 0, t 1, t 2 with
    | some i, some j, some k => A.tripleSign i j k
    | _, _, _ => 1

/-- The arrangement chirotope is a simple chirotope (Layer 3.3). -/
theorem exists_chirotope_chiFun (hn : 2 ≤ n) :
    ∃ χ : Chirotope 3 (Option (Fin n)), ⇑χ = A.chiFun ∧ χ.IsSimple := sorry

/-- The arrangement chirotope is uniform exactly when the arrangement is simple (Layer 3.3). -/
theorem isUniform_chiFun_iff : Chirotope.IsUniform A.chiFun ↔ A.IsSimple := sorry

/-- Straight lines `y = a i * x + b i` with strictly decreasing slopes. -/
def ofLines (a b : Fin n → ℝ) (ha : StrictAnti a) : MonotoneArrangement n where
  f i x := a i * x + b i
  continuous _ := by fun_prop
  crossX i j := if i = j then 0 else (b j - b i) / (a i - a j)
  crossX_comm i j := by
    by_cases h : i = j
    · subst h; rfl
    · simp only [h, Ne.symm h, ite_false]
      rw [← neg_div_neg_eq (b i - b j), neg_sub, neg_sub]
  crossX_self i := by simp
  cross i j hij := by
    have h : 0 < a i - a j := sub_pos.2 (ha hij)
    simp only [hij.ne, ite_false]
    refine ⟨fun x hx => ?_, ?_, fun x hx => ?_⟩
    · have := (lt_div_iff₀ h).1 hx
      nlinarith
    · field_simp
      ring
    · have := (div_lt_iff₀ h).1 hx
      nlinarith

/-- The vector of `y = a x + b` is `(-1, a, b)` and that of the line at infinity is `(0, 0, 1)`:
equality, not equality up to sign (Layer 3.4). -/
theorem chiFun_ofLines (a b : Fin n → ℝ) (ha : StrictAnti a) :
    (ofLines a b ha).chiFun = Chirotope.ofVectorsFun (fun e : Option (Fin n) =>
      match e with
      | none => ![0, 0, 1]
      | some i => ![-1, a i, b i]) := sorry

/-- Cell decomposition (Layer 3.5 (i)): the sign vectors of points are the covectors with value
`1` at the line at infinity. -/
theorem range_signAt (hn : 2 ≤ n) :
    Set.range A.signAt = {X ∈ Chirotope.covectorsOf A.chiFun | X none = 1} := sorry

/-- Cell decomposition (Layer 3.5 (ii)): every nonempty cell is path-connected. -/
theorem isPathConnected_cell (X : Option (Fin n) → SignType)
    (hX : (A.signAt ⁻¹' {X}).Nonempty) : IsPathConnected (A.signAt ⁻¹' {X}) := sorry

end MonotoneArrangement

/-- Topological representation in rank 3, marked form (Layer 3.6). -/
theorem exists_monotoneArrangement {n : ℕ} (χ : Chirotope 3 (Option (Fin n)))
    (hs : χ.IsSimple) (hgen : ∀ a b : Fin n, a ≠ b → χ ![some a, some b, none] ≠ 0) :
    ∃ (σ : Perm (Fin n)) (A : MonotoneArrangement n) (R : Set (Option (Fin n))),
      Chirotope.reorientFun A.chiFun R = Chirotope.relabelFun (Equiv.optionCongr σ) χ := sorry

namespace Chirotope

variable {E : Type*}

/-- Sylvester–Gallai for pseudolines (Layer 3.8 (a)): a simple rank-3 chirotope on a finite type
has a rank-2 flat with exactly two elements. -/
theorem exists_isFlat_ncard_eq_two [Finite E] (χ : Chirotope 3 E) (hχ : χ.IsSimple) :
    ∃ F : Set E, χ.matroid.IsFlat F ∧ χ.matroid.eRk F = 2 ∧ F.ncard = 2 := sorry

end Chirotope

/-! ## Layer 4: wiring diagrams, signotopes and triangle flips -/

namespace Wiring

variable {n : ℕ}

/-- The sweep permutation of a word on `n + 1` wires; letter `i` swaps positions `i` and `i + 1`. -/
def wordProd (w : List (Fin n)) : Perm (Fin (n + 1)) :=
  (w.map fun i => Equiv.swap i.castSucc i.succ).prod

/-- A simple wiring diagram on `n + 1` wires: its letters multiply to `Fin.revPerm`, and it has
`(n + 1) n / 2` letters. -/
def IsWiringDiagram (w : List (Fin n)) : Prop :=
  wordProd w = Fin.revPerm ∧ w.length = (n + 1) * n / 2

/-- A commutation of two distant adjacent letters. -/
def CommutationStep (w w' : List (Fin n)) : Prop :=
  ∃ (u v : List (Fin n)) (i j : Fin n), ((i : ℕ) + 2 ≤ j ∨ (j : ℕ) + 2 ≤ i) ∧
    w = u ++ [i, j] ++ v ∧ w' = u ++ [j, i] ++ v

/-- A braid move `i (i + 1) i ↦ (i + 1) i (i + 1)`. -/
def BraidStep (w w' : List (Fin n)) : Prop :=
  ∃ (u v : List (Fin n)) (i j : Fin n), (j : ℕ) = i + 1 ∧
    w = u ++ [i, j, i] ++ v ∧ w' = u ++ [j, i, j] ++ v

/-- Connectivity of simple wiring diagrams under commutations and braid moves (Layer 4.3). -/
theorem reflTransGen_of_isWiringDiagram {w w' : List (Fin n)} (hw : IsWiringDiagram w)
    (hw' : IsWiringDiagram w') :
    Relation.ReflTransGen (fun u v => CommutationStep u v ∨ BraidStep u v ∨ BraidStep v u) w w' :=
  sorry

/-- At most one sign change along a list. -/
def AtMostOneSignChange (l : List SignType) : Prop :=
  (l.zip l.tail).countP (fun p => p.1 != p.2) ≤ 1

/-- A rank-3 signotope on `Fin m` (Felsner–Weil): nonzero on increasing triples, and at most one
sign change along `ijk, ijl, ikl, jkl` for each `i < j < k < l`. -/
def IsSignotope {m : ℕ} (s : Fin m → Fin m → Fin m → SignType) : Prop :=
  (∀ i j k, i < j → j < k → s i j k ≠ 0) ∧
    ∀ i j k l, i < j → j < k → k < l →
      AtMostOneSignChange [s i j k, s i j l, s i k l, s j k l]

/-- Felsner–Weil (Layer 4.4): the signotopes are exactly the restrictions to increasing triples of
pseudolines of the chirotopes of simple monotone arrangements. -/
theorem isSignotope_iff_exists_monotoneArrangement {m : ℕ}
    (s : Fin m → Fin m → Fin m → SignType) :
    IsSignotope s ↔ ∃ A : MonotoneArrangement m, A.IsSimple ∧
      ∀ i j k, i < j → j < k → s i j k = A.chiFun ![some i, some j, some k] := sorry

end Wiring

namespace Chirotope

variable {E : Type*}

open scoped Classical in
/-- The raw sign flip at `{a, b, c}`: negate the values on the tuples enumerating it. -/
def flipFun (χ : Chirotope 3 E) (a b c : E) : (Fin 3 → E) → SignType :=
  fun t => if Set.range t = {a, b, c} then -χ t else χ t

/-- A triangle of a rank-3 chirotope: a tope with exactly the three walls `a, b, c`. It is the
certificate that makes a flip legal. -/
structure Triangle (χ : Chirotope 3 E) where
  /-- The tope. -/
  tope : E → SignType
  /-- It is a tope of the covectors of `χ`. -/
  isTope : SignVector.IsTope (covectorsOf χ) tope
  /-- The first wall. -/
  a : E
  /-- The second wall. -/
  b : E
  /-- The third wall. -/
  c : E
  /-- Its walls are exactly `a, b, c`. -/
  walls_eq : SignVector.walls (covectorsOf χ) tope = {a, b, c}

/-- The flip of a uniform rank-3 chirotope at a certified triangle is a chirotope (Ringel 1956;
Roudneff–Sturmfels 1988). -/
theorem isChirotope_flipFun [Finite E] (χ : Chirotope 3 E) (hχ : IsUniform χ) (Δ : χ.Triangle) :
    IsChirotope (χ.flipFun Δ.a Δ.b Δ.c) := sorry

/-- The converse: if the flip of a uniform chirotope at three distinct elements is a chirotope,
the three elements are the walls of a triangle (Roudneff–Sturmfels 1988). -/
theorem exists_triangle_of_flipFun [Finite E] (χ : Chirotope 3 E) (hχ : IsUniform χ)
    (a b c : E) (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c) (h : IsChirotope (χ.flipFun a b c)) :
    ∃ Δ : χ.Triangle, ({Δ.a, Δ.b, Δ.c} : Set E) = {a, b, c} := sorry

/-- An edge of the flip graph: a flip at some certified triangle. -/
def MutationStep (χ χ' : Chirotope 3 E) : Prop :=
  IsUniform χ ∧ ∃ Δ : χ.Triangle, ⇑χ' = χ.flipFun Δ.a Δ.b Δ.c

/-- Ringel's theorem (Layer 4.5): uniform rank-3 chirotopes on a finite `E` are connected by legal
mutations and reorientations. -/
theorem reflTransGen_mutationStep [Finite E] (χ χ' : Chirotope 3 E) (hχ : IsUniform χ)
    (hχ' : IsUniform χ') :
    Relation.ReflTransGen
      (fun χ₁ χ₂ => MutationStep χ₁ χ₂ ∨ ∃ A, ⇑χ₂ = reorientFun χ₁ A) χ χ' := sorry

end Chirotope

/-! ## Layer 5: single-element extensions -/

namespace Chirotope

variable {r : ℕ} {E : Type*}

/-- `χ'` extends `χ` by the new element `none`. -/
def IsExtension (χ : Chirotope r E) (χ' : Chirotope r (Option E)) : Prop :=
  ∀ b : Fin r → E, χ' (some ∘ b) = χ b

/-- Levi's enlargement lemma, combinatorial form (Layer 5.3). -/
theorem levi_enlargement [Finite E] (χ : Chirotope 3 E) (Y Z : E → SignType)
    (hY : Y ∈ covectorsOf χ) (hZ : Z ∈ covectorsOf χ) (hY0 : Y ≠ 0) (hZ0 : Z ≠ 0) :
    ∃ χ' : Chirotope 3 (Option E), χ.IsExtension χ' ∧
      (∃ b, χ' b ≠ 0 ∧ none ∈ Set.range b) ∧
      (fun e => Option.elim e 0 Y) ∈ covectorsOf χ' ∧
      (fun e => Option.elim e 0 Z) ∈ covectorsOf χ' := sorry

end Chirotope

/-! ## Layer 6: stretchability -/

/-- Stretchability (Layer 6.1): a simple rank-3 chirotope with the line at infinity in general
position is realizable over `ℝ` iff, after relabelling fixing `none` and a reorientation, it is the
chirotope of an arrangement of straight lines. -/
theorem isRealizable_iff_exists_ofLines {n : ℕ} (χ : Chirotope 3 (Option (Fin n)))
    (hs : χ.IsSimple) (hgen : ∀ a b : Fin n, a ≠ b → χ ![some a, some b, none] ≠ 0) :
    Chirotope.IsRealizable χ ℝ ↔
      ∃ (σ : Perm (Fin n)) (R : Set (Option (Fin n))) (a b : Fin n → ℝ) (ha : StrictAnti a),
        Chirotope.reorientFun (MonotoneArrangement.ofLines a b ha).chiFun R =
          Chirotope.relabelFun (Equiv.optionCongr σ) χ := sorry

/-- The Pappus configuration of Layer 6.3. -/
def pappusPoints : Fin 9 → Fin 3 → ℚ :=
  ![![0, 0, 1], ![1, 0, 1], ![3, 0, 1], ![0, 1, 1], ![2, 1, 1], ![5, 1, 1],
    ![13, 2, 5], ![15, 3, 8], ![2, 1, 3]]

open scoped Classical in
/-- The non-Pappus function: the chirotope function of `pappusPoints`, except that it takes the
value `1` on `![6, 7, 8]` and the alternating values on its permutations. -/
def nonPappusFun (t : Fin 3 → Fin 9) : SignType :=
  if Set.range t = {6, 7, 8} then tupleSign t else Chirotope.ofVectorsFun pappusPoints t

/-- The non-Pappus function is a chirotope (Layer 6.3). -/
theorem isChirotope_nonPappusFun : IsChirotope nonPappusFun := sorry

/-- The non-Pappus chirotope is realizable over no ordered field (Layer 6.3, from Pappus). -/
theorem not_isRealizable_nonPappusFun (𝕜 : Type*) [Field 𝕜] [LinearOrder 𝕜]
    [IsStrictOrderedRing 𝕜] : ¬ Chirotope.IsRealizable nonPappusFun 𝕜 := sorry

/-- A non-stretchable arrangement (Layer 6.3): some monotone arrangement of nine pseudolines has,
with the line at infinity deleted, a chirotope isomorphic to the non-Pappus chirotope. -/
theorem exists_monotoneArrangement_nonPappus :
    ∃ (A : MonotoneArrangement 9) (σ : Perm (Fin 9)) (R : Set (Fin 9)),
      (fun t : Fin 3 → Fin 9 => A.chiFun (some ∘ t)) =
        Chirotope.reorientFun (Chirotope.relabelFun σ nonPappusFun) R := sorry

/-! ## Layer 7: the cartographic group -/

/-- The string Coxeter matrix with `M i (i + 1) = p i` (`0` meaning `∞`) and `2` between
non-adjacent generators. -/
def stringCoxeterMatrix (n : ℕ) (p : Fin n → ℕ) (hp : ∀ i, p i ≠ 1) :
    CoxeterMatrix (Fin (n + 1)) where
  M := Matrix.of fun i j =>
    if i = j then 1
    else if h : (i : ℕ) + 1 = j then p ⟨i, by have := j.isLt; omega⟩
    else if h' : (j : ℕ) + 1 = i then p ⟨j, by have := i.isLt; omega⟩
    else 2
  isSymm := by
    refine Matrix.IsSymm.ext fun i j => ?_
    simp only [Matrix.of_apply]
    split_ifs <;> omega
  diagonal i := by simp
  off_diagonal i j hij := by
    simp only [Matrix.of_apply]
    split_ifs
    · contradiction
    · exact hp _
    · exact hp _
    · omega

/-- Non-adjacent entries of a string Coxeter matrix are `2`. -/
theorem stringCoxeterMatrix_of_far {n : ℕ} {p : Fin n → ℕ} {hp : ∀ i, p i ≠ 1}
    {i j : Fin (n + 1)} (h : (i : ℕ) + 2 ≤ j) : stringCoxeterMatrix n p hp i j = 2 := by
  change Matrix.of _ i j = 2
  simp only [Matrix.of_apply]
  split_ifs with h1 h2 h3
  · subst h1; omega
  · omega
  · omega
  · rfl

/-- The cartographic group: the universal string Coxeter group with all adjacent entries `∞`. -/
abbrev cartographicGroup (n : ℕ) : Type :=
  (stringCoxeterMatrix n 0 (fun _ => by simp)).Group

/-- Two simple reflections whose Coxeter entry is `2` commute. -/
theorem commute_simple_of_eq_two {B W : Type*} [Group W] {M : CoxeterMatrix B}
    (cs : CoxeterSystem M W) {i j : B} (h : M i j = 2) : Commute (cs.simple i) (cs.simple j) := by
  have h2 := cs.simple_mul_simple_pow i j
  rw [h, sq] at h2
  have := eq_inv_of_mul_eq_one_left h2
  rw [mul_inv_rev, cs.inv_simple, cs.inv_simple] at this
  exact this

namespace GMap

variable {n : ℕ} {D D' : Type*} (G : GMap n D)

/-- The involutions of a flag system satisfy the relations of the cartographic group
(Layer 7.2). -/
theorem isLiftable_adj : (stringCoxeterMatrix n 0 (fun _ => by simp)).IsLiftable G.adj := by
  intro i j
  have hii : ∀ k, G.adj k * G.adj k = 1 := fun k => Equiv.ext fun d => G.involutive k d
  change (G.adj i * G.adj j) ^ (Matrix.of _ i j) = 1
  simp only [Matrix.of_apply]
  split_ifs with h1 h2 h3
  · subst h1; rw [pow_one, hii]
  · rfl
  · rfl
  · have hne := Fin.val_ne_of_ne h1
    rcases (show (i : ℕ) + 2 ≤ j ∨ (j : ℕ) + 2 ≤ i by omega) with hf | hf
    · rw [(G.commute_of_far i j hf).mul_pow, sq, sq, hii, hii, one_mul]
    · rw [(G.commute_of_far j i hf).symm.mul_pow, sq, sq, hii, hii, one_mul]

/-- The monodromy homomorphism `cartographicGroup n →* Perm D` (Layer 7.2). -/
def monodromyHom : cartographicGroup n →* Perm D :=
  (stringCoxeterMatrix n 0 (fun _ => by simp)).toCoxeterSystem.lift ⟨G.adj, G.isLiftable_adj⟩

/-- The flag system of a homomorphism `cartographicGroup n →* Perm D` (Layer 7.2). -/
def ofMonodromyHom (φ : cartographicGroup n →* Perm D) : GMap n D where
  adj i := φ ((stringCoxeterMatrix n 0 (fun _ => by simp)).toCoxeterSystem.simple i)
  involutive i d := by
    rw [← Perm.mul_apply, ← map_mul, CoxeterSystem.simple_mul_simple_self, map_one,
      Perm.one_apply]
  commute_of_far i j h := (commute_simple_of_eq_two _ (stringCoxeterMatrix_of_far h)).map φ

/-- The monodromy homomorphism factors through `(stringCoxeterMatrix n p hp).Group` iff
`(adj i * adj (i + 1)) ^ p i = 1` for every `i` (Layer 7.2). -/
theorem exists_monoidHom_stringCoxeterMatrix_iff (p : Fin n → ℕ) (hp : ∀ i, p i ≠ 1) :
    (∃ ψ : (stringCoxeterMatrix n p hp).Group →* Perm D,
        ∀ i, ψ ((stringCoxeterMatrix n p hp).simple i) = G.adj i) ↔
      ∀ i : Fin n, (G.adj i.castSucc * G.adj i.succ) ^ p i = 1 := sorry

/-- The automorphism group: the centralizer of the `adj i` (Layer 7.3). -/
def aut : Subgroup (Perm D) := Subgroup.centralizer (Set.range G.adj)

/-- A map of darts commuting with every `adj i`, from a nonempty flag system to a connected one,
is surjective (Layer 7.3). -/
theorem surjective_of_map_adj [Nonempty D] {G' : GMap n D'} (hG' : G'.IsConnected) (f : D → D')
    (hf : ∀ i d, f (G.adj i d) = G'.adj i (f d)) : Function.Surjective f := sorry

/-- The automorphism group of a connected flag system acts freely (Layer 7.3). -/
theorem eq_of_mem_aut_of_apply_eq (hG : G.IsConnected) {σ τ : Perm D} (hσ : σ ∈ G.aut)
    (hτ : τ ∈ G.aut) (d : D) (h : σ d = τ d) : σ = τ := sorry

/-- A finite nonempty connected flag system has at most `Nat.card D` automorphisms
(Layer 7.3). -/
theorem natCard_aut_le [Finite D] [Nonempty D] (hG : G.IsConnected) :
    Nat.card G.aut ≤ Nat.card D := sorry

/-- A flag system is connected iff its flag graph is (Layer 7.4). -/
theorem isConnected_iff_preconnected_flagGraph :
    G.IsConnected ↔ G.flagGraph.Preconnected := sorry

/-- The coset flag system of `H ≤ cartographicGroup n` on `cartographicGroup n ⧸ H` (Layer 7.5). -/
def cosetGMap (H : Subgroup (cartographicGroup n)) : GMap n (cartographicGroup n ⧸ H) :=
  ofMonodromyHom (MulAction.toPermHom (cartographicGroup n) (cartographicGroup n ⧸ H))

/-- Every nonempty connected flag system is isomorphic to a coset flag system (Layer 7.5). -/
theorem exists_iso_cosetGMap [Nonempty D] (hG : G.IsConnected) :
    ∃ H : Subgroup (cartographicGroup n), Nonempty (G.Iso (cosetGMap H)) := sorry

open scoped Pointwise in
/-- Two coset flag systems are isomorphic iff the subgroups are conjugate (Layer 7.5). -/
theorem nonempty_iso_cosetGMap_iff (H K : Subgroup (cartographicGroup n)) :
    Nonempty ((cosetGMap H).Iso (cosetGMap K)) ↔
      ∃ g : cartographicGroup n, K = MulAut.conj g • H := sorry

end GMap

/-! ## Layer 8: orientability in the cartographic group -/

namespace GMap

variable {D : Type*}

/-- The even part of the monodromy group: the image of the kernel of the length parity. -/
def evenMonodromy {n : ℕ} (G : GMap n D) : Subgroup (Perm D) :=
  (stringCoxeterMatrix n 0 (fun _ => by simp)).toCoxeterSystem.lengthParity.ker.map
    G.monodromyHom

/-- A nonempty connected closed-surface flag system is orientable iff the even part of its
monodromy group is not transitive on flags (Layer 8.1). -/
theorem isOrientable_iff_not_isPretransitive_evenMonodromy [Nonempty D] (G : GMap2 D)
    (hG : G.IsConnected) (hS : G.IsClosedSurface) :
    G.IsOrientable ↔ ¬ MulAction.IsPretransitive G.evenMonodromy D := sorry

end GMap

/-! ## Layer 9: regular flag systems and regular maps -/

namespace GMap

variable {n : ℕ} {D : Type*} (G : GMap n D)

/-- Regular: connected, with a monodromy group acting freely (Layer 9.1). -/
def IsRegular : Prop := G.IsConnected ∧ ∀ g ∈ G.monodromy, ∀ d, g d = d → g = 1

/-- For a finite nonempty connected flag system, regular iff the automorphism group acts
transitively (Layer 9.1). -/
theorem isRegular_iff_isPretransitive_aut [Finite D] [Nonempty D] (hG : G.IsConnected) :
    G.IsRegular ↔ MulAction.IsPretransitive G.aut D := sorry

/-- For a finite nonempty connected flag system, regular iff it has `Nat.card D` automorphisms
(Layer 9.1). -/
theorem isRegular_iff_natCard_aut [Finite D] [Nonempty D] (hG : G.IsConnected) :
    G.IsRegular ↔ Nat.card G.aut = Nat.card D := sorry

/-- A nonempty regular flag system is isomorphic to the coset flag system of a normal subgroup
(Layer 9.1). -/
theorem exists_normal_iso_cosetGMap [Nonempty D] (hG : G.IsRegular) :
    ∃ N : Subgroup (cartographicGroup n), N.Normal ∧ Nonempty (G.Iso (cosetGMap N)) := sorry

/-- The automorphism group of the coset flag system of a normal subgroup `N` is
`(cartographicGroup n ⧸ N)ᵐᵒᵖ` (Layer 9.1). -/
theorem nonempty_mulEquiv_aut_cosetGMap (N : Subgroup (cartographicGroup n)) [N.Normal] :
    Nonempty ((cosetGMap N).aut ≃* (cartographicGroup n ⧸ N)ᵐᵒᵖ) := sorry

/-- The regular flag system of `ρ : Fin (n + 1) → W` satisfying the relations of the cartographic
group: flags `W`, `adj i g = ρ i * g` (Layer 9.2). -/
def ofGroup {W : Type*} [Group W] (ρ : Fin (n + 1) → W) (hρ : ∀ i, ρ i * ρ i = 1)
    (hfar : ∀ i j : Fin (n + 1), (i : ℕ) + 2 ≤ j → Commute (ρ i) (ρ j)) : GMap n W where
  adj i := Equiv.mulLeft (ρ i)
  involutive i g := by simp [← mul_assoc, hρ i]
  commute_of_far i j h := by
    unfold Commute SemiconjBy
    refine Equiv.ext fun g => ?_
    simp [Perm.mul_apply, ← mul_assoc, (hfar i j h).eq]

/-- The regular flag system of `ρ` is connected iff the `ρ i` generate `W` (Layer 9.2). -/
theorem isConnected_ofGroup_iff {W : Type*} [Group W] (ρ : Fin (n + 1) → W)
    (hρ : ∀ i, ρ i * ρ i = 1) (hfar : ∀ i j : Fin (n + 1), (i : ℕ) + 2 ≤ j → Commute (ρ i) (ρ j)) :
    (ofGroup ρ hρ hfar).IsConnected ↔ Subgroup.closure (Set.range ρ) = ⊤ := sorry

/-- When the `ρ i` generate `W`, the regular flag system of `ρ` is regular, with automorphism
group `Wᵐᵒᵖ` (Layer 9.2). -/
theorem isRegular_ofGroup {W : Type*} [Group W] (ρ : Fin (n + 1) → W) (hρ : ∀ i, ρ i * ρ i = 1)
    (hfar : ∀ i j : Fin (n + 1), (i : ℕ) + 2 ≤ j → Commute (ρ i) (ρ j))
    (hgen : Subgroup.closure (Set.range ρ) = ⊤) :
    (ofGroup ρ hρ hfar).IsRegular ∧ Nonempty ((ofGroup ρ hρ hfar).aut ≃* Wᵐᵒᵖ) := sorry

/-- The generators `adj i` of the monodromy group, as elements of it. -/
def monodromyGen (i : Fin (n + 1)) : G.monodromy :=
  ⟨G.adj i, Subgroup.subset_closure ⟨i, rfl⟩⟩

/-- The generators of the monodromy group are involutions. -/
theorem monodromyGen_mul_self (i : Fin (n + 1)) : G.monodromyGen i * G.monodromyGen i = 1 :=
  Subtype.ext (Equiv.ext fun d => G.involutive i d)

/-- Distant generators of the monodromy group commute. -/
theorem commute_monodromyGen (i j : Fin (n + 1)) (h : (i : ℕ) + 2 ≤ j) :
    Commute (G.monodromyGen i) (G.monodromyGen j) :=
  Subtype.ext (G.commute_of_far i j h).eq

/-- The regular flag system of the monodromy group. -/
def ofMonodromy : GMap n G.monodromy :=
  ofGroup G.monodromyGen G.monodromyGen_mul_self G.commute_monodromyGen

/-- Every nonempty regular flag system is isomorphic to the regular flag system of its monodromy
group (Layer 9.2). -/
theorem nonempty_iso_ofMonodromy [Nonempty D] (hG : G.IsRegular) :
    Nonempty (G.Iso G.ofMonodromy) := sorry

end GMap

/-- The regular flag system of a Coxeter system whose diagram is a string: flags `W`,
`adj i w = s i * w` (Layer 9.4). -/
def coxeterGMap {n : ℕ} {W : Type*} [Group W] {M : CoxeterMatrix (Fin (n + 1))}
    (cs : CoxeterSystem M W) (hM : ∀ i j : Fin (n + 1), (i : ℕ) + 2 ≤ j → M i j = 2) :
    GMap n W :=
  GMap.ofGroup cs.simple cs.simple_mul_simple_self
    (fun i j h => commute_simple_of_eq_two cs (hM i j h))

/-- The tetrahedral map, of type `{3,3}`. -/
def tetrahedronGMap : GMap2 (CoxeterMatrix.A 3).Group :=
  coxeterGMap (CoxeterMatrix.A 3).toCoxeterSystem
    (fun i j h => by fin_cases i <;> fin_cases j <;> first | (simp at h; done) | rfl)

/-- The octahedral map, of type `{3,4}`. -/
def octahedronGMap : GMap2 (CoxeterMatrix.B 3).Group :=
  coxeterGMap (CoxeterMatrix.B 3).toCoxeterSystem
    (fun i j h => by fin_cases i <;> fin_cases j <;> first | (simp at h; done) | rfl)

/-- The cubical map, of type `{4,3}`: the generators of `B₃` reversed. -/
def cubeGMap : GMap2 ((CoxeterMatrix.B 3).reindex Fin.revPerm).Group :=
  coxeterGMap ((CoxeterMatrix.B 3).reindex Fin.revPerm).toCoxeterSystem
    (fun i j h => by fin_cases i <;> fin_cases j <;> first | (simp at h; done) | rfl)

/-- The icosahedral map, of type `{3,5}`. -/
def icosahedronGMap : GMap2 CoxeterMatrix.H₃.Group :=
  coxeterGMap CoxeterMatrix.H₃.toCoxeterSystem
    (fun i j h => by fin_cases i <;> fin_cases j <;> first | (simp at h; done) | rfl)

/-- The dodecahedral map, of type `{5,3}`: the generators of `H₃` reversed. -/
def dodecahedronGMap : GMap2 (CoxeterMatrix.H₃.reindex Fin.revPerm).Group :=
  coxeterGMap (CoxeterMatrix.H₃.reindex Fin.revPerm).toCoxeterSystem
    (fun i j h => by fin_cases i <;> fin_cases j <;> first | (simp at h; done) | rfl)

/-- The orders of the three groups (Layer 9.4). -/
theorem natCard_platonicGroups :
    Nat.card (CoxeterMatrix.A 3).Group = 24 ∧ Nat.card (CoxeterMatrix.B 3).Group = 48 ∧
      Nat.card CoxeterMatrix.H₃.Group = 120 := sorry

/-- Vertices, edges and faces of the five Platonic maps (Layer 9.4). -/
theorem cellNumbers_platonic :
    tetrahedronGMap.cellNumbers = (4, 6, 4) ∧ octahedronGMap.cellNumbers = (6, 12, 8) ∧
      cubeGMap.cellNumbers = (8, 12, 6) ∧ icosahedronGMap.cellNumbers = (12, 30, 20) ∧
      dodecahedronGMap.cellNumbers = (20, 30, 12) := sorry

/-- The five Platonic maps are orientable closed-surface maps (Layer 9.4). -/
theorem isClosedSurface_isOrientable_platonic :
    (tetrahedronGMap.IsClosedSurface ∧ tetrahedronGMap.IsOrientable) ∧
      (octahedronGMap.IsClosedSurface ∧ octahedronGMap.IsOrientable) ∧
      (cubeGMap.IsClosedSurface ∧ cubeGMap.IsOrientable) ∧
      (icosahedronGMap.IsClosedSurface ∧ icosahedronGMap.IsOrientable) ∧
      (dodecahedronGMap.IsClosedSurface ∧ dodecahedronGMap.IsOrientable) := sorry

/-- The longest element `(s₀ s₁ s₂)⁵` of the icosahedral group. -/
def hemiW₀ : CoxeterMatrix.H₃.Group :=
  (CoxeterMatrix.H₃.simple 0 * CoxeterMatrix.H₃.simple 1 * CoxeterMatrix.H₃.simple 2) ^ 5

/-- The centre of the icosahedral group is generated by its longest element (Layer 9.5). -/
theorem center_eq_zpowers_hemiW₀ :
    Subgroup.center CoxeterMatrix.H₃.Group = Subgroup.zpowers hemiW₀ := sorry

/-- The icosahedral group modulo its centre is `A₅` (Layer 9.5). -/
theorem nonempty_mulEquiv_alternatingGroup :
    Nonempty ((CoxeterMatrix.H₃.Group ⧸ Subgroup.center CoxeterMatrix.H₃.Group) ≃*
      alternatingGroup (Fin 5)) := sorry

/-- The hemi-icosahedron: the regular flag system of `H₃` modulo its centre (Layer 9.5). -/
def hemiIcosahedronGMap :
    GMap2 (CoxeterMatrix.H₃.Group ⧸ Subgroup.center CoxeterMatrix.H₃.Group) :=
  GMap.ofGroup (fun i => QuotientGroup.mk (CoxeterMatrix.H₃.toCoxeterSystem.simple i))
    (fun i => by
      rw [← QuotientGroup.mk_mul, CoxeterSystem.simple_mul_simple_self, QuotientGroup.mk_one])
    (fun i j h => (commute_simple_of_eq_two _
      (by fin_cases i <;> fin_cases j <;> first | (simp at h; done) | rfl)).map
        (QuotientGroup.mk' _))

/-- The hemi-icosahedron has 6 vertices, 15 edges and 10 faces and is a non-orientable
closed-surface map (Layer 9.5). -/
theorem cellNumbers_hemiIcosahedronGMap :
    hemiIcosahedronGMap.cellNumbers = (6, 15, 10) ∧ hemiIcosahedronGMap.IsClosedSurface ∧
      ¬ hemiIcosahedronGMap.IsOrientable := sorry

/-- The icosahedral map is the orientation double cover of the hemi-icosahedron (Layer 9.5). -/
theorem nonempty_iso_orientationDoubleCover_hemiIcosahedronGMap :
    Nonempty (hemiIcosahedronGMap.orientationDoubleCover.Iso icosahedronGMap) := sorry

/-- The three affine involutions of the regular triangulation of the torus `(ZMod n)²`. -/
def torusInvolution (n : ℕ) : Fin 3 → Perm (ZMod n × ZMod n)
  | 0 => Function.Involutive.toPerm (fun p => (1 - p.1 + p.2, p.2))
      (fun p => Prod.ext (by simp only; ring) rfl)
  | 1 => Function.Involutive.toPerm (fun p => (p.1, p.1 - p.2))
      (fun p => Prod.ext rfl (by simp only; ring))
  | 2 => Function.Involutive.toPerm (fun p => (p.1 - p.2, -p.2))
      (fun p => Prod.ext (by simp only; ring) (by simp only; ring))

/-- The group generated by the three involutions. -/
abbrev torusGroup (n : ℕ) : Subgroup (Perm (ZMod n × ZMod n)) :=
  Subgroup.closure (Set.range (torusInvolution n))

/-- The torus group has `12 n²` elements for `n ≥ 3` (Layer 9.6). -/
theorem card_torusGroup (n : ℕ) (hn : 3 ≤ n) : Nat.card (torusGroup n) = 12 * n ^ 2 := sorry

/-- The three involutions of the torus are involutions. -/
theorem torusInvolution_involutive (n : ℕ) : ∀ i, Function.Involutive (torusInvolution n i)
  | 0 => fun p => Prod.ext (by change 1 - (1 - p.1 + p.2) + p.2 = p.1; ring) rfl
  | 1 => fun p => Prod.ext rfl (by change p.1 - (p.1 - p.2) = p.2; ring)
  | 2 => fun p => Prod.ext (by change p.1 - p.2 - -p.2 = p.1; ring) (by change - -p.2 = p.2; ring)

/-- The regular flag system of the torus group on its three generators (Layer 9.6). -/
def torusGMap (n : ℕ) : GMap2 (torusGroup n) :=
  GMap.ofGroup (fun i => ⟨torusInvolution n i, Subgroup.subset_closure ⟨i, rfl⟩⟩)
    (fun i => Subtype.ext (Equiv.ext fun p => torusInvolution_involutive n i p))
    (fun i j h => by
      have hi : i = 0 := Fin.ext (by have := j.isLt; simp; omega)
      have hj : j = 2 := Fin.ext (by have := j.isLt; simp; omega)
      subst hi hj
      refine Subtype.ext (Equiv.ext fun p => Prod.ext ?_ rfl)
      change 1 - (p.1 - p.2) + -p.2 = 1 - p.1 + p.2 - p.2
      ring)

/-- For `n ≥ 3` the torus map is an orientable closed-surface map with `n²` vertices, `3 n²`
edges and `2 n²` faces (Layer 9.6). -/
theorem cellNumbers_torusGMap (n : ℕ) (hn : 3 ≤ n) :
    (torusGMap n).cellNumbers = (n ^ 2, 3 * n ^ 2, 2 * n ^ 2) ∧ (torusGMap n).IsClosedSurface ∧
      (torusGMap n).IsOrientable := sorry

/-! ## Layer 10: applications of the geometric representation -/

/-- The geometric representation in function coordinates `B → ℝ`, for a finite `B`, transported
from Tau Ceti's `B →₀ ℝ` along `Finsupp.linearEquivFunOnFinite`. -/
def geometricRepresentationFun {B W : Type*} [Finite B] [Group W]
    {M : CoxeterMatrix B} (cs : CoxeterSystem M W) : Representation ℝ W (B → ℝ) :=
  (MonoidHom.ofClass
    ((Finsupp.linearEquivFunOnFinite ℝ ℝ B).conjAlgEquiv ℝ)).comp cs.geometricRepresentation

/-- The cartographic group acts faithfully on `ℝ ^ (n + 1)` by reflections (Layer 10.2), from the
faithfulness of the geometric representation (RootSystems §1.3, `geometric_faithfulness`). -/
theorem geometricRepresentationFun_cartographic_injective (n : ℕ) :
    Function.Injective
      (geometricRepresentationFun (stringCoxeterMatrix n 0 (fun _ => by simp)).toCoxeterSystem) :=
  sorry

end

end TauCetiRoadmap.PseudolineArrangementsAndOrientedMatroids
