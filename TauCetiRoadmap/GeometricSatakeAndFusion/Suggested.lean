import Mathlib

/-!
# Geometric Satake and fusion: representative target signatures

The roadmap is README.md, the definitive mathematical specification. This file records suggested
forms, not an exhaustive checklist. It states the elementary lattice, matrix and parity results
on carriers available in the pinned libraries. The local Hecke stacks, bounded Grassmannians,
ULA and Satake categories, fusion, relative reconstruction and the Satake equivalences are
README targets: their geometric carriers and hypotheses are part of those constructions.
In particular, the numerical trace identities below specify the sign convention; the geometric
trace comparison also requires Frobenius descent and the bounded sheaf correspondences.
-/

noncomputable section

universe u v w

namespace TauCeti.GeometricSatake

open scoped BigOperators TensorProduct

/-! ## Layer GS0: double actions, lattice bounds and determinant loci -/

/-- Changes of the two trivializations act by left multiplication and inverse right
multiplication. This action presents the local quotient before stackification (FS VI.1.6). -/
@[instance_reducible]
def localHeckeAction (G : Type u) [Group G] (H : Subgroup G) : MulAction (H × H) G where
  smul h g := (h.1 : G) * g * (h.2 : G)⁻¹
  one_smul g := by
    change ((1 : H × H).1 : G) * g * ((1 : H × H).2 : G)⁻¹ = g
    simp
  mul_smul h k g := by
    change (((h * k).1 : H) : G) * g * (((h * k).2 : H) : G)⁻¹ =
      (h.1 : G) * ((k.1 : G) * g * (k.2 : G)⁻¹) * (h.2 : G)⁻¹
    simp [mul_assoc]

/-- The identity modification retains the diagonal stabilizer (README, local Hecke stack). -/
theorem localHeckeAction_unit_stabilizer (G : Type u) [Group G] (H : Subgroup G)
    (h : H × H) :
    @SMul.smul (H × H) G (localHeckeAction G H).toSMul h 1 = 1 ↔ h.1 = h.2 := sorry

/-- For a trivial group, the modification and every automorphism label are unique. -/
theorem hecke_trivial_group (G : Type u) [Group G] [Subsingleton G] (H : Subgroup G) :
    (∀ g : G, g = 1) ∧ (∀ h : H × H, h = 1) ∧
      ∀ (h : H × H) (g : G),
        @SMul.smul (H × H) G (localHeckeAction G H).toSMul h g = g := sorry

-- The two trivializations have opposite signs.
example (G : Type u) [Group G] (h : (⊤ : Subgroup G)) :
    @SMul.smul ((⊤ : Subgroup G) × (⊤ : Subgroup G)) G
      (localHeckeAction G ⊤).toSMul (h, 1) 1 = (h : G) ∧
    @SMul.smul ((⊤ : Subgroup G) × (⊤ : Subgroup G)) G
      (localHeckeAction G ⊤).toSMul (1, h) 1 = (h : G)⁻¹ := by
  change (h : G) * 1 * 1⁻¹ = (h : G) ∧ (1 : G) * 1 * (h : G)⁻¹ = (h : G)⁻¹
  simp

-- A nonidentity diagonal label survives; taking the orbit set loses this inertia.
example :
    let H := (⊤ : Subgroup (Multiplicative ℤ))
    let h : H := ⟨Multiplicative.ofAdd 1, Subgroup.mem_top _⟩
    (h : Multiplicative ℤ) ≠ 1 ∧
      @SMul.smul (H × H) (Multiplicative ℤ)
        (localHeckeAction (Multiplicative ℤ) H).toSMul (h, h) 1 = 1 := by
  change Multiplicative.ofAdd (1 : ℤ) ≠ 1 ∧
    Multiplicative.ofAdd (1 : ℤ) * 1 * (Multiplicative.ofAdd (1 : ℤ))⁻¹ = 1
  simp

/-- The integral coroot order for GL_n: equal degree and bounded initial sums. The
geometric Schubert statements apply it to dominant tuples (FS VI.2.2–VI.2.3). -/
def dominanceBound {n : ℕ} (ν μ : Fin n → ℤ) : Prop :=
  (∑ i, ν i) = (∑ i, μ i) ∧
    ∀ j : ℕ, (∑ i with i.val < j, ν i) ≤ (∑ i with i.val < j, μ i)

