import Mathlib
import TauCeti.GroupTheory.SpecificGroups.Braid.Basic

/-!
# Inverse Galois theory and arithmetic fundamental groups, Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, with the few definitions they need: the
Hurwitz action of the pinned Artin braid group `TauCeti.BraidGroup n` on branch tuples (planned by
InverseGaloisAndArithmeticFundamentalGroups, §IG.3.2, and restated here because a roadmap module
cannot be imported), the fibres
of the marked and unmarked Hurwitz covers over the base configuration, the extension to every
`n` of Tau Ceti's block inclusion `TauCeti.BraidGroup.natAdd` of braid groups, and the
stabilization operator `U` (the sum over `g ∈ c` of gluing the constant block `(g, …, g)`) on the
permutation representations. Since `Conf_n` is a `K(B_n, 1)` and a
Hurwitz space is the covering space of `Conf_n` with fibre `X`, its homology with coefficients in
a field `k` is the group homology `H_p(B_n; k[X])`; the stability statements below are written in
that form (README, Layer 0, §0.5, *Hurwitz homology as braid-group homology*).

Headline theorems stated here:

* `hurwitz_homological_stability`: Ellenberg–Venkatesh–Westerland, Theorem 6.1 and
  Corollary 6.2, for marked, full-monodromy and unmarked Hurwitz spaces, with constants uniform
  in the coefficient field;
* `uniform_betti_bound`: the topological uniform Betti bound behind EVW Proposition 7.8.

Headline theorems not statable at the pins:

* the uniform étale Betti bound for the arithmetic Hurwitz schemes `Hn^c_{G,n}` over `F̄_q`
  (EVW Proposition 7.8): Mathlib has pro-étale `ℓ`-adic cohomology of schemes
  (`AlgebraicGeometry.Scheme.EllAdicCohomology`) but no Hurwitz scheme, a moduli construction
  supplied by the parent roadmap;
* stabilization of a graded module from its low K-homology (EVW Theorem 4.2): Tau Ceti has the
  category `TauCeti.GradedModuleCat` of internally graded modules over a graded algebra and the
  graded balanced tensor product, but not the component algebra, the monoid algebra of the
  braid-orbit monoid with its length grading, nor the K-complex with its differential and its
  homology; both are constructions of the roadmap, not short definitions;
* `(n − 2)`-connectivity of the disc arc complex (Hatcher–Wahl Proposition 7.2): there is no
  carrier for isotopy classes of embedded arcs in a marked disc.
-/

namespace TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroupsPartII

open TauCeti TauCeti.BraidGroup

/-! ## Layer 0: nonsplitting classes, the Hurwitz representation and the component ring -/

/-- The nonsplitting property of a conjugacy class `c` of `G` (EVW Definition 3.1): `c` generates
`G`, and for every subgroup `H` any two elements of `c ∩ H` are conjugate in `H`, that is, `c ∩ H`
is empty or a single conjugacy class of `H`. -/
def IsNonsplitting {G : Type*} [Group G] (c : ConjClasses G) : Prop :=
  Subgroup.closure c.carrier = ⊤ ∧
    ∀ (H : Subgroup G) (g h : G), g ∈ c.carrier → h ∈ c.carrier → g ∈ H → h ∈ H →
      ∃ x ∈ H, x * g * x⁻¹ = h

variable {n : ℕ}

section BraidAction

variable {G : Type*} [Group G]

/-- The positive Hurwitz move on an `n`-tuple at the adjacent positions `i, i + 1` (zero-based):
`(a, b) ↦ (a b a⁻¹, a)`, the other entries unchanged. -/
def hurwitzMoveFun (i : Fin (n - 1)) (s : Fin n → G) : Fin n → G := fun j =>
  if j = strand i then s (strand i) * s (strandSucc i) * (s (strand i))⁻¹
  else if j = strandSucc i then s (strand i) else s j

/-- The inverse move `(a, b) ↦ (b, b⁻¹ a b)`. -/
def hurwitzMoveInvFun (i : Fin (n - 1)) (s : Fin n → G) : Fin n → G := fun j =>
  if j = strand i then s (strandSucc i)
  else if j = strandSucc i then (s (strandSucc i))⁻¹ * s (strand i) * s (strandSucc i)
  else s j

