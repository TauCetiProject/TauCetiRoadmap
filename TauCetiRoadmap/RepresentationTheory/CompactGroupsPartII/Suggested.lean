import Mathlib
import TauCeti.RepresentationTheory.Compact.PeterWeyl
import TauCeti.RepresentationTheory.SU2.Exhaustion

/-!
# Compact groups, part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: irreducible positive-scalar metric
classification, U(2) weight recognition, Banach G-finite density, compact-group
countability, duals of arbitrary products, compact abelian Fourier theory, and SU(2)
multiplicities and faithfulness.
The implemented Haar, unitarization, Peter–Weyl, character and SU(2) theorems of the
base roadmap are inputs, identified in the README's supplier contracts.

Not stated, each for a carrier the pins lack:

* the Layer 6 simply connected compact cocharacter/coroot-lattice equality,
  classification of irreducible representations by dominant characters
  and the formal-character basis of the Weyl invariants: the pins have maximal tori
  (`TauCeti.Lie.IsMaximalTorus`, with the character lattice `PontryaginDual`) but
  neither the root characters and real coroots with a positive system of a compact connected Lie
  group, nor its finite central cover, nor the formal character of a continuous
  representation restricted to a maximal torus;
* the full multiplicity-space metric comparison: it needs the chosen unitary
  isotypic tensor decomposition;
* the continuous-kernel norm identity: the pins have the Hilbert–Schmidt energy and
  norm of an operator but not the integral operator of a continuous kernel on a
  compact space with a finite Borel measure.

These constructions remain README targets, without substitute predicates here.
-/

noncomputable section

open MeasureTheory
open scoped DirectSum InnerProductSpace

namespace TauCetiRoadmap.CompactGroupsPartII

universe u v

/-! ## Layer 1: invariant Hermitian metrics -/

/-- A strictly positive self-adjoint intertwiner of a finite-dimensional
irreducible complex representation is a unique positive real scalar.
No compactness or continuity of the group parameter is needed for this
consequence of scalar Schur. -/
theorem positive_selfIntertwiner_existsUnique_scalar
    {G V : Type*} [Group G] [NormedAddCommGroup V] [InnerProductSpace ℂ V]
    [FiniteDimensional ℂ V] (π : ContRepresentation ℂ G V)
    (hirr : π.toRepresentation.IsIrreducible) (T : ContIntertwiningMap π π)
    (hself : IsSelfAdjoint T.toContinuousLinearMap)
    (hpos : ∀ v : V, v ≠ 0 → 0 < (⟪v, T v⟫_ℂ).re) :
    ∃! c : ℝ, 0 < c ∧ T.toContinuousLinearMap =
      (c : ℂ) • ContinuousLinearMap.id ℂ V := by
  sorry

/-! ## Layer 2: G-finite vectors in Banach representations -/

/-- An orbit-finite vector has finite-dimensional orbit span, over any field. -/
def IsGFinite {k G V : Type*} [Field k] [Group G] [AddCommGroup V] [Module k V]
    (ρ : Representation k G V) (v : V) : Prop :=
  FiniteDimensional k (Submodule.span k (Set.range fun g : G => ρ g v))

/-- The submodule of orbit-finite vectors of a representation over any field: the
orbit span of a sum lies in the sum of the orbit spans, and the orbit span of a
scalar multiple lies in the orbit span of the vector. -/
def gFiniteSubmodule {k G V : Type*} [Field k] [Group G] [AddCommGroup V] [Module k V]
    (ρ : Representation k G V) : Submodule k V where
  carrier := {v | IsGFinite ρ v}
  zero_mem' := by
    change FiniteDimensional k (Submodule.span k (Set.range fun g : G => ρ g 0))
    have hle : Submodule.span k (Set.range fun g : G => ρ g 0) ≤ ⊥ := by
      rw [Submodule.span_le]
      rintro _ ⟨g, rfl⟩
      simp
    exact Submodule.finiteDimensional_of_le hle
  add_mem' := by
    intro v w hv hw
    have : FiniteDimensional k (Submodule.span k (Set.range fun g : G => ρ g v)) := hv
    have : FiniteDimensional k (Submodule.span k (Set.range fun g : G => ρ g w)) := hw
    change FiniteDimensional k (Submodule.span k (Set.range fun g : G => ρ g (v + w)))
    have hle : Submodule.span k (Set.range fun g : G => ρ g (v + w)) ≤
        Submodule.span k (Set.range fun g : G => ρ g v) ⊔
          Submodule.span k (Set.range fun g : G => ρ g w) := by
      rw [Submodule.span_le]
      rintro _ ⟨g, rfl⟩
      dsimp only
      rw [map_add]
      exact Submodule.add_mem_sup (Submodule.subset_span ⟨g, rfl⟩)
        (Submodule.subset_span ⟨g, rfl⟩)
    exact Submodule.finiteDimensional_of_le hle
  smul_mem' := by
    intro c v hv
    have : FiniteDimensional k (Submodule.span k (Set.range fun g : G => ρ g v)) := hv
    change FiniteDimensional k (Submodule.span k (Set.range fun g : G => ρ g (c • v)))
    have hle : Submodule.span k (Set.range fun g : G => ρ g (c • v)) ≤
        Submodule.span k (Set.range fun g : G => ρ g v) := by
      rw [Submodule.span_le]
      rintro _ ⟨g, rfl⟩
      dsimp only
      rw [map_smul]
      exact Submodule.smul_mem _ _ (Submodule.subset_span ⟨g, rfl⟩)
    exact Submodule.finiteDimensional_of_le hle