/-- The partial-sum criterion is exactly the nonnegative integral simple-coroot cone,
including the rank-one torus case n = 0 (README, generic Schubert bounds). -/
theorem dominanceBound_iff_simpleCoroots {n : ℕ} (ν μ : Fin (n + 1) → ℤ) :
    dominanceBound ν μ ↔ ∃ c : Fin n → ℕ,
      μ - ν = ∑ i : Fin n, (c i : ℤ) •
        (Pi.single i.castSucc (1 : ℤ) - Pi.single i.succ (1 : ℤ)) := sorry

/-- On the rank-one torus the integral coroot order is equality of weights. -/
theorem bound_zero_component (a b : ℤ) :
    dominanceBound (fun _ : Fin 1 => a) (fun _ : Fin 1 => b) ↔ a = b := sorry

-- Equal degree permits this degeneration inside a GL₂ component.
example : dominanceBound (![1, 1] : Fin 2 → ℤ) ![2, 0] := by
  constructor
  · norm_num [Fin.sum_univ_two]
  · intro j
    simp only [Finset.sum_filter, Fin.sum_univ_two]
    simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Fin.val_zero, Fin.val_one]
    split_ifs <;> omega

-- Smaller partial sums do not allow a change of component.
example : ¬ dominanceBound (![1, 0] : Fin 2 → ℤ) ![2, 0] := by
  simp [dominanceBound, Fin.sum_univ_two]

/-- Nonnegative quotient types use the same integral dominance relation
(BS §7.1–§7.9); sorting the tuple is a geometric elementary-divisor hypothesis. -/
def wittTypeBound {n : ℕ} (type bound : Fin n → ℕ) : Prop :=
  dominanceBound (fun i => (type i : ℤ)) (fun i => (bound i : ℤ))

/-- Column lengths of a quotient type, the prescribed ranks in a Witt Demazure
filtration (BS §7.10–§7.13). -/
def wittTypeBound_columns {n : ℕ} (lam : Fin n → ℕ) (i : ℕ) : ℕ :=
  (Finset.univ.filter (fun j => i < lam j)).card

/-- A zero bound forces the entire nonnegative quotient type to vanish. -/
theorem wittTypeBound_zero {n : ℕ} (lam : Fin n → ℕ) :
    wittTypeBound lam 0 ↔ lam = 0 := sorry

/-- The zero quotient type has no columns, in every rank and degree. -/
theorem witt_columns_zero (n i : ℕ) :
    wittTypeBound_columns (0 : Fin n → ℕ) i = 0 := sorry

/-- A tuple of ones gives one column of full rank and no later columns. -/
theorem witt_columns_one (n : ℕ) :
    wittTypeBound_columns (fun _ : Fin n => 1) 0 = n ∧
      ∀ i : ℕ, wittTypeBound_columns (fun _ : Fin n => 1) (i + 1) = 0 := sorry

-- A quotient of length one cannot lie in this length-three component.
example : ¬ wittTypeBound (![1, 0, 0] : Fin 3 → ℕ) ![2, 1, 0] := by
  simp [wittTypeBound, dominanceBound, Fin.sum_univ_succ]

-- The two nonzero columns specify different Grassmannian quotient ranks.
example : wittTypeBound_columns (![2, 1, 0] : Fin 3 → ℕ) 0 = 2 ∧
    wittTypeBound_columns (![2, 1, 0] : Fin 3 → ℕ) 1 = 1 := by
  decide

/-- A finite projective embedded lattice spanning K^n (BS §8.1 and §9.4–§9.5).
For Witt geometry B is the ramified Witt ring and K its uniformizer localization;
locally uniform pole bounds belong to the geometric functor in the README. -/
def WittLattice (B K : Type u) [CommRing B] [CommRing K] [Algebra B K] (n : ℕ) : Type u :=
  {L : Submodule B (Fin n → K) // Module.Finite B L ∧ Module.Projective B L ∧
    Submodule.span K (Set.range (fun x : L => (x : Fin n → K))) = ⊤}

/-- Rank zero has no lattice moduli, including over a general coefficient algebra. -/
theorem WittLattice_rank_zero (B K : Type u) [CommRing B] [CommRing K] [Algebra B K] :
    Subsingleton (WittLattice B K 0) := sorry

