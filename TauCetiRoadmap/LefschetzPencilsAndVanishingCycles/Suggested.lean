import Mathlib
import TauCeti.LinearAlgebra.GeneralLinearGroup.Unipotent

/-!
# Lefschetz pencils, nearby cycles and vanishing cycles: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements give Lean forms for headline results; discharging them
finishes neither a layer nor the roadmap.

The statements on native library carriers are Grothendieck's arithmetic monodromy theorem
for henselian discrete valuation fields (1.1), the existence, uniqueness and strictness of
monodromy filtrations in an abelian category (1.3–1.4), the finite étale rank-two even
Clifford centre and its Azumaya algebra over an arbitrary base ring (2.2), the linear
Kazhdan–Margulis theorem (5.8), and the open-or-finite alternative for orthogonal
monodromy (5.10). The last two statements concern matrix groups in every dimension over
`ℚ_ℓ`; the geometric images satisfy their hypotheses by the pencil monodromy theorems.

The geometric headline statements are deferred because the pins have no trait
nearby-cycle functors, constructible adic étale cohomology with its specialization and
cup-product maps, ordinary quadratic points, or Lefschetz-pencil structures. These
objects are needed for absolute purity and nearby-cycle comparison (LPV.0), geometric
local monodromy (1.1), Picard–Lefschetz (2.7–2.8), existence and arithmetic specialization
of pencils (3.4–3.6), and the global vanishing-cycle, conjugacy, generation and
irreducibility theorems (LPV.4–LPV.5). The finite ADE classification and the Frobenius
polynomial theorem (5.10–5.11) also need these geometric cohomology representations.
Gabber's duality and perversity theorems (6.1–6.2) require Verdier duality and perverse
étale sheaves; the semistable monodromy and weight spectral sequence (LPV.7a) require
nearby cycles and stratum étale cohomology; and local and global invariant cycles
(LPV.7b) require their geometric specialization maps. The complex invariant-cycle
theorem (7b.6) needs Betti cohomology with singular-fibre supports and its Wang cross.
The arithmetic theorem instead uses the native valuation inertia subgroup and Krull
topology, with Tau Ceti's unipotence predicate. No geometric structure is replaced by a
free predicate or an arbitrary linear map.
The Tate-twisted statements of LPV.1 require the geometric Tate realization; primitive
decompositions and relative filtrations need the associated graded constructions and
induced maps specified there. Semisimple traces (1.10) need admissible inertia filtrations
with their induced graded actions.
-/

namespace TauCetiRoadmap.LefschetzPencilsAndVanishingCycles

open CategoryTheory CategoryTheory.Limits
open scoped Matrix

/-! ## Layer LPV.1: Inertia, variation and the monodromy operator -/

/-- If no finite extension of the residue field contains all ℓ-power roots of unity,
every continuous ℓ-adic representation is unipotent on an open subgroup of inertia.
The root-of-unity hypothesis says that their generated residue-field extension is
infinite. The valuation on the algebraic closure extends the given henselian DVR.
README 1.1, Grothendieck's arithmetic monodromy theorem. -/
theorem grothendieck_arithmeticMonodromy {K : Type*} [Field K]
    (A : ValuationSubring K) [IsDiscreteValuationRing A] [HenselianLocalRing A]
    (W : ValuationSubring (AlgebraicClosure K))
    (hW : W.comap (algebraMap K (AlgebraicClosure K)) = A)
    (ℓ : ℕ) [Fact ℓ.Prime]
    (hℓ : (ℓ : IsLocalRing.ResidueField A) ≠ 0)
    (hroots : ¬ Module.Finite (IsLocalRing.ResidueField A)
      (IntermediateField.adjoin (IsLocalRing.ResidueField A)
        {x : AlgebraicClosure (IsLocalRing.ResidueField A) | ∃ n : ℕ, x ^ (ℓ ^ n) = 1}))
    (d : ℕ)
    (ρ : (AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K) →*
      Matrix.GeneralLinearGroup (Fin d) ℚ_[ℓ]) (hρ : Continuous ρ) :
    ∃ I₁ : Subgroup (W.inertiaSubgroup K), IsOpen (I₁ : Set (W.inertiaSubgroup K)) ∧
      ∀ σ ∈ I₁,
        LinearMap.GeneralLinearGroup.IsUnipotent (Matrix.GeneralLinearGroup.toLin (ρ σ.val.val)) := by
  sorry

