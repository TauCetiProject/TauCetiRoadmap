module

public import Mathlib

/-!
# Locally analytic representations of p-adic reductive groups: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so the file states nothing; each headline and the carrier
it lacks are listed below.

* Layers 0–1: the Schneider–Teitelbaum anti-equivalence between admissible
  locally analytic representations of a non-compact p-adic group and coadmissible
  modules over its distribution algebra D(G, E), and Breuil's identification of
  Ext¹ in D(G, E)-modules with admissible extensions. The pins have locally
  analytic functions only on ℤ_p with values in a Banach space: Tau Ceti's
  analytic stages `TauCeti.AnalyticStage` and their algebraic direct limit
  `TauCeti.LocallyAnalytic`, which carries no topology. They have no topologised
  space of locally analytic functions on a locally analytic manifold, no
  locally analytic representations of a p-adic Lie group, no distribution
  algebra D(G, E) and no Fréchet–Stein algebras or coadmissible modules.
  Mathlib's `BarrelledSpace` and its Banach–Steinhaus theorem apply over E, but
  its `LocallyConvexSpace` needs a partially ordered scalar semiring, and the
  comparison with barrels given by O_E-lattices is absent.
* Layer 2: Pan's theorem that admissible Banach representations of a p-adic Lie
  group are strongly LA-acyclic. The pins lack the Banach spaces C^an(G_n, ℚ_p)
  of analytic functions on the uniform subgroups G_n, which need the coordinates
  of a p-valued group, and the category of admissible Banach representations.
* Layer 3: the Grothendieck property of smooth solid representations and the
  comparison of solid derived locally analytic vectors with Pan's functors. The
  pins have no analytic ring E_■ over a p-adic field, no solid E-vector spaces
  and no solidified group rings of profinite groups.
* Layers 5–6: Schraen's spectral sequence for Ext into a locally analytic
  parabolic induction, and the Orlik–Strauch irreducibility and Jordan–Hölder
  theorems. These need locally analytic parabolic induction, Kohlhaase's
  homology and the parabolic BGG categories O^p_alg over a split reductive Lie
  algebra; the pins have Verma modules only for Killing Lie algebras
  (`TauCeti.VermaModule`) and no category O.
* Layer 7: Emerton's adjunction theorem and Breuil's adjunction for
  Orlik–Strauch representations. These need Emerton's locally analytic Jacquet
  functor, closed induction and very strong admissibility.
* Layers 8–10: Ding's theorems for GL_n(L): the bijectivity of
  ζ_w : Hom(T(L), E) → Ext¹_w, the formula
  dim Ext¹(π_alg(φ, h), π_1(φ, h)) = n + (2^n − 1)[L : ℚ_p], the bijectivity of
  the parabolic maps ζ_{F_P}, and the decomposition of Ext¹ over the embeddings
  of L. All carriers of the previous items are needed, together with
  π_alg(φ, h), π_1(φ, h) and their Ext groups.
-/

namespace TauCetiRoadmap.LocallyAnalyticRepresentationsOfLocalGroups

end TauCetiRoadmap.LocallyAnalyticRepresentationsOfLocalGroups