/-- The rank-zero lattice exists over every coefficient algebra. -/
theorem WittLattice_rank_zero_exists (B K : Type u) [CommRing B] [CommRing K]
    [Algebra B K] : Nonempty (WittLattice B K 0) := sorry

-- With no localization, the standard full module is a lattice.
example (K : Type u) [Field K] (n : ℕ) :
    ∃ L : WittLattice K K n, L.val = ⊤ := by
  refine ⟨⟨⊤, inferInstance, inferInstance, ?_⟩, rfl⟩
  simp

-- The embedded zero module cannot be a rank-one lattice over a field.
example (K : Type u) [Field K] (L : WittLattice K K 1) : L.val ≠ ⊥ := by
  intro h
  have hs := L.property.2.2
  simp [h] at hs

/-- Matrices whose determinant is a unit times the prescribed uniformizer power.
The Greenberg scheme and its jet-level hypotheses are separate geometric targets
(Zhu §1.9–§1.11). -/
def jetDeterminantLocus (B : Type u) [CommRing B] (n : ℕ) (π : B) (N : ℕ) :
    Set (Matrix (Fin n) (Fin n) B) :=
  {A | ∃ u : Bˣ, A.det = (u : B) * π ^ N}

/-- Change of trivialization preserves the prescribed determinant valuation. -/
theorem jetDeterminantLocus_right_invariance (B : Type u) [CommRing B] (n : ℕ)
    (π : B) (N : ℕ) (A g : Matrix (Fin n) (Fin n) B) (hg : IsUnit g.det) :
    A ∈ jetDeterminantLocus B n π N → A * g ∈ jetDeterminantLocus B n π N := sorry

/-- Coefficient change preserves the determinant equation and its unit factor. -/
theorem jetDeterminantLocus_ring_map (B C : Type u) [CommRing B] [CommRing C]
    (f : B →+* C) (n : ℕ) (π : B) (N : ℕ) (A : Matrix (Fin n) (Fin n) B) :
    A ∈ jetDeterminantLocus B n π N →
      A.map f ∈ jetDeterminantLocus C n (f π) N := sorry

/-- A zero rank-one matrix cannot have unit determinant over a coefficient field. -/
theorem jet_zero_excluded (K : Type u) [Field K] (π : K) :
    (0 : Matrix (Fin 1) (Fin 1) K) ∉ jetDeterminantLocus K 1 π 0 := sorry

-- The zero bound contains the identity in every rank.
example (B : Type u) [CommRing B] (n : ℕ) (π : B) :
    (1 : Matrix (Fin n) (Fin n) B) ∈ jetDeterminantLocus B n π 0 := by
  exact ⟨1, by simp⟩

-- In the rank-two cone calculation a truncated right factor is not unique
-- (Zhu B.11); the cone representative is the object with a uniqueness assertion.
example :
    let A : Matrix (Fin 2) (Fin 2) (ZMod 27) := !![3, 0; 0, 3]
    let g : Matrix (Fin 2) (Fin 2) (ZMod 27) := !![1, 9; 0, 1]
    A ∈ jetDeterminantLocus (ZMod 27) 2 3 2 ∧
      A * g = A ∧ Matrix.det g = 1 ∧ g ≠ 1 := by
  refine ⟨⟨1, ?_⟩, ?_⟩
  · norm_num [Matrix.det_fin_two]
  · decide

/-! ## Layer GS1: coefficient flatness at a point -/

/-- The degree-zero point module over ℤ/4 fails the coefficient-flatness test
(FS VI.7.7). Its associated point sheaf is perverse but is also not ULA-perfect. -/
theorem flat_perverse_nonflat_point :
    ¬ Module.Flat (ZMod 4) ((ZMod 4) ⧸ Ideal.span ({2} : Set (ZMod 4))) := sorry

/-! ## Layer GS3: cross-block disjointness and the fusion sign -/

/-- Points of the disjoint-block locus; internal block collisions are allowed
(FS VI.9, pp. 226–227). The geometric open subfunctor is specified in the README. -/
def disjointLegLocus {I : Type u} {K : Type v} {X : Type w} (b : I → K) : Set (I → X) :=
  {x | ∀ i j, b i ≠ b j → x i ≠ x j}

