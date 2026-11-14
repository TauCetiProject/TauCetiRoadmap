import Mathlib
import TauCeti.GroupTheory.Coxeter.Parabolic

/-!
# Shimura data: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statement here suggests a Lean form for a mathematical milestone;
discharging it finishes neither a layer nor the roadmap.

The Kostant opposition theorem of §3.13 is stated on the native `CoxeterSystem` carrier.
It says that the longest Levi and full Weyl elements induce an involution on minimal
left parabolic representatives, with complementary lengths. No root-coordinate table
or separate definition of minimal representatives is needed.

The other headline results require objects absent from the pinned libraries:

* The real and adelic Hilbert comparisons (Layer 0) need Weil restriction and its
  fibre-product groups with their Lie-group and adelic topologies.
* Rational-weight descent, Mumford–Tate connectedness and reductivity, and the elliptic
  Mumford–Tate classification (Layer 1) need the algebraic Deligne-torus action and its
  rational Hodge representation. The native Hodge filtrations, GL coordinate algebra
  and Hopf-ideal lattice do not supply that action or the Mumford–Tate group.
* Uniqueness of the domain complex structure and the Hermitian-group adapter (Layer 2)
  need a pure Shimura datum, its domain and its faithful holomorphic filtration map.
* Polarized orthogonal splitting of variations, the intrinsic compact dual and Borel
  embedding, reflex-field descent, and integral Bruhat and Schubert geometry (Layer 3)
  need holomorphic filtered flat bundles with connections, representable parabolic-type
  varieties and their integral Schubert schemes. Native local systems, period-domain
  points and dynamic parabolic subgroup functors do not supply these objects. The
  flag-dimension interpretation of the complementary length is also not stated.
* The type implications, connected-datum lifting, product reflex fields and distinguished
  datum with its centre and Levi identities (Layer 4) need pure and connected Shimura
  data and their reflex fields. The rational-centre discreteness criterion additionally
  needs the adelic point topology of an algebraic torus and its anisotropic subtorus.
* The Hilbert and Siegel comparisons and the actual compact Cartan (Layer 5) need those
  datum and Hermitian-group carriers. The all-places Iwahori neatness criterion needs
  unipotent Iwahori subgroups of GSp₄ over local fields, their adelic levels and the
  faithful rational restriction-of-scalars representation seeing every place over the
  certifying prime. A family of arbitrary local matrices does not provide these objects.

These geometric and arithmetic results are specified in `README.md`.
-/

namespace TauCetiRoadmap.ShimuraData

/-- Kostant opposition (§3.13): the longest Levi and full Weyl elements induce an
involution on minimal left parabolic representatives and complement their lengths.
Minimality is expressed by applying the native right-coset predicate to the inverse. -/
theorem kostantInvolution
    {B W : Type*} [Group W] {M : CoxeterMatrix B} (cs : CoxeterSystem M W)
    (J : Set B) (w₀ w₀J : W)
    (h₀ : ∀ v, cs.length v ≤ cs.length w₀)
    (hJ : w₀J ∈ cs.parabolic J)
    (h₀J : ∀ v ∈ cs.parabolic J, cs.length v ≤ cs.length w₀J)
    (w : W) (hw : cs.IsMinimalCosetRep J w⁻¹) :
    cs.IsMinimalCosetRep J (w₀J * w * w₀)⁻¹ ∧
      w₀J * (w₀J * w * w₀) * w₀ = w ∧
      cs.length (w₀J * w * w₀) + cs.length w + cs.length w₀J = cs.length w₀ := by
  sorry

end TauCetiRoadmap.ShimuraData