/-- The positive Hurwitz move at the adjacent positions `i, i + 1`, as a permutation of tuples;
its inverse is `hurwitzMoveInvFun`. -/
def hurwitzMove (i : Fin (n - 1)) : Equiv.Perm (Fin n → G) where
  toFun := hurwitzMoveFun i
  invFun := hurwitzMoveInvFun i
  left_inv s := by
    have h : strandSucc i ≠ strand i := (strand_ne_strandSucc i).symm
    funext x
    by_cases h1 : x = strand i
    · subst h1; simp [hurwitzMoveInvFun, hurwitzMoveFun, *]
    by_cases h2 : x = strandSucc i
    · subst h2; simp [hurwitzMoveInvFun, hurwitzMoveFun, *]; group
    · simp [hurwitzMoveInvFun, hurwitzMoveFun, *]
  right_inv s := by
    have h : strandSucc i ≠ strand i := (strand_ne_strandSucc i).symm
    funext x
    by_cases h1 : x = strand i
    · subst h1; simp [hurwitzMoveInvFun, hurwitzMoveFun, *]; group
    by_cases h2 : x = strandSucc i
    · subst h2; simp [hurwitzMoveInvFun, hurwitzMoveFun, *]
    · simp [hurwitzMoveInvFun, hurwitzMoveFun, *]

/-- Moves at positions two or more apart commute. -/
theorem hurwitzMove_comm {i j : Fin (n - 1)} (hij : (i : ℕ) + 2 ≤ j ∨ (j : ℕ) + 2 ≤ i) :
    (hurwitzMove i : Equiv.Perm (Fin n → G)) * hurwitzMove j =
      hurwitzMove j * hurwitzMove i := by
  have h1 : strandSucc i ≠ strand i :=
    Fin.ne_of_val_ne (by rw [val_strandSucc, val_strand]; omega)
  have h2 : strand j ≠ strand i := Fin.ne_of_val_ne (by rw [val_strand, val_strand]; omega)
  have h3 : strandSucc j ≠ strand i :=
    Fin.ne_of_val_ne (by rw [val_strandSucc, val_strand]; omega)
  have h4 : strand j ≠ strandSucc i :=
    Fin.ne_of_val_ne (by rw [val_strand, val_strandSucc]; omega)
  have h5 : strandSucc j ≠ strandSucc i :=
    Fin.ne_of_val_ne (by rw [val_strandSucc, val_strandSucc]; omega)
  have h6 : strandSucc j ≠ strand j :=
    Fin.ne_of_val_ne (by rw [val_strandSucc, val_strand]; omega)
  have h1' := h1.symm; have h2' := h2.symm; have h3' := h3.symm
  have h4' := h4.symm; have h5' := h5.symm; have h6' := h6.symm
  ext s x
  simp only [Equiv.Perm.mul_apply, hurwitzMove, Equiv.coe_fn_mk]
  by_cases a1 : x = strand i
  · subst a1; simp [hurwitzMoveFun, *]
  by_cases a2 : x = strandSucc i
  · subst a2; simp [hurwitzMoveFun, *]
  by_cases a3 : x = strand j
  · subst a3; simp [hurwitzMoveFun, *]
  by_cases a4 : x = strandSucc j
  · subst a4; simp [hurwitzMoveFun, *]
  · simp [hurwitzMoveFun, *]

/-- Adjacent moves satisfy the braid relation. -/
theorem hurwitzMove_braid {i j : Fin (n - 1)} (hij : (i : ℕ) + 1 = j) :
    (hurwitzMove i : Equiv.Perm (Fin n → G)) * hurwitzMove j * hurwitzMove i =
      hurwitzMove j * hurwitzMove i * hurwitzMove j := by
  have e : strand j = strandSucc i := strand_eq_strandSucc_of_succ hij
  have h1 : strandSucc i ≠ strand i := (strand_ne_strandSucc i).symm
  have h2 : strandSucc j ≠ strand i := (strand_ne_strandSucc_of_succ hij).symm
  have h3 : strandSucc j ≠ strandSucc i := by rw [← e]; exact (strand_ne_strandSucc j).symm
  have h1' := h1.symm; have h2' := h2.symm; have h3' := h3.symm
  ext s x
  simp only [Equiv.Perm.mul_apply, hurwitzMove, Equiv.coe_fn_mk]
  by_cases a1 : x = strand i
  · subst a1; simp [hurwitzMoveFun, *]; group
  by_cases a2 : x = strandSucc i
  · subst a2; simp [hurwitzMoveFun, *]
  by_cases a4 : x = strandSucc j
  · subst a4; simp [hurwitzMoveFun, *]
  · simp [hurwitzMoveFun, *]

