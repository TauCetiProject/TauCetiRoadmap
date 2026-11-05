module

public import Mathlib
public import TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree

/-!
# Global Galois deformations, part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs.

The general reducible lifting headlines and their applications retain the
arithmetic selection hypothesis of README §3.2; the irreducible number-field
theorem in §6.6 uses its independent FKP19 route, and the ordinary symplectic
lifts of §§10.1–10.3 rest on §6.6 without that hypothesis.

Statable at the pins: the degree-one uniform torsion theorem of README §4.4
(FKP19 Lemma B.1), for a compact `ℚ_p`-analytic group whose Mathlib
`GroupLieAlgebra` is semisimple, with coefficients in the reductions `V/ϖʳV` of
a finite free lattice over a discrete valuation ring finite over `ℤ_p`. The
reductions, with their discrete topology and induced action, are the only
definitions this file makes. The all-degree form of §4.4 needs the
differentiated action of the Lie algebra on `V ⊗ ℚ_p` for its no-invariants
hypothesis, which the pins do not provide, and stays in prose.

The following headline theorems are not statable at the pins:
* Controlled G-valued finite-level towers: the fixed-quotient arithmetic lifting
  datum, its local lifting conditions and the derived congruence image interface
  are missing.
* Finite-prime annihilation of relative Selmer images: the arithmetic finite
  adjoint coefficient systems, Selmer kernels and root local conditions are missing.
* Finitely ramified geometric lifts with prescribed components and approximation,
  the sl2 refinement, nongeometric lifts and the irreducible specialization (§6.6):
  the G-valued deformation spaces,
  their local components and regular de Rham conditions are missing.
* Derived-dense lifts of Levi-valued residual representations: the arithmetic
  reductive-group lifting datum and its integral lattice comparison are missing.
* Actual reducible modularity at every weight and prime-to-p level at Serre weight:
  newform Galois attachments, their stable integral lattices and the
  extension-sensitive local Serre weight interface are missing.
* Fixed-weight-level finiteness of actual reductions: the newform Galois
  attachments with their stable integral lattices are missing.
* Actual function-field automorphy, including the block applications: the global
  function-field automorphic representation and Lafforgue attachment carriers
  with their integral lattices are missing.
* Ordinary symplectic lifts at two Steinberg places and their ANT automorphy
  application: the ordinary local deformation and automorphic attachment
  interfaces are missing.
* The strictly pure symplectic compatible-system consequence: the compatible
  system, strict purity and all-coefficient monodromy comparison interfaces are
  missing. Their general construction belongs to the named suppliers in README.md.
-/

open scoped Manifold ContDiff

namespace TauCetiRoadmap.GlobalGaloisDeformationsPartII

@[expose] public section

/-! ## Layer 4: Relative local conditions and Selmer images -/

section ModPow

variable {O : Type*} [CommRing O] {G : Type*} [Group G] {V : Type*} [AddCommGroup V]
  [Module O V]

/-- The reduction `V/ϖʳV` of an `O`-module `V` carrying a representation `ρ` of `G`: a type
synonym for the quotient by the image of multiplication by `ϖ ^ r`, which carries the discrete
topology and the `G`-action induced by `ρ`. -/
def ModPow (_ : Representation O G V) (ϖ : O) (r : ℕ) : Type _ :=
  V ⧸ LinearMap.range (LinearMap.lsmul O V (ϖ ^ r))

instance (ρ : Representation O G V) (ϖ : O) (r : ℕ) : AddCommGroup (ModPow ρ ϖ r) :=
  inferInstanceAs (AddCommGroup (V ⧸ LinearMap.range (LinearMap.lsmul O V (ϖ ^ r))))

instance (ρ : Representation O G V) (ϖ : O) (r : ℕ) : Module O (ModPow ρ ϖ r) :=
  inferInstanceAs (Module O (V ⧸ LinearMap.range (LinearMap.lsmul O V (ϖ ^ r))))

instance (ρ : Representation O G V) (ϖ : O) (r : ℕ) : TopologicalSpace (ModPow ρ ϖ r) := ⊥

instance (ρ : Representation O G V) (ϖ : O) (r : ℕ) : DiscreteTopology (ModPow ρ ϖ r) := ⟨rfl⟩

/-- The submodule `ϖʳV` is stable under the `O`-linear action `ρ`, so it is a
subrepresentation. -/
def modPowSub (ρ : Representation O G V) (ϖ : O) (r : ℕ) : Subrepresentation ρ where
  toSubmodule := LinearMap.range (LinearMap.lsmul O V (ϖ ^ r))
  apply_mem_toSubmodule g v hv := by
    obtain ⟨w, rfl⟩ := LinearMap.mem_range.mp hv
    exact LinearMap.mem_range.mpr ⟨ρ g w, by simp⟩

/-- The representation of `G` on the reduction `V/ϖʳV` induced by `ρ`: Mathlib's quotient
representation by the subrepresentation `ϖʳV`. -/
noncomputable def modPowRep (ρ : Representation O G V) (ϖ : O) (r : ℕ) :
    Representation O G (ModPow ρ ϖ r) :=
  (modPowSub ρ ϖ r).quotient

/-- The action of `G` on `V/ϖʳV` through `modPowRep`. -/
noncomputable instance (ρ : Representation O G V) (ϖ : O) (r : ℕ) :
    DistribMulAction G (ModPow ρ ϖ r) :=
  DistribMulAction.compHom (ModPow ρ ϖ r) (modPowRep ρ ϖ r)

end ModPow

/-- README §4.4, degree one (FKP19 Lemma B.1, p.64; Lazard V, Theorems 2.2.2.3, 2.2.3.1 and
2.4.10). Let `G` be a compact group with a `ℚ_p`-analytic manifold structure of dimension `d`
and analytic group operations, whose Lie algebra, the tangent space at the identity with the
bracket of left-invariant vector fields, is semisimple over `ℚ_p`. Let `O` be a discrete
valuation ring finite over `ℤ_p`, `ϖ` an irreducible element of `O`, `V` a finite free
`O`-module with a representation `ρ` of `G` that is continuous on every reduction `V/ϖʳV`
for the discrete topology. Then one power of `p`, independent of `r`, kills the first
continuous cohomology of `G` with coefficients in `V/ϖʳV` for every `r`. Since `p` is a unit
times a power of `ϖ`, a power of `p` and a power of `ϖ` kill the same classes. -/
theorem uniformTorsion_H1 {p : ℕ} [Fact p.Prime] {d : ℕ} {G : Type*} [TopologicalSpace G]
    [ChartedSpace (Fin d → ℚ_[p]) G] [Group G] [IsTopologicalGroup G] [CompactSpace G]
    [LieGroup 𝓘(ℚ_[p], Fin d → ℚ_[p]) ω G]
    [LieAlgebra.IsSemisimple ℚ_[p] (GroupLieAlgebra 𝓘(ℚ_[p], Fin d → ℚ_[p]) G)]
    {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [Algebra ℤ_[p] O]
    [Module.Finite ℤ_[p] O] {ϖ : O} (hϖ : Irreducible ϖ)
    {V : Type*} [AddCommGroup V] [Module O V] [Module.Finite O V] [Module.Free O V]
    (ρ : Representation O G V) [∀ r : ℕ, ContinuousSMul G (ModPow ρ ϖ r)] :
    ∃ a : ℕ, ∀ r : ℕ, ∀ x : TauCeti.ContCohomology.H1 G (ModPow ρ ϖ r), p ^ a • x = 0 := by
  sorry

end

end TauCetiRoadmap.GlobalGaloisDeformationsPartII