/-- The finite monodromy-filtration conditions, expressed through images and inverse
images of native subobjects. The two equalities for each power express that the induced
map between opposite graded pieces is an isomorphism. README 1.3. -/
def IsMonodromyFiltration {C : Type*} [Category C] [Abelian C] {X : C}
    (N : End X) (c : ℤ) (M : ℤ → Subobject X) : Prop :=
  Monotone M ∧ (∃ a b : ℤ, M a = ⊥ ∧ M b = ⊤) ∧
  (∀ i : ℤ, (Subobject.«exists» N).obj (M i) ≤ M (i - 2)) ∧
  (∀ r : ℕ,
    (Subobject.«exists» (N ^ r)).obj (M (c + (r : ℤ))) ⊔ M (c - (r : ℤ) - 1) =
      M (c - (r : ℤ)) ∧
    M (c + (r : ℤ)) ⊓ (Subobject.pullback (N ^ r)).obj (M (c - (r : ℤ) - 1)) =
      M (c + (r : ℤ) - 1))

/-- Every nilpotent endomorphism in an abelian category has a unique monodromy
filtration centred at `c`, and is strict for that filtration. README 1.3–1.4. -/
theorem monodromyFiltration_exists_unique {C : Type*} [Category C] [Abelian C] {X : C}
    (N : End X) (hN : IsNilpotent N) (c : ℤ) :
    (∃! M : ℤ → Subobject X, IsMonodromyFiltration N c M) ∧
      ∀ M : ℤ → Subobject X, IsMonodromyFiltration N c M →
        ∀ i : ℤ, (Subobject.«exists» N).obj (M (i + 2)) = imageSubobject N ⊓ M i := by
  sorry

/-! ## Layer LPV.2: Ordinary quadratic singularities and the Picard–Lefschetz formula -/

/-- For an ordinary quadratic form of positive even local rank, its even Clifford
centre is finite étale of rank two and the even Clifford algebra is Azumaya over it.
A perfect polar pairing expresses ordinarity in even rank, including characteristic two.
Finite projective modules allow arbitrary affine bases. README 2.2. -/
theorem evenClifford_center_etale_azumaya {R W : Type*} [CommRing R] [Nontrivial R]
    [AddCommGroup W] [Module R W] [Module.Projective R W] [Module.Finite R W]
    (Q : QuadraticForm R W) (hQ : Function.Bijective Q.polarBilin)
    (hpos : ∀ p : PrimeSpectrum R, 0 < Module.rankAtStalk W p)
    (heven : ∀ p : PrimeSpectrum R, Even (Module.rankAtStalk W p)) :
    Module.Finite R (Subalgebra.center R (CliffordAlgebra.even Q)) ∧
      Algebra.Etale R (Subalgebra.center R (CliffordAlgebra.even Q)) ∧
      (∀ p : PrimeSpectrum R,
        Module.rankAtStalk (Subalgebra.center R (CliffordAlgebra.even Q)) p = 2) ∧
      IsAzumaya (Subring.center (CliffordAlgebra.even Q)) (CliffordAlgebra.even Q) := by
  sorry

/-! ## Layer LPV.5: Conjugacy, monodromy and the open image theorem -/