/-- G-finite vectors are dense for every strongly continuous representation of a
compact Hausdorff group on a complex Banach space; no operator-norm continuity
or separability of the Banach space is assumed. The statement is density of
the submodule of such vectors as a subset of the Banach space. -/
theorem gFiniteSubmodule_dense (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (E : Type v) [NormedAddCommGroup E] [NormedSpace ℂ E] [CompleteSpace E]
    (π : ContRepresentation ℂ G E) (hπ : ∀ v : E, Continuous fun g : G => π g v) :
    Dense (gFiniteSubmodule π.toRepresentation : Set E) := by
  sorry

/-! ## Layer 3: countability and metrizability -/

section

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [T2Space G]

/-- The general compact-group dual is countable exactly in the second-countable case. -/
theorem secondCountable_iff_countable_irrepClass :
    SecondCountableTopology G ↔ Countable (TauCeti.IrrepClass ℂ G) := by
  sorry

variable [MeasurableSpace G] [BorelSpace G]

/-- The Peter–Weyl block index detects separability of normalized Haar L². -/
theorem separable_L2_iff_countable_irrepClass :
    TopologicalSpace.SeparableSpace (Lp ℂ 2 (TauCeti.haarProb G)) ↔
      Countable (TauCeti.IrrepClass ℂ G) := by
  sorry

end

/-! ## Layer 4: characters of arbitrary products -/

section

section FiniteCoordinates

variable {J : Type u} [DecidableEq J] (G : J → Type v)
  [∀ j, Group (G j)] [∀ j, TopologicalSpace (G j)]
  [∀ j, IsTopologicalGroup (G j)]

/-- Circle-valued continuous characters factor through finitely many coordinates,
even without compactness, commutativity or a countable index type. -/
theorem character_finite_coordinates (χ : PontryaginDual (∀ j, G j)) :
    ∃ F : Finset J, ∀ x : ∀ j, G j,
      χ x = ∏ j ∈ F, χ (Pi.mulSingle j (x j)) := by
  sorry

end FiniteCoordinates

section CompactAbelian

variable {J : Type u} [DecidableEq J] (G : J → Type v)
  [∀ j, CommGroup (G j)] [∀ j, TopologicalSpace (G j)]
  [∀ j, IsTopologicalGroup (G j)] [∀ j, CompactSpace (G j)] [∀ j, T2Space (G j)]

/-- The topology on the direct sum is a hypothesis and is discrete.
The equation on its generators pins the isomorphism to coordinate evaluation. -/
theorem exists_productDualEquiv
    [TopologicalSpace (Multiplicative (⨁ j, Additive (PontryaginDual (G j))))]
    [DiscreteTopology (Multiplicative (⨁ j, Additive (PontryaginDual (G j))))] :
    ∃ e : Multiplicative (⨁ j, Additive (PontryaginDual (G j))) ≃ₜ*
        PontryaginDual (∀ j, G j),
      ∀ (j : J) (χ : PontryaginDual (G j)) (x : ∀ j, G j),
        e (Multiplicative.ofAdd
          (DirectSum.of (fun k => Additive (PontryaginDual (G k))) j
            (Additive.ofMul χ))) x = χ (x j) := by
  sorry

end CompactAbelian

/-- Every character of an arbitrary torus has a unique finite integer multi-index. -/
theorem circleProduct_character {J : Type u} [DecidableEq J]
    (χ : PontryaginDual (J → Circle)) :
    ∃! n : J →₀ ℤ, ∀ z : J → Circle,
      χ z = ∏ j ∈ n.support, z j ^ n j := by
  sorry


end

/-! ## Layer 5: compact abelian Fourier theory -/

section

variable (G : Type u) [CommGroup G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [T2Space G]

/-- The complex continuous function of an actual circle-valued character. -/
def compactCharacter (χ : PontryaginDual G) : C(G, ℂ) :=
  ⟨fun g => (χ g : ℂ), continuous_subtype_val.comp (map_continuous χ)⟩

/-- The native irreducible-class bijection is pinned by its scalar action.
The Peter–Weyl coefficient convention requires the inverse of this character
when reindexing the basis below. -/
theorem exists_irrepClass_characterEquiv :
    ∃ e : TauCeti.IrrepClass ℂ G ≃ PontryaginDual G,
      ∀ (i : TauCeti.IrrepClass ℂ G), (TauCeti.IrrepClass.model i).dim = 1 ∧
        ∀ g : G, (TauCeti.IrrepClass.model i).rep g =
          (e i g : ℂ) • ContinuousLinearMap.id ℂ
            (EuclideanSpace ℂ (Fin (TauCeti.IrrepClass.model i).dim)) := by
  sorry

/-- Character polynomials are uniformly dense on every compact abelian group. -/
theorem compactCharacter_span_dense :
    (Submodule.span ℂ (Set.range (compactCharacter G))).topologicalClosure = ⊤ := by
  sorry

variable [MeasurableSpace G] [BorelSpace G]

/-- The Fourier basis is indexed by native characters, with these exact vectors. -/
theorem exists_characterBasis :
    ∃ b : HilbertBasis (PontryaginDual G) ℂ (Lp ℂ 2 (TauCeti.haarProb G)),
      ∀ χ, b χ = ContinuousMap.toLp 2 (TauCeti.haarProb G) ℂ
        (compactCharacter G χ) := by
  sorry


end

/-! ## Layer 6: global forms and formal characters -/

/-- Finite torus weights characterize actual continuous U(2) representations. -/
theorem u2_weight_character_iff (f : (ℤ × ℤ) →₀ ℕ) :
    (∃ (n : ℕ) (π : ContRepresentation ℂ (Matrix.unitaryGroup (Fin 2) ℂ)
        (EuclideanSpace ℂ (Fin n))),
      Continuous π ∧ ∀ g : Matrix.unitaryGroup (Fin 2) ℂ,
        (g : Matrix (Fin 2) (Fin 2) ℂ) 0 1 = 0 →
        (g : Matrix (Fin 2) (Fin 2) ℂ) 1 0 = 0 →
        π.toRepresentation.character g =
          f.sum (fun ab m => (m : ℂ) *
            ((g : Matrix (Fin 2) (Fin 2) ℂ) 0 0) ^ ab.1 *
            ((g : Matrix (Fin 2) (Fin 2) ℂ) 1 1) ^ ab.2)) ↔
      (∀ a b : ℤ, f (a,b) = f (b,a)) ∧
      (∀ a b : ℤ, b ≤ a → f (a+1,b-1) ≤ f (a,b)) := by
  sorry


/-! ## Layer 7: unitary SU(2) actions and embeddings -/

/-- A unitary SU(2) action has unique symmetric-power multiplicities, whose
weighted sum is its dimension; it is faithful exactly when an odd highest
weight occurs. Characters here are traces of the actual representations. -/
theorem su2_multiplicities_and_faithfulness (n : ℕ)
    (π : ContRepresentation ℂ TauCeti.SU2 (EuclideanSpace ℂ (Fin n)))
    (hcont : Continuous π) (hunitary : _root_.ContRepresentation.IsUnitary π) :
    ∃! m : ℕ →₀ ℕ,
      (∀ g : TauCeti.SU2, π.toRepresentation.character g =
        m.sum (fun d a => (a : ℂ) *
          (TauCeti.SU2.symPowerModel d).toRepresentation.character g)) ∧
      m.sum (fun d a => a * (d + 1)) = n ∧
      (Function.Injective π ↔ ∃ d : ℕ, Odd d ∧ m d ≠ 0) := by
  sorry

/-- Every finite list of symmetric-power multiplicities is realized by a
continuous unitary action on the standard space of its total dimension. -/
theorem exists_su2_of_multiplicities (m : ℕ →₀ ℕ) :
    ∃ π : ContRepresentation ℂ TauCeti.SU2
        (EuclideanSpace ℂ (Fin (m.sum (fun d a => a * (d + 1))))),
      Continuous π ∧ _root_.ContRepresentation.IsUnitary π ∧
      ∀ g : TauCeti.SU2, π.toRepresentation.character g =
        m.sum (fun d a => (a : ℂ) *
          (TauCeti.SU2.symPowerModel d).toRepresentation.character g) := by
  sorry

end TauCetiRoadmap.CompactGroupsPartII