/-- Relabelling legs preserves precisely the same cross-block condition. -/
theorem disjointLegLocus_reindex {I J : Type u} {K : Type v} {X : Type w}
    (e : J ≃ I) (b : I → K) (x : I → X) :
    x ∈ disjointLegLocus b ↔ (x ∘ e) ∈ disjointLegLocus (b ∘ e) := sorry

/-- Two singleton blocks exclude exactly the collision diagonal. -/
theorem test_disjoint_twoSingletons {X : Type u} (x : Fin 2 → X) :
    x ∈ disjointLegLocus (id : Fin 2 → Fin 2) ↔ x 0 ≠ x 1 := sorry

-- A single block permits every collision.
example {I : Type u} {X : Type w} :
    disjointLegLocus (fun _ : I => ()) = (Set.univ : Set (I → X)) := by
  ext x
  simp [disjointLegLocus]

-- Two equal legs in one block are compatible with a distinct third leg.
example {X : Type u} (x y : X) (h : x ≠ y) :
    (![x, x, y] : Fin 3 → X) ∈
      disjointLegLocus (![false, false, true] : Fin 3 → Bool) := by
  intro i j hij
  fin_cases i <;> fin_cases j <;> simp_all [Ne.symm h]

/-- Sum of local Schubert dimensions modulo two (FS VI.9, pp. 228–229).
The geometric dimensions are summed after combining colliding weights. -/
def supportParity {I : Type u} [Fintype I] (dimension : I → ℤ) : ZMod 2 :=
  (∑ i, dimension i : ℤ)

/-- Even changes of local dimension do not change the correction parity. -/
theorem supportParity_dominance {I : Type u} [Fintype I] (d e : I → ℤ)
    (difference : ∀ i, ∃ n : ℤ, d i - e i = 2 * n) :
    supportParity d = supportParity e := sorry

/-- Disjoint union adds the parities used by the tensor symmetry. -/
theorem supportParity_union {I J : Type u} [Fintype I] [Fintype J]
    (d : I → ℤ) (e : J → ℤ) :
    supportParity (Sum.elim d e) = supportParity d + supportParity e := sorry

/-- The unit has parity zero for every finite family of zero dimensions. -/
theorem test_parity_unit {I : Type u} [Fintype I] :
    supportParity (0 : I → ℤ) = 0 := sorry

-- One leg retains its dimension parity.
example (d : ℤ) : supportParity (fun _ : Fin 1 => d) = (d : ZMod 2) := by
  simp [supportParity]

-- Two odd-dimensional legs give even total parity.
example : supportParity (![1, 1] : Fin 2 → ℤ) = 0 := by
  decide

/-- Component correction which turns the graded flip into the ordinary flip. -/
def fusionSign (e f : ZMod 2) : ℤ := if e = 1 ∧ f = 1 then -1 else 1

/-- The correction is trivial in either tensor slot containing the unit. -/
theorem fusionSign_unit (e : ZMod 2) :
    fusionSign 0 e = 1 ∧ fusionSign e 0 = 1 := by
  fin_cases e <;> decide

/-- Tensoring in the first slot multiplies correction scalars. -/
theorem fusionSign_add_left (e f g : ZMod 2) :
    fusionSign (e + f) g = fusionSign e g * fusionSign f g := by
  fin_cases e <;> fin_cases f <;> fin_cases g <;> decide

/-- Tensoring in the second slot multiplies correction scalars. -/
theorem fusionSign_add_right (e f g : ZMod 2) :
    fusionSign e (f + g) = fusionSign e f * fusionSign e g := by
  fin_cases e <;> fin_cases f <;> fin_cases g <;> decide

/-- In characteristic two every correction scalar acts as the identity. -/
theorem fusionSign_char_two {Λ : Type u} [Field Λ] [CharP Λ 2] (e f : ZMod 2) :
    (fusionSign e f : Λ) = 1 := sorry

-- The two associations of three homogeneous tensor factors give the same sign.
example (e f g : ZMod 2) :
    fusionSign e f * fusionSign (e + f) g =
      fusionSign f g * fusionSign e (f + g) := by
  fin_cases e <;> fin_cases f <;> fin_cases g <;> decide

-- Reduction to characteristic two erases even the odd/odd correction.
example (e f : ZMod 2) : (fusionSign e f : ZMod 2) = 1 := by
  fin_cases e <;> fin_cases f <;> decide

/-! ## Layer GS4: integral recovery and trace normalization -/