/-- A closed irreducible subgroup topologically generated by symplectic transvections
over `ℚ_ℓ` is open in the symplectic group. README 5.8. -/
theorem kazhdanMargulis (ℓ : ℕ) [Fact ℓ.Prime] (d : ℕ)
    (B : LinearMap.BilinForm ℚ_[ℓ] (Fin d → ℚ_[ℓ]))
    (hB : LinearMap.IsAlt B) (hBnd : B.Nondegenerate)
    (H : Subgroup (Matrix.GeneralLinearGroup (Fin d) ℚ_[ℓ]))
    (hclosed : IsClosed (H : Set (Matrix.GeneralLinearGroup (Fin d) ℚ_[ℓ])))
    (hpres : ∀ g ∈ H, ∀ x y, B ((g : Matrix _ _ _) *ᵥ x) ((g : Matrix _ _ _) *ᵥ y) = B x y)
    (hirr : ∀ W : Submodule ℚ_[ℓ] (Fin d → ℚ_[ℓ]),
      (∀ g ∈ H, ∀ w ∈ W, (g : Matrix _ _ _) *ᵥ w ∈ W) → W = ⊥ ∨ W = ⊤)
    {ι : Type*} (T : ι → Matrix.GeneralLinearGroup (Fin d) ℚ_[ℓ])
    (δ : ι → (Fin d → ℚ_[ℓ])) (c : ι → ℚ_[ℓ]) (hc : ∀ i, c i ≠ 0)
    (hT : ∀ i, (Matrix.GeneralLinearGroup.toLin (T i) : Module.End ℚ_[ℓ] (Fin d → ℚ_[ℓ])) =
      LinearMap.transvection (c i • B.flip (δ i)) (δ i))
    (hgen : (Subgroup.closure (Set.range T)).topologicalClosure = H) :
    IsOpen {g : {g : Matrix.GeneralLinearGroup (Fin d) ℚ_[ℓ] //
        ∀ x y, B ((g : Matrix _ _ _) *ᵥ x) ((g : Matrix _ _ _) *ᵥ y) = B x y} |
      g.val ∈ H} := by
  sorry

/-- A compact orthogonal group generated by one transported orbit of reflections is
open or finite, provided the roots span a nondegenerate space. The form is normalized
so that every root has square two. README 5.10. -/
theorem orthogonalMonodromy_open_or_finite (ℓ : ℕ) [Fact ℓ.Prime] (d : ℕ)
    (B : LinearMap.BilinForm ℚ_[ℓ] (Fin d → ℚ_[ℓ]))
    (hB : B.IsSymm) (hBnd : B.Nondegenerate)
    (H : Subgroup (Matrix.GeneralLinearGroup (Fin d) ℚ_[ℓ]))
    (hcompact : IsCompact (H : Set (Matrix.GeneralLinearGroup (Fin d) ℚ_[ℓ])))
    (hpres : ∀ g ∈ H, ∀ x y, B ((g : Matrix _ _ _) *ᵥ x) ((g : Matrix _ _ _) *ᵥ y) = B x y)
    {ι : Type*} (T : ι → Matrix.GeneralLinearGroup (Fin d) ℚ_[ℓ])
    (δ : ι → (Fin d → ℚ_[ℓ])) (hnorm : ∀ i, B (δ i) (δ i) = 2)
    (hspan : Submodule.span ℚ_[ℓ] (Set.range δ) = ⊤)
    (horbit : ∀ i j, ∃ g ∈ H,
      (g : Matrix _ _ _) *ᵥ δ i = δ j ∨ (g : Matrix _ _ _) *ᵥ δ i = -δ j)
    (hT : ∀ i, (Matrix.GeneralLinearGroup.toLin (T i) : Module.End ℚ_[ℓ] (Fin d → ℚ_[ℓ])) =
      LinearMap.transvection (-B.flip (δ i)) (δ i))
    (hgen : (Subgroup.closure (Set.range T)).topologicalClosure = H) :
    (H : Set (Matrix.GeneralLinearGroup (Fin d) ℚ_[ℓ])).Finite ∨
      IsOpen {g : {g : Matrix.GeneralLinearGroup (Fin d) ℚ_[ℓ] //
          ∀ x y, B ((g : Matrix _ _ _) *ᵥ x) ((g : Matrix _ _ _) *ᵥ y) = B x y} |
        g.val ∈ H} := by
  sorry

end TauCetiRoadmap.LefschetzPencilsAndVanishingCycles
