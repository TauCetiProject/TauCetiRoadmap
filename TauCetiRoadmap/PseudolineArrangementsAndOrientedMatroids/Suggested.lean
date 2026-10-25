import Mathlib

/-!
# Pseudoline arrangements, oriented matroids, and combinatorial maps: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library: these are goals, not proofs.

What is prototyped here are the carriers whose shape fixes everything above them: sign vectors
as plain functions `E → SignType`; the chirotope with its three-term Grassmann–Plücker field and
its matroid of bases; covector oriented matroids; the x-monotone model of pseudoline
arrangements with the line at infinity as `none`; wiring diagrams as words of adjacent swaps;
`n`-cartes as tuples of involutions, with the cartographic group as a string Coxeter group in
Mathlib's sense (`0` means `∞`); and the geometric representation of a Coxeter group.

One indexing difference with the prose: a wiring diagram on `n + 1` wires is a word in `Fin n`
here, so that `Fin.castSucc` and `Fin.succ` name the two swapped positions without subtraction.
-/

namespace TauCetiRoadmap.PseudolineArrangementsAndOrientedMatroids

open Equiv

noncomputable section

/-! ## Layer 0: sign vectors -/

namespace SignVector

variable {E : Type*}

/-- Composition `X ∘ Y`: `X` where it is nonzero, `Y` elsewhere. -/
def compose (X Y : E → SignType) : E → SignType := fun e => if X e = 0 then Y e else X e

/-- The separation set of two sign vectors. -/
def sep (X Y : E → SignType) : Set E := {e | X e ≠ 0 ∧ Y e = -X e}

/-- The support of a sign vector. -/
def supp (X : E → SignType) : Set E := {e | X e ≠ 0}

/-- The conformal order: `X` agrees with `Y` wherever `X` is nonzero. Not the pointwise order. -/
def ConfLE (X Y : E → SignType) : Prop := ∀ e, X e = 0 ∨ X e = Y e

open scoped Classical in
/-- Reorientation on `A`: negate the coordinates in `A`. -/
def reorient (A : Set E) (X : E → SignType) : E → SignType := fun e => if e ∈ A then -X e else X e

theorem compose_assoc (X Y Z : E → SignType) :
    compose (compose X Y) Z = compose X (compose Y Z) := sorry

theorem neg_compose (X Y : E → SignType) : -compose X Y = compose (-X) (-Y) := sorry

theorem compose_comm_iff (X Y : E → SignType) : compose X Y = compose Y X ↔ sep X Y = ∅ := sorry

theorem confLE_compose (X Y : E → SignType) : ConfLE X (compose X Y) := sorry

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
  exists_ne_zero : ∃ b, toFun b ≠ 0
  eq_zero_of_not_injective : ∀ b, ¬ Function.Injective b → toFun b = 0
  comp_perm : ∀ (b : Fin r → E) (σ : Perm (Fin r)), toFun (b ∘ σ) = permSign σ * toFun b
  /-- The supports of nonzero values are the bases of a matroid. -/
  isBase_exchange :
    Matroid.ExchangeProperty (fun B : Set E => ∃ b, toFun b ≠ 0 ∧ Set.range b = B)
  /-- The three-term Grassmann–Plücker relations. -/
  grassmannPlucker : ∀ (x : Fin r → E) (i j : Fin r), i ≠ j → ∀ a b c d : E,
    let s := fun u v => toFun (Function.update (Function.update x i u) j v)
    GP3 (s a b * s c d) (-(s a c * s b d)) (s a d * s b c)

namespace Chirotope

