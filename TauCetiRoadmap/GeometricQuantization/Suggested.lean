import Mathlib

/-!
# Geometric quantization: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs when their geometric carriers are
available. The following headlines are not statable at these pins with only
simple definitions on existing carriers:

* Layer 2: intrinsic Hamiltonian lifting and the prequantum commutator need the
  prequantum principal circle bundle, its real principal connection, and the
  dual-character associated complex line with its induced connection. Native
  smooth two-forms and `CovariantDerivative` do not supply this dictionary.
* Layer 2: complete-flow unitary quantization and essential self-adjointness need
  the Hilbert space of square-integrable sections of that Hermitian line and
  its dense smooth compactly supported section core with the induced operator.
* Layer 3: homogeneous character/descent equivalence and fixed-moment coadjoint
  integrality need smooth homogeneous associated lines on the actual closed-
  subgroup quotient, their lifted actions and their invariant connections.
* Layer 3: normalized compact-root maps need the compact real root/cocharacter
  comparison on the actual Lie groups.
* Layer 3: the period, ordinary Picard and global-form comparisons need actual
  compact flag root curves, their integral homology classes, and holomorphic
  line-bundle isomorphism classes on those same flags. A ring Picard group or
  an arbitrary lattice homomorphism does not give these carriers.
* Layers 4 and 5: polarization preservation and the cotangent half-density
  realization need polarized sections of the associated line and the smooth
  half-density bundle with its intrinsic square-integrable section space.
* Layer 5: projective and theta/Bohr--Sommerfeld quantization need holomorphic
  sections of O(k) and of the theta line, and parallel lines over the actual
  Bohr--Sommerfeld leaves. Projectivization and theta functions alone do not
  supply these geometric section spaces.
* Layer 6: the positive-line/index bridge needs positive Hermitian holomorphic
  line bundles, their H⁰ spaces and equivariant Dolbeault index.
* Layer 6: complexified action, shifted semistability and regular quotient need
  the linearized holomorphic line and its full-isotropy reduced Kähler orbifold.
* Layer 6: global restriction/descent and the shifted Kostant bound need the
  holomorphic section spaces of that line on the manifold, semistable locus
  and reduced orbifold, together with the actual restriction/descent maps.
* Layer 6: fixed-component equivariant Riemann–Roch and its near-identity
  expansion need the equivariant Dolbeault cohomology, fixed-submanifold normal
  eigenbundles and equivariant characteristic forms of the same line and tangent
  bundles. The pinned APIs do not supply these carriers.
* Layer 6: the global distribution limit needs multiplicities of the actual
  H⁰(M,L^n) representation and its Kostant-normalized moment map.
* Layer 6: chamber quasi-polynomials and uniform asymptotics need the reduced
  orbifold line, its Dolbeault index and inertia-sector characteristic forms,
  retaining ineffective isotropy and joint degree-weight residue classes.

Layer 1's integral-curvature existence and flat-twist torsor are supplier
results from SmoothBundlesConnections B6.3--B6.5. Their symplectic
specialization is specified in README.md. No coordinate special case or
unconstrained character sequence substitutes for the headlines above.
-/

namespace TauCetiRoadmap.GeometricQuantization

section HomogeneousCharacters

/-!
These signatures illustrate part of the programme. The README is definitive;
this file is neither an exhaustive checklist nor a replacement geometric carrier.
Native characters and homomorphisms below are actual maps. The geometric
stabilizer, coroot-period and flag dictionaries are specified in Q2A and S3P.
-/

namespace HomogeneousCharacters

noncomputable section Characters
variable {G H : Type*} [Group G] [Group H]
  [TopologicalSpace G] [TopologicalSpace H]

/-- Restriction along the actual stabilizer or covering homomorphism. -/
def restrictCharacter (i : H →ₜ* G) (χ : G →ₜ* Circle) : H →ₜ* Circle :=
  χ.comp i

