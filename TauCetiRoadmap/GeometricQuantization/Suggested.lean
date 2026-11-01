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

end TauCetiRoadmap.GeometricQuantization