/-- The flat-module recovery lemma used on coordinate rings in integral dual
identification (FS Lemma VI.11.3, p. 237). The proof works over any domain with
a nonzero element: reduction is injective and uniformizer localization is an
isomorphism. No finite-generation or completeness assumption on the modules is needed. -/
theorem flatModuleIntegralRecovery (R : Type u) [CommRing R] [IsDomain R]
    (π : R) (hπ : π ≠ 0) (M N : Type v) [AddCommGroup M] [AddCommGroup N]
    [Module R M] [Module R N] [Module.Flat R M] [Module.Flat R N]
    (f : M →ₗ[R] N)
    (hres : Function.Injective (f.lTensor (R ⧸ Ideal.span ({π} : Set R))))
    (hloc : Function.Bijective (f.lTensor (Localization.Away π))) :
    Function.Bijective f := sorry

/-- Parity correction of a raw alternating stalk trace. Frobenius descent and
the geometric support are inputs to the trace function in the README. -/
def normalizedTraceFunction {Λ : Type u} {G : Type v} [Field Λ]
    (parity : G → ZMod 2) (rawTrace : G → Λ) : G → Λ :=
  fun g => if parity g = 1 then -rawTrace g else rawTrace g

/-- Biinvariance of both parity and raw trace gives biinvariance of the corrected trace. -/
theorem normalizedTrace_biinvariant {Λ : Type u} {G : Type v} [Field Λ] [Group G]
    (p : G → ZMod 2) (f : G → Λ) (K : Subgroup G)
    (hp : ∀ k ∈ K, ∀ g, p (k * g) = p g ∧ p (g * k) = p g)
    (hf : ∀ k ∈ K, ∀ g, f (k * g) = f g ∧ f (g * k) = f g) :
    ∀ k ∈ K, ∀ g,
      normalizedTraceFunction p f (k * g) = normalizedTraceFunction p f g ∧
      normalizedTraceFunction p f (g * k) = normalizedTraceFunction p f g := sorry

/-- The component sign cancels the perverse-shift sign and leaves the half twist
r^(-d). The identification of c with a geometric minuscule coset indicator is
the separate README theorem (Zhu (2.2.7)–(2.2.10); Gross §3). -/
theorem normalizedTrace_minuscule {Λ : Type u} {G : Type v} [Field Λ]
    (r : Λˣ) (d : ℕ) (c : G → Λ) :
    normalizedTraceFunction (fun _ => (d : ZMod 2))
      (fun g => (-1 : Λ) ^ d * (↑(r⁻¹) : Λ) ^ d * c g) =
      fun g => (↑(r⁻¹) : Λ) ^ d * c g := sorry

/-- With canonical unit descent the parity correction preserves the subgroup
indicator and its coefficient one (README, normalized Frobenius function). -/
theorem test_trace_unit {Λ : Type u} {G : Type v} [Field Λ] [Group G]
    (K : Subgroup G) :
    normalizedTraceFunction (fun _ : G => 0)
      ((K : Set G).indicator (fun _ => (1 : Λ))) =
      (K : Set G).indicator (fun _ => (1 : Λ)) := sorry

-- A torus weight has no rho sign correction.
example {Λ : Type u} [Field Λ] (n : ℤ) :
    normalizedTraceFunction (fun _ : ℤ => 0)
      (fun m => if m = n then (1 : Λ) else 0) =
      fun m => if m = n then (1 : Λ) else 0 := by
  funext m
  simp [normalizedTraceFunction]

-- On the PGL₂ minuscule cell the odd shift has raw sign minus, giving r⁻¹.
example {Λ : Type u} [Field Λ] (r : Λˣ) :
    normalizedTraceFunction (fun _ : Unit => 1)
      (fun _ => -(↑(r⁻¹) : Λ)) () = ↑(r⁻¹) := by
  simp [normalizedTraceFunction]

/- The README also specifies the elementary APIs localHeckeAction_formula,
dominanceBound_iff, dominanceBound_refl, dominanceBound_trans,
wittTypeBound_dominance, wittTypeBound_closed_under_dominance,
WittLattice_standard, WittLattice_ext, jetDeterminantLocus_mem, disjointLegLocus_mem,
disjointLegLocus_baseChange, normalizedTrace_add and normalizedTrace_halfTwist.
The geometric carriers, their full APIs, and the Satake milestones are specified there. -/

end TauCeti.GeometricSatake
