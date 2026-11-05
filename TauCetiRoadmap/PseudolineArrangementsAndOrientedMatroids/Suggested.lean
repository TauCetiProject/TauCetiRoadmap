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

* 1.4, `Chirotope.isChirotope_ofVectorsFun` (on `Chirotope`, `GP3`, `permSign`, `IsChirotope`,
  `Chirotope.ofVectorsFun`, `Chirotope.IsRealizable`).
* 1.5, `Chirotope.isChirotope_reorientFun`, `Chirotope.isChirotope_relabelFun` (on
  `Chirotope.reorientFun`, `Chirotope.relabelFun`).
* 2.2, `Chirotope.exists_orientedMatroid_covectorsOf` (on `OrientedMatroid`,
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
* 7.1, `stringCoxeterMatrix`, `cartographicGroup` (definitions only).
* 9.5, `center_eq_zpowers_hemiW₀`, `nonempty_mulEquiv_alternatingGroup` (on `hemiW₀`).
* 9.6, `card_torusGroup` (on `torusInvolution`, `torusGroup`).
* 10.1–10.2, `geometricRepresentationFun_cartographic_injective` (on
  `geometricRepresentationFun`).

Not stated here, with the carrier each lacks:

* 2.2, the representation of every `OrientedMatroid` of rank `r` by a chirotope (BLSWZ
  Theorem 3.5.5); 2.4–2.6, the face lattice, the projective face poset and the Euler relation:
  they lack the rank of a covector and of an `OrientedMatroid`, which are not defined here.
* 3.7, 3.9 (i)–(ii), 8.2, 8.3: they lack SurfaceTopology's `GMap2`, its cells and its
  isomorphisms, which are not declared at the pins, and GraphConnectivityAndFlows' isomorphisms of
  `Graph α β` (Target 1.1).
* 4.2–4.3, the arrangement drawn from a wiring diagram, its simplicity, the invariance of its
  chirotope under commutations and the braid move as a legal mutation: they lack the
  piecewise-linear arrangement drawn from a word, which this file does not build.
* 5.1 (localizations), 5.4, 5.5, the poset of positions and the unmarked topological
  representation: they lack the localization of a single-element extension as a function on
  cocircuits, which this file does not build.
* 7.2–7.5, 8.1, 9.1–9.4, the flag systems of the cartographic group, residues, coset and regular
  flag systems, orientability through the even monodromy, regular flag systems and the Platonic
  and toroidal maps: they lack SurfaceTopology's `GMap n D` on an arbitrary dart type
  (gap:gmap-arbitrary-darts in the README's supplier contracts).
* 9.3, string C-groups and abstract polytopes: there is no abstract polytope at the pins.

The proof of 10.1–10.2 needs the faithfulness of `CoxeterSystem.geometricRepresentation` for every
Coxeter system, which is not at the pins (gap:coxeter-geometric-faithfulness in the README).
-/

@[expose] public section

namespace TauCetiRoadmap.PseudolineArrangementsAndOrientedMatroids

open Equiv

noncomputable section

/-! ## Layer 0: sign vectors -/

namespace SignVector

variable {E : Type*}

/-- Composition `X ∘ Y`: `X` where it is nonzero, `Y` elsewhere. -/
def compose (X Y : E → SignType) : E → SignType := fun e => if X e = 0 then Y e else X e

/-- The separation set `{e | X e ≠ 0 ∧ Y e = -X e}` of two sign vectors. -/
def sep (X Y : E → SignType) : Set E := {e | X e ≠ 0 ∧ Y e = -X e}

/-- The conformal order: `X` agrees with `Y` wherever `X` is nonzero. Not the pointwise order. -/
def ConfLE (X Y : E → SignType) : Prop := ∀ e, X e = 0 ∨ X e = Y e

end SignVector

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

/-- The covectors of a chirotope form an oriented matroid (Layer 2.2; BLSWZ §3.5, §3.7). -/
theorem exists_orientedMatroid_covectorsOf (χ : Chirotope r E) :
    ∃ L : OrientedMatroid E, L.covectors = covectorsOf χ := sorry

/-- No bigons (Layer 2.3): in a simple rank-3 chirotope every tope has at least three walls. -/
theorem three_le_ncard_walls [Finite E] (χ : Chirotope 3 E) (hχ : χ.IsSimple)
    {T : E → SignType} (hT : SignVector.IsTope (covectorsOf χ) T) :
    3 ≤ (SignVector.walls (covectorsOf χ) T).ncard := sorry

/-- Rank 2 and cyclic orders (Layer 2.7): signed elements carry a unique circular order in which
`χ a b = 1` means that `b` lies strictly between `a` and `-a`. -/
theorem exists_unique_circularOrder [Finite E] (χ : Chirotope 2 E) (hχ : χ.IsSimple) :
    ∃! c : CircularOrder (E × ℤˣ), letI := c; ∀ a b : E × ℤˣ, a.1 ≠ b.1 →
      (SignType.sign (a.2 : ℤ) * SignType.sign (b.2 : ℤ) * χ ![a.1, b.1] = 1 ↔
        sbtw a b (a.1, -a.2)) := sorry

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
  /-- Two pseudolines cross exactly once, `i` below `j` on the left. -/
  cross : ∀ i j, i < j → ∃ x₀ : ℝ,
    (∀ x < x₀, f i x < f j x) ∧ f i x₀ = f j x₀ ∧ ∀ x, x₀ < x → f j x < f i x

namespace MonotoneArrangement

variable {n : ℕ} (A : MonotoneArrangement n)

/-- The abscissa where `i` and `j` cross, symmetric in `i` and `j`; the value `0` at `i = j` is
junk. -/
def crossX (i j : Fin n) : ℝ :=
  if h : i < j then Classical.choose (A.cross i j h)
  else if h' : j < i then Classical.choose (A.cross j i h') else 0

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
  cross i j hij := by
    have h : 0 < a i - a j := sub_pos.2 (ha hij)
    refine ⟨(b j - b i) / (a i - a j), fun x hx => ?_, ?_, fun x hx => ?_⟩
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
theorem isChirotope_flipFun (χ : Chirotope 3 E) (hχ : IsUniform χ) (Δ : χ.Triangle) :
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

/-- The cartographic group: the universal string Coxeter group with all adjacent entries `∞`. -/
abbrev cartographicGroup (n : ℕ) : Type :=
  (stringCoxeterMatrix n 0 (fun _ => by simp)).Group

/-! ## Layer 9: the hemi-icosahedron and the toroidal maps -/

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

/-! ## Layer 10: applications of the geometric representation -/

/-- The geometric representation in function coordinates `B → ℝ`, for a finite `B`, transported
from Tau Ceti's `B →₀ ℝ` along `Finsupp.linearEquivFunOnFinite`. -/
def geometricRepresentationFun {B W : Type*} [Finite B] [Group W]
    {M : CoxeterMatrix B} (cs : CoxeterSystem M W) : Representation ℝ W (B → ℝ) :=
  (MonoidHom.ofClass
    ((Finsupp.linearEquivFunOnFinite ℝ ℝ B).conjAlgEquiv ℝ)).comp cs.geometricRepresentation

/-- The cartographic group acts faithfully on `ℝ ^ (n + 1)` by reflections (Layer 10.2), from the
faithfulness of the geometric representation (gap:coxeter-geometric-faithfulness). -/
theorem geometricRepresentationFun_cartographic_injective (n : ℕ) :
    Function.Injective
      (geometricRepresentationFun (stringCoxeterMatrix n 0 (fun _ => by simp)).toCoxeterSystem) :=
  sorry

end

end TauCetiRoadmap.PseudolineArrangementsAndOrientedMatroids