variable {r : ℕ} {E E' : Type*}

instance : CoeFun (Chirotope r E) (fun _ => (Fin r → E) → SignType) := ⟨Chirotope.toFun⟩

instance : Neg (Chirotope r E) :=
  ⟨fun χ => { toFun := fun b => -χ b, exists_ne_zero := sorry, eq_zero_of_not_injective := sorry,
    comp_perm := sorry, isBase_exchange := sorry, grassmannPlucker := sorry }⟩

/-- The matroid of bases of a chirotope on a finite type. -/
def matroid [Finite E] (χ : Chirotope r E) : Matroid E :=
  Matroid.ofIsBaseOfFinite Set.finite_univ (fun B => ∃ b, χ b ≠ 0 ∧ Set.range b = B)
    (by obtain ⟨b, hb⟩ := χ.exists_ne_zero; exact ⟨_, b, hb, rfl⟩) χ.isBase_exchange
    (fun _ _ => Set.subset_univ _)

theorem matroid_isBase_iff [Finite E] (χ : Chirotope r E) (B : Set E) :
    χ.matroid.IsBase B ↔ ∃ b, χ b ≠ 0 ∧ Set.range b = B := sorry

/-- No loops and no parallel pairs (stated for rank at least two). -/
def IsSimple (χ : Chirotope r E) : Prop :=
  (∀ e, ∃ b, χ b ≠ 0 ∧ e ∈ Set.range b) ∧
    ∀ e f, e ≠ f → ∃ b, χ b ≠ 0 ∧ e ∈ Set.range b ∧ f ∈ Set.range b

def IsUniform (χ : Chirotope r E) : Prop := ∀ b, Function.Injective b → χ b ≠ 0

variable {𝕜 : Type*} [Field 𝕜] [LinearOrder 𝕜] [IsStrictOrderedRing 𝕜]

/-- The chirotope of a spanning family of vectors: the sign of the determinant whose rows are the
vectors. -/
def ofVectors (v : E → Fin r → 𝕜) (hv : Submodule.span 𝕜 (Set.range v) = ⊤) : Chirotope r E where
  toFun b := SignType.sign (Matrix.of fun i j => v (b i) j).det
  exists_ne_zero := sorry
  eq_zero_of_not_injective := sorry
  comp_perm := sorry
  isBase_exchange := sorry
  grassmannPlucker := sorry

def IsRealizable (χ : Chirotope r E) (𝕜 : Type*) [Field 𝕜] [LinearOrder 𝕜]
    [IsStrictOrderedRing 𝕜] : Prop :=
  ∃ (v : E → Fin r → 𝕜) (hv : Submodule.span 𝕜 (Set.range v) = ⊤), χ = ofVectors v hv

open scoped Classical in
/-- Reorientation on `A`: one factor `-1` for each entry of the tuple lying in `A`. -/
def reorient (χ : Chirotope r E) (A : Set E) : Chirotope r E where
  toFun b := (∏ i, if b i ∈ A then (-1 : SignType) else 1) * χ b
  exists_ne_zero := sorry
  eq_zero_of_not_injective := sorry
  comp_perm := sorry
  isBase_exchange := sorry
  grassmannPlucker := sorry

/-- Relabelling along `E ≃ E'`. -/
def relabel (e : E ≃ E') (χ : Chirotope r E) : Chirotope r E' where
  toFun b := χ (e.symm ∘ b)
  exists_ne_zero := sorry
  eq_zero_of_not_injective := sorry
  comp_perm := sorry
  isBase_exchange := sorry
  grassmannPlucker := sorry

/-- Contraction of `e`, of rank `r`, from a chirotope of rank `r + 1`: `e` is appended last. -/
def contract (χ : Chirotope (r + 1) E) (e : E) (he : ∃ b, χ b ≠ 0 ∧ e ∈ Set.range b) :
    Chirotope r E where
  toFun b := χ (Fin.snoc b e)
  exists_ne_zero := sorry
  eq_zero_of_not_injective := sorry
  comp_perm := sorry
  isBase_exchange := sorry
  grassmannPlucker := sorry

def ReorientationEquivalent (χ χ' : Chirotope r E) : Prop :=
  ∃ A : Set E, χ' = χ.reorient A ∨ χ' = -χ.reorient A

/-- The cocircuit sign vector `e ↦ χ (update x i e)`. -/
def cocircuit (χ : Chirotope r E) (x : Fin r → E) (i : Fin r) : E → SignType :=
  fun e => χ (Function.update x i e)

end Chirotope

/-! ## Layer 2: covectors -/

/-- An oriented matroid in covector form (BLSWZ Definition 4.1.1). -/
structure OrientedMatroid (E : Type*) where
  covectors : Set (E → SignType)
  zero_mem : 0 ∈ covectors
  neg_mem : ∀ X ∈ covectors, -X ∈ covectors
  compose_mem : ∀ X ∈ covectors, ∀ Y ∈ covectors, SignVector.compose X Y ∈ covectors
  elim : ∀ X ∈ covectors, ∀ Y ∈ covectors, ∀ e ∈ SignVector.sep X Y, ∃ Z ∈ covectors,
    Z e = 0 ∧ ∀ f ∉ SignVector.sep X Y, Z f = SignVector.compose X Y f

namespace OrientedMatroid

variable {E : Type*}

def IsTope (L : OrientedMatroid E) (T : E → SignType) : Prop :=
  T ∈ L.covectors ∧ ∀ Y ∈ L.covectors, SignVector.ConfLE T Y → Y = T

def IsCocircuit (L : OrientedMatroid E) (X : E → SignType) : Prop :=
  X ∈ L.covectors ∧ X ≠ 0 ∧ ∀ Y ∈ L.covectors, Y ≠ 0 → SignVector.ConfLE Y X → Y = X

/-- The walls of a tope: the coordinates whose negation gives another tope. -/
def walls (L : OrientedMatroid E) (T : E → SignType) : Set E :=
  {e | T e ≠ 0 ∧ L.IsTope (Function.update T e (-T e))}

end OrientedMatroid

namespace Chirotope

variable {r : ℕ} {E : Type*}

/-- The covectors of a chirotope: compositions of finite lists of cocircuit vectors. -/
def toOrientedMatroid (χ : Chirotope r E) : OrientedMatroid E where
  covectors := {X | ∃ l : List ((Fin r → E) × Fin r),
    X = (l.map fun p => χ.cocircuit p.1 p.2).foldr SignVector.compose 0}
  zero_mem := ⟨[], rfl⟩
  neg_mem := sorry
  compose_mem := sorry
  elim := sorry

theorem toOrientedMatroid_neg (χ : Chirotope r E) :
    (-χ).toOrientedMatroid = χ.toOrientedMatroid := sorry

/-- Rank 2 and cyclic orders (Layer 2.7): signed elements carry a unique circular order in which
`χ a b = 1` means that `b` lies strictly between `a` and `-a`. -/
theorem exists_unique_circularOrder [Finite E] (χ : Chirotope 2 E) (hχ : χ.IsSimple) :
    ∃! c : CircularOrder (E × ℤˣ), letI := c; ∀ a b : E × ℤˣ, a.1 ≠ b.1 →
      (SignType.sign (a.2 : ℤ) * SignType.sign (b.2 : ℤ) * χ ![a.1, b.1] = 1 ↔
        sbtw a b (a.1, -a.2)) := sorry

end Chirotope

/-! ## Layer 3: monotone arrangements -/

/-- A monotone (x-monotone) arrangement of `n` pseudolines: indices increase upward at the far
left, and each pair crosses exactly once. -/
structure MonotoneArrangement (n : ℕ) where
  f : Fin n → ℝ → ℝ
  continuous : ∀ i, Continuous (f i)
  cross : ∀ i j, i < j → ∃ x₀ : ℝ,
    (∀ x < x₀, f i x < f j x) ∧ f i x₀ = f j x₀ ∧ ∀ x, x₀ < x → f j x < f i x

namespace MonotoneArrangement

variable {n : ℕ} (A : MonotoneArrangement n)

/-- The abscissa where `i` and `j` cross (`i ≠ j`). -/
def crossX (i j : Fin n) : ℝ := sorry

def IsSimple : Prop :=
  ∀ i j k : Fin n, i < j → j < k → A.crossX i j ≠ A.crossX j k

/-- The sign vector of a point; `none` is the line at infinity, on whose positive side every
point of the plane lies. -/
def signAt (p : ℝ × ℝ) : Option (Fin n) → SignType
  | none => 1
  | some i => SignType.sign (p.2 - A.f i p.1)

/-- The chirotope: `sign (crossX j k - crossX i j)` on `some i, some j, some k` with
`i < j < k`, and `1` on `some i, some j, none` with `i < j`, extended alternatingly. -/
def chirotope (hn : 2 ≤ n) : Chirotope 3 (Option (Fin n)) := sorry

theorem chirotope_isSimple (hn : 2 ≤ n) : (A.chirotope hn).IsSimple := sorry

theorem chirotope_isUniform_iff (hn : 2 ≤ n) : (A.chirotope hn).IsUniform ↔ A.IsSimple := sorry

/-- Straight lines `y = a i * x + b i` with strictly decreasing slopes. -/
def ofLines (a b : Fin n → ℝ) (ha : StrictAnti a) : MonotoneArrangement n where
  f i x := a i * x + b i
  continuous _ := by fun_prop
  cross := sorry

/-- The vector of `y = a x + b` is `(-1, a, b)` and that of the line at infinity is `(0, 0, 1)`. -/
theorem chirotope_ofLines (hn : 2 ≤ n) (a b : Fin n → ℝ) (ha : StrictAnti a)
    (hv : Submodule.span ℝ (Set.range (fun e : Option (Fin n) =>
      match e with
      | none => ![0, 0, 1]
      | some i => ![-1, a i, b i])) = ⊤) :
    (ofLines a b ha).chirotope hn = Chirotope.ofVectors _ hv := sorry

/-- Cell decomposition (Layer 3.5 (i)): the sign vectors of points are the affine covectors. -/
theorem range_signAt (hn : 2 ≤ n) :
    Set.range A.signAt = {X ∈ (A.chirotope hn).toOrientedMatroid.covectors | X none = 1} := sorry

/-- Cell decomposition (Layer 3.5 (ii)). -/
theorem isPathConnected_cell (X : Option (Fin n) → SignType) (hX : (A.signAt ⁻¹' {X}).Nonempty) :
    IsPathConnected (A.signAt ⁻¹' {X}) := sorry

end MonotoneArrangement

/-- Topological representation in rank 3, marked form (Layer 3.6). -/
theorem exists_monotoneArrangement {n : ℕ} (hn : 2 ≤ n) (χ : Chirotope 3 (Option (Fin n)))
    (hs : χ.IsSimple) (hgen : ∀ a b : Fin n, a ≠ b → χ ![some a, some b, none] ≠ 0) :
    ∃ (σ : Perm (Fin n)) (A : MonotoneArrangement n) (R : Set (Option (Fin n))),
      (A.chirotope hn).reorient R = χ.relabel (Equiv.optionCongr σ) := sorry

/-! ## Layer 4: wiring diagrams and signotopes -/

namespace Wiring

variable {n : ℕ}

/-- The sweep permutation of a word on `n + 1` wires; letter `i` swaps positions `i` and `i + 1`. -/
def wordProd (w : List (Fin n)) : Perm (Fin (n + 1)) :=
  (w.map fun i => Equiv.swap i.castSucc i.succ).prod

def IsWiringDiagram (w : List (Fin n)) : Prop :=
  wordProd w = Fin.revPerm ∧ w.length = (n + 1) * n / 2

def CommutationStep (w w' : List (Fin n)) : Prop :=
  ∃ (u v : List (Fin n)) (i j : Fin n), ((i : ℕ) + 2 ≤ j ∨ (j : ℕ) + 2 ≤ i) ∧
    w = u ++ [i, j] ++ v ∧ w' = u ++ [j, i] ++ v

def BraidStep (w w' : List (Fin n)) : Prop :=
  ∃ (u v : List (Fin n)) (i j : Fin n), (j : ℕ) = i + 1 ∧
    w = u ++ [i, j, i] ++ v ∧ w' = u ++ [j, i, j] ++ v

/-- Connectivity of simple wiring diagrams under commutations and braid moves. -/
theorem reflTransGen_of_isWiringDiagram {w w' : List (Fin n)} (hw : IsWiringDiagram w)
    (hw' : IsWiringDiagram w') :
    Relation.ReflTransGen (fun u v => CommutationStep u v ∨ BraidStep u v ∨ BraidStep v u) w w' :=
  sorry

/-- Commutation classes on five wires: 62 (OEIS A006245). -/
theorem card_commutationClasses_five :
    Nat.card (Quot fun w w' : {w : List (Fin 4) // IsWiringDiagram w} =>
      CommutationStep w.1 w'.1) = 62 := sorry

/-- At most one sign change along a list. -/
def AtMostOneSignChange (l : List SignType) : Prop :=
  (l.zip l.tail).countP (fun p => p.1 != p.2) ≤ 1

/-- A rank-3 signotope on `Fin n` (Felsner–Weil). -/
def IsSignotope {m : ℕ} (s : Fin m → Fin m → Fin m → SignType) : Prop :=
  (∀ i j k, i < j → j < k → s i j k ≠ 0) ∧
    ∀ i j k l, i < j → j < k → k < l →
      AtMostOneSignChange [s i j k, s i j l, s i k l, s j k l]

end Wiring

namespace Chirotope

variable {E : Type*}

open scoped Classical in
/-- The mutation (triangle flip) at `{a, b, c}`: negate the values on tuples enumerating it. -/
def mutate (χ : Chirotope 3 E) (a b c : E) : Chirotope 3 E where
  toFun t := if Set.range t = {a, b, c} then -χ t else χ t
  exists_ne_zero := sorry
  eq_zero_of_not_injective := sorry
  comp_perm := sorry
  isBase_exchange := sorry
  grassmannPlucker := sorry

end Chirotope

/-! ## Layer 5: single-element extensions -/

namespace Chirotope

variable {r : ℕ} {E : Type*}

/-- `χ'` extends `χ` by the new element `none`. -/
def IsExtension (χ : Chirotope r E) (χ' : Chirotope r (Option E)) : Prop :=
  ∀ b : Fin r → E, χ' (some ∘ b) = χ b

/-- Levi's enlargement lemma, combinatorial form (Layer 5.3). -/
theorem levi_enlargement [Finite E] (χ : Chirotope 3 E) (Y Z : E → SignType)
    (hY : Y ∈ χ.toOrientedMatroid.covectors) (hZ : Z ∈ χ.toOrientedMatroid.covectors)
    (hY0 : Y ≠ 0) (hZ0 : Z ≠ 0) :
    ∃ χ' : Chirotope 3 (Option E), χ.IsExtension χ' ∧
      (∃ b, χ' b ≠ 0 ∧ none ∈ Set.range b) ∧
      (fun e => Option.elim e 0 Y) ∈ χ'.toOrientedMatroid.covectors ∧
      (fun e => Option.elim e 0 Z) ∈ χ'.toOrientedMatroid.covectors := sorry

end Chirotope

/-! ## Layer 6: stretchability -/

open Matrix in
/-- Pappus's theorem in cross-product form, over any field. -/
theorem pappus {K : Type*} [Field K] (A B : Fin 3 → Fin 3 → K)
    (hA : (Matrix.of A).det = 0) (hB : (Matrix.of B).det = 0) :
    (Matrix.of ![(A 1 ×₃ B 2) ×₃ (A 2 ×₃ B 1), (A 0 ×₃ B 2) ×₃ (A 2 ×₃ B 0),
      (A 0 ×₃ B 1) ×₃ (A 1 ×₃ B 0)]).det = 0 := sorry

/-- The Pappus configuration of Layer 6.3. -/
def pappusPoints : Fin 9 → Fin 3 → ℚ :=
  ![![0, 0, 1], ![1, 0, 1], ![3, 0, 1], ![0, 1, 1], ![2, 1, 1], ![5, 1, 1],
    ![13, 2, 5], ![15, 3, 8], ![2, 1, 3]]

/-- The non-Pappus chirotope: the chirotope of `pappusPoints`, except that it takes the value `1`
on `![6, 7, 8]` (and the alternating values on its permutations). -/
def nonPappus : Chirotope 3 (Fin 9) := sorry

theorem nonPappus_isSimple : nonPappus.IsSimple := sorry

theorem nonPappus_not_isRealizable (𝕜 : Type*) [Field 𝕜] [LinearOrder 𝕜]
    [IsStrictOrderedRing 𝕜] : ¬ nonPappus.IsRealizable 𝕜 := sorry

/-! ## Layer 7: n-cartes -/

/-- The string Coxeter matrix with `M i (i + 1) = p i` (`0` meaning `∞`) and `2` between
non-adjacent generators. -/
def stringCoxeterMatrix (n : ℕ) (p : Fin n → ℕ) (hp : ∀ i, p i ≠ 1) :
    CoxeterMatrix (Fin (n + 1)) where
  M := Matrix.of fun i j =>
    if i = j then 1
    else if h : (i : ℕ) + 1 = j then p ⟨i, by have := j.isLt; omega⟩
    else if h' : (j : ℕ) + 1 = i then p ⟨j, by have := i.isLt; omega⟩
    else 2
  isSymm := sorry
  diagonal := sorry
  off_diagonal := sorry

/-- The cartographic group: the universal string Coxeter group with all adjacent entries `∞`. -/
abbrev cartographicGroup (n : ℕ) : Type :=
  (stringCoxeterMatrix n 0 (fun _ => by simp)).Group

/-- An `n`-carte on a type of flags. -/
structure Carte (n : ℕ) (Φ : Type*) where
  r : Fin (n + 1) → Perm Φ
  r_mul_self : ∀ i, r i * r i = 1
  commute_far : ∀ i j : Fin (n + 1), (i : ℕ) + 2 ≤ j → (r i * r j) ^ 2 = 1

namespace Carte

variable {n : ℕ} {Φ : Type*} (C : Carte n Φ)

def monodromyHom : cartographicGroup n →* Perm Φ :=
  (stringCoxeterMatrix n 0 (fun _ => by simp)).toCoxeterSystem.lift ⟨C.r, sorry⟩

def monodromyGroup : Subgroup (Perm Φ) := Subgroup.closure (Set.range C.r)

theorem range_monodromyHom : C.monodromyHom.range = C.monodromyGroup := sorry

def IsConnected : Prop := MulAction.IsPretransitive C.monodromyGroup Φ

def IsWithoutBoundary : Prop := ∀ i φ, C.r i φ ≠ φ

/-- The automorphisms: permutations commuting with every `r i`. -/
def Aut : Subgroup (Perm Φ) := Subgroup.centralizer (Set.range C.r)

def IsRegular : Prop :=
  C.IsConnected ∧ ∀ g : C.monodromyGroup, ∀ φ : Φ, g • φ = φ → g = 1

/-- `J`-residues: orbits of the subgroup generated by the `r j`, `j ∈ J`. -/
def residueRel (J : Set (Fin (n + 1))) : Setoid Φ :=
  MulAction.orbitRel (Subgroup.closure (C.r '' J)) Φ

/-- The `i`-faces. -/
def face (i : Fin (n + 1)) : Type _ := Quotient (C.residueRel {j | j ≠ i})

theorem isRegular_iff_card_aut [Finite Φ] (hC : C.IsConnected) :
    C.IsRegular ↔ Nat.card C.Aut = Nat.card Φ := sorry

end Carte

/-- The coset carte of a subgroup of the cartographic group. -/
def cosetCarte (n : ℕ) (H : Subgroup (cartographicGroup n)) : Carte n (cartographicGroup n ⧸ H) where
  r i := MulAction.toPerm ((stringCoxeterMatrix n 0 (fun _ => by simp)).simple i)
  r_mul_self := sorry
  commute_far := sorry

/-- The regular carte of a group with string involutions: flags `G`, `r i g = ρ i * g`. -/
def regularCarte {n : ℕ} (G : Type*) [Group G] (ρ : Fin (n + 1) → G)
    (h1 : ∀ i, ρ i * ρ i = 1) (h2 : ∀ i j : Fin (n + 1), (i : ℕ) + 2 ≤ j → (ρ i * ρ j) ^ 2 = 1) :
    Carte n G where
  r i := MulAction.toPerm (ρ i)
  r_mul_self := sorry
  commute_far := sorry

theorem regularCarte_aut {n : ℕ} (G : Type*) [Group G] (ρ : Fin (n + 1) → G)
    (h1 : ∀ i, ρ i * ρ i = 1) (h2 : ∀ i j : Fin (n + 1), (i : ℕ) + 2 ≤ j → (ρ i * ρ j) ^ 2 = 1)
    (hgen : Subgroup.closure (Set.range ρ) = ⊤) :
    Nonempty ((regularCarte G ρ h1 h2).Aut ≃* Gᵐᵒᵖ) := sorry

/-! ## Layer 8: maps -/

namespace Carte

variable {Φ : Type*} (C : Carte 2 Φ)

def IsMap : Prop :=
  C.IsConnected ∧ (∀ i φ, C.r i φ ≠ φ) ∧ ∀ φ, (C.r 0 * C.r 2) φ ≠ φ

def eulerChar : ℤ := Nat.card (C.face 0) - Nat.card (C.face 1) + Nat.card (C.face 2)

/-- The even part of the monodromy group: the image of the words of even length. -/
def evenMonodromy : Subgroup (Perm Φ) :=
  (stringCoxeterMatrix 2 0 (fun _ => by simp)).toCoxeterSystem.lengthParity.ker.map
    C.monodromyHom

def IsOrientable : Prop := ¬ MulAction.IsPretransitive C.evenMonodromy Φ

/-- The orientable double cover on `Φ × ZMod 2`. -/
def doubleCover : Carte 2 (Φ × ZMod 2) where
  r i := (C.r i).prodCongr (Equiv.addRight 1)
  r_mul_self := sorry
  commute_far := sorry

theorem eulerChar_le_two [Finite Φ] (hC : C.IsMap) (ho : C.IsOrientable) : C.eulerChar ≤ 2 := sorry

theorem eulerChar_le_one [Finite Φ] (hC : C.IsMap) (ho : ¬ C.IsOrientable) :
    C.eulerChar ≤ 1 := sorry

end Carte

/-! ## Layer 9: regular polytopes and examples -/

/-- The intersection property of a string group generated by involutions. -/
def HasIntersectionProperty {n : ℕ} {G : Type*} [Group G] (ρ : Fin (n + 1) → G) : Prop :=
  ∀ I J : Set (Fin (n + 1)),
    Subgroup.closure (ρ '' I) ⊓ Subgroup.closure (ρ '' J) = Subgroup.closure (ρ '' (I ∩ J))

theorem card_H₃_group : Nat.card CoxeterMatrix.H₃.Group = 120 := sorry

/-- The longest element `(s₀ s₁ s₂)⁵` of the icosahedral group. -/
def hemiW₀ : CoxeterMatrix.H₃.Group :=
  (CoxeterMatrix.H₃.simple 0 * CoxeterMatrix.H₃.simple 1 * CoxeterMatrix.H₃.simple 2) ^ 5

theorem hemiW₀_mem_center : hemiW₀ ∈ Subgroup.center CoxeterMatrix.H₃.Group := sorry

instance : (Subgroup.zpowers hemiW₀).Normal := sorry

/-- The hemi-icosahedron. -/
def hemiIcosahedron : Carte 2 (CoxeterMatrix.H₃.Group ⧸ Subgroup.zpowers hemiW₀) :=
  regularCarte _ (fun i => QuotientGroup.mk (CoxeterMatrix.H₃.simple i)) sorry sorry

theorem hemiIcosahedron_isMap : hemiIcosahedron.IsMap := sorry

theorem hemiIcosahedron_eulerChar : hemiIcosahedron.eulerChar = 1 := sorry

theorem hemiIcosahedron_not_isOrientable : ¬ hemiIcosahedron.IsOrientable := sorry

theorem nonempty_mulEquiv_alternatingGroup :
    Nonempty ((CoxeterMatrix.H₃.Group ⧸ Subgroup.zpowers hemiW₀) ≃* alternatingGroup (Fin 5)) :=
  sorry

/-- The three affine involutions of the regular triangulation of the torus `(ZMod n)²`. -/
def torusInvolution (n : ℕ) : Fin 3 → Perm (ZMod n × ZMod n)
  | 0 => Function.Involutive.toPerm (fun p => (1 - p.1 + p.2, p.2)) sorry
  | 1 => Function.Involutive.toPerm (fun p => (p.1, p.1 - p.2)) sorry
  | 2 => Function.Involutive.toPerm (fun p => (p.1 - p.2, -p.2)) sorry

abbrev torusGroup (n : ℕ) : Subgroup (Perm (ZMod n × ZMod n)) :=
  Subgroup.closure (Set.range (torusInvolution n))

theorem card_torusGroup (n : ℕ) (hn : 3 ≤ n) : Nat.card (torusGroup n) = 12 * n ^ 2 := sorry

/-- The regular map `{3,6}` on the torus with vertex set `(ZMod n)²`. -/
def torusTriangulation (n : ℕ) : Carte 2 (torusGroup n) :=
  regularCarte _ (fun i => ⟨torusInvolution n i, Subgroup.subset_closure (Set.mem_range_self i)⟩)
    sorry sorry

theorem torusTriangulation_eulerChar (n : ℕ) (hn : 3 ≤ n) :
    (torusTriangulation n).eulerChar = 0 := sorry

/-! ## Layer 10: the geometric representation -/

/-- The bilinear form `-cos (π / m)`, and `-1` for `m = 0` (that is, `∞`). -/
def cosForm {B : Type*} (M : CoxeterMatrix B) (i j : B) : ℝ :=
  if M i j = 0 then -1 else -Real.cos (Real.pi / M i j)

/-- The reflection `v ↦ v - 2 B(αᵢ, v) αᵢ`. -/
def geomReflection {B : Type*} [Fintype B] [DecidableEq B] (M : CoxeterMatrix B) (i : B) :
    Module.End ℝ (B → ℝ) :=
  LinearMap.id - (2 : ℝ) • LinearMap.smulRight
    (∑ j, cosForm M i j • (LinearMap.proj j : (B → ℝ) →ₗ[ℝ] ℝ))
    (Pi.single i 1 : B → ℝ)

def geometricRepresentation {B : Type*} [Fintype B] [DecidableEq B] (M : CoxeterMatrix B) :
    M.Group →* Module.End ℝ (B → ℝ) :=
  M.toCoxeterSystem.lift ⟨geomReflection M, sorry⟩

/-- Tits' theorem (Humphreys, Corollary 5.4). -/
theorem geometricRepresentation_injective {B : Type*} [Fintype B] [DecidableEq B]
    (M : CoxeterMatrix B) : Function.Injective (geometricRepresentation M) := sorry

theorem orderOf_simple_mul_simple {B : Type*} [Finite B] (M : CoxeterMatrix B) (i j : B) :
    orderOf (M.simple i * M.simple j) = M i j := sorry

end

end TauCetiRoadmap.PseudolineArrangementsAndOrientedMatroids
