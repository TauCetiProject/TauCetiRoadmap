module

public import Mathlib

/-!
# Geometric Satake and fusion, part II: target signatures

The roadmap is `README.md`; this file is not the roadmap and is not exhaustive. It states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti whenever every carrier in a
statement exists at the pins or is a simple definition on native objects. None of the headline
theorems is statable at the pins, so this file declares nothing. Mathlib and Tau Ceti carry no
affine Grassmannian or affine flag variety, no loop group, no parahoric group scheme, no
Schubert variety, no represented Grassmannian scheme (Mathlib's `Module.Grassmannian` is a
functor of points without representability), no v-sheaf or kimberlite, and no nearby-cycle
functor at the pins; every headline below mentions at least one of them.

The headline theorems and the carriers each lacks:

* Normality, reduced admissible special fibre and adjoint/derived-isogeny comparison of the
  polynomial Schubert-bound closures (Layer 1, §§1.2–1.4): polynomial Beilinson–Drinfeld
  Grassmannians, their schematic Schubert closures and the companion twisted affine flags.
* The auxiliary prime-to-`p` Hodge cover (§1.5): local cocharacter data, reflex fields and
  parahoric levels on the reductive-group carriers.
* Flatness of the standard `GL` and `GSp` lattice-chain incidence models (§2.5): the represented
  relative Grassmannian scheme and its closed incidence subscheme over `O_F`.
* Closed polynomial Hodge, Weyl-lattice, restriction-of-scalars and tame symplectic model
  embeddings and the period-total embedding (§§2.1–2.4, 2.6–2.7): the polynomial local models and
  the represented lattice-chain Grassmannians.
* The canonical local model in the classical abelian-type range, normalization of integral Hodge
  images and good embeddings cut out by descent endomorphisms (§§3.1–3.3): integral local-model
  v-sheaves and their scheme comparison morphisms.
* General minuscule weakly normal representability and its smooth open of maximal orbits
  (§§3.6–3.7): those v-sheaves, kimberlites and the specialization-triple comparison.
* Root and Cartan tangent equalities for the Finkelberg–Mirković bound and curve-spanning of
  affine Schubert and reductive Weil-restriction special-fibre tangent spaces (§§4.7–4.11):
  algebraic affine Schubert schemes, their representation-bound subschemes and the derivative of
  a pointed formal curve on the Zariski tangent space.
* Same-residue-field Schubert curves (§5.5): companion partial affine flags, their valued-root
  orbit strata and the local-model comparison.
* EL/PEL chain torsors, the de Rham kernel comparison and the EL and unitary Drinfeld local-model
  isomorphisms (§§6.2, 6.4–6.6): integral polarized lattice-chain moduli, the represented
  determinant and Eisenstein models, integral modification v-sheaves and their diamond comparison.
* Connected geometric tubes for every dominant bound and normality with geometrically reduced
  special fibre of every minuscule local model (§§7.5–7.6): local-model kimberlites, geometric
  tubes, nearby-cycle sheaf categories and the weakly normal scheme representative.
* Good embeddings for acceptable Hodge data and the admissible lattice-membership criterion
  (§§7.7–7.8): integral Hodge models, their map to a represented Grassmannian and the admissible
  locus with its stratum comparison.
* Splitting-field inertia in the tame polynomial range, and centrality and the
  Satake-parameter characterization of the local-model test function for every reductive group,
  parahoric level and dominant bound (§§8.1–8.4): local-model nearby cycles of the intersection
  complex, central sheaves and parahoric Satake-parameter central functions.

The nondegeneracy of the trace symplectic form on a finite separable restriction of scalars
(§2.8) is statable with `Algebra.trace`, but it is a supporting lemma on linear-algebra data
rather than a headline, so it stays in the README as a target with its Checks.
-/

namespace TauCetiRoadmap.GeometricSatakeAndFusionPartII

-- No headline theorem is statable at the pins; see README.md.

end TauCetiRoadmap.GeometricSatakeAndFusionPartII