@[simp] theorem restrictCharacter_apply (i : H →ₜ* G) (χ : G →ₜ* Circle) (h : H) :
    restrictCharacter i χ h = χ (i h) := rfl

/-- Fibrewise central descent tests the given character on the given kernel. -/
def characterKernel (χ : G →ₜ* Circle) : Subgroup G := χ.toMonoidHom.ker

@[simp] theorem mem_characterKernel (χ : G →ₜ* Circle) (g : G) :
    g ∈ characterKernel χ ↔ χ g = 1 := Iff.rfl

/-- The actual algebraic descended character. Continuity/smoothness of this
map is a separate quotient-topology comparison, not an arbitrary dictionary. -/
def descendCharacter (N : Subgroup G) [N.Normal] (χ : G →ₜ* Circle)
    (hN : N ≤ characterKernel χ) : G ⧸ N →* Circle :=
  QuotientGroup.lift N χ.toMonoidHom hN

@[simp] theorem descendCharacter_mk (N : Subgroup G) [N.Normal]
    (χ : G →ₜ* Circle) (hN : N ≤ characterKernel χ) (g : G) :
    descendCharacter N χ hN (QuotientGroup.mk g) = χ g := rfl

/-- Descent really pulls back to the supplied character. -/
theorem descendCharacter_comp (N : Subgroup G) [N.Normal]
    (χ : G →ₜ* Circle) (hN : N ≤ characterKernel χ) :
    (descendCharacter N χ hN).comp (QuotientGroup.mk' N) = χ.toMonoidHom := rfl

/-- Continuous descent uses the native quotient topology of the same group. -/
def descendContinuousCharacter (N : Subgroup G) [N.Normal] (χ : G →ₜ* Circle)
    (hN : N ≤ characterKernel χ) : (G ⧸ N) →ₜ* Circle where
  __ := descendCharacter N χ hN
  continuous_toFun := continuous_quot_lift _ χ.continuous

@[simp] theorem descendContinuousCharacter_mk (N : Subgroup G) [N.Normal]
    (χ : G →ₜ* Circle) (hN : N ≤ characterKernel χ) (g : G) :
    descendContinuousCharacter N χ hN (QuotientGroup.mk g) = χ g := rfl

end Characters

section Lattices
variable {Q Y : Type*} [AddCommGroup Q] [AddCommGroup Y]

/-- Restrict a specified integral character to the actual coroot inclusion. -/
def periodRestriction (j : Q →+ Y) : (Y →+ ℤ) →+ (Q →+ ℤ) where
  toFun χ := χ.comp j
  map_zero' := by ext q; rfl
  map_add' χ ψ := by ext q; rfl

@[simp] theorem periodRestriction_apply (j : Q →+ Y) (χ : Y →+ ℤ) (q : Q) :
    periodRestriction j χ q = χ (j q) := rfl

/-- Characters invisible on all supplied coroots; this is not yet an
identification with characters of a compact group. -/
def centralCharacterLattice (j : Q →+ Y) : AddSubgroup (Y →+ ℤ) :=
  (periodRestriction j).ker

@[simp] theorem mem_centralCharacterLattice (j : Q →+ Y) (χ : Y →+ ℤ) :
    χ ∈ centralCharacterLattice j ↔ ∀ q, χ (j q) = 0 := by
  change periodRestriction j χ = 0 ↔ _
  constructor
  · intro h q
    exact DFunLike.congr_fun h q
  · intro h
    ext q
    exact h q

/-- The finite-cover test consumes the actual integral inclusion and value,
not just a group-form name. -/
theorem ordinaryDegree_has_specifiedCharacter (j : Q →+ Y) (p : Q →+ ℤ) :
    p ∈ (periodRestriction j).range ↔ ∃ χ : Y →+ ℤ, χ.comp j = p := Iff.rfl

end Lattices

end HomogeneousCharacters

end HomogeneousCharacters

end TauCetiRoadmap.GeometricQuantization