/-- The left Hurwitz action of the Artin braid group `B_n` on `G^n`: the generator `σ_i` acts by
the `i`-th positive move (InverseGaloisAndArithmeticFundamentalGroups §IG.3.2, *The Hurwitz braid
action*). -/
def hurwitzAction (n : ℕ) (G : Type*) [Group G] : BraidGroup n →* Equiv.Perm (Fin n → G) :=
  lift hurwitzMove (fun h => hurwitzMove_comm h) (fun {i j} h => by
    rcases h with h | h
    · exact hurwitzMove_braid h
    · exact (hurwitzMove_braid h).symm)

/-- A property of tuples preserved by every move is preserved by every braid. -/
theorem hurwitzAction_iff (P : (Fin n → G) → Prop) (h : ∀ i s, P (hurwitzMoveFun i s) ↔ P s)
    (b : BraidGroup n) (s : Fin n → G) : P (hurwitzAction n G b s) ↔ P s := by
  induction b using sigma_induction_on generalizing s with
  | sigma i => simpa [hurwitzAction, hurwitzMove] using h i s
  | one => simp
  | mul b b' hb hb' => rw [map_mul, Equiv.Perm.mul_apply, hb, hb']
  | inv b hb =>
    have := hb ((hurwitzAction n G b)⁻¹ s)
    rw [map_inv]
    simpa using this.symm

/-- A map of tuples intertwining every move with the image of `σ_i` under a homomorphism of braid
groups intertwines every braid. -/
theorem hurwitzAction_comm {m : ℕ} (φ : (Fin n → G) → (Fin m → G))
    (f : BraidGroup n →* BraidGroup m)
    (h : ∀ i s, hurwitzAction m G (f (sigma i)) (φ s) = φ (hurwitzMoveFun i s))
    (b : BraidGroup n) (s : Fin n → G) :
    hurwitzAction m G (f b) (φ s) = φ (hurwitzAction n G b s) := by
  induction b using sigma_induction_on generalizing s with
  | sigma i => simpa [hurwitzAction, hurwitzMove] using h i s
  | one => simp
  | mul b b' hb hb' =>
    simp only [map_mul, Equiv.Perm.mul_apply]
    rw [hb', hb]
  | inv b hb =>
    rw [map_inv, map_inv, Equiv.Perm.inv_eq_iff_eq, hb]
    simp

/-- The block inclusion `B_n → B_(m+n)` on the last `n` strands, `σ_i ↦ σ_(m+i)`, for every `n`:
Tau Ceti's `TauCeti.BraidGroup.natAdd m` for `n ≥ 1`, and the trivial homomorphism out of the
trivial group `B_0`. -/
def shiftHom (m : ℕ) : (n : ℕ) → BraidGroup n →* BraidGroup (m + n)
  | 0 => 1
  | _ + 1 => natAdd m

/-- Concatenation with a fixed prefix of length `m` is equivariant along the block inclusion. -/
theorem hurwitzAction_shift (m : ℕ) (t : Fin m → G) (b : BraidGroup n) (s : Fin n → G) :
    hurwitzAction (m + n) G (shiftHom m n b) (Fin.append t s) =
      Fin.append t (hurwitzAction n G b s) := by
  have hs : ∀ (k : ℕ) (j : Fin (k - 1)),
      shiftHom m k (sigma j) = sigma ⟨m + j, by have := j.isLt; omega⟩ := by
    intro k j
    cases k with
    | zero => exact Fin.elim0 j
    | succ k => exact (natAdd_sigma m j).trans (congrArg sigma (Fin.ext rfl))
  refine hurwitzAction_comm (Fin.append t) (shiftHom m n) (fun i s => ?_) b s
  rw [hs n i]
  simp only [hurwitzAction, hurwitzMove, lift_sigma, Equiv.coe_fn_mk]
  have e1 : (strand (⟨m + i, by have := i.isLt; omega⟩ : Fin (m + n - 1)) : Fin (m + n)) =
      Fin.natAdd m (strand i) := Fin.ext (by simp)
  have e2 : (strandSucc (⟨m + i, by have := i.isLt; omega⟩ : Fin (m + n - 1)) : Fin (m + n)) =
      Fin.natAdd m (strandSucc i) := Fin.ext (by simp; omega)
  funext x
  refine Fin.addCases (fun y => ?_) (fun z => ?_) x
  · have n1 : Fin.castAdd n y ≠ Fin.natAdd m (strand i) :=
      Fin.ne_of_val_ne (by simp only [Fin.val_castAdd, Fin.val_natAdd]; omega)
    have n2 : Fin.castAdd n y ≠ Fin.natAdd m (strandSucc i) :=
      Fin.ne_of_val_ne (by simp only [Fin.val_castAdd, Fin.val_natAdd]; omega)
    simp [hurwitzMoveFun, e1, e2, n1, n2]
  · simp [hurwitzMoveFun, e1, e2]

end BraidAction

variable {G : Type} [Group G]

/-- A move preserves the condition that every entry lies in a conjugacy class `c`. -/
theorem hurwitzMoveFun_mem_iff (c : ConjClasses G) (i : Fin (n - 1)) (s : Fin n → G) :
    (∀ j, hurwitzMoveFun i s j ∈ c.carrier) ↔ ∀ j, s j ∈ c.carrier := by
  have key : ∀ a b : G, a * b * a⁻¹ ∈ c.carrier ↔ b ∈ c.carrier := fun a b => by
    simp only [ConjClasses.mem_carrier_iff_mk_eq]
    rw [show ConjClasses.mk (a * b * a⁻¹) = ConjClasses.mk b from
      (ConjClasses.mk_eq_mk_iff_isConj).2 (isConj_iff.2 ⟨a⁻¹, by group⟩)]
  constructor
  · intro h j
    by_cases h1 : j = strand i
    · subst h1
      have := h (strandSucc i)
      simpa [hurwitzMoveFun, (strand_ne_strandSucc i).symm] using this
    by_cases h2 : j = strandSucc i
    · subst h2
      have := h (strand i)
      simpa [hurwitzMoveFun, key] using this
    · simpa [hurwitzMoveFun, h1, h2] using h j
  · intro h j
    unfold hurwitzMoveFun
    split_ifs
    · exact (key _ _).2 (h _)
    · exact h _
    · exact h _

/-- A move preserves the subgroup generated by the entries. -/
theorem closure_range_hurwitzMoveFun (i : Fin (n - 1)) (s : Fin n → G) :
    Subgroup.closure (Set.range (hurwitzMoveFun i s)) = Subgroup.closure (Set.range s) := by
  have hn : strandSucc i ≠ strand i := (strand_ne_strandSucc i).symm
  apply le_antisymm
  · rw [Subgroup.closure_le]
    rintro _ ⟨j, rfl⟩
    unfold hurwitzMoveFun
    split_ifs
    · exact Subgroup.mul_mem _ (Subgroup.mul_mem _ (Subgroup.subset_closure ⟨_, rfl⟩)
        (Subgroup.subset_closure ⟨_, rfl⟩)) (Subgroup.inv_mem _ (Subgroup.subset_closure ⟨_, rfl⟩))
    · exact Subgroup.subset_closure ⟨_, rfl⟩
    · exact Subgroup.subset_closure ⟨_, rfl⟩
  · rw [Subgroup.closure_le]
    rintro _ ⟨j, rfl⟩
    have ha : s (strand i) ∈ Subgroup.closure (Set.range (hurwitzMoveFun i s)) :=
      Subgroup.subset_closure ⟨strandSucc i, by simp [hurwitzMoveFun, hn]⟩
    have hc : s (strand i) * s (strandSucc i) * (s (strand i))⁻¹ ∈
        Subgroup.closure (Set.range (hurwitzMoveFun i s)) :=
      Subgroup.subset_closure ⟨strand i, by simp [hurwitzMoveFun]⟩
    by_cases h1 : j = strand i
    · subst h1; exact ha
    by_cases h2 : j = strandSucc i
    · subst h2
      have := Subgroup.mul_mem _ (Subgroup.mul_mem _ (Subgroup.inv_mem _ ha) hc) ha
      simpa [mul_assoc] using this
    · exact Subgroup.subset_closure ⟨j, by simp [hurwitzMoveFun, h1, h2]⟩

/-- The fibre of the marked Hurwitz cover over the base configuration: tuples with entries in the
class `c`, generating `G` when `full` holds. -/
@[ext]
structure HurwitzFibre (c : ConjClasses G) (full : Bool) (n : ℕ) where
  /-- The branch tuple. -/
  tuple : Fin n → G
  /-- Every entry lies in the class `c`. -/
  mem : ∀ i, tuple i ∈ c.carrier
  /-- Full monodromy, when `full` holds. -/
  gen : full = true → Subgroup.closure (Set.range tuple) = ⊤

/-- Every braid preserves the class condition and, when `full` holds, generation. -/
theorem hurwitzFibre_prop_iff (c : ConjClasses G) (full : Bool) (b : BraidGroup n)
    (s : Fin n → G) :
    ((∀ i, hurwitzAction n G b s i ∈ c.carrier) ∧
      (full = true → Subgroup.closure (Set.range (hurwitzAction n G b s)) = ⊤)) ↔
    ((∀ i, s i ∈ c.carrier) ∧ (full = true → Subgroup.closure (Set.range s) = ⊤)) :=
  hurwitzAction_iff (fun t => (∀ i, t i ∈ c.carrier) ∧
      (full = true → Subgroup.closure (Set.range t) = ⊤))
    (fun i t => by rw [hurwitzMoveFun_mem_iff, closure_range_hurwitzMoveFun]) b s

/-- The Hurwitz action of `B_n` on the fibre: the monodromy action of `π₁(Conf_n) = B_n`. -/
instance HurwitzFibre.instMulAction (c : ConjClasses G) (full : Bool) (n : ℕ) :
    MulAction (BraidGroup n) (HurwitzFibre c full n) where
  smul b s := ⟨hurwitzAction n G b s.tuple, ((hurwitzFibre_prop_iff c full b s.tuple).2
    ⟨s.mem, s.gen⟩).1, ((hurwitzFibre_prop_iff c full b s.tuple).2 ⟨s.mem, s.gen⟩).2⟩
  one_smul s := HurwitzFibre.ext (show hurwitzAction n G 1 s.tuple = s.tuple by simp)
  mul_smul b b' s := HurwitzFibre.ext
    (show hurwitzAction n G (b * b') s.tuple =
      hurwitzAction n G b (hurwitzAction n G b' s.tuple) by simp)

/-- Gluing the constant block `(g, …, g)` of length `m` on the left. -/
def glue (c : ConjClasses G) (full : Bool) (m : ℕ) (g : c.carrier) (s : HurwitzFibre c full n) :
    HurwitzFibre c full (m + n) where
  tuple := Fin.append (fun _ : Fin m => (g : G)) s.tuple
  mem j := Fin.addCases (fun y => by simp) (fun z => by simpa using s.mem z) j
  gen hf := by
    rw [eq_top_iff, ← s.gen hf]
    refine Subgroup.closure_mono ?_
    rintro _ ⟨j, rfl⟩
    exact ⟨Fin.natAdd m j, by simp⟩

/-- Gluing a constant block is equivariant along the block inclusion. -/
theorem glue_smul (c : ConjClasses G) (full : Bool) (m : ℕ) (g : c.carrier) (b : BraidGroup n)
    (s : HurwitzFibre c full n) : glue c full m g (b • s) = shiftHom m n b • glue c full m g s :=
  HurwitzFibre.ext (hurwitzAction_shift m (fun _ => (g : G)) b s.tuple).symm

/-- The gluing map of a constant block, as a morphism of braid-group representations along the
block inclusion. -/
noncomputable def glueRepHom (k : Type) [Field k] (c : ConjClasses G) (full : Bool) (m n : ℕ)
    (g : c.carrier) :
    Rep.ofMulAction k (BraidGroup n) (HurwitzFibre c full n) ⟶
      Rep.res (shiftHom m n)
        (Rep.ofMulAction k (BraidGroup (m + n)) (HurwitzFibre c full (m + n))) :=
  Rep.ofHom ⟨MonoidAlgebra.mapDomainLinearMap k k (glue c full m g), fun b => by
    ext s
    simp [MonoidAlgebra.mapDomainLinearMap_single, glue_smul]⟩

open Classical in
/-- The marked stabilization operator `U`: the sum over `g ∈ c` of gluing `(g, …, g)`. -/
noncomputable def markedStabilizer [Fintype G] (k : Type) [Field k] (c : ConjClasses G)
    (full : Bool) (m n : ℕ) :
    Rep.ofMulAction k (BraidGroup n) (HurwitzFibre c full n) ⟶
      Rep.res (shiftHom m n)
        (Rep.ofMulAction k (BraidGroup (m + n)) (HurwitzFibre c full (m + n))) :=
  ∑ g : c.carrier, glueRepHom k c full m n g

/-- A conjugacy class is closed under conjugation. -/
theorem conj_mem_carrier {c : ConjClasses G} {x : G} (hx : x ∈ c.carrier) (h : G) :
    h * x * h⁻¹ ∈ c.carrier := by
  rw [ConjClasses.mem_carrier_iff_mk_eq] at hx ⊢
  rw [← hx]
  exact (ConjClasses.mk_eq_mk_iff_isConj).2 (isConj_iff.2 ⟨h⁻¹, by group⟩)

/-- Simultaneous conjugation of a fibre point by `h`. -/
def conjFibre {c : ConjClasses G} {full : Bool} {n : ℕ} (h : G) (s : HurwitzFibre c full n) :
    HurwitzFibre c full n where
  tuple i := h * s.tuple i * h⁻¹
  mem i := conj_mem_carrier (s.mem i) h
  gen hf := by
    have e : Set.range (fun i => h * s.tuple i * h⁻¹) =
        (MulAut.conj h).toMonoidHom '' Set.range s.tuple := by
      ext x; simp [MulAut.conj_apply]
    rw [e, ← MonoidHom.map_closure, s.gen hf]
    exact Subgroup.map_top_of_surjective _ (MulEquiv.surjective _)

/-- Moves commute with simultaneous conjugation. -/
theorem hurwitzMoveFun_conj (h : G) (i : Fin (n - 1)) (s : Fin n → G) :
    hurwitzMoveFun i (fun j => h * s j * h⁻¹) = fun j => h * hurwitzMoveFun i s j * h⁻¹ := by
  funext j
  unfold hurwitzMoveFun
  split_ifs <;> group

/-- The braid action commutes with simultaneous conjugation. -/
theorem smul_conjFibre {c : ConjClasses G} {full : Bool} (h : G) (b : BraidGroup n)
    (s : HurwitzFibre c full n) : b • conjFibre h s = conjFibre h (b • s) :=
  HurwitzFibre.ext (hurwitzAction_comm (fun t j => h * t j * h⁻¹) (MonoidHom.id _)
    (fun i t => by simpa [hurwitzAction, hurwitzMove] using hurwitzMoveFun_conj h i t) b s.tuple)

/-- Fibre points equivalent under simultaneous conjugation. -/
def conjSetoid (c : ConjClasses G) (full : Bool) (n : ℕ) : Setoid (HurwitzFibre c full n) where
  r s t := ∃ h : G, t = conjFibre h s
  iseqv := ⟨fun s => ⟨1, HurwitzFibre.ext (by funext i; simp [conjFibre])⟩,
    fun ⟨h, e⟩ => ⟨h⁻¹, by
      subst e; exact HurwitzFibre.ext (by funext i; simp [conjFibre]; group)⟩,
    fun ⟨h, e⟩ ⟨h', e'⟩ => ⟨h' * h, by
      subst e e'; exact HurwitzFibre.ext (by funext i; simp [conjFibre]; group)⟩⟩

/-- The fibre of the unmarked Hurwitz cover: fibre points up to simultaneous conjugation. -/
abbrev UnmarkedFibre (c : ConjClasses G) (full : Bool) (n : ℕ) : Type :=
  Quotient (conjSetoid c full n)

/-- The induced action of `B_n` on classes under simultaneous conjugation. -/
instance UnmarkedFibre.instMulAction (c : ConjClasses G) (full : Bool) (n : ℕ) :
    MulAction (BraidGroup n) (UnmarkedFibre c full n) where
  smul b := Quotient.map (b • ·) (fun s t ⟨h, e⟩ => ⟨h, by rw [e, smul_conjFibre]⟩)
  one_smul q := by
    induction q using Quotient.inductionOn with
    | h s => exact congrArg (Quotient.mk _) (one_smul _ s)
  mul_smul b b' q := by
    induction q using Quotient.inductionOn with
    | h s => exact congrArg (Quotient.mk _) (mul_smul b b' s)

/-- The class of a fibre point. -/
abbrev UnmarkedFibre.mk {c : ConjClasses G} {full : Bool} {n : ℕ} (s : HurwitzFibre c full n) :
    UnmarkedFibre c full n :=
  Quotient.mk _ s

/-- Gluing `(g, …, g)` onto a conjugate is the conjugate of gluing `(h⁻¹ g h, …)`. -/
theorem glue_conjFibre (c : ConjClasses G) (full : Bool) (m : ℕ) (g : c.carrier) (h : G)
    (s : HurwitzFibre c full n) :
    glue c full m g (conjFibre h s) =
      conjFibre h (glue c full m ⟨h⁻¹ * g * h, by simpa using conj_mem_carrier g.2 h⁻¹⟩ s) := by
  refine HurwitzFibre.ext (funext fun j => ?_)
  refine Fin.addCases (fun y => ?_) (fun z => ?_) j
  · simp [glue, conjFibre]; group
  · simp [glue, conjFibre]

open Classical in
/-- The sum over `g ∈ c` of the classes of the glued points; it depends only on the class of the
input point. -/
noncomputable def unmarkedGlueSum (k : Type) [Field k] [Fintype G] (c : ConjClasses G)
    (full : Bool) (m : ℕ) (s : HurwitzFibre c full n) :
    MonoidAlgebra k (UnmarkedFibre c full (m + n)) :=
  ∑ g : c.carrier, MonoidAlgebra.single (UnmarkedFibre.mk (glue c full m g s)) 1

/-- The glue sum is invariant under simultaneous conjugation of the input. -/
theorem unmarkedGlueSum_conj (k : Type) [Field k] [Fintype G] (c : ConjClasses G)
    (full : Bool) (m : ℕ) (h : G) (s : HurwitzFibre c full n) :
    unmarkedGlueSum k c full m (conjFibre h s) = unmarkedGlueSum k c full m s := by
  classical
  unfold unmarkedGlueSum
  let e : c.carrier ≃ c.carrier :=
    { toFun := fun g => ⟨h⁻¹ * g * h, by simpa using conj_mem_carrier g.2 h⁻¹⟩
      invFun := fun g => ⟨h * g * h⁻¹, conj_mem_carrier g.2 h⟩
      left_inv := fun g => Subtype.ext (by simp; group)
      right_inv := fun g => Subtype.ext (by simp; group) }
  refine Fintype.sum_equiv e _ _ (fun g => ?_)
  congr 1
  exact (Quot.sound (show (conjSetoid c full (m + n)).r _ _ from
    ⟨h, glue_conjFibre c full m g h s⟩)).symm

/-- The glue sum depends only on the class of the input. -/
theorem unmarkedGlueSum_eq_of_mk_eq (k : Type) [Field k] [Fintype G] (c : ConjClasses G)
    (full : Bool) (m : ℕ) {s t : HurwitzFibre c full n}
    (hst : UnmarkedFibre.mk s = UnmarkedFibre.mk t) :
    unmarkedGlueSum k c full m s = unmarkedGlueSum k c full m t := by
  obtain ⟨h, e⟩ := Quotient.exact hst
  rw [e, unmarkedGlueSum_conj]

/-- The unmarked stabilization operator, induced by `U` on classes under simultaneous
conjugation. -/
noncomputable def unmarkedStabilizer [Fintype G] (k : Type) [Field k] (c : ConjClasses G)
    (full : Bool) (m n : ℕ) :
    Rep.ofMulAction k (BraidGroup n) (UnmarkedFibre c full n) ⟶
      Rep.res (shiftHom m n)
        (Rep.ofMulAction k (BraidGroup (m + n)) (UnmarkedFibre c full (m + n))) :=
  Rep.ofHom ⟨Finsupp.linearCombination k
      (fun q : UnmarkedFibre c full n => unmarkedGlueSum k c full m (Quotient.out q)) ∘ₗ
      (MonoidAlgebra.coeffLinearEquiv k).toLinearMap, fun b => by
    refine MonoidAlgebra.lhom_ext' fun q => LinearMap.ext_ring ?_
    have hq : UnmarkedFibre.mk (Quotient.out (b • q)) =
        UnmarkedFibre.mk (b • Quotient.out q) := by
      show UnmarkedFibre.mk (Quotient.out (b • q)) = b • UnmarkedFibre.mk (Quotient.out q)
      simp only [UnmarkedFibre.mk, Quotient.out_eq]
    simp only [LinearMap.coe_comp, Function.comp_apply, MonoidAlgebra.lsingle_apply,
      Representation.ofMulAction_single, LinearEquiv.coe_coe, MonoidAlgebra.coeffLinearEquiv_apply,
      MonoidAlgebra.coeff_single, Finsupp.linearCombination_single, one_smul, MonoidHom.comp_apply]
    rw [unmarkedGlueSum_eq_of_mk_eq k c full m hq]
    classical
    simp only [unmarkedGlueSum, map_sum, Representation.ofMulAction_single, glue_smul]
    rfl⟩

/-! ## Layer 4: linear stability for marked, full-monodromy and unmarked Hurwitz spaces -/

/-- Homological stability for Hurwitz spaces (Ellenberg–Venkatesh–Westerland, Theorem 6.1 and
Corollary 6.2). For a nonsplitting class `c` of a finite group `G` there are a block length `m > 0`
divisible by the order of the elements of `c` and constants `A, B` such that, for every field `k` in
which `|G|` is invertible, every homological degree `p` and every `n > A p + B`, the stabilization
operator `U` induces isomorphisms `H_p(Hur_n; k) → H_p(Hur_(n+m); k)`. Here `Hur_n` is the marked
Hurwitz space of `c`-valued covers (`full = false`) or its full-monodromy subspace
(`full = true`), and the same holds for their quotients by simultaneous conjugation; homology is
written as braid-group homology with permutation coefficients. -/
theorem hurwitz_homological_stability [Fintype G] (c : ConjClasses G) (hc : IsNonsplitting c) :
    ∃ m : ℕ, 0 < m ∧ (∀ g ∈ c.carrier, g ^ m = 1) ∧ ∃ A B : ℕ,
      ∀ (k : Type) [Field k], (Fintype.card G : k) ≠ 0 →
        ∀ (full : Bool) (p n : ℕ), A * p + B < n →
          Function.Bijective
              (groupHomology.map (shiftHom m n) (markedStabilizer k c full m n) p).hom ∧
            Function.Bijective
              (groupHomology.map (shiftHom m n) (unmarkedStabilizer k c full m n) p).hom := by
  sorry

/-! ## Layer 5: finite cell models and uniform Betti numbers -/

/-- The uniform Betti bound (Ellenberg–Venkatesh–Westerland, Proposition 2.5 and the topological
part of the proof of Proposition 7.8): for a nonsplitting class `c` of a finite group `G` there is
`C` such that for every field `k` in which `|G|` is invertible and all `i, n`, the `i`-th homology
of the marked, full-monodromy and unmarked Hurwitz spaces with `n` branch points has dimension at
most `C^(i+1)`. -/
theorem uniform_betti_bound [Fintype G] (c : ConjClasses G) (hc : IsNonsplitting c) :
    ∃ C : ℕ, ∀ (k : Type) [Field k], (Fintype.card G : k) ≠ 0 →
      ∀ (full : Bool) (i n : ℕ),
        Module.rank k (groupHomology (Rep.ofMulAction k (BraidGroup n) (HurwitzFibre c full n)) i) ≤
            ((C ^ (i + 1) : ℕ) : Cardinal) ∧
          Module.rank k
              (groupHomology (Rep.ofMulAction k (BraidGroup n) (UnmarkedFibre c full n)) i) ≤
            ((C ^ (i + 1) : ℕ) : Cardinal) := by
  sorry

end TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroupsPartII
