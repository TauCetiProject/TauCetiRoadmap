import Mathlib

/-!
# AnabelianGeometryAndNonabelianChabauty: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is README.md.
The declarations suggest forms for particular milestones; discharging them does not finish a layer.
This file records light definitions and representative theorem
signatures statable against the pinned APIs; it is not exhaustive. Continuous cocycles retain
their ordered multiplication, gauge classes use a native quotient, and sections are over a fixed
quotient. The linear correspondence and height formulas record their signs and normalization.
Geometric fundamental groups, comparison functors and represented Selmer varieties are targets
of README.md. They are not introduced here by admitted data definitions.
-/

namespace TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty

universe u v w

/-! ## Layer 0: Continuous nonabelian cohomology -/

namespace Nonabelian

variable {G : Type u} {U : Type v} [Group G] [Group U]

/-- The ordered cocycle equation for an action by group automorphisms. -/
def IsCocycle (ρ : G →* MulAut U) (c : G → U) : Prop :=
  ∀ g h, c (g * h) = c g * ρ g (c h)

/-- A continuous cocycle is an actual continuous map satisfying the ordered equation. -/
def Z1 [TopologicalSpace G] [TopologicalSpace U] (ρ : G →* MulAut U) :=
  {c : C(G, U) // IsCocycle ρ c}

/-- Gauge translation uses the source action on the inverse gauge. -/
def gauge (ρ : G →* MulAut U) (a : U) (c : G → U) : G → U :=
  fun g => a * c g * (ρ g a)⁻¹

/-- Equality up to one constant gauge, on the genuine continuous cocycle carrier. -/
def GaugeRelated [TopologicalSpace G] [TopologicalSpace U]
    (ρ : G →* MulAut U) (c d : Z1 ρ) : Prop :=
  ∃ a : U, ∀ g, d.1 g = gauge ρ a c.1 g

/-- The native quotient by gauge equivalence. Its generated equivalence relation agrees with
the single-gauge relation, giving the orbit-set realization described in README.md. -/
def H1 [TopologicalSpace G] [TopologicalSpace U] (ρ : G →* MulAut U) :=
  Quotient (Relation.EqvGen.setoid (GaugeRelated ρ))

/-- The positive defect matches the additive differential after central abelian conversion. -/
def positiveDefect (ρ : G →* MulAut U) (a : G → U) (g h : G) : U :=
  a g * ρ g (a h) * (a (g * h))⁻¹

/-- The cocycle law fixes the identity value. -/
theorem cocycle_one (ρ : G →* MulAut U) {c : G → U} (hc : IsCocycle ρ c) :
    c 1 = 1 := by
  sorry

/-- Gauge translation preserves the ordered cocycle law. -/
theorem gauge_isCocycle (ρ : G →* MulAut U) {c : G → U}
    (hc : IsCocycle ρ c) (a : U) : IsCocycle ρ (gauge ρ a c) := by
  sorry

/-- Joint continuity of the action gives continuity of the gauge-translated representative. -/
theorem gauge_continuous [TopologicalSpace G] [TopologicalSpace U] [IsTopologicalGroup U]
    (ρ : G →* MulAut U) (hρ : Continuous (fun z : G × U => ρ z.1 z.2))
    (a : U) (c : C(G, U)) : Continuous (gauge ρ a c) := by
  sorry

/-- The generated equivalence relation introduces no additional identifications. -/
theorem class_eq_iff [TopologicalSpace G] [TopologicalSpace U]
    (ρ : G →* MulAut U) (c d : Z1 ρ) :
    Quotient.mk (Relation.EqvGen.setoid (GaugeRelated ρ)) c =
      Quotient.mk (Relation.EqvGen.setoid (GaugeRelated ρ)) d ↔ GaugeRelated ρ c d := by
  sorry

/-- A cocycle has zero positive defect. -/
theorem positiveDefect_eq_one (ρ : G →* MulAut U) {c : G → U}
    (hc : IsCocycle ρ c) (g h : G) : positiveDefect ρ c g h = 1 := by
  sorry

/-- The actual identity homomorphism is a cocycle for the trivial action. -/
example : IsCocycle (1 : Equiv.Perm (Fin 3) →* MulAut (Equiv.Perm (Fin 3))) id := by
  sorry

/-- The reverse factor order fails on two transpositions. -/
example :
    let g : Equiv.Perm (Fin 3) := Equiv.swap 0 1
    let h : Equiv.Perm (Fin 3) := Equiv.swap 1 2
    g * h ≠ h * g := by
  sorry

/-- The reversed gauge display fails for the inverse cocycle under the inner S₃ action. -/
example :
    let a : Equiv.Perm (Fin 3) := Equiv.swap 0 1
    ¬ IsCocycle (MulAut.conj : Equiv.Perm (Fin 3) →* MulAut (Equiv.Perm (Fin 3)))
      (fun g => g * a⁻¹ * g⁻¹ * g⁻¹ * a) := by
  sorry

/-- The concrete continuous identity cocycle retains those two distinct products. -/
example [TopologicalSpace (Equiv.Perm (Fin 3))] :
    ∃ c : Z1 (1 : Equiv.Perm (Fin 3) →* MulAut (Equiv.Perm (Fin 3))),
      (∀ g, c.1 g = g) ∧
      c.1 (Equiv.swap 0 1 * Equiv.swap 1 2) ≠
        c.1 (Equiv.swap 1 2) * c.1 (Equiv.swap 0 1) := by
  sorry

/-- A constant unit function is a cocycle for every automorphism action. -/
example (ρ : G →* MulAut U) : IsCocycle ρ (fun _ => 1) := by
  sorry

/-- Gauging the neutral representative gives the stated coboundary convention. -/
example (ρ : G →* MulAut U) (a : U) (g : G) :
    gauge ρ a (fun _ => 1) g = a * (ρ g a)⁻¹ := by
  sorry

/-- At the identity source element, gauging the neutral representative gives the identity. -/
example (ρ : G →* MulAut U) (a : U) : gauge ρ a (fun _ => 1) 1 = 1 := by
  sorry

/-- Every actual cocycle is gauge-related to itself. -/
example [TopologicalSpace G] [TopologicalSpace U] (ρ : G →* MulAut U) (c : Z1 ρ) :
    GaugeRelated ρ c c := by
  sorry

/-- Two gauge-related cocycles give the same element of the native quotient. -/
example [TopologicalSpace G] [TopologicalSpace U] (ρ : G →* MulAut U) (c d : Z1 ρ)
    (h : GaugeRelated ρ c d) :
    (Quotient.mk (Relation.EqvGen.setoid (GaugeRelated ρ)) c : H1 ρ) =
      Quotient.mk (Relation.EqvGen.setoid (GaugeRelated ρ)) d := by
  sorry

/-- A trivial source group has only one gauge class. -/
example [TopologicalSpace G] [TopologicalSpace U] [Subsingleton G]
    (ρ : G →* MulAut U) : Subsingleton (H1 ρ) := by
  sorry

/-- The least-residue C₉→C₃ lift has positive defect 3 at (2,1). -/
example :
    (positiveDefect (1 : Multiplicative (ZMod 3) →* MulAut (Multiplicative (ZMod 9)))
      (fun g => Multiplicative.ofAdd (g.toAdd.val : ZMod 9))
      (Multiplicative.ofAdd 2) (Multiplicative.ofAdd 1)).toAdd = 3 := by
  sorry

/-- Inverting that same defect changes its C₉ value to 6. -/
example :
    ((positiveDefect (1 : Multiplicative (ZMod 3) →* MulAut (Multiplicative (ZMod 9)))
      (fun g => Multiplicative.ofAdd (g.toAdd.val : ZMod 9))
      (Multiplicative.ofAdd 2) (Multiplicative.ofAdd 1))⁻¹).toAdd = 6 := by
  sorry

end Nonabelian

/-! ## Layer 1: Étale K(π,1) schemes and arithmetic paths -/

namespace ArithmeticPath

variable {G : Type u} {E : Type v} [Group G] [Group E]

/-- In a common group frame, the geometric arithmetic path cocycle is p⁻¹sₓ(g)p s_b(g)⁻¹.
The two-fibre-functor construction of README.md specializes to this formula. -/
def pathCocycle (sb sx : G →* E) (p : E) (g : G) : E :=
  p⁻¹ * sx g * p * (sb g)⁻¹

/-- The action on the geometric kernel is conjugation by the reference section. -/
theorem pathCocycle_law (sb sx : G →* E) (p : E) (g h : G) :
    pathCocycle sb sx p (g * h) =
      pathCocycle sb sx p g * (sb g * pathCocycle sb sx p h * (sb g)⁻¹) := by
  sorry

/-- If both sections split q, and p is geometric, the cocycle values lie in the actual kernel. -/
theorem pathCocycle_mem_ker (q : E →* G) (sb sx : G →* E)
    (hsb : q.comp sb = MonoidHom.id G) (hsx : q.comp sx = MonoidHom.id G)
    {p : E} (hp : p ∈ q.ker) (g : G) : pathCocycle sb sx p g ∈ q.ker := by
  sorry

/-- Equal endpoint and reference sections with the constant path give the neutral cocycle. -/
example (sb : G →* E) : pathCocycle sb sb 1 = fun _ => 1 := by
  sorry

/-- A neutral path cocycle says exactly that p transfers the endpoint section to the reference. -/
example (sb sx : G →* E) (p : E) :
    (∀ g, pathCocycle sb sx p g = 1) ↔ (∀ g, p⁻¹ * sx g * p = sb g) := by
  sorry

/-- A path moved by the reference action gives a nonneutral representative. -/
example (sb : G →* E) (p : E) (g : G)
    (h : sb g * p * (sb g)⁻¹ ≠ p) : pathCocycle sb sb p g ≠ 1 := by
  sorry

/-- Distinct section values give a nonneutral cocycle value at the identity path. -/
example (sb sx : G →* E) (g : G) (h : sx g ≠ sb g) :
    pathCocycle sb sx 1 g ≠ 1 := by
  sorry

end ArithmeticPath

/-! ## Layer 2: Unipotent fundamental groups and their realizations -/

namespace Unipotent

variable {K : Type u} [Field K] {G : Type v} [Group G]
variable {V : Type w} [AddCommGroup V] [Module K V] [Module.Finite K V]

/-- Extension length n means n + 1 trivial graded layers, agreeing with C_n in the README.
The finite-dimensional representation version uses submodules over any field. -/
def UnipotentLength (ρ : G →* (V ≃ₗ[K] V)) (n : ℕ) : Prop :=
  ∃ F : ℕ → Submodule K V,
    F 0 = ⊥ ∧ F (n + 1) = ⊤ ∧ Monotone F ∧
      ∀ i, i < n + 1 → ∀ g v, v ∈ F (i + 1) → ρ g v - v ∈ F i

/-- Length zero means trivial action, including on a nonzero vector space. -/
theorem length_zero_iff (ρ : G →* (V ≃ₗ[K] V)) :
    UnipotentLength ρ 0 ↔ ∀ g v, ρ g v = v := by
  sorry

/-- A trivial representation has extension length zero. -/
example : UnipotentLength (1 : G →* (V ≃ₗ[K] V)) 0 := by
  sorry

/-- The zero representation has length zero. -/
example [Subsingleton V] (ρ : G →* (V ≃ₗ[K] V)) : UnipotentLength ρ 0 := by
  sorry

/-- One vector moved by the action rejects extension length zero. -/
example (ρ : G →* (V ≃ₗ[K] V)) (g : G) (v : V) (h : ρ g v ≠ v) :
    ¬ UnipotentLength ρ 0 := by
  sorry

end Unipotent

/-! ## Layer 3: Anabelian reconstruction -/

namespace RelativeMaps

variable {E : Type u} {F : Type v} {G : Type w}
variable [Group E] [Group F] [Group G]
variable [TopologicalSpace E] [TopologicalSpace F] [TopologicalSpace G]

/-- A relative open map is continuous, over the fixed quotient and has open image.
Geometric target conjugation is a separate quotient in the reconstruction statements. -/
structure RelativeOpenHom (qE : E →ₜ* G) (qF : F →ₜ* G) where
  hom : E →ₜ* F
  over_base : qF.comp hom = qE
  open_range : IsOpen (Set.range hom)

/-- For the identity quotient, a map over the quotient has its forced value. -/
theorem over_identity (q : E →ₜ* G)
    (f : RelativeOpenHom q (ContinuousMonoidHom.id G)) : f.hom = q := by
  sorry

/-- An identity quotient admits exactly one relative open map to itself. -/
example : Subsingleton (RelativeOpenHom (ContinuousMonoidHom.id G)
    (ContinuousMonoidHom.id G)) := by
  sorry

/-- The identity relative map has open full image. -/
example : Nonempty (RelativeOpenHom (ContinuousMonoidHom.id G)
    (ContinuousMonoidHom.id G)) := by
  sorry

end RelativeMaps

/-! ## Layer 4: Cohomology varieties and Selmer conditions -/

namespace Selmer

variable {G : Type u} {U : Type v} [Group G] [Group U]
variable [TopologicalSpace G] [TopologicalSpace U]
variable {I : Type w} {L : I → Type*}

/-- The underlying Selmer set is the intersection of the specified local conditions on actual
gauge classes. Its arithmetic localization maps and representing scheme are README targets. -/
def SelmerSet (ρ : G →* MulAut U) (localization : ∀ i, Nonabelian.H1 ρ → L i)
    (condition : ∀ i, Set (L i)) : Set (Nonabelian.H1 ρ) :=
  {x | ∀ i, localization i x ∈ condition i}

/-- Refining every local condition can only shrink the Selmer set. -/
theorem condition_mono (ρ : G →* MulAut U)
    (localization : ∀ i, Nonabelian.H1 ρ → L i) (A B : ∀ i, Set (L i))
    (h : ∀ i, A i ⊆ B i) : SelmerSet ρ localization A ⊆ SelmerSet ρ localization B := by
  sorry

/-- With no places the condition is vacuous. -/
example [IsEmpty I] (ρ : G →* MulAut U)
    (localization : ∀ i, Nonabelian.H1 ρ → L i) (A : ∀ i, Set (L i)) :
    SelmerSet ρ localization A = Set.univ := by
  sorry

/-- An empty condition at a specified place makes the intersection empty. -/
example (ρ : G →* MulAut U) (localization : ∀ i, Nonabelian.H1 ρ → L i)
    (A : ∀ i, Set (L i)) (i : I) (hi : A i = ∅) : SelmerSet ρ localization A = ∅ := by
  sorry

/-- Universal local conditions accept every global class for arbitrary local indices. -/
example (ρ : G →* MulAut U)
    (localization : ∀ i, Nonabelian.H1 ρ → L i) :
    SelmerSet ρ localization (fun _ => Set.univ) = Set.univ := by
  sorry

/-- A single failed local condition excludes a class from the Selmer set. -/
example (ρ : G →* MulAut U)
    (localization : ∀ i, Nonabelian.H1 ρ → L i)
    (A : ∀ i, Set (L i)) (x : Nonabelian.H1 ρ) (i : I)
    (h : localization i x ∉ A i) : x ∉ SelmerSet ρ localization A := by
  sorry

end Selmer

/-- Dual-number coefficient maps distinguish and kill actual continuous additive H¹ classes.
The product topology on the dual numbers is their finite-dimensional coordinate topology. -/
example (p : ℕ) [Fact p.Prime] :
    let ρ := (1 : Multiplicative ℤ_[p] →* MulAut (Multiplicative (DualNumber ℚ_[p])))
    ∃ cε c₁ c₀ : Nonabelian.Z1 ρ,
      (∀ g, (cε.1 g).toAdd =
        (g.toAdd : ℚ_[p]) • (DualNumber.eps : DualNumber ℚ_[p])) ∧
      (∀ g, (c₁.1 g).toAdd =
        algebraMap ℚ_[p] (DualNumber ℚ_[p]) (g.toAdd : ℚ_[p])) ∧
      (∀ g, c₀.1 g = 1) ∧
      (Quotient.mk (Relation.EqvGen.setoid (Nonabelian.GaugeRelated ρ)) cε :
        Nonabelian.H1 ρ) ≠ Quotient.mk _ c₀ ∧
      (Quotient.mk (Relation.EqvGen.setoid (Nonabelian.GaugeRelated ρ)) c₁ :
        Nonabelian.H1 ρ) ≠ Quotient.mk _ c₀ ∧
      (Quotient.mk (Relation.EqvGen.setoid (Nonabelian.GaugeRelated ρ)) c₁ :
        Nonabelian.H1 ρ) ≠ Quotient.mk _ cε ∧
      (∀ g, TrivSqZeroExt.fst ((cε.1 g).toAdd) = 0) ∧
      (∀ g, TrivSqZeroExt.fst ((c₁.1 g).toAdd) = (g.toAdd : ℚ_[p])) := by
  sorry

/-! ## Layer 5: Albanese maps and Chabauty–Kim finiteness -/

namespace Period

variable {U : Type u} [Group U]

/-- In a chosen group frame the admissible period is the source ratio I⁻¹γ.
The geometric construction takes its right homogeneous coset by F⁰U. -/
def periodRatio (frobeniusPath hodgePath : U) : U := frobeniusPath⁻¹ * hodgePath

/-- This ratio solves the source-translation equation. -/
theorem translate_periodRatio (I γ : U) : I * periodRatio I γ = γ := by
  sorry

/-- A coincident Frobenius and Hodge path has neutral period. -/
example (I : U) : periodRatio I I = 1 := by
  sorry

/-- In a noncommutative frame, the reversed ratio generally differs. -/
example :
    let I : Equiv.Perm (Fin 3) := Equiv.swap 0 1
    let γ : Equiv.Perm (Fin 3) := Equiv.swap 1 2
    periodRatio I γ ≠ γ * I⁻¹ := by
  sorry

/-- An identity Frobenius path leaves the Hodge path as its period. -/
example (g : U) : periodRatio 1 g = g := by
  sorry

/-- Fixing the identity Hodge path inverts a nontrivial additive rational path. -/
example :
    let g : Multiplicative ℚ := Multiplicative.ofAdd 1
    periodRatio g 1 = g⁻¹ ∧ periodRatio g 1 ≠ g := by
  sorry

end Period

/-!
The analytic Coleman algebra, normalized primitives and polylogarithms are supplied by
ColemanIntegration L1–L2. The README's colemanFunctions, colemanPrimitive and colemanDilogarithm
interfaces transport those objects to the tensor-path realization, with the coefficient field,
logarithm branch, tangential normalization and outermost-letter order identified there.
RestrictedPowerSeries supplies the native series, evaluation, rescaling and Strassmann theorem;
the residue-chart comparison and Chabauty zero-set application are targets of Layer 5 here.
-/

/-! ## Layer 6: Quadratic Chabauty and height equations -/

namespace Heights

/-- On the symplectic plane, a tensor u ⊗ v acts by w ↦ ⟨u,w⟩v.
This is the trace-equals-cup convention of the divisor correspondence target. -/
def symplecticTensorAction (u v : ℚ × ℚ) : (ℚ × ℚ) →ₗ[ℚ] ℚ × ℚ :=
  (u.1 • LinearMap.snd ℚ ℚ ℚ - u.2 • LinearMap.fst ℚ ℚ ℚ).smulRight v

/-- The diagonal middle tensor b ⊗ a − a ⊗ b acts as negative identity. -/
example (w : ℚ × ℚ) :
    symplecticTensorAction (0, 1) (1, 0) w -
      symplecticTensorAction (1, 0) (0, 1) w = -w := by
  sorry

/-- The simple tensor a ⊗ b acts by diag(0,1), so its trace and cup are 1. -/
example (w : ℚ × ℚ) : symplecticTensorAction (1, 0) (0, 1) w = (0, w.2) := by
  sorry

/-- A zero first tensor factor gives the zero correspondence action. -/
example (v : ℚ × ℚ) : symplecticTensorAction 0 v = 0 := by
  sorry

/-- A zero second tensor factor gives the zero correspondence action. -/
example (u : ℚ × ℚ) : symplecticTensorAction u 0 = 0 := by
  sorry

/-- Swapping the symplectic basis inputs gives diag(−1,0). -/
example (w : ℚ × ℚ) : symplecticTensorAction (0, 1) (1, 0) w = (-w.1, 0) := by
  sorry

variable {K : Type u} [Field K]
variable {C : Type v} [AddCommGroup C] [Module K C]
variable {N : Type w} [AddCommGroup N] [Module K N]

/-- The linear predicate for a correspondence: symmetry modulo pullbacks, zero trace and a
nonzero primitive class. Geometric cycle realization supplies these particular maps. -/
def IsNiceCorrespondence (P : Submodule K C) (swap : C →ₗ[K] C)
    (trace : C →ₗ[K] K) (cl : C →ₗ[K] N) (Z : C) : Prop :=
  swap Z - Z ∈ P ∧ trace Z = 0 ∧ cl Z ≠ 0

/-- Adding a pullback preserves niceness when all three maps have the prescribed pullback
behavior; this does not identify every p-adic class with a lattice correspondence. -/
theorem nice_add_pullback (P : Submodule K C) (swap : C →ₗ[K] C)
    (trace : C →ₗ[K] K) (cl : C →ₗ[K] N)
    (hP : ∀ z ∈ P, swap z - z ∈ P) (htrace : P ≤ trace.ker) (hcl : P ≤ cl.ker)
    {Z d : C} (hZ : IsNiceCorrespondence P swap trace cl Z) (hd : d ∈ P) :
    IsNiceCorrespondence P swap trace cl (Z + d) := by
  sorry

/-- A nonzero primitive class with zero trace is accepted. -/
example : IsNiceCorrespondence (⊥ : Submodule ℚ (ℚ × ℚ))
    (LinearMap.id : (ℚ × ℚ) →ₗ[ℚ] ℚ × ℚ)
    (LinearMap.fst ℚ ℚ ℚ) (LinearMap.snd ℚ ℚ ℚ) (0, 1) := by
  sorry

/-- The zero primitive class fails even when its trace is zero. -/
example : ¬ IsNiceCorrespondence (⊥ : Submodule ℚ (ℚ × ℚ))
    (LinearMap.id : (ℚ × ℚ) →ₗ[ℚ] ℚ × ℚ)
    (0 : (ℚ × ℚ) →ₗ[ℚ] ℚ) (LinearMap.snd ℚ ℚ ℚ) (1, 0) := by
  sorry

/-- A nonzero trace excludes a class with nonzero primitive component. -/
example : ¬ IsNiceCorrespondence (⊥ : Submodule ℚ (ℚ × ℚ))
    (LinearMap.id : (ℚ × ℚ) →ₗ[ℚ] ℚ × ℚ)
    (LinearMap.fst ℚ ℚ ℚ) (LinearMap.snd ℚ ℚ ℚ) (1, 1) := by
  sorry

variable {V : Type v} [AddCommGroup V] [Module K V]

/-- The preheight has both negative splitting corrections. The geometric projections are
complementary; the displayed scalar expression is defined for arbitrary supplied linear maps. -/
def HeightPrevalue (s1 s2 : V →ₗ[K] V) (α : V)
    (βφ βFil : Module.Dual K V) (γφ γFil : K) : K :=
  γφ - γFil - βφ (s1 α) - βFil (s2 α)

/-- Changing the central Frobenius coordinate by t changes the preheight by t. -/
theorem preheight_central_variation (s1 s2 : V →ₗ[K] V) (α : V)
    (βφ βFil : Module.Dual K V) (γφ γFil t : K) :
    HeightPrevalue s1 s2 α βφ βFil (γφ + t) γFil =
      HeightPrevalue s1 s2 α βφ βFil γφ γFil + t := by
  sorry

/-- The complementary projections onto the two coordinates give 7−1−2−6=−2. -/
example : HeightPrevalue
    ((LinearMap.inl ℚ ℚ ℚ).comp (LinearMap.fst ℚ ℚ ℚ))
    ((LinearMap.inr ℚ ℚ ℚ).comp (LinearMap.snd ℚ ℚ ℚ)) (1, 2)
    (2 • LinearMap.fst ℚ ℚ ℚ) (3 • LinearMap.snd ℚ ℚ ℚ) 7 1 = -2 := by
  sorry

/-- Reversing those projections incorrectly changes that same value to 6. -/
example : HeightPrevalue
    ((LinearMap.inr ℚ ℚ ℚ).comp (LinearMap.snd ℚ ℚ ℚ))
    ((LinearMap.inl ℚ ℚ ℚ).comp (LinearMap.fst ℚ ℚ ℚ)) (1, 2)
    (2 • LinearMap.fst ℚ ℚ ℚ) (3 • LinearMap.snd ℚ ℚ ℚ) 7 1 = 6 := by
  sorry

/-- With zero adjacent vector, the preheight is the central difference 7−1=6. -/
example : HeightPrevalue
    ((LinearMap.inl ℚ ℚ ℚ).comp (LinearMap.fst ℚ ℚ ℚ))
    ((LinearMap.inr ℚ ℚ ℚ).comp (LinearMap.snd ℚ ℚ ℚ)) (0, 0)
    (2 • LinearMap.fst ℚ ℚ ℚ) (3 • LinearMap.snd ℚ ℚ ℚ) 7 1 = 6 := by
  sorry

/-- Raising the central Frobenius coordinate by one raises this preheight from −2 to −1. -/
example : HeightPrevalue
    ((LinearMap.inl ℚ ℚ ℚ).comp (LinearMap.fst ℚ ℚ ℚ))
    ((LinearMap.inr ℚ ℚ ℚ).comp (LinearMap.snd ℚ ℚ ℚ)) (1, 2)
    (2 • LinearMap.fst ℚ ℚ ℚ) (3 • LinearMap.snd ℚ ℚ ℚ) 8 1 = -1 := by
  sorry

/-- A linear local character respects scalar multiplication of the height coordinate. -/
example (χ : K →ₗ[K] K) (a z : K) : χ (a * z) = a * χ z := by
  sorry

variable {I : Type w} [Fintype I]

/-- Complete independent local height upper bounds give the negative away-place sum set. -/
def AwayHeightConstants (Γ : I → Set K) : Set K :=
  {a | ∃ t : I → K, (∀ i, t i ∈ Γ i) ∧ a = -(∑ i, t i)}

/-- Finite local height sets give a finite correction set. -/
theorem away_constants_finite (Γ : I → Set K) (hΓ : ∀ i, (Γ i).Finite) :
    (AwayHeightConstants Γ).Finite := by
  sorry

/-- The global sum identity places the corrected local height in the negative sum set. -/
theorem height_sum_correction (Γ : I → Set K) (t : I → K) (ht : ∀ i, t i ∈ Γ i)
    (hp globalHeight : K) (hsum : globalHeight = hp + ∑ i, t i) :
    hp - globalHeight ∈ AwayHeightConstants Γ := by
  sorry

/-- With no away places, the correction set is exactly zero. -/
example : AwayHeightConstants (fun _ : Fin 0 => (∅ : Set ℚ)) = {0} := by
  sorry

/-- An away-place height of 3 contributes −3, not 3. -/
example : AwayHeightConstants (fun _ : Fin 1 => ({3} : Set ℚ)) = {-3} := by
  sorry

/-- Two singleton local values 1 and 2 give correction −3. -/
example : AwayHeightConstants
    (fun i : Fin 2 => if i = 0 then ({1} : Set ℚ) else {2}) = {-3} := by
  sorry

/-- A singleton local value 2 gives correction −2. -/
example : AwayHeightConstants (fun _ : Fin 1 => ({2} : Set ℚ)) = {-2} := by
  sorry

/-- The positive value and zero are both excluded by a singleton local value 3. -/
example : (3 : ℚ) ∉ AwayHeightConstants (fun _ : Fin 1 => ({3} : Set ℚ)) ∧
    (0 : ℚ) ∉ AwayHeightConstants (fun _ : Fin 1 => ({3} : Set ℚ)) := by
  sorry

/-- Singleton-zero local sets give exactly the zero correction. -/
example : AwayHeightConstants (fun _ : I => ({0} : Set K)) = {0} := by
  sorry

variable {X : Type v} {m : ℕ}

/-- Candidate and anchor height corrections occupy separate entries of the first column. -/
def HeightDeterminantMatrix (ψ : X → Fin m → K) (θ : X → K)
    (anchors : Fin m → X) (α : K) (anchorα : Fin m → K) (x : X) :
    Matrix (Option (Fin m)) (Option (Fin m)) K
  | none, none => θ x - α
  | none, some j => ψ x j
  | some i, none => θ (anchors i) - anchorα i
  | some i, some j => ψ (anchors i) j

/-- The height determinant uses Mathlib's determinant on the displayed square matrix. -/
noncomputable def HeightDeterminant (ψ : X → Fin m → K) (θ : X → K)
    (anchors : Fin m → X) (α : K) (anchorα : Fin m → K) (x : X) : K :=
  (HeightDeterminantMatrix ψ θ anchors α anchorα x).det

/-- A basis hypothesis for the anchor features makes determinant vanishing equivalent to
the residual height equation. Without the certificate, zero determinants need not cut points. -/
theorem determinant_equation (ψ : X → Fin m → K) (θ : X → K)
    (anchors : Fin m → X) (α : K) (anchorα : Fin m → K)
    (L : (Fin m → K) →ₗ[K] K)
    (hanchors : ∀ i, θ (anchors i) - anchorα i = L (ψ (anchors i)))
    (hbasis : Matrix.det (fun i j => ψ (anchors i) j) ≠ 0) (x : X) :
    HeightDeterminant ψ θ anchors α anchorα x = 0 ↔ θ x - L (ψ x) = α := by
  sorry

/-- The candidate residual is subtracted only from the candidate height. -/
example (ψ : X → Fin m → K) (θ : X → K) (anchors : Fin m → X)
    (α : K) (anchorα : Fin m → K) (x : X) :
    HeightDeterminantMatrix ψ θ anchors α anchorα x none none = θ x - α := by
  sorry

/-- An anchor row uses that anchor's own correction. -/
example (ψ : X → Fin m → K) (θ : X → K) (anchors : Fin m → X)
    (α : K) (anchorα : Fin m → K) (x : X) (i : Fin m) :
    HeightDeterminantMatrix ψ θ anchors α anchorα x (some i) none =
      θ (anchors i) - anchorα i := by
  sorry

/-- With no features, the determinant is the single corrected height entry 7−2=5. -/
example : HeightDeterminant (fun _ : ℚ => (0 : Fin 0 → ℚ)) (fun x => x)
    (fun i : Fin 0 => Fin.elim0 i) 2 0 7 = 5 := by
  sorry

/-- A zero feature matrix makes this determinant zero for every height value. -/
example : HeightDeterminant (fun _ : ℚ => (0 : Fin 1 → ℚ)) (fun x => x)
    (fun _ : Fin 1 => 0) 0 0 7 = 0 := by
  sorry

/-- Candidate and anchor corrections give the matrix ((5,2),(10,4)) of determinant zero. -/
example : HeightDeterminant (fun x : ℚ => fun _ : Fin 1 => x)
    (fun x => x + 5) (fun _ : Fin 1 => 4) 2
    (fun _ : Fin 1 => -1) 2 = 0 := by
  sorry

/-- Dropping both corrections changes the same determinant to 10. -/
example : HeightDeterminant (fun x : ℚ => fun _ : Fin 1 => x)
    (fun x => x + 5) (fun _ : Fin 1 => 4) 0 0 2 = 10 := by
  sorry

/-- An anchor with its own correction repeats a row and makes the determinant zero. -/
example (ψ : X → Fin m → K) (θ : X → K) (anchors : Fin m → X)
    (anchorα : Fin m → K) (i : Fin m) :
    HeightDeterminant ψ θ anchors (anchorα i) anchorα (anchors i) = 0 := by
  sorry

end Heights

/-! ## Layer 7: Sections and the conjectural frontier -/

namespace Frontier

variable {E : Type u} {G : Type v} [Group E] [Group G]
variable [TopologicalSpace E] [TopologicalSpace G]

/-- A continuous section is a continuous homomorphism splitting the fixed arithmetic quotient.
The conjugacy relation of README.md uses only the geometric kernel. -/
structure GaloisSection (q : E →ₜ* G) where
  hom : G →ₜ* E
  splits : q.comp hom = ContinuousMonoidHom.id G

/-- The identity quotient admits only its identity section. -/
example : Subsingleton (GaloisSection (ContinuousMonoidHom.id G)) := by
  sorry

/-- Its identity section exists, independently of any curve conjecture. -/
example : Nonempty (GaloisSection (ContinuousMonoidHom.id G)) := by
  sorry

/-- Bijectivity of a supplied map from rational points to section classes.
The geometric instance uses classes modulo conjugation by the geometric kernel. -/
def SectionConjectureFor {P : Type u} {S : Type w} (κ : P → S) : Prop :=
  Function.Bijective κ

/-- Bijectivity of the interior-point and cuspidal-packet decomposition of a supplied
section-class set. The sigma type retains every class in each packet. -/
def CuspidalSectionConjecture {P : Type u} {D : Type v} {S : Type w}
    (κ : P → S) (packet : D → Set S) : Prop :=
  Function.Bijective (fun t : P ⊕ (Σ y : D, packet y) =>
    match t with
    | .inl x => κ x
    | .inr c => c.2.1)

/-- The decomposition asserts distinct interior classes, separation of all components,
and exhaustion by the interior image and the cuspidal packets. -/
theorem cuspidalSectionConjecture_iff {P : Type u} {D : Type v} {S : Type w}
    (κ : P → S) (packet : D → Set S) :
    CuspidalSectionConjecture κ packet ↔
      Function.Injective κ ∧
      (∀ x y, κ x ∉ packet y) ∧
      (∀ y z, y ≠ z → Disjoint (packet y) (packet z)) ∧
      (∀ s, (∃ x, κ x = s) ∨ ∃ y, s ∈ packet y) := by
  sorry

/-- A class in two cuspidal packets determines the same cusp under the decomposition. -/
theorem cuspidalSectionConjecture_cusp_unique {P : Type u} {D : Type v} {S : Type w}
    {κ : P → S} {packet : D → Set S} (h : CuspidalSectionConjecture κ packet)
    {s : S} {y z : D} (hy : s ∈ packet y) (hz : s ∈ packet z) : y = z := by
  sorry

/-- An empty boundary reduces the packet decomposition to the proper section proposition. -/
theorem cuspidalSectionConjecture_empty_boundary {P : Type u} {D : Type v} {S : Type w}
    [IsEmpty D] (κ : P → S) (packet : D → Set S) :
    CuspidalSectionConjecture κ packet ↔ SectionConjectureFor κ := by
  sorry

/-- A model decomposition with three cusps retains an integer-indexed family at each cusp. -/
example {P : Type u} :
    CuspidalSectionConjecture (S := P ⊕ (Fin 3 × ℤ)) Sum.inl
      (fun y : Fin 3 => {s | ∃ n : ℤ, s = Sum.inr (y, n)}) := by
  sorry

/-- Overlapping packets at distinct cusp indices prevent a decomposition. -/
example : ¬ CuspidalSectionConjecture (S := Unit) (Empty.elim : Empty → Unit)
    (fun _ : Bool => Set.univ) := by
  sorry

/-- An interior class lying in a packet also prevents a decomposition. -/
example : ¬ CuspidalSectionConjecture (id : Unit → Unit)
    (fun _ : Unit => Set.univ) := by
  sorry

/-- The numeric part of Kim's dimension condition asserts a strict inequality at some positive
depth. In its geometric application the two functions are dimensions of the stated schemes. -/
def KimDimensionCondition (selmerDimension deRhamDimension : ℕ → ℕ) : Prop :=
  ∃ n, 0 < n ∧ selmerDimension n < deRhamDimension n

/-- Summing an eventual H² bound retains the full finite initial H² contribution.
The Euler characteristic identities and tail estimates give this bound at every depth. -/
theorem sum_h1_le_with_initial_h2 (h1 h2 negative error : ℕ → ℕ)
    (k₀ : ℕ) (hk₀ : 1 ≤ k₀)
    (hEuler : ∀ k, 1 ≤ k → h1 k = negative k + h2 k)
    (hbound : ∀ k, k₀ ≤ k → h2 k ≤ error k) (n : ℕ) :
    (∑ k ∈ Finset.Icc 1 n, h1 k) ≤
      (∑ k ∈ Finset.Icc 1 n, negative k) +
        (∑ k ∈ Finset.Ico 1 k₀, h2 k) +
        ∑ k ∈ Finset.Icc k₀ n, error k := by
  sorry

/-- A degree-one H² term of two remains in every positive-depth sum when the tail is zero. -/
example (n : ℕ) (hn : 1 ≤ n) :
    (∑ k ∈ Finset.Icc 1 n, if k = 1 then 2 else 0) = 2 := by
  sorry

/-- A threshold of one has no initial H² terms. -/
example (h2 : ℕ → ℕ) : (∑ k ∈ Finset.Ico 1 1, h2 k) = 0 := by
  sorry

/-- Before the threshold, the estimated tail sum is empty. -/
example (error : ℕ → ℕ) (n k₀ : ℕ) (h : n < k₀) :
    (∑ k ∈ Finset.Icc k₀ n, error k) = 0 := by
  sorry

/-- Equality of dimensions at all depths does not satisfy the condition. -/
example (d : ℕ → ℕ) : ¬ KimDimensionCondition d d := by
  sorry

/-- A strict inequality at depth one is sufficient for the numeric condition. -/
example : KimDimensionCondition (fun _ => 1) (fun _ => 2) := by
  sorry

/-- The mod-two boundary excludes simultaneous integral units z and 1 − z. -/
example : ¬ ∃ z : ZMod 2, z ≠ 0 ∧ 1 - z ≠ 0 := by
  decide

/-- Eventual equality keeps its tail quantifier; an intersection equality is weaker. -/
def EventualEquality {X : Type*} (loci : ℕ → Set X) (points : Set X) : Prop :=
  ∃ N, ∀ n, N ≤ n → loci n = points

/-- Eventual equality implies the intersection statement for a decreasing containing family. -/
theorem intersection_of_eventual_equality {X : Type*} (loci : ℕ → Set X) (points : Set X)
    (hmono : Antitone loci) (hcontain : ∀ n, points ⊆ loci n)
    (heventual : EventualEquality loci points) : (⋂ n, loci n) = points := by
  sorry

/-- A constant family has eventual equality immediately. -/
example {X : Type*} (points : Set X) : EventualEquality (fun _ => points) points := by
  sorry

/-- A decreasing family can have the required intersection without ever stabilizing. -/
example :
    let loci : ℕ → Set ℕ := fun n => {x | x = 0 ∨ n ≤ x}
    (⋂ n, loci n) = {0} ∧ ¬ EventualEquality loci {0} := by
  sorry

end Frontier

/-!
README.md specifies the geometric arithmetic path torsor, finite-coefficient étale K(π,1)
predicate and raw étale pro-space; equivariant topological torsors and their isomorphisms;
good and symmetric paths; relative outer Hom and Isom; stable log-admissible covers;
cyclotomic degree; Jacobian-geometric and formal Kummer disc sections, nondegenerate sections
and canonical relations; two-fibre-functor tensor torsors and the unipotent specialization;
completed path algebra, universal pointed object, finite path module, filtered path and tangential fibre; algebra-valued Galois
cohomology family, filtered affine torsor and Selmer variety; admissible period and Albanese
maps; exact, period-image and closed-image Kim loci; geometric nice correspondences,
admissible de Rham Tate classes, depth-two height quotient and module, relative-cycle mixed
extensions and quadratic Chabauty pairs; section classes, the section conjecture, geometric
Kim dimension and eventual equality conjectures, and strict Selmer-tensor vanishing. It also
specifies the comparison from continuous fundamental-group cohomology to étale cohomology,
tangential fibre functors, admissible coverings of pointed stable curves, relative Hodge–Tate
inputs over small logarithmic bases, homogeneous quotients of unipotent groups, the Bloch–Kato
subgroups, Coleman charts on proper curves, mixed extensions with Nekovář's local and global
heights, including the adjacent-finite construction on semistable mixed extensions, and the
action of divisor correspondences on H¹ ⊗ H¹.
Their sites, comparison functors, completions and representing schemes are constructions of
the corresponding layers of README.md.
-/


/-!
The README specifies the following further API and Checks on its stated carriers.
These names refer to those mathematical targets.

ArithmeticPath:
galoisAction_val, restrict_id, rightMul_val.

AwayHeightConstants:
all_zero, height_sum.

GaloisSection:
diff_mul.

HeightDeterminant:
duplicate_row, matrix_first.

HeightPrevalue:
character_smul, gamma_add, local_height, zero_alpha.

IsNiceCorrespondence:
add_pullback.

TauCeti.NonabelianCohomology.H1:
changeRepresentative_apply, changeRepresentative_comp, changeRepresentative_eq_map,
changeRepresentative_gauge, changeRepresentative_id, changeRepresentative_one,
changeRepresentative_symm, changeRepresentative_twistEquiv, embeddedKernelEquiv_inclusion,
embeddedKernelEquiv_mk, embeddedKernelEquiv_one, embeddedKernelInclusion_fibre_range_iff,
embeddedKernelInclusion_injective, embeddedKernelInclusion_mapped_range_iff,
embeddedKernelInclusion_mk, embeddedKernelInclusion_quotient_range_iff,
embeddedKernelInclusion_range, embeddedKernel_fibre_existsUnique, equivContCohomology_one,
existsUnique_inflate_of_restrict_eq_one, exists_twistedKernelInclusion_of_map_eq_one,
exists_twistedKernelInclusion_of_quotient_eq_one, finiteQuotientColimitEquiv_one,
finiteQuotientColimitEquiv_symm_inflate, finiteQuotientColimitEquiv_ι, inflateNeutralEquiv_apply,
inflateNeutralEquiv_apply_symm, inflateNeutralEquiv_one, inflateNeutralEquiv_symm_inflate,
inflate_eq_one_iff, inflate_injective, inflate_mk, inflate_one, inflate_transition,
inflationCocone_app, inflationCocone_naturality, inflationCocone_pt, kernelInclusion_range_iff,
kernelInvariantAction_fibre_iff, kernelInvariantAction_inclusion,
kernelInvariantAction_injective_iff, kernelInvariantAction_lift,
kernelInvariantAction_lift_independent, kernelInvariantAction_mk,
kernelMap_injective_of_fixed_trivial, kernelMap_injective_of_stabilizer_lifts,
kernelOrbitImageEquiv_choice_independent, kernelOrbitImageEquiv_mk, kernelOrbitImageEquiv_symm_mk,
kernelOrbitImageEquiv_symm_projection, kernelOrbitNeutralFibreEquiv_inverse,
kernelOrbitNeutralFibreEquiv_mk, kernelOrbitNeutralFibreEquiv_one,
kernelOrbitNeutralFibreEquiv_symm_mk, kernelPreimageAction_kernel, kernelPreimageAction_mk,
kernelPreimageAction_perm_kernel, map_comp, map_id, map_mk, map_one, mk_eq_mk_iff, mk_eq_one_iff,
mk_smul, mk_surjective, namedKernelEquiv_inclusion, namedKernelEquiv_mk, namedKernelEquiv_one,
namedKernelEquiv_symm_mk, namedKernelInclusion_fibre_range_iff,
namedKernelInclusion_mapped_range_iff, namedKernelInclusion_quotient_range_iff,
namedKernelInclusion_range, quotientDiagram_map_apply, quotientDiagram_map_id, quotientDiagram_obj,
res_comp, res_id, res_injective, res_map, res_mk, res_one, res_subgroup, restrict_inflate,
restrict_mk, restrict_mk_eq_one_iff, restrict_one, transition_injective, transition_mk,
transition_one, transition_refl, transition_trans, twistEquiv_eq_class_iff, twistEquiv_gaugeMap,
twistEquiv_map, twistEquiv_mk, twistEquiv_one, twistNeutralFibreEquiv_apply,
twistNeutralFibreEquiv_basepoint, twistNeutralFibreEquiv_symm_apply, twistRes_comp_translation,
twistRes_identity_translation, twistRes_injective, twistRes_mk, twistRes_one,
twistRes_representative, twistRes_translation, twistedKernelInclusion_fibre,
twistedKernelInclusion_fibre_range_iff, twistedKernelInclusion_image,
twistedKernelInclusion_injective, twistedKernelInclusion_mk, twistedKernelInclusion_one,
twistedKernelInclusion_range_iff, twistedKernelInvariantAction_fibre_iff,
twistedKernelInvariantAction_inclusion, twistedKernelInvariantAction_injective_iff,
twistedKernelInvariantAction_mk, twistedKernelOrbitFibreEquiv_basepoint,
twistedKernelOrbitFibreEquiv_choice_independent, twistedKernelOrbitFibreEquiv_left_inv,
twistedKernelOrbitFibreEquiv_mk, twistedKernelOrbitFibreEquiv_right_inv,
twistedKernelOrbitFibreEquiv_symm_mk, twistedQuotientEquiv_mk, twistedQuotientEquiv_one,
twistedQuotientEquiv_projection, twistedQuotientEquiv_symm_mk, twistedQuotientEquiv_translation,
twistedQuotient_fibre, twistedQuotient_kernel, twistedQuotient_mk, twistedQuotient_one,
twistedQuotient_range_iff.

TauCeti.NonabelianCohomology.Z1:
descendEquiv_apply, descendEquiv_left_inv, descendEquiv_one, descendEquiv_right_inv,
descendEquiv_symm_apply, descend_apply, descend_gauge_iff, descend_inflate, descend_one,
descend_proof_independent, descend_unique, gaugeTransporterEquiv_apply,
gaugeTransporterEquiv_continuous, gaugeTransporterEquiv_symm_apply,
gaugeTransporterEquiv_symm_continuous, gauge_transporter_iff, gauge_witness_fixed,
gauge_witness_unique_iff, inflate_apply, inflate_descend, inflate_gauge_iff, inflate_injective,
inflate_one, inflate_smul, inflate_transition, inflate_trivialOn, kernelGauge_apply,
kernelGauge_gauge, kernelGauge_inclusion, kernelGauge_mul, kernelGauge_one,
kernel_gauge_projects_fixed, map_apply, map_comp, map_id, map_inv, map_one, map_smul, map_trivial,
mem_iff, mem_oneFibre, normalize_trivialOn, oneFibre_eq_ker, oneFibre_eq_top, oneFibre_isClopen,
res_apply, res_comp, res_id, res_injective, res_map, res_one, res_smul, res_subgroup,
restrict_apply, restrict_inflate, restrict_one, restrict_smul, transition_apply,
transition_injective, transition_one, transition_refl, transition_trans, twistEquiv_apply,
twistEquiv_gaugeMap, twistEquiv_map, twistEquiv_smul, twistEquiv_symm_apply, twistRes_apply,
twistRes_injective, twistRes_one, twistRes_smul, twistRes_translation, twistedKernelLift_apply,
twistedKernelLift_gauge, twistedKernelLift_inclusion, twistedKernelLift_injective,
twistedKernelLift_one, twistedQuotientEquiv_apply, twistedQuotientEquiv_gauge,
twistedQuotientEquiv_one, twistedQuotientEquiv_projection, twistedQuotientEquiv_symm_apply,
twistedQuotient_apply, twistedQuotient_gauge, twistedQuotient_one.

Unqualified API:
eventualEquality_iInter, eventualEquality_iff_exists_subset, gauge_transporter_continuous_roundtrip,
gauge_transporter_inverse, gauge_transporter_right_order, gauge_witness_nonunique,
gauge_witness_unique, pathCocycle_apply, pathCocycle_changePoint,
pathCocycle_changed_representative, pathCocycle_distinct_sections, pathCocycle_mul,
pathCocycle_same_sections.

-/

end TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty
