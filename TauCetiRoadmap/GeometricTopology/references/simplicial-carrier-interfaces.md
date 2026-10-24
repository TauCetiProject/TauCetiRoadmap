# Simplicial carrier and realization interfaces

The definitive roadmap owns the comparison targets. These primary interfaces
use different face conventions and must be related explicitly.

* The pinned Mathlib `AbstractSimplicialComplex` in
  `Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean` has only nonempty
  faces and contains every singleton of its vertex type. Its precomplex has
  only nonempty faces without the singleton condition. A restriction or link
  therefore uses its actual vertex subtype, or the precomplex with an explicit
  actual-vertex comparison. The associated empty-vertex complex has no faces.
* [Mathlib PR28125](https://github.com/leanprover-community/mathlib4/pull/28125),
  source [1ac421b61c8e4905267179d61beb063bd1ae8a91](https://github.com/leanprover-community/mathlib4/blob/1ac421b61c8e4905267179d61beb063bd1ae8a91/Mathlib/Combinatorics/SimplicialComplex/Basic.lean),
  presents a downward-closed family of finite vertex sets. It imposes neither
  an all-singleton axiom nor an empty-membership axiom. Any nonempty family
  contains the empty face by downward closure; the void family is also allowed.
* [Mathlib PR28530](https://github.com/leanprover-community/mathlib4/pull/28530),
  source [b50cffaf879c00ab1455d9e346fdf6252e423d08](https://github.com/leanprover-community/mathlib4/blob/b50cffaf879c00ab1455d9e346fdf6252e423d08/Mathlib/Combinatorics/SimplicialComplex/Topology/GeomReal/Basic.lean),
  develops realization, its face-diagram colimit and functoriality on that
  abstract-face carrier. Compare its nonempty face diagram and barycentric
  coordinates with this roadmap's ordered-simplicial realization, rather than
  constructing a second independent CW structure.

The conversion from a native complex K to a lower family adds the empty face.
For a lower family F, its actual vertices are those v with {v} in F, and its
native nonempty faces are nonempty finite subsets whose projected set is in F.
Ghost vertices and empty-face membership are separate data. The nonempty face
posets and unaugmented realizations compare through the vertex restriction;
recovering the full lower family also tracks whether the empty face was present.
In particular, neither the void family nor the empty-face-only family acquires
an actual vertex, but they are not equal augmented families.

The [Mathlib discussion of face conventions](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/Definition.20of.20Simplicial.20Complex/near/573196453)
and [abstract-complex development discussion](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/AbstractSimplicialComplex/near/389851716)
record the carrier issue. Use Mathlib's vocabulary and adopt its interfaces as
available; construct the required comparisons in Tau Ceti. The proposed PR
carrier is not an already installed import in the pinned prototype.

The independent [Pachner formalization](https://github.com/not-gary/pachner)
by Cunningham, Zach and Friedl includes links and stellar subdivisions. It is
relevant provenance for the broader PL development. No code from that repository
is imported or copied by the native link prototype; code integration requires
coordination and licence review under the repository contribution rules.
