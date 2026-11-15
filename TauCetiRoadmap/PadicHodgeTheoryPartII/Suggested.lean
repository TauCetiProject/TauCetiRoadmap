module

public import Mathlib

/-!
# p-adic Hodge theory, Part II — generic crystalline monodromy: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, and none of them is statable at the pins, so
the file states nothing. For each headline, the missing carriers are:

* Generic admissibility (README §2.3; Gleason–Lim–Xu, Theorem 5.8(1)): for a connected
  reductive group `G` over `ℚ_p`, a decent `b ∈ G(Q̆_p)` with `[b] ∈ B(G, μ)` and a generic point
  `η` of the flag variety `Fl_μ` over a finite extension `K` of `Q̆_p`, every filtered isocrystal
  `(V ⊗ Q̆_p, ρ(b)σ, Fil_η)` is weakly admissible. Tau Ceti has reductivity of affine groups
  (`TauCeti.reductiveCommHopfAlgProperty`) and their representation categories; parabolic
  subgroups as a predicate (`TauCeti.HopfIdeal.IsParabolic`) and as the dynamic parabolic of a
  cocharacter (`TauCeti.Cocharacter.parabolicDefiningHopfIdeal`); and the fppf quotient `G/N` by
  a closed subgroup (`CommHopfAlgCat.fppfHomogeneousQuotient`), represented by a scheme for
  reduced `G` of finite type over an algebraically closed field
  (`TauCeti.HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints`) and, over
  other fields, only for linearly reductive `N`
  (`TauCeti.HopfIdeal.fppfHomogeneousQuotientIsoCoinvariantsPoints`), which a proper parabolic
  is not. Missing: the set `B(G)` of `σ`-conjugacy classes in `G(Q̆_p)` with its Newton and
  Kottwitz invariants and acceptable subsets `B(G, μ)`, the flag variety `Fl_μ` as a scheme over
  the reflex field, a `p`-adic field, with its generic point, and filtered isocrystals over
  finite extensions of `Q̆_p` with their Hodge and Newton numbers (Mathlib's
  `WittVector.Isocrystal` has neither filtrations nor a Newton degree of a semilinear map).
* Generic derived monodromy (README §2.4; Gleason–Lim–Xu, Theorem 5.8(2)): if moreover `(b, μ)`
  is Hodge–Newton irreducible, the identity component of the Zariski closure of the image of
  the attached crystalline representation `Γ_K → G(ℚ_p)` contains `G_der`. Missing, in addition:
  crystalline representations with `G`-structure, the Colmez–Fontaine equivalence and the
  crystalline period comparison over `B_cris`.
* The crystalline period point with open derived image (README §3.2; Gleason–Lim–Xu,
  Proposition 5.9): for a connected reductive `G` over `ℚ_p`, a geometric conjugacy class `μ` of
  cocharacters of `G` and `b ∈ G(Q̆_p)` with `(b, μ)` Hodge–Newton irreducible, some point of
  the admissible cell `Gr^b_μ` over a finite extension of `Q̆_p` has crystalline representation
  whose image meets `G_der(ℚ_p)` in an open subgroup.
  The topological group `G(ℚ_p)` and its closed subgroups are pinned (Tau Ceti's point topology,
  `TauCeti.PointTopology.isTopologicalGroup`). Missing, in addition: the `B_dR`-affine
  Grassmannian (Mathlib has the ring `BDeRhamPlus` but no Grassmannian over it), its admissible
  locus and its classical crystalline fibres.
* The z-extension comparison (README §3.5): such points exist for `(G, b, μ)` iff they exist for
  a lift `(G̃, b̃, μ̃)` along a z-extension `G̃ → G`. Missing: the carriers of README §3.2 for both
  groups, z-extensions and the lifting of `B(G, μ)`.
* Components of compact-image period torsors (README §4.1; Gleason–Lim–Xu, proof of
  Lemma 6.12): for a finite extension `K` of `Q̆_p` and any continuous `ξ : Γ_K → G(ℚ_p)` with
  image `C`, the connected components of the `G(ℚ_p)`-torsor `T_ξ → Spd K`, obtained from the
  Galois torsor `Spd Ω → Spd K` (`Ω` the completion of an algebraic closure of `K`) by change of
  group along `ξ`, are indexed `G(ℚ_p)`-equivariantly by `G(ℚ_p)/C`, and the component of `gC`
  has stabilizer `gCg⁻¹`.
* Open derived stabilizers in an ambient target (README §4.2; Gleason–Lim–Xu, Lemma 6.12): if
  `ξ` is the crystalline representation of a period point over `K` whose image meets
  `G_der(ℚ_p)` in an open subgroup of `G_der(ℚ_p)`, as the point of README §3.2 does, then for
  every `G(ℚ_p)`-equivariant map from `T_ξ` to a locally spatial diamond `Y`, each connected
  component of `Y` containing the image of a component of `T_ξ` has a stabilizer meeting
  `G_der(ℚ_p)` in an open subgroup; when `G(ℚ_p)` acts transitively on the components of `Y`,
  every component of `Y` has such a stabilizer. The open-image hypothesis is needed: for
  `G = GL₂`, trivial `ξ`, `Y = T_ξ` and the identity map, every stabilizer is trivial, and the
  trivial subgroup is not open in `SL₂(ℚ_p)`.
  Missing, for both: diamonds, the diamond `Spd K` and locally profinite torsors over it.

The supporting statements of the README (the filtration jumps, decent fibres and invariant lines
of Layer 0, the generic filtrations and highest-weight estimates of Layer 1, the Zariski density
of open subgroups of README §3.3 and the central lifting of derived containment of README §3.4)
are README targets and are not stated here.
-/

namespace TauCetiRoadmap.PadicHodgeTheoryPartII

end TauCetiRoadmap.PadicHodgeTheoryPartII
